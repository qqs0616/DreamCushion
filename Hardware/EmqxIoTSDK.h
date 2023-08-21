#ifndef EMQX_IOT_SDK_H
#define EMQX_IOT_SDK_H
#include <Arduino.h>
#include <ArduinoJson.h>
#include "Client.h"

typedef void (*poniter_fun)(JsonVariant ele); //定义一个函数指针

typedef struct poniter_desc
{
  char *key;
  poniter_fun fp;
} poniter_desc, *p_poniter_desc;

// 最多绑定20个回调
static poniter_desc poniter_array[20];
// 最多绑定10个主题
static poniter_desc poniter_topic[10];
static p_poniter_desc p_poniter_array;

class EmqxIoTSDK
{
private:
  // mqtt 链接信息，动态生成的
  static char clientId[100];
  static char domain[50];

  // 定时检查 mqtt 链接
  static void mqttCheckConnect();

  static void messageBufferCheck();
  static void sendBuffer();
public:
  // 标记一些 topic 模板
  static char EMQX_TOPIC_PROP_POST[50];
  // 在主程序 loop 中调用，检查连接和定时发送信息
  static void loop();

  /**
   * 初始化程序
   * @param clientId mqtt客户端id
   * @param _userName 设备名字
   * @param _password 设备密码
   */
   static void begin(Client &espClient,
                         const char *_clientId,
                         const char *_userName,
                         const char *_password);

  /**
   * 发送数据到自定义主题
   * @param topic 自定义主题
   * @param payload 字符串形式的json 数据
   */
  static void sendTopicAndPayload(const char *topic,const char *payload);

  /**
   * 发送数据到自定义主题
   * @param topic 自定义主题
   * @param payload 字符串形式的json 数据
   * @param willRetain 是否是保留消息
   */
  static void sendTopicAndPayload(const char *topic,const char *payload,boolean willRetain);

  /**
   * 发送数据
   * @param param 字符串形式的json 数据，例如 {"${key}":"${value}"}
   */
  static void send(const char *param);
  /**
   * 发送 float 格式数据
   * @param key 数据的 key
   * @param number 数据的值
   */
  static void send(char *key, float number);
  /**
   * 发送 int 格式数据
   * @param key 数据的 key
   * @param number 数据的值
   */
  static void send(char *key, int number);
  /**
   * 发送 double 格式数据
   * @param key 数据的 key
   * @param number 数据的值
   */
  static void send(char *key, double number);
  /**
   * 发送 string 格式数据
   * @param key 数据的 key
   * @param text 数据的值
   */
  static void send(char *key, char *text);
  /**
   * 绑定属性回调，云服务下发的数据包含此 key 会进入回调，用于监听特定数据的下发
   * @param key 物模型的key
   */
  static int bindData(char *key, poniter_fun fp);
  /**
   * 卸载某个 key 的所有回调（慎用）
   * @param key 物模型的key
   */
  static int unbindData(char *key);

  /**
   * 绑定自定义主题以及对应的回调方法
   * @param topic 自定义主题
   * @param fp 回调方法
   */
  static int bindTopic(char *topic, poniter_fun fp);
  /**
   * 解除某一个自定义主题
   * @param topic 自定义主题
   */
  static int unbindTopic(char *topic);
};
#endif
