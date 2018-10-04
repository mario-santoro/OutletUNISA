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
import model.Taglie;
import model.Utente;

/**
 * Servlet implementation class AggiungiScorte
 */
@WebServlet("/AggiungiScorte")
public class AggiungiScorte extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiScorte() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Taglie> taglie=new ArrayList<Taglie>();
		Taglie t;
		for(int i=0;i<4;i++){
			t=new Taglie();
			
			t.setTaglia(request.getParameter("taglia"+i));
			t.setQuantita(Integer.parseInt(request.getParameter("quant"+i)));
			
			taglie.add(t);
			
		}
		
		int cod=Integer.parseInt(request.getParameter("cod"));
		Prodotto p=new Prodotto();
		ProdottoDAO pd=new ProdottoDAO();
		p.setTaglie(taglie);
		p.setCod(cod);
		pd.doUpdate(p);
		RequestDispatcher d=request.getRequestDispatcher("VisualizzaVendite");
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
