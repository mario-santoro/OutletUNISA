package model;
//il prodotto ha ad esempio taglia M quantità 30, stesso prodotto altro oggetto taglia con L e quantità 20
public class Taglie {
	private String taglia;
	private int quantita;
	public Taglie(){}
	public Taglie(String taglia,int quantita){
		this.taglia=taglia;
		this.quantita=quantita;
	}
	
	
	public String getTaglia() {
		return taglia;
	}
	public void setTaglia(String taglia) {
		this.taglia = taglia;
	}
	public int getQuantita() {
		return quantita;
	}
	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}
	
}
