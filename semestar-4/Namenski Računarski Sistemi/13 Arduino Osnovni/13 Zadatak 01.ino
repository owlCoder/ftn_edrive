/*
	Napisati program koji pri pritisku dugmeta BTN1 (pin 4) pali
	lampicu LD2 (pin 27), a pri puštanju dugmeta BTN1, gasi lampicu LD2.
	
	- Paljenje i gašenje lampice realizovati preko preko interapta povezanih na
	dugme BTN1.
	
	- Kako dugmadi nisu podrzana u interaptima, kreirati kompletan handler za
	dugme BTN1, koji podrazumeva i funkcije attachInterrupt1() i
	deattachInterrupt1() slične postojećim funkcijama.
*/
typedef void var_func();
var_func *rastucaIvica = NULL, *opadajucaIvica = NULL;
int staroStanje = 0, novoStanje = 0;

void attachInterrupt_btn(var_func *fun, int mod)
{
    if(mod == RISING)
        rastucaIvica = fun;
    else
        opadajucaIvica = fun;
}

void dettachInterrupt_btn(int mode)
{
    if(mode == RISING)
        rastucaIvica = NULL;
    else
        opadajucaIvica = NULL;
}

void interruptOn()  { digitalWrite(27, HIGH); }
void interruptOff() { digitalWrite(27, LOW); }

void dugme(int id, void *tptr)
{
    novoStanje = digitalRead(4);

    if(staroStanje == 0 && novoStanje == 1)
    {
        if(rastucaIvica != NULL)
            rastucaIvica();
    }
    else if(staroStanje == 1 && novoStanje == 0)
    {
        if(opadajucaIvica != NULL)
            opadajucaIvica();
    }

    staroStanje = novoStanje;
}

void setup()
{
    pinMode(27, OUTPUT);

    attachInterrupt_btn(interruptOn, RISING);
    attachInterrupt_btn(interruptOff, FALLING);

    createTask(dugme, 20, TASK_ENABLE, NULL);
}

void loop()
{

}


