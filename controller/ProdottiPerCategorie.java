package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Prodotto;
import model.ProdottoDAO;

/**
 * Servlet implementation class ProdottiPerCategorie
 */
@WebServlet("/ProdottiPerCategorie")
public class ProdottiPerCategorie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdottiPerCategorie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//servlet che stampa nel catalogo.jsp la lista dei prodotti con la categoria o sottocategoria selezionata
		ProdottoDAO pd=new ProdottoDAO();
		ArrayList<Prodotto> p;
		String key=request.getParameter("c");
		
		p=pd.doRetriveByCategoria(key);
	
		HttpSession session=request.getSession();
		session.setAttribute("search", p);
		
		RequestDispatcher d=request.getRequestDispatcher("catalogo.jsp");
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
