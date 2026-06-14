/*  Napisati program koji koristeci task blink_task1 proverava stanje
na prekidacu i ukoliko je prekidac upaljen, upaliti lampicu, a ukoliko je
prekidac ugasen, ugasiti lampicu. Redni broj prekidaca i lampice primiti kao
parametar. Koristeci dati task, kontrolisati lampice na pinovima 26, 27, 28 i
29 u zavisnosti od stanja na prikidacima na pinovima 2, 7, 8 i 35.
*/

typedef struct Podaci
{
    short PIN_PREKIDAC;
    short PIN_LLAMPICA;
} podaci;

void blink_task1(int id, void *tptr)
{
    podaci *tmp= (podaci *) tptr;
    digitalWrite(tmp -> PIN_LLAMPICA, digitalRead(tmp -> PIN_PREKIDAC));
}

void setup()
{
    Serial.begin(9600);

    pinMode(26, OUTPUT);
    pinMode(27, OUTPUT);
    pinMode(28, OUTPUT);
    pinMode(29, OUTPUT);

    static podaci p[4];
    p[0] = (podaci) { 2, 26};
    p[1] = (podaci) { 7, 27};
    p[2] = (podaci) { 8, 28};
    p[3] = (podaci) {35, 29};

    createTask(blink_task1,  25, TASK_ENABLE, p);
    createTask(blink_task1,  25, TASK_ENABLE, p + 1);
    createTask(blink_task1,  25, TASK_ENABLE, p + 2);
    createTask(blink_task1,  25, TASK_ENABLE, p + 3);
}

void loop()
{

}