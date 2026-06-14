/* Napisati program koji broji koliko je upaljenih prekidaca na
pinovima 2, 7, 8 i 35, i u zavisnosti od toga pali duplo veci broj lampica,
pocevsi od lampice sa brojem 26.
*/

void setup()
{
    Serial.begin(9600);

    for(int i = 26; i <= 33; i++)
        pinMode(i, OUTPUT);
}

void loop()
{
    int suma = digitalRead(2) + digitalRead(7) + digitalRead(8) + digitalRead(35);
    suma *= 2;

    /// UGASI SVE LAMPICE
    for(int i = 33; i >= 26; i--)
        digitalWrite(i, LOW);

    /// UKLJUCI DUPLO VECI BROJ LAMPICA
    for(int i = 26, j = 0; j < suma; i++, j++)
        digitalWrite(i, HIGH);
}
