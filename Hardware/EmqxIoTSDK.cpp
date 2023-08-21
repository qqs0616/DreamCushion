#include "EmqxIoTSDK.h"
#include "PubSubClient.h"

#define CHECK_INTERVAL 10000
#define MESSAGE_BUFFER_SIZE 10
#define RETRY_CRASH_COUNT 5

static const char *userName = NULL;
static const char *password = NULL;

struct DeviceProperty
{
    String key;
    String value;
};

DeviceProperty PropertyMessageBuffer[MESSAGE_BUFFER_SIZE];

#define MQTT_PORT 9160

#define DATA_CALLBACK_SIZE 20

#define EMQX_BODY_FORMAT "{\"id\":\"123\",\"version\":\"1.0\",\"method\":\"emqx.property.post\",\"params\":%s}"

static unsigned long lastMs = 0;
static int retry_count = 0;

static PubSubClient *client = NULL;

char EmqxIoTSDK::clientId[100] = "";
char EmqxIoTSDK::domain[50] = "121.40.31.87";

char EmqxIoTSDK::EMQX_TOPIC_PROP_POST[50] = "SysThingPropertyPost";

static void parmPass(JsonVariant parm)
{
    //    const char *method = parm["method"];
    for (int i = 0; i < DATA_CALLBACK_SIZE; i++)
    {
        if (poniter_array[i].key)
        {
            bool hasKey = parm["params"].containsKey(poniter_array[i].key);
            if (hasKey)
            {
                poniter_array[i].fp(parm["params"]);
            }
        }
    }
}

static void topicPass(char *topic,JsonVariant parm)
{
    for (int i = 0; i < 10; i++)
    {
        if (poniter_topic[i].key){
          if (strstr(topic, poniter_topic[i].key))
          {
            poniter_topic[i].fp(parm);
          }
        }
    }
}

// 所有云服务的回调都会首先进入这里，例如属性下发
static void callback(char *topic, byte *payload, unsigned int length)
{
    Serial.print("Message arrived [");
    Serial.print(topic);
    Serial.print("] ");
    payload[length] = '\0';
    Serial.println((char *)payload);

    if (strstr(topic, EmqxIoTSDK::EMQX_TOPIC_PROP_POST))
    {
        StaticJsonDocument<200> doc;
        DeserializationError error = deserializeJson(doc, payload); //反序列化JSON数据

        if (!error) //检查反序列化是否成功
        {
            parmPass(doc.as<JsonVariant>()); //将参数传递后打印输出
        }
    } else {
        StaticJsonDocument<200> doc;
        DeserializationError error = deserializeJson(doc, payload); //反序列化JSON数据

        if (!error) //检查反序列化是否成功
        {
            topicPass(topic,doc.as<JsonVariant>()); //将参数传递后打印输出
        } else {
          Serial.println("DeserializationError error ...");
        }
    }
}

static bool mqttConnecting = false;
void(* resetFunc) (void) = 0; //制造重启命令
void EmqxIoTSDK::mqttCheckConnect()
{
    if (client != NULL && !mqttConnecting)
    {
        if (!client->connected())
        {
            client->disconnect();
            Serial.println("Connecting to MQTT Server ...");
            mqttConnecting = true;
            if (client->connect(clientId, userName, password))
            {
                // 绑定系统主题
//                client->subscribe(EMQX_TOPIC_PROP_POST);
                // 自定义主题订阅
                for (int i = 0; i < 10; i++)
                {
                    if (poniter_topic[i].fp)
                    {
                        Serial.printf("subscribe %s\n",poniter_topic[i].key);
                        client->subscribe(poniter_topic[i].key);
                    }
                }
                Serial.println("MQTT Connected!");
            }
            else
            {
                Serial.print("MQTT Connect err:");
                Serial.println(client->state());
                retry_count++;
                if(retry_count > RETRY_CRASH_COUNT){
                    resetFunc();
                }
            }
            mqttConnecting = false;
        }
        else
        {
            Serial.println("state is connected");
            retry_count = 0;
        }
    }
}

void EmqxIoTSDK::begin(Client &espClient,
                         const char *_clientId,
                         const char *_userName,
                         const char *_password)
{

    client = new PubSubClient(espClient);
    userName = _userName;
    password = _password;
    sprintf(clientId, "%s", _clientId);
    client->setServer(domain, MQTT_PORT); /* 连接WiFi之后，连接MQTT服务器 */
    client->setCallback(callback);

    mqttCheckConnect();
}

void EmqxIoTSDK::loop()
{
    client->loop();
    if (millis() - lastMs >= CHECK_INTERVAL)
    {
        lastMs = millis();
        mqttCheckConnect();
        messageBufferCheck();
    }
}

/**
 * 发送数据到自定义主题
 * @param topic 自定义主题
 * @param payload 字符串形式的json 数据
 * @param willRetain 是否是保留消息
 */
