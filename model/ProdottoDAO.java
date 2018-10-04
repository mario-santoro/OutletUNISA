package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class ProdottoDAO {
	
	
	public synchronized void doSave(Prodotto p) {
		Connection conn = null;
		PreparedStatement cmd = null;
		
		try {
			
			conn = DriverManagerConnectionPool.getConnection();
			

				
				String sql = "INSERT INTO prodotto (nome,prezzo, marca, img, descrizione, tipologia,sottocategoria,p_iva) VALUES (?,?,?,?,?,?,?,?)";
				cmd = (PreparedStatement) conn.prepareStatement(sql);

				cmd.setString(1, p.getNome());
				cmd.setDouble(2, p.getPrezzo());
				cmd.setString(3, p.getMarca());
				cmd.setString(4, p.getImmagine());
				cmd.setString(5, p.getDescrizione());
				cmd.setString(6, p.getCategoria());
				cmd.setString(7, p.getSottocategoria());
				cmd.setString(8, p.getP_iva());
				cmd.executeUpdate();

				String sql2 = "SELECT max(cod) as cod from prodotto";
				cmd = (PreparedStatement) conn.prepareStatement(sql2);
				ResultSet res = cmd.executeQuery();
				if(res.next()){
				p.setCod(res.getInt("cod"));
				}
				for (int i = 0; i < p.getTaglie().size(); i++) {
					String sql1 = "INSERT INTO divide (cod,quant,size) VALUES (?,?,?)";
					cmd = (PreparedStatement) conn.prepareStatement(sql1);
					cmd.setInt(1, p.getCod());
					cmd.setInt(2, p.getTaglie().get(i).getQuantita());
					cmd.setString(3, p.getTaglie().get(i).getTaglia());
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
	
	
	
	public synchronized void doUpdate(Prodotto p) {
		Connection conn = null;
		PreparedStatement cmd = null;
		ResultSet rs = null;
		
		try {
			
			conn = DriverManagerConnectionPool.getConnection();
		
				
				for (int i = 0; i < p.getTaglie().size(); i++) {
					System.out.println(p.getCod()+" , "+ p.getTaglie().get(i).getQuantita()+" , " +p.getTaglie().get(i).getTaglia());
					String sql = " UPDATE divide SET quant=? where cod=? and size=?";
					cmd = (PreparedStatement) conn.prepareStatement(sql);
					cmd.setInt(1, p.getTaglie().get(i).getQuantita()); // quantita immessa +
					cmd.setInt(2, p.getCod());
					cmd.setString(3, p.getTaglie().get(i).getTaglia());
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
	
//	public synchronized ArrayList<Prodotto> doRetriveAll() { // tutti i prodotti
//		ArrayList<Prodotto> prodotti = new ArrayList<Prodotto>();
//		Connection conn = null;
//		PreparedStatement ps = null;
//		try {
//			Prodotto p ;
//			conn = DriverManagerConnectionPool.getConnection();
//			ps = (PreparedStatement) conn.prepareStatement("select * from prodotto");
//
//			ResultSet res = ps.executeQuery();
//
//			while (res.next()) {
//				p= new Prodotto();
//				p.setCod(res.getInt("cod"));
//				p.setNome(res.getString("nome"));
//				p.setMarca(res.getString("marca"));
//				p.setImmagine(res.getString("img"));
//				p.setDescrizione(res.getString("descrizione"));
//				p.setCategoria(res.getString("tipologia"));
//				p.setSottocategoria(res.getString("sottocategoria"));
//
//				prodotti.add(p);
//			}
//			
//			for(int i=0;i<prodotti.size();i++){
//				System.out.println(prodotti.get(i).getNome());
//				System.out.println(prodotti.get(i).getCod());
//				System.out.println(prodotti.get(i).getMarca());
//			}
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			try {
//				ps.close();
//				DriverManagerConnectionPool.releaseConnection(conn);
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//		return prodotti;
//
//	}

	public synchronized ArrayList<String> sottocategorie() {
		ArrayList<String> sottocategorie = new ArrayList<String>();
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DriverManagerConnectionPool.getConnection();
			ps = (PreparedStatement) conn
					.prepareStatement("SELECT nome FROM sottocategoria GROUP by nome");

			ResultSet res = ps.executeQuery();
			int i=0;
			while (res.next()) {
				sottocategorie.add(res.getString("nome"));
				
				
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
		return sottocategorie;

	}
	
	public synchronized ArrayList<String> sottocategorie(String categoria) {
		ArrayList<String> sottocategorie = new ArrayList<String>();
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DriverManagerConnectionPool.getConnection();
			ps = (PreparedStatement) conn
					.prepareStatement("SELECT nome FROM sottocategoria where tipologia=? GROUP by nome");
			ps.setString(1, categoria);
			ResultSet res = ps.executeQuery();
			while (res.next()) {
				sottocategorie.add(res.getString("nome"));
				
				
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
		return sottocategorie;

	}

	public synchronized ArrayList<Prodotto> doRetriveByCategoria(String categoria) {
		ArrayList<Prodotto> prodotti = new ArrayList<Prodotto>();
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			Prodotto p;
			conn = DriverManagerConnectionPool.getConnection();
			ps = (PreparedStatement) conn.prepareStatement("select * from prodotto where tipologia=? or sottocategoria=?");
			ps.setString(1, categoria);
			ps.setString(2, categoria);
			ResultSet res = ps.executeQuery();

			while (res.next()) {
				p = new Prodotto();
				p.setCod(res.getInt("cod"));
				p.setNome(res.getString("nome"));
				p.setMarca(res.getString("marca"));
				p.setImmagine(res.getString("img"));
				p.setPrezzo(res.getDouble("prezzo"));
				p.setDescrizione(res.getString("descrizione"));
				p.setCategoria(res.getString("tipologia"));
				p.setSottocategoria(res.getString("sottocategoria"));
				p.setP_iva(res.getString("p_iva"));
				prodotti.add(p);
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
		return prodotti;

	}


	public synchronized ArrayList<Prodotto> doRetriveVetrina() {
		ArrayList<Prodotto> prodotti = new ArrayList<Prodotto>();
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			Prodotto p ;
			conn = DriverManagerConnectionPool.getConnection();
			ps = (PreparedStatement) conn.prepareStatement(
					"select prodotto.cod,prodotto.nome,prodotto.marca,prodotto.prezzo,"
					+ "prodotto.img,prodotto.descrizione,prodotto.tipologia,prodotto.sottocategoria,"
					+ "prodotto.p_iva, COUNT(cod_prodotto)AS Num_comprato FROM compra join prodotto "
					+ "on compra.cod_prodotto=prodotto.cod group by cod_prodotto");

			ResultSet res = ps.executeQuery();

			while (res.next()) {
				p= new Prodotto();
				p.setCod(res.getInt("cod"));
				p.setNome(res.getString("nome"));
				p.setMarca(res.getString("marca"));
				p.setImmagine(res.getString("img"));
				p.setPrezzo(res.getDouble("prezzo"));
				p.setDescrizione(res.getString("descrizione"));
				p.setCategoria(res.getString("tipologia"));
				p.setSottocategoria(res.getString("sottocategoria"));

				prodotti.add(p);
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
		return prodotti;


	}

	public synchronized Prodotto doRetriveByCod(int c) { // prodotto selezionato prendiamo
																	// taglia e quantita
		Prodotto p=new Prodotto();
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			
			conn = DriverManagerConnectionPool.getConnection();
			ps = (PreparedStatement) conn.prepareStatement("select * FROM prodotto where cod=?");
			ps.setInt(1, c);
			ResultSet res = ps.executeQuery();
	
			while (res.next()) {
	
				p.setCod(c);
				p.setNome(res.getString("nome"));
				p.setMarca(res.getString("marca"));
				p.setImmagine(res.getString("img"));
				p.setPrezzo(res.getDouble("prezzo"));
				p.setDescrizione(res.getString("descrizione"));
				p.setCategoria(res.getString("tipologia"));
				p.setSottocategoria(res.getString("sottocategoria"));

				
			}
			
			
			ps = (PreparedStatement) conn.prepareStatement("select quant,size FROM divide where cod=?");
			ps.setInt(1, c);

			 res = ps.executeQuery();
			 Taglie t ;
			 ArrayList<Taglie> taglie=new ArrayList<Taglie>();
			while (res.next()) {
				t=new Taglie();
				t.setQuantita(res.getInt("quant"));
				t.setTaglia(res.getString("size"));
				
				taglie.add(t);

			}
			
			p.setTaglie(taglie);
			
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
		return p;

	}
	
	public synchronized void doDelete(int cod){
		
		Connection conn = null;
		PreparedStatement cmd = null;

		try {
			conn = DriverManagerConnectionPool.getConnection();

			String cancellazione = "DELETE FROM prodotto where cod=?";
			cmd = (PreparedStatement) conn.prepareStatement(cancellazione);
			cmd.setInt(1, cod);
			cmd.executeUpdate();
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
	
	public synchronized ArrayList<Prodotto> doRetriveByCond(String key){		//ricerca per nome e marca
		
		ArrayList<Prodotto> prodotti=new ArrayList<Prodotto>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			Prodotto p;
			conn = DriverManagerConnectionPool.getConnection();
			ps = (PreparedStatement) conn.prepareStatement("SELECT * FROM `prodotto` WHERE (prodotto.nome  like '%"+ key +"%' or prodotto.marca like '%"+ key +"%') ");
	
			ResultSet res = ps.executeQuery();

			while (res.next()) {
				 p = new Prodotto();
			
				p.setCod(res.getInt("cod"));
				p.setNome(res.getString("nome"));
				p.setMarca(res.getString("marca"));
				p.setImmagine(res.getString("img"));
				p.setPrezzo(res.getDouble("prezzo"));
				p.setDescrizione(res.getString("descrizione"));
				p.setCategoria(res.getString("tipologia"));
				p.setSottocategoria(res.getString("sottocategoria"));
				p.setP_iva(res.getString("p_iva"));
				prodotti.add(p);
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
		return prodotti;
	}
	
	// array di oggetti prodotto venduti dal fornitore
		public synchronized ArrayList<Prodotto> doRetriveProdottiVenduti(String p_iva) {
			ArrayList<Prodotto> prodotti = new ArrayList<Prodotto>();
			Connection conn = null;
			PreparedStatement ps = null;
			try {
				Prodotto p ;
				conn = DriverManagerConnectionPool.getConnection();
				ps = (PreparedStatement) conn.prepareStatement("select prodotto.cod,prodotto.nome,prodotto.prezzo, prodotto.marca,prodotto.img,prodotto.descrizione,prodotto.tipologia,prodotto.sottocategoria, divide.quant,divide.size from prodotto join divide on prodotto.cod=divide.cod where p_iva=?");
				ps.setString(1, p_iva);
				ResultSet res = ps.executeQuery();
				boolean flag = false;
				Taglie t;
				while (res.next()) {
					flag = false;
					
					int cod=res.getInt("cod");
					for (int i = 0; i < prodotti.size(); i++) {
						if (prodotti.get(i).getCod()==cod) {
							flag = true;
							t = new Taglie();
							t.setQuantita(res.getInt("quant"));
							t.setTaglia(res.getString("size"));
							prodotti.get(i).getTaglie().add(t);
						}

					}
				
					if (flag == false) {
						p = new Prodotto();
						t=new Taglie();
						p.setCod(res.getInt("cod"));
						p.setNome(res.getString("nome"));
						p.setMarca(res.getString("marca"));
						p.setImmagine(res.getString("img"));
						p.setPrezzo(res.getDouble("prezzo"));
						p.setDescrizione(res.getString("descrizione"));
						p.setCategoria(res.getString("tipologia"));
						p.setSottocategoria(res.getString("sottocategoria"));
						p.setP_iva(p_iva);
						t.setQuantita(res.getInt("quant"));
						t.setTaglia(res.getString("size"));
						p.getTaglie().add(t);
						
						prodotti.add(p);
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
			return prodotti;

		}
		
		
		public synchronized ArrayList<String> doRetriveAllSize() {
			ArrayList<String> size = new ArrayList<String>();
			Connection conn = null;
			PreparedStatement ps = null;
			
				try {
					conn = DriverManagerConnectionPool.getConnection();
					ps = (PreparedStatement) conn
							.prepareStatement("SELECT size FROM taglia ");

					ResultSet res = ps.executeQuery();
					int i=0;
					while (res.next()) {
						size.add(res.getString("size"));
						
						
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
			return size;

		}	

}
