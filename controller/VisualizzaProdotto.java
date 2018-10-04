package controller;

import java.io.IOException;

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
 * Servlet implementation class VisualizzaProdotto
 */
@WebServlet("/VisualizzaProdotto")
public class VisualizzaProdotto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VisualizzaProdotto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//cliccando su un immagine di un prodotto  prendiamo
			//tutte le informazioni inerenti a quel prodotto e le stampiamo nella pagina prodotto.jsp
		 String s=request.getParameter("cod");
	int	cod=Integer.parseInt(s.replace(" ", ""));
	
			ProdottoDAO pd=new ProdottoDAO();
			Prodotto p1=pd.doRetriveByCod(cod);
			HttpSession ses=request.getSession();
			ses.setAttribute("p", p1);
			RequestDispatcher d=request.getRequestDispatcher("prodotto.jsp");
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
