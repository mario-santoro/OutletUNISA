<%@page import="java.util.ArrayList"%>
<%@page import="model.Utente"%>
<%@page import="model.SottoOrdine"%>
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
<link href="https://fonts.googleapis.com/css?family=Raleway"
	rel="stylesheet">
<link type="text/css" rel="stylesheet" href="js/template.css">
<style type="text/css">
.boh {
	margin-left: 28%;
	margin-right: 10%;
	margin-bottom: 2%;
	border-bottom: 2px solid #ccc;
	opacity: 20%;
	padding: 10px 10px 10px 10px;
}

.totale {
	background-color: white;
	border: 2px solid #526E9B;
	border-radius: 10px;
	opacity: 20%;
	border-radius: 10px;
	padding: 3% 2% 3% 2%;
}
</style>
</head>
<body>
	<script type="text/javascript">

$( document ).ready(function() {
	
	var denied="${denied}"
	if(denied=="true"){
		alert("Devi Accedere");
		
	}
	
	
	
	
})
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

	
	
	

		})
		

		function remove(a){

	window.location.href='RimuoviDalCarrello?cod='+a;
		   
	}
	
	function Acquista(){
		var quantTot=document.getElementById("quantTot").innerHTML;
		var prezzoTot=document.getElementById("prezzoTot").innerHTML;

		window.location.href='ConfermaOrdine?quantTot='+quantTot+'&prezzoTot='+prezzoTot;
		
	}
