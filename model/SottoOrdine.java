package model;

public class SottoOrdine {
private Prodotto p;
private int quant; //singola quantita del prodotto acquistato 
private String size;
	public SottoOrdine(){}
	public SottoOrdine(Prodotto p,int quant){
		this.p=p;
		this.quant=quant;
		
	}
	
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public Prodotto getP() {
		return p;
	}
	public void setP(Prodotto p) {
		this.p = p;
	}
	public int getQuant() {
		return quant;
	}
	public void setQuant(int quant) {
		this.quant = quant;
	}
	
}
