import java.util.ArrayList;

public class DedaMraz {
	private ArrayList<NovogodisnjiPaketic> novogodisnjiPaketici;
	
	public DedaMraz() {
		super();
		this.novogodisnjiPaketici = new ArrayList<NovogodisnjiPaketic>();
	}
	
	public boolean pripremiZaIsporuku(NovogodisnjiPaketic np, String opisPaketica) {
		boolean spakovano = np.spakuj();
		
		if(spakovano) {
			np.setOpis(opisPaketica);
			np.setSpremanZaIsporuku(true);
			System.out.println("Novogodisnji paketic je spreman za isporuku.");
			return true;
		}
		return false;
	}
	
	/*
	    Metodu boolean dodaj(NovogodisnjiPaketic) – u sluèaju da prosleðeni
		novogodišnji paketiæ nije spreman za isporuku, metoda vraæa false. Ukoliko se pak
		ispostavi da je spreman za isporuku, i veæ se nalazi u listi, metoda takoðe vraæa false.
		Ako je novogodišnji paketiæ spreman za isporuku i ne nalazi se u vreæi Deda Mraza, tada
		povratna vrednost metode odgovara (ne)uspešnom pokušaju dodavanja u listu.
	 */
	public boolean dodaj(NovogodisnjiPaketic novogodisnjiPaketic) {
		if(!novogodisnjiPaketic.isSpremanZaIsporuku()) 
			return false;
		
		for(NovogodisnjiPaketic np : novogodisnjiPaketici)
			if(np.equals(novogodisnjiPaketic)) 
				return false;
		
		return novogodisnjiPaketici.add(novogodisnjiPaketic);
	}
	
	/*
	 	Metodu boolean izbaci(String) – iz liste uklanja prvi novogodišnji paketiæ èija je
		vrednost atributa namenjen jednaka prosleðenoj. Povratna vrednost metode odgovara
		(ne)uspešnom pokušaju izbacivanja.
	 */
	public boolean izbaci(String namenjen) {
		for(int i = 0; i < novogodisnjiPaketici.size(); i++)
			if(novogodisnjiPaketici.get(i).getNamenjen().equals(namenjen))
				return novogodisnjiPaketici.remove(novogodisnjiPaketici.get(i));
					
		return false;
	}
	
	@Override
	public String toString() {
		String str = "";
		
		str += "---------------------------- DEDA MRAZ ----------------------------\n";
		
		if(novogodisnjiPaketici.isEmpty())
			str += "Vreca Deda Mraza je trenutno prazna!\n";
		else {
			for(int i = 0; i < novogodisnjiPaketici.size(); i++)
				str += novogodisnjiPaketici.get(i) + "\n";
		}
		
		str += "-------------------------------------------------------------------";
		
		return str;
	}
}
