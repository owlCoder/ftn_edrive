/* Napisati program koji pali i gasi led diode LD8 i LD2 na pinovima
33 i 27 na svakih 500, odnosno 25 milisekundi. Kreirati dva task-a
blink_task1 i blink_task2, za svaku lampicu po jedan. Nakon toga, kreirati
task blink_task3 koja omogucuje/onemogucuje task blink_task2 u zavisnosti
od stanja prekidaca SW2
*/

int blink1_id, blink2_id;

void blink_task1(int id, void *tptr)
{
    digitalWrite(33, !digitalRead(33));
}

void blink_task2(int id, void *tptr)
{
    digitalWrite(27, !digitalRead(27));
}

void blink_task3(int id, void *tptr)
{
    if(digitalRead(7))
        setTaskState(blink2_id, TASK_DISABLE), digitalWrite(27, LOW);
    else
        setTaskState(blink2_id, TASK_ENABLE);
}

void setup()
{
    Serial.begin(9600);

    pinMode(27, OUTPUT);
    pinMode(33, OUTPUT);

    blink1_id = createTask(blink_task1, 500, TASK_ENABLE, NULL);
    blink2_id = createTask(blink_task2, 25 , TASK_ENABLE, NULL);
    createTask(blink_task3, 25 , TASK_ENABLE, NULL);
}

void loop()
{

}