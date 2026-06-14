package z2;
import z1.Pravougaonik;

public class TestNiz {

	public static void main(String[] args) 
	{
		int nizInt[] = {3, 8, 2, 5, 7};
		System.out.print("nizInt: ");
		for(int i = 0; i < nizInt.length; i++) {
			System.out.print(nizInt[i] + " ");
		}
		
		double nizDouble[] = new double[3];
		nizDouble[1] = 2.3;
		System.out.print("\nnizDouble: ");
		for(int i = 0; i < nizDouble.length; i++) {
			System.out.print(nizDouble[i] + " ");
		}
		
		Pravougaonik pravougaonici[] = new Pravougaonik[5];
		pravougaonici[0] = new Pravougaonik(3, 4);
		pravougaonici[1] = new Pravougaonik(1, 9);
		pravougaonici[2] = new Pravougaonik(4, 7);
		pravougaonici[3] = new Pravougaonik(5, 6);
		pravougaonici[4] = new Pravougaonik(6, 3);
		System.out.print("\nPovrsine pravougaonika: ");
		for(int i = 0; i < pravougaonici.length; i++) {
			System.out.print(pravougaonici[i].getP() + " ");
		}
	
		Pravougaonik pMax = najvecaPovrsina(pravougaonici);
		
		if(pMax == null) {
			System.out.println("\nNema pravougaonika!");
		}
		else {
			System.out.println("\nNajveca povrsina je: " + pMax.getP());
		}
	}
	
	public static Pravougaonik najvecaPovrsina(Pravougaonik[] ps) {
		if(ps == null) {
			return null;
		}
		else {
			Pravougaonik pMax = ps[0];
			for(int i = 1; i < ps.length; i++) {
				if(ps[i].getP() > pMax.getP()) {
					pMax = ps[i];
				}
			}
			return pMax;
		}
	}
}