</script>
	<%
		session.setAttribute("denied", false);
	%>
	<%
		ArrayList<SottoOrdine> p = (ArrayList<SottoOrdine>) session.getAttribute("carrello");
	%>
	<%
		if (session.getAttribute("count") == null) {

			session.setAttribute("count", "0");
		}
	%>
	<%
		Utente u = (Utente) session.getAttribute("userBean");
	%>
	<div id="mySidenav" class="sidenav"></div>


	<div id="main">

		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a href="index.jsp"><img src="img/Untitled-3.png" height="80"
						width="120"></a>
					<div style="font-size: 20px;">
						<span id="linee" style="color: #FFF587; cursor: pointer"
							onclick="openNav()">&#9776; </span> <span
							style="margin-left: 10px; margin-right: 10px;"><a id="c1"
							href="ProdottiPerCategorie?c=Uomo">Uomo</a></span> <span
							style="margin-left: 10px; margin-right: 10px;"><a id="c2"
							href="ProdottiPerCategorie?c=Donna">Donna</a></span> <span
							style="margin-left: 10px; margin-right: 10px;"><a id="c3"
							href="ProdottiPerCategorie?c=Bambino">Bambino</a></span>
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
						<input type="text" class="search-query offset1" name="search"
							placeholder="Search.." required>
					</div>
					<button type="submit"
						style="background: url(); background-repet: no-repet; border: none; cursor: pinter; overflow: hidden; outline: none;">
						<img width="30px" height="30px" src="img/lens_copy.png" />
					</button>
				</form>
				<%
					if (u != null) {
				%>

				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="carrello.jsp"><span
							class="glyphicon glyphicon-shopping-cart"></span> <span>Carrello
								<%=session.getAttribute("count")%>
						</span><span id="quanti_carrello"></span></a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>
							<%=u.getNome()%><span class="caret"></span></a>

						<ul class="dropdown-menu">
							<li><a href="modificaProfilo.jsp" style="color: #fff587">Modifica
									Profilo</a></li>
							<li><a href="ListaOrdini" style="color: #fff587">Lista
									Ordini</a></li>
							<%
								if (!u.getP_iva().equals("")) {
							%>
							<li><a href="VisualizzaVendite" style="color: #fff587">Lista
									Prodotti</a></li>
							<%
								}
							%>
						</ul></li>
					<li class="dropdown"><a href="Logout"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul>

				<%
					} else {
				%>
				<form method="GET" action="Login" name="fo1">

					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="carrello.jsp"><span
								class="glyphicon glyphicon-shopping-cart"></span> <span>Carrello
									<%=session.getAttribute("count")%>
							</span><span id="quanti_carrello"></span></a></li>
						<li><a href="registrazione.jsp"><span
								class="glyphicon glyphicon-user"></span> Sign Up</a></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown"><span
								class="glyphicon glyphicon-log-in"></span> Login</a>


							<ul class="dropdown-menu">
								<li class="test">Login: <input type="text" name="email"
									required></li>
								<li class="test">Password: <input type="password"
									name="psw" required></li>
								<li class="bottone"><input type="submit" value="accedi"></li>
							</ul></li>
					</ul>


				</form>
				<%
					}
				%>
			</div>
		</nav>


		<div class="container-fluid text-center">
			<div class="row content">

				<%
					if (p == null || p.size() == 0) {
				%>
				<div align="left" style="margin-left: 5%;">
					<h1>
						<b>Carrello</b>
					</h1>
					<br>
					<h3>Il tuo carrello è vuoto.</h3>
					<br> <br> <br> <br> <br>
				</div>
				<%
					} else {
				%>
				<!-- inizia il prodotto -->

				<div class="col-sm-8 text-left" style="width: 70%; height: 50%;">
					<%
						double tot = 0;
							int TotQuant = 0;
							for (int i = 0; i < p.size(); i++) {
								tot += p.get(i).getP().getPrezzo()*p.get(i).getQuant();
								TotQuant += p.get(i).getQuant();
					%>

					<div class="inizia qui">
						<span style="margin-left: 5px;"> <img width=15% height=20%
							src="img/<%=p.get(i).getP().getImmagine()%>"
							style="float: left; margin-bottom: 5%;" />
						</span>


						<div class="boh">

							<p>
								<b><%=p.get(i).getP().getNome()%></b> <span
									style="margin-left: 25%"> <b>prezzo <%=p.get(i).getP().getPrezzo()%>
										<span class="glyphicon glyphicon-euro"></span></b>
								</span>

							</p>

							<p>
								<b><%=p.get(i).getP().getMarca()%> </b>
							</p>

							<p>
								<b>Taglie:</b>
								<%=p.get(i).getSize()%>


								<span style="margin-left: 5%"> <b>Q.tà:</b> <%=p.get(i).getQuant()%>
								</span>

							</p>



							<br> <br>
							<p>

								<b>descrizione: </b>
								<%=p.get(i).getP().getDescrizione()%>
							</p>



							<p align="right">
								<input type="button" class="btn-primary" style="color: #FFF587;"
									value="rimuovi dal carrello"
									onclick="remove(<%=p.get(i).getP().getCod()%>)">
							</p>
						</div>
					</div>

					<%
						}
					%>



				</div>


				<!-- questo è per il prezzo totale -->

				<div class="col-sm-8 text-rigth" style="width: 30%; height: 50%;">
					<div class="totale"
						style="float:; margin-right: 5%; margin-bottom: 5%;">

						<b>Prezzo Totale (articoli <span id="quantTot"><%=TotQuant%></span>):
						</b>
						<p id="prezzoTot"><%=tot%></p>
						<p align="right">
							<input type="button" class="btn-primary" style="color: #FFF587;"
								value="Acquista" onclick="Acquista()">
						</p>
					</div>
				</div>

				<!-- fine prezzo totale-->
				<%
					}
				%>
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
						<img alt="Share on Facebook"
							src="https://d21jyx1832zc40.cloudfront.net/img/Facebook.png">
					</p>
					<!-- Twitter -->
					<p>
						<img alt="Tweet"
							src="https://d21jyx1832zc40.cloudfront.net/img/Twitter.png">
					</p>
					<!-- Google +-->
					<p>
						<img alt="Share on Google+"
							src="https://d21jyx1832zc40.cloudfront.net/img/Google%2B.png">

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

