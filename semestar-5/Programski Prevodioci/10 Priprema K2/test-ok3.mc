//OPIS: ugnjezdeni for
//RETURN: 20
int main(){
    int i;
    int j; 
    int a;
    a = 0;

    PERFORM VARYING i FROM 0 BY 1 UNTIL i = 10
    {
        PERFORM VARYING j FROM 0 BY 2 UNTIL j = 4
        {
            a = a + 1;
        };
    };

    return a;
}