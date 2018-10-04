<%@page import="java.util.ArrayList" %> 
<%@page import="model.Utente" %>
<%@page import="model.Prodotto" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>OutletUNISA</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
 <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
 <link type="text/css" rel="stylesheet" href="js/template.css">
 <style> 
 
 .wrap{
 display: grid;
 grid-template-columns: 1fr 1fr 1fr;
 
 }
 
 </style>
</head>
<body>
<script type="text/javascript">

$( document ).ready(function() {

	
	$.get("Sottocategorie", function(data, status){
	    myFunction(data);
	   
			});

	function myFunction(data) {
		  var i;
		 
		  var data = JSON.parse(data);
		 
		var sott="";
		  for (i = 0; i <data.length; i++) { 
			  sott+="<a href=\"ProdottiPerCategorie?c="+data[i].name+"\">" +
			    data[i].name +"</a>";
			   
		  
		  }
		  document.getElementById("mySidenav").innerHTML = sott;
		}

	
		$("#fo").submit(function(){
			var key=$("#search").val();
			
			$.get("Ricerca?search="+key, function(data, status){
			    
					});
			
		})
	

		})
		

</script>

<% ArrayList<Prodotto> p=(ArrayList<Prodotto>)session.getAttribute("search");    %>
<%

if(session.getAttribute("count")==null){

	session.setAttribute("count", "0");
}
%>
<%Utente u=(Utente)session.getAttribute("userBean");%>
<div id="mySidenav" class="sidenav">
 
 
</div>


<div id="main">

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="index.jsp"><img src="img/Untitled-3.png" height="80" width="120" ></a>
				<div style="font-size:20px;"><span id="linee" style=" color:#FFF587; cursor:pointer " onclick="openNav()" >&#9776; </span>
				
				
				
				<span style="margin-left:10px; margin-right:10px;"><a id="c1" href="ProdottiPerCategorie?c=Uomo">Uomo</a></span>
				 
				<span style="margin-left:10px; margin-right:10px;"><a id="c2" href="ProdottiPerCategorie?c=Donna">Donna</a></span> 
				
				<span style="margin-left:10px; margin-right:10px;"><a id="c3" href="ProdottiPerCategorie?c=Bambino">Bambino</a></span>
				</div>
				<script>
				var b=true;
function openNav() {
	if(b==true){
	 b=false;
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
	}else if(b==false){
		b=true;
	    document.getElementById("mySidenav").style.width = "0";
	    document.getElementById("main").style.marginLeft= "0";
		
	}
}


</script>
			</div>
			
			<form class="navbar-form navbar-left" action="Ricerca" method="get">
     <div class="form-group">
  <input  type="text" class="search-query offset1" name="search" placeholder="Search.." required>
   </div>
    <button type="submit" style="background: url(); background-repet:no-repet; border:none; cursor:pinter; overflow:hidden; outline:none;">
   <img width="30px" height="30px" src="img/lens_copy.png"/>
   </button>
