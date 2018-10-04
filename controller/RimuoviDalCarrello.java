package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Prodotto;
import model.ProdottoDAO;
import model.SottoOrdine;

/**
 * Servlet implementation class RimuoviDalCarrello
 */
@WebServlet("/RimuoviDalCarrello")
public class RimuoviDalCarrello extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RimuoviDalCarrello() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//in carrello.jsp abbiamo la possibilità di togliere prodotti dal carrello
		int cod =Integer.parseInt(request.getParameter("cod"));
	
		ArrayList<SottoOrdine> carrello;
	
			carrello=(ArrayList<SottoOrdine>)request.getSession().getAttribute("carrello");
		
		Prodotto p;
		ProdottoDAO pd = new ProdottoDAO();
	for(int i=0;i<carrello.size();i++){
		if(carrello.get(i).getP().getCod()==cod){
			
			carrello.remove(i);
		}
	}
		request.getSession().setAttribute("count", carrello.size());
		//session.setAttribute("caunt", a);
		
		request.getSession().setAttribute("carrello", carrello);
		request.getRequestDispatcher("carrello.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
