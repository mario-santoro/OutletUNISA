package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Utente;
import model.UtenteDAO;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			// recupero login e password e li memorizzo in userB se presenti
			Utente user = getUsrPsw(request);

			if (user == null)     // no login e/o no password -> redirigo a login form 
				response.sendRedirect("index.jsp");    // non ho bisogno di mandargli parametri. Il nome login.jsp si vedrà nel browser
			else {
				try{
					UtenteDAO ubd = new UtenteDAO();
					Utente ub = ubd.doRetrieveByKey(user.getEmail(), user.getPsw());
					if (ub==null) {    // login e/o password sbagliati -> chiamo login form  con messaggio errore
										// il nome login.jsp non si vedrà nel browser
						HttpSession s=request.getSession();
						s.setAttribute("denied", true);
						response.sendRedirect("index.jsp");
					}else {
						// l'utente è ammesso al sito: inserisco dati di login in cookies e do risposta
						
						Cookie emcookie = new Cookie("email", ub.getEmail());
						Cookie pswcookie = new Cookie("psw", ub.getPsw());
						response.addCookie(emcookie);
						response.addCookie(pswcookie);
						
						HttpSession s=request.getSession();
						s.setAttribute("userBean", ub);  // l'output ha bisogno di queste informazioni
					
						if(ub.isAdmin()==1){
							
							RequestDispatcher requestDispatcher = request.getRequestDispatcher("ListaUtenti");
							requestDispatcher.forward(request, response);
						}else{
						RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
						requestDispatcher.forward(request, response);
					
						}
					}
				}
				catch(Exception e)
				{  
					request.setAttribute("exception", e);
				
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("exception.jsp");
					requestDispatcher.forward(request, response);
				}
			}
		}

			
		private Utente getUsrPsw(HttpServletRequest request) {
			
			Utente ub = null;
			String email = null, psw = null;

			Cookie[] c = request.getCookies();   // tramite cookie
			if (c!=null) { 
				for(int i=0;i<c.length;i++) {
					if (c[i].getName().equals("email")) 
						email = c[i].getValue();
					if (c[i].getName().equals("psw")) 
						psw = c[i].getValue();	
				}
			} 	
			if (email == null || psw == null){		// se recupero tramite cookie fallisce, allora tramite parametri	
				String temp;                        
				temp = request.getParameter("email");
				if (temp!= null) {
					email = temp;
					temp = request.getParameter("psw");   
					if (temp!= null) {
						psw = temp;
					}
				}
			}
			
			if (email != null && psw != null)    // se recupero ha avuto successo riempio bean
				 ub = new Utente(email, psw,null,null,null,0,0,0,null);  //????????????????????????????????
			
			return ub;
		}
			
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
