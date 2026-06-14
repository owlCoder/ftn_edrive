//OPIS: branch, otherwise
//RETURN: -1
int main(){
	int a;
	a = 2;
	
	branch ( a ; 1 , 3 , 5 )
	  first a = a + 1;
	  second a = a + 3;
	  third a = a + 5;
	  otherwise a = a - 3;
	
	return a;
}
