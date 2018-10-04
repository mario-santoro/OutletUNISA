package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Prodotto;

/**
 * Servlet implementation class SelezionaQuant
 */
@WebServlet("/SelezionaQuant")
public class SelezionaQuant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelezionaQuant() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//servlet utile nel prodotto.jsp per selezionare la quantità che vogliamo comprare
		Prodotto p=(Prodotto)request.getSession().getAttribute("p");
		String size=(String) request.getParameter("size");
		response.getWriter().append("[");
		int i,j;
		int index=0;
		for(j=0;j<p.getTaglie().size();j++){
			
			if(size.equals(p.getTaglie().get(j).getTaglia())){
				
				index=j;
			}
		}
	if(p.getTaglie().get(index).getQuantita()==0){
		i=0;
	}else{
		for ( i = 1; i < p.getTaglie().get(index).getQuantita(); i++) {
			response.getWriter().append("{\"quant\":\""+i+"\"},");

			
		}
	}
		
		response.getWriter().append("{\"quant\":\""+i+"\"}");

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
