package z31;
import z1.Pravougaonik;

public class PP3Prizma {
	private Pravougaonik omotac = new Pravougaonik(0, 0);
	private JSTrougao baza = new JSTrougao(0);
	
	public PP3Prizma(Pravougaonik p, JSTrougao t) {
		omotac.setA(p.getA());
		omotac.setB(p.getB());
		baza.setA(t.getA());
	}
	
	public PP3Prizma(PP3Prizma pp) {
		omotac.setA(pp.omotac.getA());
		omotac.setB(pp.omotac.getB());
		baza.setA(pp.baza.getA());
	}
	
	public double getOsnovica() {
		return baza.getA();
	}
	
	public double getVisinaPrizme() {
		return omotac.getB();
	}
	
	public double V() {
		return ((Math.pow(baza.getA(), 2) * Math.sqrt(3)) / 4) * getVisinaPrizme();
	}
	
	public double P() {
		double baza = (Math.pow(getOsnovica(), 2) * Math.sqrt(3)) / 4;
		double omotac = 3 * getOsnovica() * getVisinaPrizme();
		
		return 2 * baza + omotac;
	}
}
