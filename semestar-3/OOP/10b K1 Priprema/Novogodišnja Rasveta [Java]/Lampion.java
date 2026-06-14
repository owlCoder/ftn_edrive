package priprema;

public class Lampion implements Popravka {
	private int sifra;
	private String boja;
	private boolean ispravan;
	private double cena;
	
	public Lampion(int sifra, String boja, boolean ispravan, double cena) {
		super();
		this.sifra = sifra;
		this.boja = boja;
		this.ispravan = ispravan;
		this.cena = cena;
	}
	
	public Lampion(Lampion l) {
		super();
		this.sifra = l.sifra;
		this.boja = l.boja;
		this.ispravan = l.ispravan;
		this.cena = l.cena;
	}
	
	@Override
	public boolean popravi() {
		if(ispravan == false) {
			ispravan = true;
			return true;
		}
		return false;
	}
	
	

	@Override
	public String toString() {
		return "Lampion [sifra=" + sifra + ", boja=" + boja + ", ispravan=" + (ispravan == true ? "DA" : "NE")+ ", cena=" + cena + "]";
	}

	public int getSifra() {
		return sifra;
	}

	public String getBoja() {
		return boja;
	}

	public boolean isIspravan() {
		return ispravan;
	}

	public double getCena() {
		return cena;
	}

	public void setCena(double cena) {
		this.cena = cena;
	}
}
