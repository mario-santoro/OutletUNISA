<%@page import="model.Prodotto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
	Prodotto p = (Prodotto) session.getAttribute("p");
%>
<title>Prodotto <%=p.getNome()%></title>
<meta charset=ISO-8859-1>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
 <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
 <link type="text/css" rel="stylesheet" href="js/template.css">

<title>Prodotto</title>
<style type="text/css">



.boh {
	
	margin-left: 35%;
	margin-right: 25%;
	margin-bottom: 2%;
	
	padding: 10px 10px 10px 10px;
}



</style>


<script type="text/javascript">


	$(document).ready(function() {
		
		 $("#taglie").change(function(){
			 document.getElementById("prova").innerHTML="";
			var size= $("#taglie").val();
		    	$.get("SelezionaQuant?size="+size, function(data, status){
		            func(data);
		        });

	})
	});
	function func(JSONdata) {
	  var i;
	  var data = JSON.parse(JSONdata);
	  var s="";

	if(data[0].quant==0){
		s="<option>non disponibile";
		
	}else{
	  for (i = 0; i <data.length; i++) {
		  
	    s += "<option>" +
	    data[i].quant 
	    ;
	  }
	}
	  document.getElementById("quant").innerHTML = s;
	}
	
	$(document).ready(function() {

				$.get("Sottocategorie", function(data, status) {
					myFunction(data);

				});

				function myFunction(data) {
					var i;

					var data = JSON.parse(data);

					var sott = "";
					for (i = 0; i < data.length; i++) {
						sott += "<a href=\"ProdottiPerCategorie?c="
								+ data[i].name + "\">" + data[i].name + "</a>";

					}
					document.getElementById("mySidenav").innerHTML = sott;
				}

			})

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
	
	
	function addCarrello(a){
	var quant=document.getElementById("quant").value;
	var taglia= document.getElementById("taglie").value;
	if(taglia=="--Seleziona Taglia--"){
		
		document.getElementById("prova").innerHTML="seleziona taglia";
	}else if(quant=="non disponibile"){
		
		document.getElementById("prova").innerHTML="riprova piu tardi";
		
	}else{
		document.getElementById("prova").innerHTML="";
		 var xmlhttp = new XMLHttpRequest();
		  xmlhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		     
		    }
		  };
		  xmlhttp.open("GET", "AggiungiAlCarrello?cod="+a+"&quant="+quant+"&taglia="+taglia, true);
		  xmlhttp.send();
		  window.location.href='prodotto.jsp';
	}
	
	
	}
	   
	  

	
</script>

<%
	Utente u = (Utente) session.getAttribute("userBean");
%>
<%

if(session.getAttribute("count")==null){

	session.setAttribute("count", "0");
}
%>
</head>
<body>
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
							class="glyphicon glyphicon-shopping-cart"></span> <span>Carrello <%=session.getAttribute("count") %>
						</span><span id="quanti_carrello"></span></a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>
							<%=u.getNome()%><span class="caret"></span></a>

						<ul class="dropdown-menu">
							<li><a href="modificaProfilo.jsp" style="color: #fff587">Modifica
									Profilo</a></li>
							<li><a href="listaOrdini.jsp" style="color: #fff587">Lista
									Ordini</a></li>
									
									<% if(!u.getP_iva().equals("")){%>
							<li><a href="VisualizzaVendite" style="color:#fff587">Lista Prodotti</a></li>
							<%} %>

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
							class="glyphicon glyphicon-shopping-cart"></span> <span>Carrello <%=session.getAttribute("count") %>
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

				<div class="col-sm-8 text-left" style="width:100%;height:50%;">
<span style="margin-left: 5px;"> <img width=35% height=23%
						src='img/<%=p.getImmagine()%>'
						style="float: left; margin-right: 5%; margin-bottom: 5%;" />
					</span>

					<div class="boh">
	
						<p>
							<b><%=p.getNome()%></b>
						
						
						<span style="margin-left: 25%">
							<b><%=p.getPrezzo()%><span class="glyphicon glyphicon-euro"></span></b>
						</span>
						
						</p>
						
							<p><b><%=p.getMarca()%></b></p>
						
					
					
					<p>
						
						
						<b>Taglie:</b> <select name="taglie" id="taglie" onchange="quant(this.value)">
						<option>--Seleziona Taglia--
							<%
								for (int i = 0; i < p.getTaglie().size(); i++) {
									
							%>
							<option><%=p.getTaglie().get(i).getTaglia()%>
								
									
								
								 
									
										<%
											}
										%>
							</select>
									<span style="margin-left: 5%"><b>Quantità:</b>
									<select name="quant" id="quant">
									
									</select>
								</span>
							<br>
					</p>
					<p id="prova" style="color:red;"></p>
					<br>
						<br>
						<p>
						
							<b><%=p.getDescrizione()%></b>
							
						</p>
				
					<p align="right">
						<input class="btn-primary" style="color:#FFF587;" type="button" value="aggiungi al carrello" onclick="addCarrello(<%=p.getCod()%>)">
							
						</p>
				
				
					</div>

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
							<a href=""><img alt="Share on Facebook"
								src="https://d21jyx1832zc40.cloudfront.net/img/Facebook.png"></a>
						</p>
						<!-- Twitter -->
						<p>
							<a href=""><img alt="Tweet"
								src="https://d21jyx1832zc40.cloudfront.net/img/Twitter.png"></a>
						</p>
						<!-- Google +-->
						<p>
							<a href=""><img alt="Share on Google+"
								src="https://d21jyx1832zc40.cloudfront.net/img/Google%2B.png"></a>

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