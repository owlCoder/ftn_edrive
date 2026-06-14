public class Test {

	public static void main(String[] args) {
		NovogodisnjiPaketic np1 = new NovogodisnjiPaketic("", "za decaka", false, 3, true, false);
		NovogodisnjiPaketic np2 = new NovogodisnjiPaketic("", "za devojcicu", false, 4, true, false);
		NovogodisnjiPaketic np3 = new NovogodisnjiPaketic("", "za decaka", false, 2, true, false);
		NovogodisnjiPaketic np4 = new NovogodisnjiPaketic("", "za devojcicu", false, 3, true, false);
		NovogodisnjiPaketic np5 = new NovogodisnjiPaketic("", "za decaka", false, 5, true, false);
		NovogodisnjiPaketic np6 = new NovogodisnjiPaketic("", "za devojcicu", false, 1, true, false);

		DedaMraz dm = new DedaMraz();
		
		System.out.println(dm);
		
		dm.pripremiZaIsporuku(np1, "vozic");
		dm.pripremiZaIsporuku(np2, "barbika");
		dm.pripremiZaIsporuku(np3, "lego kockice");
		dm.pripremiZaIsporuku(np4, "bratz lutka");
		dm.pripremiZaIsporuku(np5, "dinosaurus");
		dm.pripremiZaIsporuku(np6, "plisani meda");
		
		dm.dodaj(np1);
		dm.dodaj(np2);
		dm.dodaj(np3);
		dm.dodaj(np4);
		dm.dodaj(np5);
		dm.dodaj(np6);
		dm.dodaj(np5);
		
		System.out.println(dm);
		dm.izbaci("za devojcicu");
		System.out.println(dm);
	}
}
