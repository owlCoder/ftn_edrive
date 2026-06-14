package priprema;

public class Test {

	public static void main(String[] args) {
		// LAMPIONI
		Lampion l1 = new Lampion(1, "ROZE ", false, 100);
		Lampion l2 = new Lampion(l1);
		Lampion l3 = new Lampion(2, "PLAVA", true, 10000);
		
		l1.getBoja();
		l2.getCena();
		l3.getSifra();
		l1.isIspravan();
		l1.setCena(500);
		System.out.println(l1 + "\n" + l2 + "\n" + l3);
		
		System.out.println( (l1.popravi() == true ? "L1: LAMPION POPRAVLJEN" : "L1: LAMPION NIJE POPRAVLJEN") );
		System.out.println( (l1.popravi() == true ? "L1: LAMPION POPRAVLJEN" : "L1: LAMPION NIJE POPRAVLJEN") );
		System.out.println( (l2.popravi() == true ? "L2: LAMPION POPRAVLJEN" : "L2: LAMPION NIJE POPRAVLJEN") );
		System.out.println( (l3.popravi() == true ? "L3: LAMPION POPRAVLJEN" : "L3: LAMPION NIJE POPRAVLJEN") );

		
		// Novogodisnja Rasveta
		NovogodisnjaRasveta nr = new NovogodisnjaRasveta();
		
		System.out.println( (nr.dodaj(l1) == true ? "L1: LAMPION DODAT" : "L1: LAMPION NIJE DODAT") );
		System.out.println( (nr.dodaj(l2) == true ? "L2: LAMPION DODAT" : "L2: LAMPION NIJE DODAT") );
		System.out.println( (nr.dodaj(l3) == true ? "L3: LAMPION DODAT" : "L3: LAMPION NIJE DODAT") );
		System.out.println( (nr.dodaj(l3) == true ? "L3: LAMPION DODAT" : "L3: LAMPION NIJE DODAT") );

		System.out.println("\nTrazimo lampion sa cenom vecom od 20 i boja plava\n");
		Lampion trazeni = null;
		trazeni = nr.pronadji(20, "PLAVA");
		
		System.out.println( trazeni == null ? "LAMPION NE POSTOJI!" : trazeni);
		
		System.out.println("\nPRE AKCIJE\n" + nr);
		nr.akcija();
		System.out.println("\nPOSLE AKCIJE\n" + nr);
	}

}
