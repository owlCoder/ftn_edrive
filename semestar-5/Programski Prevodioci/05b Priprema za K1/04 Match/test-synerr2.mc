//OPIS: breakme
int main() {
    int a;

    match a positive
    {
        5 => 10;
        6 => a = 5;
        5 => 12;
        _ => breakme;
    };
}