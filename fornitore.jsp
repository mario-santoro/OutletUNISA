<%@page import="java.util.ArrayList"%>
<%@page import="model.Utente"%>
<%@page import="model.Prodotto"%>
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

.newProdotto {
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
		$(document).ready(
				function() {

					$.get("Sottocategorie", function(data, status) {
						myFunction(data);

					});

					function myFunction(data) {
						var i;

						var data = JSON.parse(data);

						var sott = "";
						for (i = 0; i < data.length; i++) {
							sott += "<a href=\"ProdottiPerCategorie?c="
									+ data[i].name + "\">" + data[i].name
									+ "</a>";

						}
						document.getElementById("mySidenav").innerHTML = sott;
					}

				})

		function inserisci() {

			window.location.href = 'nuovoProdotto.jsp';

		}
	</script>
	<%
		Utente u = (Utente) session.getAttribute("userBean");
	%>
	<%
		if (session.getAttribute("count") == null) {

			session.setAttribute("count", "0");
		}
	%>
	<%
		ArrayList<Prodotto> p = (ArrayList<Prodotto>) session.getAttribute("vendite");
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
						var b = true;
						function openNav() {
							if (b == true) {
								b = false;
								document.getElementById("mySidenav").style.width = "250px";
								document.getElementById("main").style.marginLeft = "250px";
							} else if (b == false) {
								b = true;
								document.getElementById("mySidenav").style.width = "0";
								document.getElementById("main").style.marginLeft = "0";

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

				<
			</div>
		</nav>


		<div class="container-fluid text-center">
			<div class="row content">

				<%
					if (p == null || p.size() == 0) {
				%>
				<div align="left" style="margin-left: 5%;">
					<h1>
						<b>Prodotti</b>
					</h1>
					<br>
					<h3>Lavora con noi e aggiungi nuovi prodotti. <a  onclick="inserisci()"> Qui</a></h3>
					<br> <br> <br> <br> <br>
				</div>
				<%
					} else {
				%>
				<!-- inizia il prodotto -->

				<div class="col-sm-8 text-left" style="width: 70%; height: 50%;">
					<%
						for (int i = 0; i < p.size(); i++) {
					%>

					<div class="inizia qui">
						<span style="margin-left: 5px;"> <img width=15% height=20%
							src="img/<%=p.get(i).getImmagine()%>"
							style="float: left; margin-bottom: 5%;" />
						</span>


						<div class="boh">

							<p>
								<b><%=p.get(i).getNome()%></b> <span style="margin-left: 25%">
									<b>prezzo <%=p.get(i).getPrezzo()%> <span
										class="glyphicon glyphicon-euro"></span></b>
								</span>

							</p>

							<p>
								<b><%=p.get(i).getMarca()%> </b>
							</p>
							<p>
								<b>descrizione: </b>
								<%=p.get(i).getDescrizione()%>
							</p>
							<p>
								<b>categoria: </b>
								<%=p.get(i).getCategoria()%>
							</p>
							<p>
								<b>sottocategoria: </b>
								<%=p.get(i).getSottocategoria()%>
							</p>

							<p>
								<b>Taglie:</b>
							</p>
							<form action="AggiungiScorte" method="get">
								<p>
									<%
										for (int j = 0; j < p.get(i).getTaglie().size(); j++) {
									%>
									<span>
										<p class="test">
											<input style="border-top:0px; border-left:0px; border-right:0px;  border-bottom: 2px solid #ccc; background-color: #F0F7FF; width: 10% ; margin-right: 3% ;" type="text" name="taglia<%=j%>" id="taglia"value="<%=p.get(i).getTaglie().get(j).getTaglia()%>"readonly> 
												<input style="border-top:0px; border-left:0px; border-right:0px; border-bottom: 2px solid #ccc; background-color: #F0F7FF;  width: 10% ; margin-right: 3% " type="number" name="quant<%=j%>" id="quant" min=0 value=<%=p.get(i).getTaglie().get(j).getQuantita()%> required>
										</p> <%
 	}
 %>
									</span> <br>
								</p>

								<br> <br> <input type="hidden" name="cod"
									value=<%=p.get(i).getCod()%>>


								<p align="right">
									<input type="submit" class="btn-primary"
										style="color: #FFF587;" value="aggiungi scorte">
							</form>
							</p>
						</div>
					</div>

					<%
						}
						
					%>



				</div>


				<!-- questo è l'inserimento di un nuovo prodotto -->

				<div class="col-sm-8 text-rigth" style="width: 30%; height: 50%;">
					<div class="newProdotto"
						style="float:; margin-right: 5%; margin-bottom: 5%;">

						<b>Inserisci nuovo prodotto </b>
						<p>
							<input type="button" class="btn-primary" style="color: #FFF587;"
								value="Inserisci" onclick="inserisci()">
						</p>
					</div>
				</div>

				<%} %>

			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="page-footer font-small blue pt-4">

		<!-- Footer Links -->
		<div class="container-fluid text-center text-md-center">

			<!-- Grid row -->
			<div class="row">

				<!-- Grid column -->
				<div class="col-md-3 " align="center">

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
				<div class="col-md-6 " align="center">

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
				<div class="col-md-3 " align="center">

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
