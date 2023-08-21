//-------加载各类库文件-------//
#include <Arduino.h>
#include <ESP8266WiFi.h>    //加载WiFi服务库文件
#include <ArduinoJson.h>    // 引入JSON处理库
#include "PubSubClient.h"   // 引入MQTT处理库
#include "EmqxIoTSDK.h"     // 引入Emqx IoT SDK
#include <WiFiManager.h>    //加载WiFi配网库文件
#include <TimeLib.h>        //加载网络时间库文件
#include <WiFiUdp.h>        //加载WiFi通信库文件
#include <Wire.h>           //加载IIC通信库文件
#include <U8g2lib.h>        //加载u8g2库用于显示
#include <MPU6050_tockn.h>  //加载MPU6050库文件
#include <SoftwareSerial.h> //加载软串口通信库文件
#include <EEPROM.h>         // 存储本地数据

#define SCL_PIN     D1      //设置IIC通信引脚
#define SDA_PIN     D2      //设置IIC通信引脚
#define TXD_PIN     D3      //设置蓝牙通信引脚
#define RXD_PIN     D4      //设置蓝牙通信引脚
#define STBY_PIN    D0      //定义DRV8833引脚STBY
#define AIN1_PIN    D5      //定义DRV8833引脚A1
#define AIN2_PIN    D6      //定义DRV8833引脚A2
#define BIN1_PIN    D8      //定义DRV8833引脚B1
#define BIN2_PIN    D7      //定义DRV8833引脚B2
#define MotorSpd    200       //定义电机速度
#define TimeX       1000    //设置定时器时间
#define TIME_OUT    5 * 60 * 1000 // 5分钟

const char *WiFiAP = "ESP8266";     //定义ESP8266 WiFi AP 名称
const char *Password = "88888888";  //定义密码

//---------------- EMQX相关配置信息 ------------------//
// 这三项我们可以进行一些认证授权操作
#define MQTT_CLIENT_ID "xianyu123"       // mqtt客户端id
#define MQTT_USER_NAME "xianyu123"       // mqtt客户端 名字
#define MQTT_PASSWORD  "xianyu123"      // mqtt密码

#define KEY_HOUR "hour"
#define KEY_MINUTE "minute"
#define KEY_SWITCH "alarmSwitch"

// 控制命令主题
#define COMMAND_TOPIC  "/smart/data" // 这里对应不同的主题
#define EVENT_TOPIC  "/smart/event/set_alarm/xianyu124" // 这里对应不同的主题
//---------------- EMQX相关配置信息 ------------------//

// NTP Servers:
static const char ntpServerName[] = "uk.pool.ntp.org";  //英国的时间服务器
const int timeZone = 1;  // 英国时区
//static const char ntpServerName[] = "ntp1.aliyun.com"; //定义阿里云的时间服务器地址
//const int timeZone = 8;                                //定义时区中国为东8区


#define CONFIG_NUMBER 0xAA                 // 用户标识eeprom存储状态
#define NOCONFIG_NUMBER 0x00
#define BUFFER_SIZE 300       // 缓存区大小
char param[BUFFER_SIZE];             // 存储上传到巴法云的Json数据
WiFiServer server(80);
WiFiUDP Udp;
unsigned int localPort = 8888;  // 定义本地UDP端口
time_t getNtpTime();

U8G2_SSD1306_128X64_NONAME_F_SW_I2C u8g2(U8G2_R0, SCL_PIN, SDA_PIN);  //配置构造显示函数
MPU6050 Mpu6050(Wire);                                                //实例化陀螺仪传感器
SoftwareSerial BTSerial(RXD_PIN, TXD_PIN);      //实例化软串口，RX,TX与ESP8266连接

