var person1={
    firstName:"Mika",
    lastName:"Mikic",
    age:22
}
alert("Ime prvog korisnika je "+person1.firstName)

var person2= new Object();
person2.firstName="Luka";
person2. lastName="Lukic";
person2.age=23;
alert("Ime drugog korisnika je "+person2.firstName)

function Person(firstName, lastName, age){
    this.firstName=firstName;
    this.lastName=lastName;
    this.age=age;
 };
 var person3=new Person("Pera", "Peric", 24);
 alert("Ime treceg korisnika je "+person3.firstName)
