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
import model.OrdineDAO;
import model.Utente;

/**
 * Servlet implementation class ListaOrdini
 */
@WebServlet("/ListaOrdini")
public class ListaOrdini extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListaOrdini() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//servlet che riempie un arraylist con gli ordini effettuati dal cliente
		Utente u=(Utente) request.getSession().getAttribute("userBean");
		OrdineDAO o=new OrdineDAO();
		
		ArrayList<Ordine> ordini=new ArrayList<Ordine>();
		ordini=o.doRetriveByKey(u.getEmail());		
		request.getSession().setAttribute("ordini", ordini);
		RequestDispatcher d=request.getRequestDispatcher("listaOrdini.jsp");
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
