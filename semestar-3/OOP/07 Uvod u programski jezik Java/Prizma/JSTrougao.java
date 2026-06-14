package z31;

public class JSTrougao {
	private double a;

	public JSTrougao(double a) {
		this.a = a;
	}
	
	public JSTrougao(JSTrougao jt) {
		a = jt.a;
	}
	
	public double getO() {
		return 3 * a;
	}
	
	public double getP() {
		double h = (a * Math.sqrt(3)) / 2;
		return (Math.pow(h, 2) * Math.sqrt(3)) / 3;
	}
 	
	public double getA() {
		return a;
	}

	public void setA(double a) {
		this.a = a;
	}
}
