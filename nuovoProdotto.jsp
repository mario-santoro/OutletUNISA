<%@page import="model.Utente"%>
<%@page import="java.util.ArrayList"%>
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
input.search-query::-webkit-input-placeholder {
	color: #FFF587;
	opacity: 1;
}

input.search-query:-moz-placeholder {
	color: #FFF587;
	opacity: 1;
}

input.search-query::-moz-placeholder {
	color: #FFF587;
	opacity: 1;
}

input.search-query:-ms-input-placeholder {
	color: #FFF587;
	opacity: 1;
}

::-webkit-input-placeholder {
	color: black;
	opacity: 0.5;
}

::-moz-placeholder { /* Firefox 19+ */
	opacity: 0.5;
	color: black;
}

:-ms-input-placeholder { /* IE 10+ */
	color: black;
	opacity: 0.5;
}

:-moz-placeholder { /* Firefox 18- */
	color: black;
	opacity: 0.5;
}

.boh {
	background-color: white;
	margin-left: 35%;
	margin-right: 35%;
	margin-bottom: 2%;
	border: 2px solid #526E9B;
	border-radius: 10px;
	padding: 10px 10px 10px 10px;
}

.boh2 {
	background-color: white;
	margin-left: 35%;
	margin-right: 35%;
	margin-bottom: 2%;
}

input {
	padding: 5px;
	border-top: 0px;
	border-right: 0px;
	border-left: 0px;
	border-bottom: 2px solid #ccc;
}

.taglie {
	border-top: 0px;
	border-left: 0px;
	border-right: 0px;
	border-bottom: 2px solid #ccc;
	background-color: white;
	width: 15%;
	margin-right: 3%;
}

.cate {
	border-top: 0px;
	border-left: 0px;
	border-right: 0px;
	border-bottom: 2px solid #ccc;
	background-color: white;
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

		$(document)
				.ready(
						function() {
							$("#categoria").change(
									function() {
										var categoria = $("#categoria").val();

										$.get(
												"InserimentoSottoCategoria?categoria="
														+ categoria, function(
														data, status) {
													myFunction(data);

												});

									})

							function myFunction(data) {
								var i;

								var data = JSON.parse(data);

								var sott = "";
								for (i = 0; i < data.length; i++) {
									sott += "<option>" + data[i].name;

								}
								document.getElementById("sottocategoria").innerHTML = sott;
							}

						})

		function validate() {

			document.getElementById("nome").style.borderColor = '#ccc';
			document.getElementById("prezzo").style.borderColor = '#ccc';
			document.getElementById("marca").style.borderColor = '#ccc';
			document.getElementById("categoria").style.borderColor = '#ccc';

			document.getElementById("prova1").innerHTML = "";
			document.getElementById("prova2").innerHTML = "";
			document.getElementById("prova3").innerHTML = "";
			document.getElementById("prova4").innerHTML = "";

			var name = document.forms["fo1"]["nome"].value;
			var prezzo = document.forms["fo1"]["prezzo"].value;
			var marche = document.forms["fo1"]["marca"].value;
			var cat = document.forms["fo1"]["categoria"].value;

			var stringa = /^[A-Za-z0-9 ]{4,}$/
			var stringa2 = /^\d{0,8}(\.\d{1,4})?$/

			if ((prezzo.match(stringa2)) && (name.match(stringa))
					&& (marche.match(stringa))
					&& (cat !== "Seleiona categoria")) {

				return true;
			} else {

				if (name.match(stringa) == null) {
					document.getElementById("nome").style.borderColor = 'red';
					document.getElementById("prova1").innerHTML = "formato nome errato";
				}

				if (cat == "Seleziona categoria") {
					document.getElementById("categoria").style.borderColor = 'red';
					document.getElementById("prova4").innerHTML = "seleziona una categoria";
				}

				if (marche.match(stringa) == null) {
					document.getElementById("marca").style.borderColor = 'red';
					document.getElementById("prova3").innerHTML = "formato marca errato";
				}

				if (prezzo.match(stringa2) == null) {
					document.getElementById("prezzo").style.borderColor = 'red';
					document.getElementById("prova2").innerHTML = "formato prezzo errato";
				}

				return false;
			}
		}
	</script>
	<%
		Utente u = (Utente) session.getAttribute("userBean");
	%>
	<%
		ArrayList<String> taglie = (ArrayList<String>) session.getAttribute("taglie");
		if (session.getAttribute("count") == null) {

			session.setAttribute("count", "0");
		}
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




			</div>
		</nav>

		<div class="boh" align="center">
			<form method="post" enctype="multipart/form-data"
				action="InserimentoProdotto" id="fo1" name="fo1"
				onsubmit="return validate()">
				<p align="left" style="margin-bottom: 0%; margin-left: 90px;">
					<b>Nome:</b>
				</p>
				<p class="test">
					<input type="text" name="nome" id="nome"
						placeholder="inserire nome" required>
				<p id="prova1" style="color: red"></p>
				<p align="left" style="margin-bottom: 0%; margin-left: 90px;">
					<b>Prezzo:</b>
				</p>
				<p class="test">
					<input type="text" name="prezzo" id="prezzo"
						placeholder="inserire prezzo" required>
				<p id="prova2" style="color: red"></p>
				<p align="left" style="margin-bottom: 0%; margin-left: 90px;">
					<b>Marca:</b>
				</p>
				<p class="test">
					<input type="text" name="marca" id="marca"
						placeholder="inserire marca" required>
				<p id="prova3" style="color: red"></p>
				<p align="left" style="margin-bottom: 0%; margin-left: 90px;">
					<b>Immagine:</b>
				</p>
				<p class="test">
					<input type="file" name="immagine" placeholder="inserire immagine"
						required>
				<p align="left" style="margin-bottom: 0%; margin-left: 90px;">
					<b>Descrizione:</b>
				</p>
				<p class="test">
					<textarea name="descrizione" id="descrizione"
						placeholder="inserire descrizione" required></textarea>
				<p align="left" style="margin-bottom: 0%; margin-left: 90px;">
					<b>Taglie:</b>
				</p>
				<%
					for (int i = 0; i < taglie.size(); i++) {
				%>
				<p class="test">
					<input class="taglie" type="text" name="taglia<%=i%>" id="taglia"
						value="<%=taglie.get(i)%>" readonly> <input class="taglie"
						type="number" name="quant<%=i%>" id="quant" min=0 required>
				</p>
				<%
					}
				%>
				<p align="left" style="margin-bottom: 0%; margin-left: 90px;">
					<b>Categoria:</b>
				</p>
				<p class="test">
					<select class="cate" name="categoria" id="categoria">
						<option>Seleziona categoria
						<option>Uomo
						<option>Donna
						<option>Bambino
					</select>
				<p id="prova4" style="color: red"></p>

				<p align="left" style="margin-bottom: 0%; margin-left: 90px;">
					<b>Sottocategoria:</b>
				</p>
				<p class="test">
					<select class="cate" name="sottocategoria" id="sottocategoria"></select>
				<p class="inserisci">
					<input style="color: #FFF587" class="btn-primary" type="submit"
						value="Inserisci">
			</form>

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