int Year, Month, Day, Hour, Minute, Second;          //定义时间变量
float AngleX, AngleY, AngleZ, GyroX, GyroY, GyroZ;   //定义角度变量
String Receive_Data;   //定义接收到的字符串
int Volume_Val;     //定义声音有无函数                     //这里修改了*************转化为数字格式
float Hum, Temp;      //定义湿度、温度变量
int Press_Val[4];   //定义压力数值变量
String Today, NowTime; //定义今天日期和当前时间字符串

static WiFiClient espClient;         // 表示 TCP 客户端，跟EmqxMQTT配合使用
unsigned long LastTime = 0;
int mHour = -1;                        
int mMinute = -1;
bool isMotorRunning = false;
int isSwitch = 0;
unsigned long previousAlarmMillis = 0;   // 记录上次读取的时间戳

// 结构体 存储到eeprom
struct device_config{
  uint8_t hour;
  uint8_t minute;
  uint8_t alarmSwitch;
  uint8_t magic;
} config;

void initEmqxIotSDK(void);   // 初始化EmqxIOT SDK
void printDigits(int digits);
void sendNTPpacket(IPAddress &address);
void sendDataToMQTT(void);            // 发送数据到MQTT平台
void loadConfig();                   // 获取配置信息
void saveConfig();                   // 保存配置信息

void setup() {
  pinMode(AIN1_PIN, OUTPUT);
  pinMode(AIN2_PIN, OUTPUT);
  pinMode(BIN1_PIN, OUTPUT);
  pinMode(BIN2_PIN, OUTPUT);
  pinMode(STBY_PIN, OUTPUT);
  Wire.begin();          //初始化IIC通信接口
  u8g2.begin();          //初始化u8g2驱动程序
  u8g2.clearBuffer();    //清空显示屏缓存
  Serial.begin(38400);   //初始化串口
  delay(100);
  BTSerial.begin(9600);  //初始化蓝牙并设置通信波特率
  delay(100);
  WiFibegin();
  delay(1000);
  Mpu6050.begin();                //初始化陀螺仪
  Mpu6050.calcGyroOffsets(true);  //陀螺仪自检测试补偿数值
  initEmqxIotSDK(); // 初始化EmqxIOT SDK
  loadConfig();                   // 加载状态配置
}

void loop() {
  now();
  Mpu6050.update();
  if (millis() - LastTime > TimeX) {
    GetDate();               //获取日期时间数据
    GetMpu6050Data();        //获取陀螺仪数据
    DataBTSerial();          //向蓝牙端发送数据
//    if ((7 <= Hour <= 21) && (Press_Val[0] < 10 || Press_Val[1] < 10 || Press_Val[2] < 10 || Press_Val[3] < 10 ))
//      MotorDrv();
//    else MotorStop();

    sendDataToMQTT();       //将数据发送到云端，每秒发送1次
    LastTime = millis();
  }

  checkTimeControl();

  if(WiFi.status() == WL_CONNECTED) // Wifi处于连接状态
    {
       EmqxIoTSDK::loop(); // 检测MQTT Emqx
    }

  ReceiveData();     //接收数据并进行解析
  DataDisplay();     //再OLED显示屏幕上显示
}

/**
 * 时间控制属性修改的回调函数
 * @param p json数据
 */
void timeConfigCallback(JsonVariant p)
{
  Serial.println(F("timeConfigCallback"));
  if(p.containsKey(KEY_HOUR)&& p.containsKey(KEY_MINUTE)) {
    mHour = p[KEY_HOUR];
    mMinute = p[KEY_MINUTE];
    isSwitch = p[KEY_SWITCH];

    Serial.printf("hour:%d\n", mHour);
    Serial.printf("minute:%d\n", mMinute);
    Serial.printf("switch:%d\n", isSwitch);
    config.hour = mHour;
    config.minute = mMinute;
    config.alarmSwitch = isSwitch;
    saveConfig();
  }
}


