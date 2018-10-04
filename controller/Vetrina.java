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

/**
 * Servlet implementation class Vetrina
 */
@WebServlet("/Vetrina")
public class Vetrina extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Vetrina() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//riempie la nostra index.jsp con i prodotti più acquistati per un massimo di 10 prodotti
		ProdottoDAO pd=new ProdottoDAO();
		ArrayList<Prodotto> p;
		p=pd.doRetriveVetrina();
		
		response.getWriter().append("[");
		int i;
		
		for ( i = 0; i < p.size()-1; i++) {
			response.getWriter().append("{\"nome\":\""+p.get(i).getNome()+"\",\"marca\":\""+p.get(i).getMarca()+"\",\"immagine\":\""+p.get(i).getImmagine()+"\",\"prezzo\":\""+p.get(i).getPrezzo()+"\",\"cod\":\" "+p.get(i).getCod()+"\"},");

			
		}
		
		response.getWriter().append("{\"nome\":\""+p.get(i).getNome()+"\",\"marca\":\""+p.get(i).getMarca()+"\",\"immagine\":\""+p.get(i).getImmagine()+"\",\"prezzo\":\""+p.get(i).getPrezzo()+"\",\"cod\":\""+p.get(i).getCod()+"\"}");
		response.getWriter().append("]");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
