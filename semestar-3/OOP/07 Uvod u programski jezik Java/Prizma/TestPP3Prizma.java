package z31;
import z1.Pravougaonik;

public class TestPP3Prizma {

	public static void main(String[] args) {
		PP3Prizma pr1 = new PP3Prizma(new Pravougaonik(1, 1), new JSTrougao(2));
		PP3Prizma pr2 = new PP3Prizma(pr1);
		
		System.out.println("PR1\n\tP: " + pr1.P() + "\n\tV: " + pr1.V());
		System.out.println("PR2\n\tP: " + pr2.P() + "\n\tV: " + pr2.V());
	}

}
