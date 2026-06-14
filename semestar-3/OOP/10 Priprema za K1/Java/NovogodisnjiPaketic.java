public class NovogodisnjiPaketic implements Pakovanje {
	private String opis;
	private String namenjen;
	private boolean spakovan;
	private int minimalanUzrast;
	private boolean zasluzen;
	private boolean spremanZaIsporuku;
	
	public NovogodisnjiPaketic(String opis, String namenjen, boolean spakovan, int minimalanUzrast, boolean zasluzen, boolean spremanZaIsporuku) {
		super();
		this.opis = opis;
		this.namenjen = namenjen;
		this.spakovan = spakovan;
		this.minimalanUzrast = minimalanUzrast;
		this.zasluzen = zasluzen;
		this.spremanZaIsporuku = spremanZaIsporuku;
	}
	
	@Override
	public boolean spakuj() {
		if(spakovan == true  || zasluzen == false) {
			return false;
		}
		else {
			if((namenjen.equals("za decaka") || namenjen.equals("za devojcicu")) && minimalanUzrast > 2) {
				spakovan = true;
				System.out.println("Novogodisnji paketic je uspesno spakovan");
				return true;
			}
			System.out.println("Novogodisnji paketic NIJE uspesno spakovan");
			return false;
		}
	}
	
	@Override
	public String toString() {
		String spakovanPaketic, zasluzenPaketic, spreman;
		
		if(spakovan) spakovanPaketic  = "SPAKOVAN";
		else 		 spakovanPaketic  = "NIJE SPAKOVAN";
		
		if(zasluzen) zasluzenPaketic  = "ZASLUZEN";
		else		 zasluzenPaketic  = "NIJE ZASLUZEN";
		
		if(spremanZaIsporuku) spreman = "SPREMAN";
		else				  spreman = "NIJE SPREMAN";
		
		return "Novogodisnji paketic [opis=" + opis + 
				", namenjen=" + namenjen + 
				", spakovan=" + spakovanPaketic +
				", minimalanUzrast=" + minimalanUzrast +
				", zasluzen=" + zasluzenPaketic +
				", spremanZaIsporuku=" + spreman + "]";
	}

	public String getOpis() {
		return opis;
	}

	public void setOpis(String opis) {
		this.opis = opis;
	}
	
	public String getNamenjen() {
		return namenjen;
	}

	public void setNamenjen(String namenjen) {
		this.namenjen = namenjen;
	}

	public boolean isSpakovan() {
		return spakovan;
	}

	public void setSpakovan(boolean spakovan) {
		this.spakovan = spakovan;
	}

	public int getMinimalanUzrast() {
		return minimalanUzrast;
	}

	public void setMinimalanUzrast(int minimalanUzrast) {
		this.minimalanUzrast = minimalanUzrast;
	}

	public boolean isZasluzen() {
		return zasluzen;
	}

	public void setZasluzen(boolean zasluzen) {
		this.zasluzen = zasluzen;
	}

	public boolean isSpremanZaIsporuku() {
		return spremanZaIsporuku;
	}

	public void setSpremanZaIsporuku(boolean spremanZaIsporuku) {
		this.spremanZaIsporuku = spremanZaIsporuku;
	}
}