</form>
<%if(u!=null){ %>

				<ul class="nav navbar-nav navbar-right">
			<li class="dropdown"><a href="carrello.jsp"><span
							class="glyphicon glyphicon-shopping-cart"></span> <span>Carrello <%=session.getAttribute("count") %>
						</span><span id="quanti_carrello"></span></a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>
							<%=u.getNome() %><span class="caret"></span></a>

						<ul class="dropdown-menu">
							<li><a href="modificaProfilo.jsp" style="color:#fff587">Modifica Profilo</a></li>
							<li><a href="ListaOrdini" style="color:#fff587">Lista Ordini</a></li>
							
							<% if(!u.getP_iva().equals("")){%>
							<li><a href="VisualizzaVendite" style="color:#fff587">Lista Prodotti</a></li>
							<%} %>

						</ul></li>
					<li class="dropdown"><a href="Logout"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul>
		
<%} else{%>
		<form method="GET" action="Login" name="fo1" >
			 
    <ul class="nav navbar-nav navbar-right">
   <li class="dropdown"><a href="carrello.jsp"><span
							class="glyphicon glyphicon-shopping-cart"></span> <span>Carrello <%=session.getAttribute("count") %>
						</span><span id="quanti_carrello"></span></a></li>
      <li><a href="registrazione.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-log-in"></span> Login</a>
						
						
						<ul class="dropdown-menu">
							 <li class="test">Login: <input type="text" name="email" required></li>
      						<li class="test">Password: <input type="password" name="psw" required></li>
							<li class="bottone"><input type="submit"  value="accedi"></li>
						</ul>
			 </li>
   </ul>
   
			</form>
<%} %>
		</div>
	</nav>
	



	<div class="container-fluid text-center">
		<div class="row content">
			
			<div class="col-sm-10 text-left">
		
			
				<h1>Catalogo</h1>
				<% if(p.size()==0){ %>
			<br>
		<h1>Siamo spiacenti, non abbiamo trovato articoli corrispondenti.</h1>
			<br>

			
		<% }else{%>	
			
<div class="wrap">

<%for(int i=0;i<p.size();i++){ %>

					




                    <div class="prodotto_in_catalogo" style=" margin-left: 5%; margin-bottom: 5%;">
						
						<article>
						<a href="VisualizzaProdotto?cod=<%=p.get(i).getCod()%>">
<span style="margin-left: 5px;"><img width=60% height=40% src='img/<%=p.get(i).getImmagine()%>'style="float:inherit ; margin-bottom: 5%;" />
</span>
</a>

								<p style="size:1em;"><b><%=p.get(i).getNome()%></b> 
								<span style="margin-left: 10%"> <b>prezzo
										<%=p.get(i).getPrezzo()%><span class="glyphicon glyphicon-euro"></span></b>
								</span></p>
						</article>
						
						
							
					</div>

<%} }%>
				
				
				
  <hr>

			</div>
	</div>
		</div>
	</div>
	
	
<!-- Footer -->
	<footer class="page-footer font-small blue pt-4">

		<!-- Footer Links -->
		<div class="container-fluid text-center text-md-left">

			<!-- Grid row -->
			<div class="row">

				<!-- Grid column -->
				<div class="col-md-6 mt-md-0 mt-3">

					<!-- Content -->
					<h5 class="text-uppercase">Aiuto</h5>
					<p>Domande frequenti</p>
					<p>Procedi all'ordine</p>
					<p>Metodi di pagamento</p>
					<p>Tempi di spedizione</p>
					<p>Dove si trova il mio ordine</p>

				</div>
				<!-- Grid column -->

				<!--  <hr class="clearfix w-100 d-md-none pb-3">-->

				<!-- Grid column -->
				<div class="col-md-3 mb-md-0 mb-3">

					<!-- Links -->
					<h5 class="text-uppercase">Address</h5>

					<ul class="list-unstyled">
						<li>
							<p>
								<i class="fa fa-home mr-3"></i> New York, NY 10012, US
							</p>
						</li>
						<li>
							<p>
								<i class="fa fa-envelope mr-3"></i> info@example.com
							</p>
						</li>
						<li>
							<p>
								<i class="fa fa-phone mr-3"></i> + 01 234 567 88
							</p>
						</li>
						<li>
							<p>
								<i class="fa fa-print mr-3"></i> + 01 234 567 89
							</p>
						</li>
					</ul>


				</div>


				<!-- Grid column -->
				<div class="col-md-3 mb-md-0 mb-3">

						<!-- Links -->
					<h5 class="text-uppercase">Follow Us</h5>

					<!-- Facebook -->
					<p>
						<img alt="Share on Facebook" src="https://d21jyx1832zc40.cloudfront.net/img/Facebook.png">
					</p>
					<!-- Twitter -->
					<p>
						<img alt="Tweet" src="https://d21jyx1832zc40.cloudfront.net/img/Twitter.png">
					</p>
					<!-- Google +-->
					<p>
						<img alt="Share on Google+" src="https://d21jyx1832zc40.cloudfront.net/img/Google%2B.png">
						
					</p>
				</div>
				<!-- Grid column -->

			</div>
			<!-- Grid row -->

		</div>
		<!-- Footer Links -->

		<!-- Copyright -->
		<div class="footer-copyright text-center py-3">
			© 2018 Copyright: <a href="index.jsp"> OutletUNISA.com</a>
		</div>
		<!-- Copyright -->

	</footer>
	<!-- Footer -->
</div>
</body>
</html>

