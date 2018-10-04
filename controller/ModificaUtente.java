package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Utente;
import model.UtenteDAO;

/**
 * Servlet implementation class ModificaUtente
 */
@WebServlet("/ModificaUtente")
public class ModificaUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificaUtente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//modifica le informazioni dell'utente
		String nome=request.getParameter("nome");
		String cognome=request.getParameter("cognome");
		
		String password=request.getParameter("psw");
		
		String via=request.getParameter("via");
		int CAP=Integer.parseInt(request.getParameter("CAP"));
		int civico=Integer.parseInt(request.getParameter("nCivico"));
			//può essere null
		HttpSession s=request.getSession();
		Utente u1=(Utente)s.getAttribute("userBean");

		u1.setNome(nome);
		u1.setCognome(cognome);
		u1.setVia(via);
		u1.setCAP(CAP);
		u1.setnCivico(civico);
		u1.setPsw(password);
		RequestDispatcher d;
		
	
		
		UtenteDAO ut=new UtenteDAO();
		ut.doUpdate(u1);
		s.setAttribute("userBean",u1);
		d=request.getRequestDispatcher("index.jsp");
		d.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