/*
 * 保存参数到EEPROM
*/
void saveConfig(){
  Serial.println("saveConfig");
  EEPROM.begin(100);
  config.magic = CONFIG_NUMBER;
  uint8_t *p = (uint8_t*)(&config);
  for (int i = 0; i < sizeof(config); i++){
    EEPROM.write(i, *(p + i));
  }
  EEPROM.commit();
}

/*
 * 从EEPROM加载参数
*/
void loadConfig(){
  Serial.println("loadConfig");
  EEPROM.begin(300);
  uint8_t *p = (uint8_t*)(&config);
  for (int i = 0; i < sizeof(config); i++){
    *(p + i) = EEPROM.read(i);
  }
  EEPROM.commit();

  if (config.magic == CONFIG_NUMBER){
      Serial.printf("hour:%d\n", config.hour);
      Serial.printf("minute:%d\n", config.minute);
      Serial.printf("switch:%d\n", config.alarmSwitch);
  } else{
    config.magic = NOCONFIG_NUMBER;
  }
}

/**
 * 判断时间是否到
 */
void checkTimeControl(){
  if(config.magic == CONFIG_NUMBER && config.alarmSwitch == 1 && Hour == config.hour && Minute == config.minute){
    Serial.println("match!!!!!!");
    isMotorRunning = true;
    previousAlarmMillis = millis();
  }
  if (isMotorRunning){
    // 5分钟运行
    if (millis() - previousAlarmMillis <= TIME_OUT) {
      MotorDrv();
    } else {
      isMotorRunning = false;
      MotorStop();
    }
  } else {
    MotorStop();
  }
}

/**
   初始化EmqxIOT SDK
*/
void initEmqxIotSDK(void)
{
  // 设置自定义主题处理函数
  EmqxIoTSDK::bindTopic(EVENT_TOPIC,timeConfigCallback);
  // 初始化 iot sdk，需传入 wifi 的 client，和三元组信息
  EmqxIoTSDK::begin(espClient, MQTT_CLIENT_ID, MQTT_USER_NAME, MQTT_PASSWORD);
}

//-------定义串口接收数据函数-------//
void ReceiveData() {
  if (Serial.available()) {                  //如果串口有数据
    Receive_Data = "";                       //将变量清零
    while (Serial.available()) {             //如果串口接收缓冲有数据未读取
      char val = Serial.read();              //从网络中读取一字节数据
      Receive_Data += val;
      delay(2);
    }
    //    Serial.print("ReceiveData："); Serial.println(Receive_Data);
    Temp = String_Operation("a", "b", Receive_Data).toFloat();    //这里修改了*************转化为数字格式
    Hum = String_Operation("b", "c", Receive_Data).toFloat();
    Press_Val[0] = String_Operation("c", "d", Receive_Data).toFloat();
    Press_Val[1] = String_Operation("d", "e", Receive_Data).toFloat();
    Press_Val[2] = String_Operation("e", "f", Receive_Data).toFloat();
    Press_Val[3] = String_Operation("f", "g", Receive_Data).toFloat();
    Volume_Val = String_Operation("g", "h", Receive_Data).toInt();

  }
  //  DataSerial();
}

/**
   发送数据到云平台
*/
void sendDataToMQTT(void)
{
  if (WiFi.status() != WL_CONNECTED) // Wifi处于连接状态
  {
    return;
  }
  /**
    {
    "dev_id":"slc",
    "angle_x":1,
    "angle_y":1,
    "angle_z":1,
    "temp":0,
    "humi":0,
    "p0":0,
    "p1":0,
    "p2":0,
    "p3":0,
    "sound":0
    }
  */
  memset(param, 0, BUFFER_SIZE);      //清空缓存数据
  sprintf(param, "{\"dev_id\":\"xianyu124\",\"angle_x\":%.2f,\"angle_y\":%.2f, \"angle_z\":%.2f, \"temp\":%.2f, \"humi\":%.2f, \"p0\":%d,\"p1\":%d,\"p2\":%d,\"p3\":%d, \"sound\":%d}",
          AngleX, AngleY, AngleZ, Temp, Hum, Press_Val[0], Press_Val[1], Press_Val[2], Press_Val[3], Volume_Val);     //这里修改了*************
  EmqxIoTSDK::sendTopicAndPayload(COMMAND_TOPIC, param);         // 发送数据到云
}

