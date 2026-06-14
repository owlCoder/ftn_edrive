/*
   Napisati program koji sa potenciometra čita vrednost ulaza i tu
  vrednost ispisuje na 8 lampica. Broj upaljenih lampica krenuvši od lampice
  na pinu 26 treba da bude srazmeran jačini ulaza sa potenicometra.
*/
const int analogInPin = A0;

#define PWM_BIT_TIME 6
#define PWM_PERIOD (PWM_BIT_TIME * 1024)

void potenciometar(int id, void *tptr)
{
    for(int i = 26; i <= 33; i++)
        digitalWrite(i, LOW);

    int sensorValue = analogRead(analogInPin);
    int outputValue = sensorValue * PWM_BIT_TIME;

    int broj = sensorValue / 116; // od 1 do 8 lampica - 9 slucajeva

    for(int i = 26; i <= 33; i++)
    {
        if(i - 26 < broj)
            digitalWrite(i, HIGH);
        else
            digitalWrite(i, LOW);
    }

}

void setup()
{
    Serial.begin(9600);

    for(int i = 26; i <= 33; i++)
        pinMode(i, OUTPUT);

    createTask(potenciometar, 50, TASK_ENABLE, NULL);
}

void loop()
{

}