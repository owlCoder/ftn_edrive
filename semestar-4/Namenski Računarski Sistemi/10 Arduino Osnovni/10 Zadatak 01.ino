/* Napisati program koji pali i gasi led diode LD8 i LD2 na pinovima
33 i 27. Pin 33 se i pali i gasi u jednom ciklusu loop-a, a pin 27 se pali ili gasi
u zavisnosti od stanja prekidaca SW2 na pinu 7.
*/

void setup()
{
    Serial.begin(9600);

    pinMode(27, OUTPUT);
    pinMode(33, OUTPUT);
}

void loop()
{
    digitalWrite(33, HIGH);
    delay(500);
    digitalWrite(33, LOW);
    delay(500);

    if(digitalRead(7))
        digitalWrite(27, HIGH);
    else
        digitalWrite(27, LOW);
}