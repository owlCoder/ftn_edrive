/*
  Napisati program koji učitava dva broja sa serijskog ulaza, sabira
  ih i ispisuje njihov zbir.
*/
bool prviUcitan = false, drugiUcitan = false;
int prvi = 0, drugi = 0;

void ucitaj(int id, void *tptr) 
{
   if(Serial.available())
   {
      if(!prviUcitan)
      {
          prvi = atoi(Serial.readString().c_str());
          prviUcitan = true;
      } 
      else if(!drugiUcitan)
      {
          drugi = atoi(Serial.readString().c_str());
          drugiUcitan = true;
      }
   }
   else
   {
      if(prviUcitan && drugiUcitan)
      {
          Serial.println(prvi + drugi);
          prviUcitan = true;
          drugiUcitan = false;
          prvi = prvi + drugi;
      }
        
   }
}

void setup()
{
  Serial.begin(9600);

  createTask(ucitaj, 1000, TASK_ENABLE, NULL);
}

void loop()
{

}
