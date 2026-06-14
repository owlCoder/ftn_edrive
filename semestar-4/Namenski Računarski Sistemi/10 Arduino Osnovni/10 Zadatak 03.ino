/* Napisati program koji pali lampice na pinovima od 26 do 33, tako
što prvo pali lampice 26 i 33, zatim 27 i 32, itd... sve dok se lampice ne
sudare. Nakon toga, lampice paliti u obrnutom redosledu, pa sve ponavljati.
U zavisnosti od stanja prekidaca SW na pinu 7, podesiti jednu od dve brzine
rotacije
*/

void setup()
{
  Serial.begin(9600);

  for(int i = 26; i <= 33; i++)
    pinMode(i, OUTPUT);
}

void loop()
{
    for(int i = 33, j = 26; i != j; i--, j++)
    {
        if(i < 26) i = 33;
        if(j > 33) j = 26;

        digitalWrite(i, HIGH);
        digitalWrite(j, HIGH);

        if(digitalRead(7))
            delay(100);
        else
            delay(500);

        digitalWrite(i, LOW);
        digitalWrite(j, LOW);
    }
}
