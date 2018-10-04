package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Ordine;
import model.SottoOrdine;
import model.Utente;

/**
 * Servlet implementation class ConfermaOrdine
 */
@WebServlet("/ConfermaOrdine")
public class ConfermaOrdine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfermaOrdine() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//quando clicchiamo in carrello.jsp acquista controlliamo se l'utente è loggato se non lo è torna nel carrello e lancia un alert
		//altrimenti inizia a creare un oggetto ordine e va in una pagina di conferma ordine
		Utente u=(Utente)request.getSession().getAttribute("userBean");
	
		if(u==null){
			request.getSession().setAttribute("denied", true);
			response.sendRedirect("carrello.jsp");
		}else{
			ArrayList<SottoOrdine> carrello;
			carrello=(ArrayList<SottoOrdine>)request.getSession().getAttribute("carrello");
			int quantTot =1;
			double prezzoTot =Double.parseDouble(request.getParameter("prezzoTot"));
			
		
			
			Ordine o=new Ordine(u.getEmail(),quantTot,prezzoTot,carrello);
			request.getSession().setAttribute("ordine",o);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("confermaAcquisto.jsp");
			requestDispatcher.forward(request, response);
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