//-------定义字符串解析函数-------//
String String_Operation(String Start , String End , String StringX) {
  int Num = Start.length();
  //判断操作字符是否存在
  if (StringX.indexOf(Start) == -1 || StringX.indexOf(End) == -1) {
    return "err";
  } else {
    //寻找并截取特定区间的起始字符
    String date = StringX.substring(StringX.indexOf(Start) + Num, StringX.indexOf(End));
    return date;
  }
}
//-------定义串口打印函数-------//
void DataSerial() {
  Serial.print("T:"); Serial.print(Temp); Serial.print("℃"); Serial.print("  ");
  Serial.print("H:"); Serial.print(Hum); Serial.println("%");
  Serial.print("AngleX:"); Serial.print(AngleX); Serial.print("  ");
  Serial.print("AngleY:"); Serial.print(AngleY); Serial.print("  ");
  Serial.print("AngleZ:"); Serial.println(AngleZ);
  Serial.print("P0:"); Serial.print(Press_Val[0]);
  Serial.print("  P1:"); Serial.print(Press_Val[1]);
  Serial.print("  P2:"); Serial.print(Press_Val[2]);
  Serial.print("  P3:"); Serial.println(Press_Val[3]);
  Serial.print("Vol:"); Serial.println(Volume_Val);  //有声音为1，无声音为0
  //  Serial.println("=======================================================");
}

//-------定义蓝牙发送函数-------//
void DataBTSerial() {
  BTSerial.print("T:"); BTSerial.print(Temp); BTSerial.print("℃"); BTSerial.print("  ");
  BTSerial.print("H:"); BTSerial.print(Hum); BTSerial.println("%");
  BTSerial.print("AngleX:"); BTSerial.print(AngleX); BTSerial.print("  ");
  BTSerial.print("AngleY:"); BTSerial.print(AngleY); BTSerial.print("  ");
  BTSerial.print("AngleZ:"); BTSerial.println(AngleZ);
  BTSerial.print("P0:"); BTSerial.print(Press_Val[0]);
  BTSerial.print("  P1:"); BTSerial.print(Press_Val[1]);
  BTSerial.print("  P2:"); BTSerial.print(Press_Val[2]);
  BTSerial.print("  P3:"); BTSerial.println(Press_Val[3]);
  BTSerial.print("Vol:"); BTSerial.println(Volume_Val);
}

//-------定义OLED显示数据函数-------//
void DataDisplay() {
  u8g2.clearBuffer();  //清空显示屏缓存
  u8g2.setFont(u8g2_font_timB08_tf);
  u8g2.setFontPosTop();
  u8g2.setCursor(32, 0);  u8g2.print("Display  Data");
  u8g2.setCursor(0, 12);  u8g2.print("Time:");  u8g2.print(Today);  u8g2.print("  ");  u8g2.print(NowTime);
  u8g2.setCursor(0, 24);  u8g2.print("T:");  u8g2.print(Temp);  u8g2.print("C");       //库文件不支持所以用C代替℃
  u8g2.setCursor(64, 24);  u8g2.print("H:");  u8g2.print(Hum);  u8g2.print("%");
  u8g2.setCursor(0, 36);  u8g2.print("AngleX: ");  u8g2.print(AngleX);
  u8g2.setCursor(64, 36);  u8g2.print("AngleY: ");  u8g2.print(AngleY);
  u8g2.setCursor(0, 48);  u8g2.print("AngleZ: ");  u8g2.print(AngleZ);
  //  u8g2.setCursor(64, 48);
  //  u8g2.print("Second:");
  //  u8g2.print(millis() / 1000);
  //  u8g2.print("S");
  u8g2.sendBuffer();    //加载以上内容
}


