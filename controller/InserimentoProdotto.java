package controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.Prodotto;
import model.ProdottoDAO;
import model.Taglie;
import model.Utente;

/**
 * Servlet implementation class InserimentoProdotto
 */
@WebServlet("/InserimentoProdotto")
@MultipartConfig
public class InserimentoProdotto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InserimentoProdotto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//servlet per l'inserimento del prodotto  
		response.setContentType("text/html);charset=UTF-8");
	 	  
		String nome=request.getParameter("nome");
		String marca=request.getParameter("marca");
		double prezzo=Double.parseDouble(request.getParameter("prezzo"));
		String descrizione=request.getParameter("descrizione");
		String categoria=request.getParameter("categoria");
		String sottocategoria=request.getParameter("sottocategoria");
		ArrayList<Taglie> taglie=new ArrayList<Taglie>();
		Utente u=(Utente)request.getSession().getAttribute("userBean");
		Taglie t;
		for(int i=0;i<4;i++){
			t=new Taglie();
			
			t.setTaglia(request.getParameter("taglia"+i));
			t.setQuantita(Integer.parseInt(request.getParameter("quant"+i)));
			taglie.add(t);
			
		}
		//in filePart carichiamo il file inviato dal form
    	String applicationPath = request.getServletContext().getRealPath("");
    	
    	Part filePart = request.getPart("immagine");
       
    	
        //salviamo in nomeFIle in nome del file
        String nomeFile = getFilename(filePart);
        
        
    //indirizzo della cartella dove salvare il file 
    /* se si vuole utilizzare un diverso indirizzo per salvarle, 
     * inizializzare diversamente la viariabile applicationPath
     */
    File uploads = new File(applicationPath+"/img",nomeFile); 
   // File uploads = new File("../1",nomeFile);
    
    //carichiamo il file in stream
    InputStream is = filePart.getInputStream();
    
    
    //parte scrittura file
    FileOutputStream fos = new FileOutputStream(uploads);
    BufferedOutputStream bos= new BufferedOutputStream(fos);
    int read = -1;

    while ((read = is.read()) != -1) {
        bos.write(read);
    }

    bos.flush();
    bos.close();
    is.close();
    
    
		Prodotto p= new Prodotto();
		ProdottoDAO pd=new ProdottoDAO();
p.setNome(nome);	
p.setMarca(marca);
p.setCategoria(categoria);
p.setDescrizione(descrizione);
p.setPrezzo(prezzo);
p.setTaglie(taglie);
p.setImmagine(nomeFile);
p.setSottocategoria(sottocategoria);
p.setP_iva(u.getP_iva());
	 pd.doSave(p);
	 RequestDispatcher d=request.getRequestDispatcher("VisualizzaVendite");
	 d.forward(request, response);
	 
	}
	private static String getFilename(Part part) {
		   for (String cd : part.getHeader("content-disposition").split(";")) {
		      if (cd.trim().startsWith("filename")) {
		         String filename = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
		         return filename.substring(filename.lastIndexOf('/') + 1).substring(filename.lastIndexOf('\\') + 1); // MSIE fix.
		      }
		   }
		 
		   return null;
		}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
