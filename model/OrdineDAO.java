package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class OrdineDAO {
	public synchronized void doSave(Ordine o) {
		Connection conn = null;
		PreparedStatement cmd = null;
		ResultSet rs = null;
	
		try {
			conn = DriverManagerConnectionPool.getConnection();

			String sql1 = "INSERT INTO ordine (dat,ora,quant,email,prezzo_totale) VALUES (?,?,?,?,?)"; // inserisco il
																										// nuovo ordine (singolo)
			cmd = (PreparedStatement) conn.prepareStatement(sql1);

			cmd.setString(1, o.getData());
			cmd.setString(2, o.getOra());
			cmd.setInt(3, o.getQuant());
			cmd.setString(4, o.getEmail());
			cmd.setDouble(5, o.getPrezzo_tot());
			cmd.executeUpdate();

			int cod_ordine = 0;

			String sql4 = "SELECT * FROM ordine WHERE email=? and ora=?"; // mi prendo il cod ordine perchè
																			// sta nel db(con autoincrement)
			cmd = (PreparedStatement) conn.prepareStatement(sql4);
			cmd.setString(1, o.getEmail());
			cmd.setString(2, o.getOra());
			rs = cmd.executeQuery();
			while (rs.next()) {
				cod_ordine = (Integer.parseInt(rs.getString("cod_ordine")));
			}

			for (int i = 0; i < o.getProdotti().size(); i++) {
				String sql2 = "INSERT INTO compra (cod_ordine,cod_prodotto,size,quant,immagine,nome_prodotto,prezzo) VALUES (?,?,?,?,?,?,?)"; // inserisco i singoli prodotti comprati
																									// e le loro quantita relative a
																									// quell'ordine
				cmd = (PreparedStatement) conn.prepareStatement(sql2);

				cmd.setInt(1, cod_ordine);
				cmd.setInt(2, o.getProdotti().get(i).getP().getCod());
				cmd.setString(3, o.getProdotti().get(i).getSize());
				cmd.setInt(4, o.getProdotti().get(i).getQuant());
				cmd.setString(5, o.getProdotti().get(i).getP().getImmagine());
				cmd.setString(6, o.getProdotti().get(i).getP().getNome());
				cmd.setDouble(7, o.getProdotti().get(i).getP().getPrezzo());
				cmd.executeUpdate();

			}
			
			
			// -----scalare la quantita di ogni prodotto------
			ProdottoDAO pd=new ProdottoDAO();	//creo un oggetto prodottoDAO
			for (int i = 0; i < o.getProdotti().size(); i++) {		//for che scorre tutti i prodotti che voglio acquistare
				Prodotto p1 = pd.doRetriveByCod(o.getProdotti().get(i).getP().getCod()); // nuovo oggetto prodotto che richiama un metodo di
																	//prodottoDAO in modo da riempire l'oggetto con le quantita presenti in precedenza

					int quanti=0;
				for(int j=0;j<p1.getTaglie().size();j++){
					
					if(p1.getTaglie().get(j).getTaglia().equals(o.getProdotti().get(i).getSize())){
					 quanti=p1.getTaglie().get(j).getQuantita()- o.getProdotti().get(i).getQuant();
					// quantita presente in db - quantita comprata 
					}
				}
				
			
					String sql = " UPDATE divide SET quant=? where cod=? and size=?";			//query di modifica
					cmd = (PreparedStatement) conn.prepareStatement(sql);
					cmd.setInt(1, quanti); 
					cmd.setInt(2, o.getProdotti().get(i).getP().getCod());
					cmd.setString(3,o.getProdotti().get(i).getSize());
					cmd.executeUpdate();
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				cmd.close();
				DriverManagerConnectionPool.releaseConnection(conn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public synchronized ArrayList<Ordine> doRetriveByKey(String email) { // visualizza tutti gli ordini
																			// di un cliente
		ArrayList<Ordine> ordini = new ArrayList<Ordine>();
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			Ordine o ;
			Prodotto p;
			conn = DriverManagerConnectionPool.getConnection();
			ps = (PreparedStatement) conn.prepareStatement(
					"select compra.cod_prodotto,ordine.cod_ordine, ordine.dat,ordine.ora,ordine.prezzo_totale,compra.nome_prodotto,"
					+ "compra.prezzo,compra.immagine, compra.quant ,compra.size FROM ordine JOIN "
					+ "compra on ordine.cod_ordine=compra.cod_ordine  "
					+ " where email=? order by dat desc");
			ps.setString(1, email);

			ResultSet res = ps.executeQuery();
			SottoOrdine s;
		
			boolean flag=false;
			while(res.next()) {
			
				 flag=false;
				int cod=res.getInt("cod_ordine"); 
				for (int i = 0; i <ordini.size(); i++) {	//for che ripete tante volte quanto sono gli ordini gia nell'array
					if(ordini.get(i)!=null){
				if ((ordini.get(i).getCod_ordine()==cod)) {//confronta il cod attuale con i cod gia dentro l'array, se esiste gia allora aggiunge un sottordine all'oggetto ordine gia esistente
					flag = true;
						s = new SottoOrdine();
						p=new Prodotto();
						p.setCod(res.getInt("cod_prodotto"));
						p.setNome(res.getString("nome_prodotto"));
						p.setPrezzo(res.getDouble("prezzo"));
						p.setImmagine(res.getString("immagine"));
						s.setQuant(res.getInt("quant"));
						s.setSize(res.getString("size"));
						s.setP(p);
						
						ordini.get(i).setProdotti(s);
				}
					}
				}
			
				if (flag == false) {			//altrimenti se il flag rimane a false e non è mai entrato è un nuovo ordine
					o = new Ordine();
					s=new SottoOrdine();
					p=new Prodotto();
					o.setCod_ordine(res.getInt("cod_ordine"));
					o.setData(res.getString("dat"));
					o.setOra(res.getString("ora"));
					o.setPrezzo_tot(res.getDouble("prezzo_totale"));
					p.setCod(res.getInt("cod_prodotto"));
					p.setNome(res.getString("nome_prodotto"));
					p.setPrezzo(res.getDouble("prezzo"));
					p.setImmagine(res.getString("immagine"));
					s.setP(p);
					s.setQuant(res.getInt("quant"));
					s.setSize(res.getString("size"));
					o.getProdotti().add(s);
				
				ordini.add(o);
				}
			
			

				
				}
		
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				DriverManagerConnectionPool.releaseConnection(conn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
		return ordini;
	}

}
