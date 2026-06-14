/*
	Umesto funkcije analogWrite() u zadatku 1, razviti svoju PWM
	funkciju, shodno sledećim zahtevima:
	
	- Širina osnovnog PWM impulsa (bita) je konfigurabilna, i jednaka umnošku od
	1ms
	
	- Period PWM jednak je trajanju 1024 bita
	
	- Promena vrednosti očitane sa potenciometra menja odnos signal/pauza
*/
const int analogInPin = A0;
const int analogOutPin = 33;
int startTime = 0;

#define PWM_BIT_TIME 6
#define PWM_PERIOD (PWM_BIT_TIME * 1024)

void potenciometar(int id, void *tptr) {
  int sensorValue = analogRead(analogInPin);
  int outputValue = sensorValue*PWM_BIT_TIME;
  if (millis()-startTime<outputValue)
     digitalWrite(analogOutPin, HIGH);
  else if (millis()-startTime<PWM_PERIOD)
     digitalWrite(analogOutPin, LOW);
  else
    startTime = millis();
}

void setup()
{
  Serial.begin(9600);
  pinMode(analogOutPin, OUTPUT);

  startTime = millis();
  createTask(potenciometar, PWM_BIT_TIME, TASK_ENABLE, NULL);
}

void loop()
{

}
