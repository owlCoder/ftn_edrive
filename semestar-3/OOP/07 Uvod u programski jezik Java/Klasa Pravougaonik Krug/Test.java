package z1;

public class Test {

	public static void main(String[] args) 
	{
		Pravougaonik p1 = new Pravougaonik(3, 5);
		System.out.println("Obim pravougaonika p1 je: " + p1.getO());
		System.out.println("Povrsina pravougaonika p1 je " + p1.getP());
		
		Pravougaonik p2 = new Pravougaonik(p1);
		System.out.println("\nObim pravougaonika p2 je: " + p2.getO());
		System.out.println("Povrsina pravougaonika p2 je " + p2.getP());
		
		Krug k = new Krug(3);
		System.out.println("\nObim kruga je " + k.getO());
		System.out.println("Povrsina kruga je " + k.getP());
	}
}