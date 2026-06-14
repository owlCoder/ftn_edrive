/*
   Napisati program koji sa potenctiometra čita vrednost ulaza na
  svakih 100ms i proverava da li je došlo do naglog skoka ulaznog signala i o
  tome obaveštava korisnika putem serijskog porta. Do naglog skoka dolazi
  ukoliko se u poslednjih 5 merenja vrednost signala promenila za više od 200.
*/
const int analogInPin = A0;

#define PWM_BIT_TIME 6
#define PWM_PERIOD (PWM_BIT_TIME * 1024)

int razlikaSkoka = 0;
int merenja[5] = {0};
int brojac = 0;

void potenciometar(int id, void *tptr)
{
    int sensorValue = analogRead(analogInPin);

        int min = merenja[0];
        int max = merenja[0];
        
        for(int j = 1; j < 5; j++)
        {
            if(merenja[j] < min)
              min = merenja[j];

            if(merenja[j] > max)
              max = merenja[j];
        }

        if(max - min > 200)
        {
            Serial.println("Doslo je do vece promene na potenciometru!");
            
            for(int j = 0; j < 5; j++)
                  merenja[j] = merenja[brojac];
        }
   
    brojac=(brojac + 1) % 5;
    merenja[brojac] = sensorValue;
}

void setup()
{
    Serial.begin(9600);
    createTask(potenciometar, 100, TASK_ENABLE, NULL);
}

void loop()
{

}
