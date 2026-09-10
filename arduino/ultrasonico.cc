// declaração de váriaveis
#include "Ultrasonic.h"

const int PINO_TRIGGER = 12;
const int PINO_ECHO = 13;

HC_SR04 sensor(PINO_TRIGGER, PINO_ECHO);

//configuração
void setup() {
  Serial.begin(9600); 
}

  //execução
void loop() {
  Serial.print("DistânciaMaxima:");
  Serial.print(100.0); //Altura total 200 - 7 do sensor
  Serial.print(" ");
  Serial.print("Distância:");
  Serial.print(sensor.distance());
  Serial.print ("cm");
  Serial.print(" ");
  Serial.print("DistânciaMinima:");
  Serial.println(2);
  Serial.print(" ");
  Serial.print("AlturaFunil:");
  Serial.println(100.0);
  Serial.print(" ");

  //conversão dos valores
  Serial.print("Capacidade:");
  Serial.print(((193 - sensor.distance()) * 10) / 18); // inverte a leitura do sensor e calcula a porcentagem bruta de 0 a 100
  Serial.print("%");
  Serial.print(" ");

  Serial.print("VolumeSimulado:");
  Serial.print(((193 - sensor.distance()) * 10) / 18); 
  Serial.println("m³");

  
}
