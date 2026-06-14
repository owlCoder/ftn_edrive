/*
    Napisati program koji koristeći task blink_task1() pali i gasi led
  diodu LD1 na pinu 26 na svakih 100 milisekundi. Nakon toga:
  • Napisati task prekidac1() koji se pali na svakih 50 ms i proverava stanje
  prekidača SW1 na pinu 2. Ukoliko je prekidač upravo upaljen, omogućiti
  korišćenje taska blink_task1, a ukoliko je upravo ugašen, onemogućiti ga
  • Napisati task prekidac2() koji se pali na svakih 50 ms i proverava stanje
  prekidača SW2 na pinu 7. Ukoliko je prekidač upravo upaljen, promeniti vreme
  blinkanja taska blink_task1 na 1000 ms, a ukoliko je upravo ugašen na 100ms
*/
int oldState1, oldState2, blink1_id;
int PIN_SW1 = 2;
int PIN_SW2 = 7;
int PIN_LED1a = 26;

void blink_task1(int id, void * tptr)
{
  digitalWrite(PIN_LED1a, !digitalRead(PIN_LED1a));  
}

void prekidac1(int id, void * tptr)
{
    int newState = digitalRead(PIN_SW1);
	if (oldState1 == 1  && newState == 0) {
        setTaskState(blink1_id, TASK_DISABLE);
	} else if (oldState1 == 0 && newState ==1) {
        setTaskState(blink1_id, TASK_ENABLE);
	}
	oldState1 = newState;
}

void prekidac2(int id, void * tptr)
{
    int newState = digitalRead(PIN_SW2);
	if (oldState2 == 1  && newState == 0) {
        setTaskPeriod(blink1_id, 100);
	} else if (oldState2 == 0 && newState ==1) {
        setTaskPeriod(blink1_id, 1000);
	}
	oldState2 = newState;
}

void setup()
{
    pinMode(PIN_LED1a, OUTPUT);
    oldState1 = digitalRead(PIN_SW1);
    oldState2 = digitalRead(PIN_SW2);
    if (oldState1==1)
        blink1_id = createTask(blink_task1, 100, TASK_ENABLE, NULL);
    else
        blink1_id = createTask(blink_task1, 100, TASK_DISABLE, NULL);
    createTask(prekidac1, 50, TASK_ENABLE, NULL);
    createTask(prekidac2, 50, TASK_ENABLE, NULL);
}

void loop()
{

}