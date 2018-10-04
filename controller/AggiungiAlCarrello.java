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
 * Servlet implementation class AggiungiAlCarrello
 */
@WebServlet("/AggiungiAlCarrello")
public class AggiungiAlCarrello extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiAlCarrello() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//servlet utile in prodotto.jsp quando clicchiamo su aggiungi al carrello
		int cod =Integer.parseInt(request.getParameter("cod"));
		int quant =Integer.parseInt(request.getParameter("quant"));
		String taglia=(String)request.getParameter("taglia");
		ArrayList<SottoOrdine> carrello;
		if(request.getSession().getAttribute("carrello") == null){
			carrello= new ArrayList<SottoOrdine>();
		}
		else{
			carrello=(ArrayList<SottoOrdine>)request.getSession().getAttribute("carrello");
		}
		Prodotto p;
		ProdottoDAO pd = new ProdottoDAO();
		SottoOrdine s= new SottoOrdine();
		p=pd.doRetriveByCod(cod);
		s.setP(p);
		s.setQuant(quant);
		s.setSize(taglia);
		carrello.add(s);
		request.getSession().setAttribute("count", carrello.size());
		
		request.getSession().setAttribute("carrello", carrello);
		request.getRequestDispatcher("prodotto.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
