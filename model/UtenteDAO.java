package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class UtenteDAO {
	public synchronized Utente doRetrieveByKey(String email, String password) { // login

		Connection conn = null;
		PreparedStatement ps = null;
		Utente ub=null;
		try {
	
			conn = DriverManagerConnectionPool.getConnection();
			ps = (PreparedStatement) conn.prepareStatement("SELECT * FROM utente WHERE email = ? AND password = ?");
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet res = ps.executeQuery();

			if (res.next()) {
				 ub = new Utente();
			
				ub.setEmail(res.getString("email"));
				ub.setPsw(res.getString("password"));
				ub.setCognome(res.getString("cognome"));
				ub.setVia(res.getString("via"));
				ub.setNome(res.getString("nome"));
				ub.setCAP(res.getInt("CAP"));
				ub.setnCivico(res.getInt("n_civico"));
				ub.setAdmin(res.getInt("is_admin"));
				
				ps = (PreparedStatement) conn.prepareStatement("SELECT p_iva FROM fornitore WHERE email = ?");
				ps.setString(1, email);
				ResultSet res1 = ps.executeQuery();

				ub.setP_iva("");
				
				if (res1.next()) {
				
					
					ub.setP_iva(res1.getString("p_iva"));
					
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
		return ub;
	}

	public synchronized boolean doSave(Utente u1) {
		Connection conn = null;
		PreparedStatement cmd = null;

		try {
			conn = DriverManagerConnectionPool.getConnection();
			cmd = (PreparedStatement) conn.prepareStatement("select * from utente where email=?");
			cmd.setString(1, u1.getEmail());
			ResultSet res = cmd.executeQuery();

			if (res.next() == false) {
				String registrazione = "INSERT INTO utente(email,via,CAP,n_civico,nome,cognome,password,is_admin) VALUES(?,?,?,?,?,?,?,?)";
				cmd = (PreparedStatement) conn.prepareStatement(registrazione);
				cmd.setString(1, u1.getEmail());
				cmd.setString(2, u1.getVia());
				cmd.setInt(3, u1.getCAP());
				cmd.setInt(4, u1.getnCivico());
				cmd.setString(5, u1.getNome());
				cmd.setString(6, u1.getCognome());
				cmd.setString(7, u1.getPsw());
				cmd.setInt(8, u1.isAdmin());
				cmd.executeUpdate();

				if (u1.getP_iva() != "") {
					String sql = "INSERT INTO fornitore(p_iva,email) VALUES(?,?)";
					cmd = (PreparedStatement) conn.prepareStatement(sql);
					cmd.setString(1, u1.getP_iva());
					cmd.setString(2, u1.getEmail());
					cmd.executeUpdate();

					
				}
				
				
				return true;
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
		return false;
	}

	public synchronized void doUpdate(Utente u1) {

		Connection conn = null;
		PreparedStatement cmd = null;

		try {
			conn = DriverManagerConnectionPool.getConnection();

			String sql = " UPDATE utente SET via=?,CAP=?,n_civico=?,nome=?,cognome=?,password=? where email=?";
			cmd = (PreparedStatement) conn.prepareStatement(sql);
			cmd.setString(1, u1.getVia());
			cmd.setInt(2, u1.getCAP());
			cmd.setInt(3, u1.getnCivico());
			cmd.setString(4, u1.getNome());
			cmd.setString(5, u1.getCognome());
			cmd.setString(6, u1.getPsw());
			cmd.setString(7, u1.getEmail());
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

	public synchronized void doDelete(String email,String p_iva) {
		Connection conn = null;
		PreparedStatement cmd = null;

		try {
			conn = DriverManagerConnectionPool.getConnection();
			if(!p_iva.equals("")){
			String cancellazione = "DELETE FROM fornitore where email=?";
			cmd = (PreparedStatement) conn.prepareStatement(cancellazione);
			cmd.setString(1, email);
			cmd.executeUpdate();
			}	
			String cancellazione2 = "DELETE FROM utente where email=?";
			cmd = (PreparedStatement) conn.prepareStatement(cancellazione2);
			cmd.setString(1, email);
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

	public synchronized ArrayList<Utente> doRetriveAll() {

		ArrayList<Utente> utenti = new ArrayList<Utente>();
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			Utente u;
			conn = DriverManagerConnectionPool.getConnection();
			ps = (PreparedStatement) conn.prepareStatement("select utente.email,utente.nome,utente.cognome,fornitore.p_iva from utente LEFT OUTER JOIN fornitore on utente.email=fornitore.email where is_admin=0");

			ResultSet res = ps.executeQuery();

			while (res.next()) {
				u = new Utente();
				u.setEmail(res.getString("email"));
				u.setNome(res.getString("nome"));
				u.setCognome(res.getString("cognome"));
				if(res.getString("p_iva")==null){
				
					u.setP_iva("");
				}else{
					u.setP_iva(res.getString("p_iva"));
				}
			
				utenti.add(u);
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
		return utenti;

	}

	

}
