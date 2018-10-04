package model;

import java.util.ArrayList;

public class Prodotto {
	private int cod;
	private String nome;
	private double prezzo;
	private String marca;
	private String immagine;
	private String descrizione;
	private ArrayList<Taglie> taglie; // lista di oggetti taglia definiti dalla
										// taglia (s,m,l,xl) e la loro
										// rispettiva quantità
	private String categoria;
	private String sottocategoria;
	private String p_iva;
	
	public Prodotto() {
		this.taglie=new ArrayList<Taglie>();
	}

	public Prodotto(String nome, double prezzo, String marca, String immagine, String descrizione,
			ArrayList<Taglie> taglie, String categoria, String sottocategoria,String p_iva) {
		this.nome = nome;
		this.prezzo = prezzo;
		this.marca = marca;
		this.immagine = immagine;
		this.descrizione = descrizione;
		this.taglie = taglie;
		this.categoria = categoria;
		this.sottocategoria = sottocategoria;
		this.p_iva=p_iva;
	}

	public String getSottocategoria() {
		return sottocategoria;
	}

	public void setSottocategoria(String sottocategoria) {
		this.sottocategoria = sottocategoria;
	}

	public int getCod() {
		return cod;
	}

	public void setCod(int cod) {
		this.cod = cod;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public ArrayList<Taglie> getTaglie() {
		return taglie;
	}

	public void setTaglie(ArrayList<Taglie> taglie) {
		this.taglie = taglie;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getImmagine() {
		return immagine;
	}

	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public String getP_iva() {
		return p_iva;
	}

	public void setP_iva(String p_iva) {
		this.p_iva = p_iva;
	}

		
}
