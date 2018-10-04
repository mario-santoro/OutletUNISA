package model;

public class Utente {
	private String email;
	private String psw;
	private String nome;
	private String cognome;
	private int nCivico;
	private String via;
	private int CAP;
	private int isAdmin;
	private String p_iva;
	public Utente(){}
	
	public Utente(String email,String psw,String nome,String cognome, String via,int nCivico,int CAP,int isAdmin,String p_iva) {
		this.psw=psw ;
		this.email=email;
		this.nome=nome;
		this.cognome=cognome;
		this.via=via;
		this.CAP=CAP;
		this.nCivico=nCivico;
		this.isAdmin=isAdmin;
		this.p_iva=p_iva;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPsw() {
		return psw;
	}

	public void setPsw(String psw) {
		this.psw = psw;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public int getnCivico() {
		return nCivico;
	}

	public void setnCivico(int nCivico) {
		this.nCivico = nCivico;
	}

	public String getVia() {
		return via;
	}

	public void setVia(String via) {
		this.via = via;
	}

	public int getCAP() {
		return CAP;
	}

	public void setCAP(int cAP) {
		CAP = cAP;
	}

	public int isAdmin() {
		return isAdmin;
	}

	public void setAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getP_iva() {
		return p_iva;
	}

	public void setP_iva(String p_iva) {
		this.p_iva = p_iva;
	}
	
}
