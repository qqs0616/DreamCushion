//-------Arduino NANO-------//

/*主要功能：
   获取4个压力传感器数值、1个声音传感器数值、1温度湿度数值、驱动2个电机
*/

//-------加载各类库文件-------//
#include <DHT.h>                 //加载DHT库文件

//-------预定义引脚和参数-------//
#define SoundD_PIN     A0        //定义声音传感器引脚
#define SoundA_PIN     A1        //定义声音传感器引脚
#define Press1_PIN     A7        //定义压力传感器引脚
#define Press2_PIN     A6        //定义压力传感器引脚
#define Press3_PIN     A3        //定义压力传感器引脚
#define Press4_PIN     A2        //定义压力传感器引脚
#define DHT_PIN        13        //定义温湿度传感器引脚
#define DHTTYPE        DHT11     //传感器类型为DHT22
#define TimeX          1000      //设置定时器时间

DHT DHTX(DHT_PIN, DHTTYPE); //实例化温度湿度传感器

boolean Volume_Val;         //定义声音变量
float Temp, Hum;            //定义空气温度、湿度变量
unsigned int Press_Val[4];  //定义压力变量
unsigned long LastTimeA;

void setup() {
  pinMode(Press1_PIN, INPUT);
  pinMode(Press2_PIN, INPUT);
  pinMode(Press3_PIN, INPUT);
  pinMode(Press4_PIN, INPUT);
  pinMode(SoundA_PIN, INPUT);
  pinMode(DHT_PIN, INPUT);

  Serial.begin(38400);       //初始化串口
  delay(50);
  DHTX.begin();              //初始化温度湿度传感器
  LastTimeA = millis();
}

void loop() {
  if (millis() - LastTimeA > TimeX) {   //每秒钟执行一次
    GetTempHum();                      //获取温度湿度数据
    GetPress();                        //获取压力数据
    GetVolume();                       //获取声音数据
    //    DataSerial();
    SendData();                        //发送数据包
    LastTimeA = millis();
  }
}

//-------定义串口数据打印函数-------//
void DataSerial() {
  Serial.print("空气温度:"); Serial.print(Temp); Serial.print("℃"); Serial.print("  ");
  Serial.print("空气湿度:"); Serial.print(Hum); Serial.println("%");
  Serial.print("压力0数值为:"); Serial.print(Press_Val[0]);
  Serial.print("  压力1数值为:"); Serial.print(Press_Val[1]);
  Serial.print("  压力2数值为:"); Serial.print(Press_Val[2]);
  Serial.print("  压力3数值为:"); Serial.println(Press_Val[3]);
  Serial.print("声音:"); Serial.println(Volume_Val);                    //有声音为1，无声音为0
  //    Serial.println("=======================================================");
}
//-------定义发送数据函数-------//
void SendData() {
  String data = "a" + String(Temp) + "b" + String(Hum);
  data += "c" + String(Press_Val[0]) + "d" + String(Press_Val[1]) + "e" + String(Press_Val[2]) + "f" + String(Press_Val[3]);
  data += "g" + String(Volume_Val) + "h";
  Serial.println(data);
}

//-------定义获取温度湿度函数-------//
void GetTempHum() {
  Hum = DHTX.readHumidity();
  Temp = DHTX.readTemperature();
  // 如果数值为0说明没有连接
  if (isnan(Hum) || isnan(Temp)) {
    //    Serial.println("DHT ERROR!");
  }
}

//-------定义获取压力数值函数-------//
void GetPress() {
  Press_Val[0] = analogRead(Press1_PIN);
  Press_Val[1] = analogRead(Press2_PIN);
  Press_Val[2] = analogRead(Press3_PIN);
  Press_Val[3] = analogRead(Press4_PIN);
}

//------定义判断音量有无函数----//
void GetVolume() {
  Volume_Val = digitalRead(SoundA_PIN);
}
