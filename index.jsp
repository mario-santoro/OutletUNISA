<%@page import="java.util.ArrayList"%>
<%@page import="model.Utente"%>
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
* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}


/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}



.boh {
	background-color: white;
	margin-left: 5%;
	margin-right: 5%;
	margin-bottom: 5%;
	margin-top: 5%;
	border: 2px solid #526E9B;
	border-radius: 10px;
	padding: 10px 20px 10px 20px;
}

.wrapper {
	height: 35%;
	overflow-x: scroll;
	overflow-y: hidden;
}

#slider4 {
	white-space: nowrap;
}

.slide-img {
	background: #ccc;
	height: 200px;
	display: inline-block;
	width: 100px;
	margin-right: 10%;
}
</style>
</head>
<body>
<script type="text/javascript">

$( document ).ready(function() {
	
	var denied="${denied}"
	if(denied=="true"){
		alert("Credenziali Errate");
		
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
		
	$( document ).ready(function() {

	
	$.get("Vetrina", function(data, status){
	    prodVetrina(data);
			});

	function prodVetrina(data) {
		var i;
		 var data = JSON.parse(data);
		  var s="";
		
		  for (i = 0; i <data.length; i++) { 
			
			  
			s+=" <div class=\"slide-img\"> <p class=\"foto-prodotto\"><a href='VisualizzaProdotto?cod="+data[i].cod+
					"'><img src=\"img/"+data[i].immagine +"\" style=\"width: 140%;\" /><p class=\"prezzo-prodotto\">"+
					"<b>"+ data[i].prezzo +"</b> <p class=\"nome-prodotto\"><b>"+data[i].nome+"</b></p></div>";
		  }
		  document.getElementById("slider4").innerHTML = s;
		}
		})

</script>
<%session.setAttribute("denied", false); %>
<%Utente u=(Utente)session.getAttribute("userBean");%>
<%

if(session.getAttribute("count")==null){

	session.setAttribute("count", "0");
}
%>
<div id="mySidenav" class="sidenav">
 
 
</div>


<div id="main">

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href=""><img src="img/Untitled-3.png" height="80" width="120" ></a>
				<div style="font-size:20px;"><span id="linee" style="color:#FFF587; cursor:pointer " onclick="openNav()" >&#9776; </span>
				
				
				
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
	
				
				<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="img/slide3.jpg" style="width:100%;height:500px;">
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="img/slide2.jpg" style="width:100%;height:500px;">
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="img/slide1.jpg" style="width:100%;height:500px;">
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>
<script>
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 1800); // Change image every 2 seconds
}
</script>

				
			

	<div class="container-fluid text-center">
		<div class="row content">
			
			<div class="text-left">
				<div class="boh">
					<h3>Consigliati</h3>
					<div class="wrapper">
						<div id="slider4" class="text-center">
						

						</div>
					</div>

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
