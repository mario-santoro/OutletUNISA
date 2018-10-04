package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Utente;
import model.UtenteDAO;

/**
 * Servlet implementation class Registrazione
 */
@WebServlet("/Registrazione")
public class Registrazione extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registrazione() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			response.setContentType("text/html");
			
			String nome=request.getParameter("nome");
			String cognome=request.getParameter("cognome");
			String email=request.getParameter("email");
			String password=request.getParameter("psw");
			String via=request.getParameter("via");
			int CAP=Integer.parseInt(request.getParameter("CAP"));
			int civico=Integer.parseInt(request.getParameter("nCivico"));
			String p_iva=request.getParameter("p_iva");		
			
			
			
			Utente u1 = new Utente(email,password,nome,cognome,via,civico,CAP,0,p_iva);
			
			UtenteDAO ut=new UtenteDAO();
			RequestDispatcher d;
			if(ut.doSave(u1)){
			
		
			d = request.getRequestDispatcher("Login?email="+u1.getEmail()+"&psw="+u1.getPsw());
			
			d.forward(request, response);
		
			}else{
				request.setAttribute("err", true);
				d=request.getRequestDispatcher("registrazione.jsp");
				d.forward(request, response);
			}
	
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
