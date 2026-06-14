package sp;

public class Bojica implements IzracunavanjeCene {
	private String serijskiBroj;
	private double cena;
	private String boja;
	private String tip;
	
	public Bojica(String serijskiBroj, double cena, String boja, String tip) {
		super();
		this.serijskiBroj = serijskiBroj;
		this.cena = cena;
		this.boja = boja;
		this.tip = tip;
	}

	public Bojica(Bojica b) {
		this.serijskiBroj = b.serijskiBroj;
		this.cena = b.cena;
		this.boja = b.boja;
		this.tip = b.tip;
	}
	
	@Override
	public boolean akcijskaCena(double c) {
		if(c <= 0) {
			System.out.println("NEUSPESAN POKUSAJ SMANJIVANJA CENE!");
			return false;
		}
		else {
			cena *= (1 - (c / 100));
			System.out.println("CENA JE SNIZENA ZA " + c + "%!");
			return true;
		}
	}
	
	@Override
	public String toString() {
		return "Bojica [serijskiBroj=" + serijskiBroj + ", cena=" + cena + ", boja=" + boja + ", tip=" + tip + "]";
	}

	public String getSerijskiBroj() {
		return serijskiBroj;
	}

	public void setSerijskiBroj(String serijskiBroj) {
		this.serijskiBroj = serijskiBroj;
	}

	public double getCena() {
		return cena;
	}

	public void setCena(double cena) {
		this.cena = cena;
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public String getBoja() {
		return boja;
	}

	public void setBoja(String boja) {
		this.boja = boja;
	}

}
