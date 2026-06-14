package sp;

import java.util.HashMap;

public class Pernica {
	private HashMap<String, Bojica> bojice;
	private int rasplozivoMesto = 5;
	
	public Pernica() {
		this.bojice = new HashMap<>();
	}
	
	public boolean dodaj(Bojica b) {
		if(bojice.containsKey(b.getSerijskiBroj())) {
			return false;
		}
		
		if(bojice.size() <= rasplozivoMesto) {
			bojice.put(b.getSerijskiBroj(), b);
			return true;
		}
		return false;
	}
	
	public int prebroj(double cena) {
		int brojac = 0;
		for(Bojica b: bojice.values()) { 
			if(b.getCena() > cena) {
				brojac++;
			}
		}
		return brojac;
	}
	
	@Override
	public String toString() {
		if(bojice.isEmpty()) {
			return "MAPA JE PRAZNA!";
		}
		return "Pernica [bojice=" + bojice + ", rasplozivoMesto=" + rasplozivoMesto + "]";
	}
	
	public static void main(String[] args) {
		Bojica b1 = new Bojica("123", 20, "PLAVA", "DRVENA");
		Bojica b2 = new Bojica("124", 30, "CRVENA", "VOSTANA");
		Bojica b3 = new Bojica(b1);
		
		b2.getBoja();
		b2.getCena();
		b3.getSerijskiBroj();
		b3.getTip();
		
		b3.akcijskaCena(10);
		
		System.out.println(b3);
		
		Pernica p = new Pernica();
		
		p.dodaj(b1);
		p.dodaj(b2);
		p.dodaj(b3);
		
		System.out.println("BROJ BOJICA: " + p.prebroj(10));
		System.out.println(p);
	}

}
