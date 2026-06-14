package priprema;
import java.util.ArrayList;

public class NovogodisnjaRasveta {
	private int kapacitet = 5;
	private ArrayList<Lampion> lampioni;
	
	public NovogodisnjaRasveta() {
		super();
		this.lampioni = new ArrayList<Lampion>();
	}
	
	public boolean dodaj(Lampion l) {
		if(l.isIspravan() == false) {
			return false;
		}
		else {
			if(lampioni.size() >= kapacitet) {
				return false;
			}
			else {
				for(Lampion lamp : lampioni) {
					if(lamp.getSifra() == l.getSifra()) {
						return false;
					}
				}
				return lampioni.add(l);
			}
		}
	}
	
	public Lampion pronadji(double cenaLampiona, String bojaLampiona) {
		if(lampioni.isEmpty()) {
			return null;
		}
		else {
			for(Lampion lamp : lampioni) {
				if(lamp.getCena() > cenaLampiona && lamp.getBoja().equals(bojaLampiona)) {
					return lamp;
				}
			}
			return null;
		}
	}
	
	public void akcija() {
		if(lampioni.isEmpty() == false) {
			for(Lampion lamp : lampioni) {
				if(lamp.getCena() > 1999.99) {
					double snizenaCena = lamp.getCena() * 0.90;
					lamp.setCena(snizenaCena);
				}
			}
		}
	}

	@Override
	public String toString() {
		if(lampioni.isEmpty()) {
			return "Lista je prazna!\n";
		}
		else {
			return "NovogodisnjaRasveta [kapacitet=" + kapacitet + ", lampioni=" + lampioni + "]";
		}
	}
}
