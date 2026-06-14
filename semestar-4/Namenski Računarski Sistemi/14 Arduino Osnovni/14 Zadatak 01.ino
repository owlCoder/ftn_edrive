/*
	Napisati program koji sa potenciometra čita vrednost ulaza i tu
	vrednost ispisuje na digitalni izlaz LD8 (pin 33). Stanje potenciometra
	osvežavati na svakih 500 milisekundi.
*/
const int analogInPin = A0;
const int analogOutPin = 33;

void potenciometar(int id, void *tptr) 
{
  int sensorValue = analogRead(analogInPin);
  int outputValue = map(sensorValue, 0, 1023, 0, 255);
  analogWrite(analogOutPin, outputValue);

  Serial.print("sensor = ");
  Serial.print(sensorValue);
  Serial.print("\t output = ");
  Serial.println(outputValue);
}

void setup()
{
  Serial.begin(9600);
  pinMode(analogOutPin, OUTPUT);
  createTask(potenciometar, 500, TASK_ENABLE, NULL);
}

void loop()
{

}
