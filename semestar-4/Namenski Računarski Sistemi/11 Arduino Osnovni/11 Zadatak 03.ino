/*  Napisati program koji koristeci task blink_task1 pali i gasi led
diodu LD8 na pinu 33 na svakih 100 milisekundi. Kreirati i task blink_task2,
koji na svakih 25 milisekundi proverava stanje prekidaca na pinovima 2, 7, 8,
i 35, broji koliko ima upaljenih prekidaca i u zavisnosti od toga, postavlja
period blinkanja lampice LD8 na 100, 200, 300, 400 ili 500ms. Period
blinkanja menjati periodom na koji se startuje blink_task1
*/

static int blind1_id;

int VREMENA[5] = {100, 200, 300, 400, 500};

void blink_task1(int id, void *tptr)
{
    digitalWrite(33, !digitalRead(33));
}

void blink_task2(int id, void *tptr)
{
    int sum = digitalRead(2) + digitalRead(7) + digitalRead(8) + digitalRead(35);
    setTaskPeriod(blind1_id, VREMENA[sum]);
}

void setup()
{
    Serial.begin(9600);

    pinMode(33, OUTPUT);
    blind1_id = createTask(blink_task1, 100, TASK_ENABLE, NULL);
    createTask(blink_task2, 1000, TASK_ENABLE, NULL);
}

void loop()
{

}
