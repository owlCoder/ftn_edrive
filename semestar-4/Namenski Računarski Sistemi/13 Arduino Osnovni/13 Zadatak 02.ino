/*
	- Kreirati funkciju enableInterrupt1() koja omogućuje korišćenje interapta za
	dugme BTN1
	
	- Kreirati funkciju disableInterrupt1() koja onemogućuje korišćenje
	interapta za dugme BTN1
	
	- Kreirati funkciju getInterrupatEnable1() koja vraća da li je omogućen
	prekid na dugmetu BTN1
	
	- Proširiti funkconalnost handler-a da podržava i dugme BTN2
	
	- Omogućiti da pri paljenju/gašenju dugmeta BTN2 bude
	omogućeno/onemogućeno korišćenje interapta na dugmetu BTN1
*/
typedef void var_func();
var_func *rastucaIvica = NULL, *opadajucaIvica = NULL;
var_func *rastucaIvica_btn2 = NULL, *opadajucaIvica_btn2 = NULL;
int staroStanje = 0, novoStanje = 0;
int staroStanje_btn2 = 0, novoStanje_btn2 = 0;
int btn1, btn2;

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

void attachInterrupt_btn2(var_func *fun, int mod)
{
    if(mod == RISING)
        rastucaIvica_btn2 = fun;
    else
        opadajucaIvica_btn2 = fun;
}

void dettachInterrupt_btn2(int mode)
{
    if(mode == RISING)
        rastucaIvica_btn2 = NULL;
    else
        opadajucaIvica_btn2 = NULL;
}

void interruptOn()  { digitalWrite(27, HIGH); }
void interruptOff() { digitalWrite(27, LOW); }
void enableInterrupt()  { btn1 = 1; }
void disableInterrupt() { btn1 = 0; }
void enableInterrupt2() { btn2 = 1; }
void disableInterrupt2(){ btn2 = 0; }
void interrupt1Enable() { enableInterrupt(); }
void interrupt1Disable(){ disableInterrupt();}

void dugme2(int id, void *tptr)
{
    novoStanje_btn2 = digitalRead(34);

    if(staroStanje_btn2 == 0 && novoStanje_btn2 == 1)
    {
        if(rastucaIvica_btn2 != NULL)
            rastucaIvica_btn2();
    }
    else if(staroStanje_btn2 == 1 && novoStanje_btn2 == 0)
    {
        if(opadajucaIvica_btn2 != NULL)
            opadajucaIvica_btn2();
    }

    staroStanje_btn2 = novoStanje_btn2;
}

void setup()
{
    pinMode(27, OUTPUT);

    staroStanje_btn2 == 0 ? disableInterrupt() : enableInterrupt();
    enableInterrupt2();

    attachInterrupt_btn(interruptOn, RISING);
    attachInterrupt_btn(interruptOff, FALLING);
    attachInterrupt_btn2(interruptOn, RISING);
    attachInterrupt_btn2(interruptOff, FALLING);

    createTask(dugme, 20, TASK_ENABLE, NULL);
    createTask(dugme2, 20, TASK_ENABLE, NULL);
}

void loop()
{

}
