package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProdottoDAO;

/**
 * Servlet implementation class Sottocategorie
 */
@WebServlet("/Sottocategorie")
public class Sottocategorie extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Sottocategorie() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// stampiamo tt le sottocategorie nel menu a tendina della nostra navbar in modo da 
		//poter effettuaere ricerche per sottocategorie
		ProdottoDAO p = new ProdottoDAO();
		ArrayList<String> sottocategorie;
		sottocategorie = p.sottocategorie();
	
		response.getWriter().append("[");
		int i;
		for ( i = 0; i < sottocategorie.size()-1; i++) {
			response.getWriter().append("{\"name\":\""+sottocategorie.get(i)+"\"},");

			
		}
		response.getWriter().append("{\"name\":\""+sottocategorie.get(i)+"\"}");
		response.getWriter().append("]");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
