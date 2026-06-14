//OPIS: b nije definisano
int main() {
    int a;

    match b positive
    {
        5 => 10;
        6 => 5;
        5 => 12;
        _ => break_me;
    };
}