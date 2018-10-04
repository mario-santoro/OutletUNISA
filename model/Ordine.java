package model;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class Ordine {
	private int cod_ordine;
	private String data;
	private int quant; //tutti i prodotti presenti in un solo ordine
	private ArrayList<SottoOrdine> prodotti=new ArrayList<SottoOrdine>(); //singoli prodotto con relativa singola quantita comprata
	private String ora;
	private double prezzo_tot;
	private String email;
	

	public Ordine(){
		
		GregorianCalendar data=new GregorianCalendar();
		String giorno = "" + data.get(Calendar.DAY_OF_MONTH);
		String mese = "" + data.get(Calendar.MONTH) + 1;
		String anno = "" + data.get(Calendar.YEAR);
		String data_ordine = anno+"-" + mese+"-"  + giorno;
		String ora = data.get(Calendar.HOUR_OF_DAY) + ":" + data.get(Calendar.MINUTE) + ":"+ data.get(Calendar.SECOND);
		this.data=data_ordine;
		this.ora=ora;
	}
	
	public Ordine(String email,int quant, double prezzo_tot, ArrayList<SottoOrdine> prodotti){
		
		GregorianCalendar data=new GregorianCalendar();
		String giorno = "" + data.get(Calendar.DAY_OF_MONTH);
		int meseint= data.get(Calendar.MONTH)+1;
		String mese = "" +meseint;
		
		String anno = "" + data.get(Calendar.YEAR);
		String data_ordine = anno+"-" + mese+"-"  + giorno;
		String ora = data.get(Calendar.HOUR_OF_DAY) + ":" + data.get(Calendar.MINUTE) + ":"+ data.get(Calendar.SECOND);
		this.data=data_ordine;
		this.ora=ora;
		this.quant=quant;
		this.prezzo_tot=prezzo_tot;
		this.prodotti=prodotti;
		this.email=email;
	}
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getCod_ordine() {
		return cod_ordine;
	}

	public void setCod_ordine(int cod_ordine) {
		this.cod_ordine = cod_ordine;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public int getQuant() {
		return quant;
	}

	public void setQuant(int quant) {
		this.quant = quant;
	}

	public String getOra() {
		return ora;
	}

	public void setOra(String ora) {
		this.ora = ora;
	}

	

	public double getPrezzo_tot() {
		return prezzo_tot;
	}

	public void setPrezzo_tot(double prezzo_tot) {
		this.prezzo_tot = prezzo_tot;
	}

	public ArrayList<SottoOrdine> getProdotti() {
		return prodotti;
	}

	public void setProdotti(SottoOrdine s) {
		prodotti.add(s);
	}

	

	
	
	
}
