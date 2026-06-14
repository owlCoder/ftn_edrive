//OPIS: dva brancha jedan za drugim
//RETURN: 8
int main(){
	int a;
	int b;
	a = 1;
	b = 3;
	branch ( a ; 1 , 3 , 5 )
	  first a = a + 1;
	  second a = a + 3;
	  third a = a + 5;
	  otherwise a = a - 3;
	
	branch ( b ; 1 , 3 , 5 )
	  first a = a + 1 + b;
	  second a = a + 3 + b;
	  third a = a + b+ 5;
	  otherwise a = a - 3 + b;
	
	return a;
}
