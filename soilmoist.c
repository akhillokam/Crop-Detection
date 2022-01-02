#include <SoftwareSerial.h>
#include <DHT.h>
#include <String.h>
#define water A1
#define ph A3
#define sw1 8
#define sw2 9
#define sw3 10
#define sw4 11
#define DHTPIN 6
#define DHTTYPE DHT11
SoftwareSerial SIM900(12,13); // rx,tx configure software serial port
int tempvalue=0,watervalue=0,humvalue=0,phvalue=0;
String data;
char hb,ch;
char data1[11]; 
DHT dht(DHTPIN, DHTTYPE);
void ShowSerialData()
{
 while(SIM900.available()!=0)
 Serial.write(char (SIM900.read()));
}
void setup()
{ 
pinMode(sw1, INPUT);
pinMode(sw2, INPUT);

pinMode(sw3, INPUT);
pinMode(sw4, INPUT);
SIM900.begin(9600);
Serial.begin(9600); 
Serial.print("power up" );
delay(5000); 
}
void loop()
{
Serial.println(" " );
tempvalue = dht.readTemperature();
humvalue = dht.readHumidity();
watervalue=analogRead(water);
watervalue=map(watervalue, 10, 1023, 0, 100);
phvalue=analogRead(ph);
phvalue=map(phvalue,0,1023,0,8);
 
 Serial.print(" temp ="); 
 Serial.println(tempvalue);
 Serial.print(" water ="); 
 Serial.println(watervalue);
 Serial.print(" hum ="); 
 Serial.println(humvalue);
 Serial.print(" ph ="); 
 Serial.println(phvalue); 
 delay(1000);
if(digitalRead(sw1)==0)
{
 Serial.println("Red"); 
 strcpy(data1,"Red");
 SubmitHttpRequest();
}
else if(digitalRead(sw2)==0)
{
 Serial.println("Black");
 strcpy(data1,"Black");
 SubmitHttpRequest();
}
else if(digitalRead(sw3)==0)
{
 Serial.println("Laterite");
 strcpy(data1,"Laterite");
 SubmitHttpRequest();
}
else if(digitalRead(sw4)==0)
{
 Serial.println("Desert");
 strcpy(data1,"Desert");
 SubmitHttpRequest();
}
delay(60000);
}
void SubmitHttpRequest()
{
SIM900.println("AT"); // Attention
delay(500);
delay(500);
SIM900.println("AT+CSQ"); // Signal quality check
delay(500);
delay(500);
ShowSerialData();
 
SIM900.println("AT+CGATT?"); //Attach or Detach from GPRS Support
delay(500);
delay(500);
ShowSerialData();
SIM900.println("AT+SAPBR=3,1,\"CONTYPE\",\"GPRS\"");//setting the SAPBR, the 
connection type is using gprs
delay(1500);
delay(500);
ShowSerialData();
SIM900.println("AT+SAPBR=3,1,\"APN\",\"CMNET\"");//setting the APN, Access point name 
string
delay(4000);
delay(500);
ShowSerialData();
SIM900.println("AT+SAPBR=1,1");//setting the SAPBR
delay(2500);
delay(500);
ShowSerialData();
SIM900.println("AT+HTTPINIT"); //init the HTTP request
delay(2500);delay(500); 
ShowSerialData();
SIM900.print("AT+HTTPPARA=\"URL\",\"http://www.ctcorphyd.com/IOT/iot.php?a=");
SIM900.print((char *)data1);
SIM900.print("&b="); 
SIM900.print(watervalue);
SIM900.print("&c=");
SIM900.print(tempvalue);
SIM900.print("&d=");
SIM900.print(humvalue);
SIM900.print("&e=");
SIM900.print(phvalue);
 
SIM900.println("\"");
delay(3000);
delay(9000);
ShowSerialData();
delay(500);
delay(1000);
SIM900.println("AT+HTTPACTION=0");//submit the request 
delay(10000);//the delay is very important, the delay time is base on the return from the website, 
if the return datas are very large, the time required longer.
delay(500);
ShowSerialData();
SIM900.println("AT+HTTPREAD");// read the data from the website you access
delay(300);
delay(500);
delay(500);
ShowSerialData();
SIM900.println("");
delay(100);delay(500);
}
