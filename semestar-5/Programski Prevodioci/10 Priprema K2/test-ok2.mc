// test-ok1
//RETURN: 10
int main(){
    int i;
    int a;
    a = 0;

    PERFORM VARYING i FROM 0 BY 1 UNTIL i = 10
    {
        a = a + 1;
    };

    return a;
}