//-------定义电机转动函数-------//
void MotorDrv() {    //两个电机同时转动1秒
  Motor_DRV(AIN1_PIN, AIN2_PIN, MotorSpd);
  Motor_DRV(BIN1_PIN, BIN2_PIN, MotorSpd);
}

//-------定义电机停止函数-------//
void MotorStop() {
  digitalWrite(STBY_PIN, LOW);
}

//-------定义电机驱动函数-------//
void Motor_DRV(int OutPin1, int OutPin2, int PwmVal) {     //马达输出函数
  PwmVal = constrain(PwmVal, -255, 255);                      //限定Pwm区间在-255~255
  digitalWrite(STBY_PIN, HIGH);
  if (PwmVal >= 0)                                          //如果Pwm大于0则电机顺时针转动
  { analogWrite(OutPin1, PwmVal);
    analogWrite(OutPin2, 0);
  }
  if (PwmVal < 0)                                           //如果Pwm小于0则电机逆时针转动
  { analogWrite(OutPin1, 0);
    analogWrite(OutPin2, -PwmVal);
  }
}

//------获取陀螺仪数值函数------//
void GetMpu6050Data() {
  AngleX = Mpu6050.getAngleX();
  AngleY = Mpu6050.getAngleY();
  AngleZ = Mpu6050.getAngleZ();
  //  Serial.println("=======================================================");
  //  Serial.print("temp : "); Serial.println(Mpu6050.getTemp());
  //  Serial.print("accX : "); Serial.print(Mpu6050.getAccX());
  //  Serial.print("\taccY : "); Serial.print(Mpu6050.getAccY());
  //  Serial.print("\taccZ : "); Serial.println(Mpu6050.getAccZ());
  //  Serial.print("gyroX : "); Serial.print(Mpu6050.getGyroX());
  //  Serial.print("\tgyroY : "); Serial.print(Mpu6050.getGyroY());
  //  Serial.print("\tgyroZ : "); Serial.println(Mpu6050.getGyroZ());
  //  Serial.print("accAngleX : "); Serial.print(Mpu6050.getAccAngleX());
  //  Serial.print("\taccAngleY : "); Serial.println(Mpu6050.getAccAngleY());
  //  Serial.print("gyroAngleX : "); Serial.print(Mpu6050.getGyroAngleX());
  //  Serial.print("\tgyroAngleY : "); Serial.print(Mpu6050.getGyroAngleY());
  //  Serial.print("\tgyroAngleZ : "); Serial.println(Mpu6050.getGyroAngleZ());
  //  Serial.println("=======================================================\n");
}

/*-------- 定义日期时间显示函数----------*/
void GetDate() {
  Year = year();
  Month = month();
  Day = day();
  Hour = hour();
  Minute = minute();
  Second = second();

  Today = String(year()) + "-" + Convert(month()) + "-" + Convert(day());
  NowTime = Convert(hour()) + ":" + Convert(minute()) + ":" + Convert(second());

  //  Serial.print(Year);
  //  Serial.print("年");
  //  Serial.print(Month);
  //  Serial.print("月");
  //  Serial.print(Day);
  //  Serial.println("日");
  //  Serial.print(Hour);
  //  printDigits(Minute);
  //  printDigits(Second);
  //  Serial.print("   ");
  //  Serial.println(num_week(weekday()));
}


//------定义补位函数------//
String Convert(int i) {
  String O = "0";
  if (i < 10)  return (O + i);
  else return String(i);
}

/*-------- 定义日期时间补位函数----------*/
void printDigits(int digits) {
  Serial.print(":");
  if (digits < 10)
    Serial.print('0');
  Serial.print(digits);
}

