/*
    Napisati program koji koristeći task dugme() broji broj pritisaka
    na dugme koji su duži od 2s i nakon svakog takvog pritiska ispisuje broj
    pritisaka na serijski monitor.
*/

int oldState, oldTime, brojac;
int PIN_BTN1 = 4;

void dugme1(int id, void * tptr)
{
    int newState = digitalRead(PIN_BTN1);
	if (oldState == 1  && newState == 0) {
        if (millis()-oldTime>=2000) {
            brojac++;
            Serial.println(brojac);
		}
	} else if (oldState == 0 && newState ==1) {
        oldTime = millis();
	}
	oldState = newState;
}

void setup()
{
    Serial.begin(9600);
    oldState = digitalRead(PIN_BTN1);
    oldTime = millis();
    brojac = 0;
    createTask(dugme1, 50, TASK_ENABLE, NULL);
}

void loop()
{

}