void EmqxIoTSDK::sendTopicAndPayload(const char *topic,const char *payload){
    sendTopicAndPayload(topic,payload,false);
}

/**
 * 发送数据到自定义主题
 * @param topic 自定义主题
 * @param payload 字符串形式的json 数据
 * @param willRetain 是否是保留消息
 */
void EmqxIoTSDK::sendTopicAndPayload(const char *topic,const char *payload, boolean willRetain){
    boolean d = client->publish(topic, payload, willRetain);
    Serial.print("publish:0 成功:");
    Serial.println(d);
}

unsigned long lastSendMS = 0;

// 检查是否有数据需要发送
void EmqxIoTSDK::messageBufferCheck()
{
    int bufferSize = 0;
    for (int i = 0; i < MESSAGE_BUFFER_SIZE; i++)
    {
        if (PropertyMessageBuffer[i].key.length() > 0)
        {
            bufferSize++;
        }
    }
    // Serial.println("bufferSize:");
    // Serial.println(bufferSize);
    if (bufferSize > 0)
    {
        if (bufferSize >= MESSAGE_BUFFER_SIZE)
        {
            sendBuffer();
        }
        else
        {
            unsigned long nowMS = millis();
            // 3s 发送一次数据
            if (nowMS - lastSendMS > 5000)
            {
                sendBuffer();
                lastSendMS = nowMS;
            }
        }
    }
}

// 发送 buffer 数据
void EmqxIoTSDK::sendBuffer()
{
    int i;
    String buffer;
    for (i = 0; i < MESSAGE_BUFFER_SIZE; i++)
    {
        if (PropertyMessageBuffer[i].key.length() > 0)
        {
            buffer += "\"" + PropertyMessageBuffer[i].key + "\":" + PropertyMessageBuffer[i].value + ",";
            PropertyMessageBuffer[i].key = "";
            PropertyMessageBuffer[i].value = "";
        }
    }

    buffer = "{" + buffer.substring(0, buffer.length() - 1) + "}";
    send(buffer.c_str());
}

void addMessageToBuffer(char *key, String value)
{
    int i;
    for (i = 0; i < MESSAGE_BUFFER_SIZE; i++)
    {
        if (PropertyMessageBuffer[i].key.length() == 0)
        {
            PropertyMessageBuffer[i].key = key;
            PropertyMessageBuffer[i].value = value;
            break;
        }
    }
}
void EmqxIoTSDK::send(const char *param)
{

    char jsonBuf[1024];
    sprintf(jsonBuf, EMQX_BODY_FORMAT, param);
    Serial.println(jsonBuf);
    boolean d = client->publish(EMQX_TOPIC_PROP_POST, jsonBuf);
    Serial.print("publish:0 成功:");
    Serial.println(d);
}
void EmqxIoTSDK::send(char *key, float number)
{
    addMessageToBuffer(key, String(number));
    messageBufferCheck();
}
void EmqxIoTSDK::send(char *key, int number)
{
    addMessageToBuffer(key, String(number));
    messageBufferCheck();
}
void EmqxIoTSDK::send(char *key, double number)
{
    addMessageToBuffer(key, String(number));
    messageBufferCheck();
}

void EmqxIoTSDK::send(char *key, char *text)
{
    addMessageToBuffer(key, "\"" + String(text) + "\"");
    messageBufferCheck();
}

int EmqxIoTSDK::bindData(char *key, poniter_fun fp)
{
    int i;
    for (i = 0; i < DATA_CALLBACK_SIZE; i++)
    {
        if (!poniter_array[i].fp)
        {
            poniter_array[i].key = key;
            poniter_array[i].fp = fp;
            return 0;
        }
    }
    return -1;
}

int EmqxIoTSDK::bindTopic(char *topic, poniter_fun fp)
{
    int i;
    for (i = 0; i < 10; i++)
    {
        if (!poniter_topic[i].fp)
        {
            poniter_topic[i].key = topic;
            poniter_topic[i].fp = fp;
            return 0;
        }
    }
    return -1;
}

int EmqxIoTSDK::unbindTopic(char *topic)
{
    int i;
    for (i = 0; i < 10; i++)
    {
        if (!strcmp(poniter_topic[i].key, topic))
        {
            poniter_topic[i].key = NULL;
            poniter_topic[i].fp = NULL;
            return 0;
        }
    }
    return -1;
}

int EmqxIoTSDK::unbindData(char *key)
{
    int i;
    for (i = 0; i < DATA_CALLBACK_SIZE; i++)
    {
        if (!strcmp(poniter_array[i].key, key))
        {
            poniter_array[i].key = NULL;
            poniter_array[i].fp = NULL;
            return 0;
        }
    }
    return -1;
}
