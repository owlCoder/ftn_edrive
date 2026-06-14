// test-semerr1
//RETURN: 5
int main()
{
    int i;
    int a;
    a = 0;

    PERFORM VARYING i FROM 0 BY 1 UNTIL a = 4
    {
        a = a + 1;
    };

    return a;
}