/*-------- 定义星期计算函数----------*/
char week[10];
char *num_week(uint8_t dayofweek) {
  switch (dayofweek) {
    case 1:
      strcpy(week, "Sunday");
      break;
    case 2:
      strcpy(week, "Monday");
      break;
    case 3:
      strcpy(week, "Tuesday");
      break;
    case 4:
      strcpy(week, "Wednesday");
      break;
    case 5:
      strcpy(week, "Thursday");
      break;
    case 6:
      strcpy(week, "Friday");
      break;
    case 7:
      strcpy(week, "Saturday");
      break;
    default:
      strcpy(week, "NO");
      break;
  }
  return week;
}

//------定义AP自动配网函数----//
void WiFibegin() {
  WiFi.mode(WIFI_STA);
  WiFiManager wm;
  bool res;
  res = wm.autoConnect(WiFiAP, Password);  //定义ap名称和密码
  if (!res) {
    Serial.println("Failed to connect");
    // ESP.restart();
  } else {
    Serial.println("connected...yeey :)");
  }
  delay(200);
  Serial.println("Starting UDP");
  Udp.begin(localPort);
  Serial.print("Local port: ");
  Serial.println(Udp.localPort());
  Serial.println("waiting for sync");
  setSyncProvider(getNtpTime);
  setSyncInterval(300);
  delay(200);
}

/*-------- NTP code ----------*/
const int NTP_PACKET_SIZE = 48;       // NTP time is in the first 48 bytes of message
byte packetBuffer[NTP_PACKET_SIZE];   //buffer to hold incoming & outgoing packets

time_t getNtpTime() {
  IPAddress ntpServerIP;  // NTP server's ip address

  while (Udp.parsePacket() > 0)
    ;  // discard any previously received packets
  Serial.println("Transmit NTP Request");
  // get a random server from the pool
  WiFi.hostByName(ntpServerName, ntpServerIP);
  Serial.print(ntpServerName);
  Serial.print(": ");
  Serial.println(ntpServerIP);
  sendNTPpacket(ntpServerIP);
  uint32_t beginWait = millis();
  while (millis() - beginWait < 1500) {
    int size = Udp.parsePacket();
    if (size >= NTP_PACKET_SIZE) {
      Serial.println("Receive NTP Response");
      Udp.read(packetBuffer, NTP_PACKET_SIZE);  // read packet into the buffer
      unsigned long secsSince1900;
      // convert four bytes starting at location 40 to a long integer
      secsSince1900 = (unsigned long)packetBuffer[40] << 24;
      secsSince1900 |= (unsigned long)packetBuffer[41] << 16;
      secsSince1900 |= (unsigned long)packetBuffer[42] << 8;
      secsSince1900 |= (unsigned long)packetBuffer[43];
      return secsSince1900 - 2208988800UL + timeZone * SECS_PER_HOUR;
    }
  }
  Serial.println("No NTP Response :-(");
  return 0;  // return 0 if unable to get the time
}

// send an NTP request to the time server at the given address
void sendNTPpacket(IPAddress &address) {
  // set all bytes in the buffer to 0
  memset(packetBuffer, 0, NTP_PACKET_SIZE);
  // Initialize values needed to form NTP request
  // (see URL above for details on the packets)
  packetBuffer[0] = 0b11100011;  // LI, Version, Mode
  packetBuffer[1] = 0;           // Stratum, or type of clock
  packetBuffer[2] = 6;           // Polling Interval
  packetBuffer[3] = 0xEC;        // Peer Clock Precision
  // 8 bytes of zero for Root Delay & Root Dispersion
  packetBuffer[12] = 49;
  packetBuffer[13] = 0x4E;
  packetBuffer[14] = 49;
  packetBuffer[15] = 52;
  // all NTP fields have been given values, now
  // you can send a packet requesting a timestamp:
  Udp.beginPacket(address, 123);  //NTP requests are to port 123
  Udp.write(packetBuffer, NTP_PACKET_SIZE);
  Udp.endPacket();
}
