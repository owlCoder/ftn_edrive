/*
  Napisati program koji uzima jedan po jedan red sa serijskog ulaza
  i ispisuje ga na serijski izlaz
 */
void ispis(int id, void *tptr) 
{
   if (Serial.available()) 
   {
       Serial.println(Serial.readString());
   }
}

void setup()
{
  Serial.begin(9600);

  createTask(ispis, 50, TASK_ENABLE, NULL);
}

void loop()
{

}
