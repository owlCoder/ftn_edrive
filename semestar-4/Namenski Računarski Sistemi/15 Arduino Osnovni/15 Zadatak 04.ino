/*
  Napisati program koji na svakih 1s učitava binarni broj koji
  formairaju prekidaci na pinovima 35, 8, 7 i 2 prebacuje ga u dekadni i
  ispisuje taj broj na serijskom monitoru u dekadnom sistemu.
  
  - Na primer, ako su upaljeni samo prekidači na pinovima 8 i 2, tada oni čine broj
  0101 u osnovi 2, što je broj 5.

 */
void ispis(int id, void *tptr) 
{
   int dekatni = digitalRead(35) * 8 + digitalRead(8) * 4 + digitalRead(7) * 2 + digitalRead(2) * 1;
   Serial.println(dekatni);
}

void setup()
{
  Serial.begin(9600);

  createTask(ispis, 1000, TASK_ENABLE, NULL);
}

void loop()
{

}
