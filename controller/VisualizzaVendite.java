package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Prodotto;
import model.ProdottoDAO;
import model.Utente;

/**
 * Servlet implementation class VisualizzaVendite
 */
@WebServlet("/VisualizzaVendite")
public class VisualizzaVendite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VisualizzaVendite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//servlet utile solo ai fornitori, visualizza tutti i prodotti messi in vendita dall'utente(fornitore)
		ArrayList<Prodotto> prod=new ArrayList<Prodotto>();
		Utente u=(Utente)request.getSession().getAttribute("userBean");
		ProdottoDAO pd=new ProdottoDAO();
		prod=pd.doRetriveProdottiVenduti(u.getP_iva());
		request.getSession().setAttribute("vendite",prod);
		//serve per inserimento prodotto
		ArrayList<String> taglie=new ArrayList<String>();
		taglie=pd.doRetriveAllSize();
		request.getSession().setAttribute("taglie",taglie);
		RequestDispatcher d=request.getRequestDispatcher("fornitore.jsp");
				d.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
