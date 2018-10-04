<!DOCTYPE html>
<html>
<title> Registrazione OutletUNISA</title>
<head>
<meta charset="ISO-8859-1">


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
 <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
 <link type="text/css" rel="stylesheet" href="js/template.css">
 
 <style type="text/css">
 
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
 .boh{
 
 background-color: white;
 margin-left: 35%;
margin-right: 35%;
margin-bottom: 2%;
border: 2px solid #526E9B;
border-radius:10px;
padding: 10px 10px 10px 10px;

 }
 
 input{
	padding: 5px;
    border-top: 0px;
    border-right: 0px;
    border-left: 0px;
    border-bottom: 2px solid #ccc;
 }
 
.boh2 {
	background-color: white;
	margin-left: 35%;
	margin-right: 35%;
	margin-bottom: 2%;
}
 </style>
 
 
</head>

<body>

<script>
$( document ).ready(function() {
	
			var denied="${err}"
	if(denied=="true"){
		alert("errore email già esistente");
		
	}

	
	
	
	
})
function validate(){
	document.getElementById("email").style.borderColor='#ccc';
	document.getElementById("psw").style.borderColor='#ccc';
	document.getElementById("nome").style.borderColor='#ccc';
	document.getElementById("cognome").style.borderColor='#ccc';
	document.getElementById("via").style.borderColor='#ccc';
	document.getElementById("p_iva").style.borderColor='#ccc';
	document.getElementById("pswnew").style.borderColor='#ccc';
	document.forms["fo1"]["pswnew"].style.borderColor='#ccc';
	document.getElementById("prova").innerHTML="";
	document.getElementById("prova1").innerHTML="";
	document.getElementById("prova2").innerHTML="";
	document.getElementById("prova3").innerHTML="";
	document.getElementById("prova4").innerHTML="";
	document.getElementById("prova5").innerHTML="";
	document.getElementById("prova6").innerHTML="";
	
	var name=document.forms["fo1"]["nome"].value;
	var cognome=document.forms["fo1"]["cognome"].value;
	var email=document.forms["fo1"]["email"].value;
	var psw=document.forms["fo1"]["psw"].value;
	var via=document.forms["fo1"]["via"].value;
	var p_iva=document.forms["fo1"]["p_iva"].value;
	var pswnew=document.forms["fo1"]["pswnew"].value;
	
	var stringa= /^\w+([\.-_]\w+)*@\w+\.\w+$/
	var stringa2= /^[A-Za-z]{3,}$/
	var stringa3= /^[A-Za-z0-9]{6,}$/
	var stringa4= /^[A-Za-z ]{3,}$/
		
	if((email.match(stringa))&&(name.match(stringa2))&&(cognome.match(stringa2))&&(via.match(stringa4))&&(psw.match(stringa3))&&(p_iva.match(stringa3)||(p_iva==""))&&(pswnew==psw)){
	
		return true;
	}else {
		
		if(email.match(stringa)==null){
			document.getElementById("email").style.borderColor='red';
			document.getElementById("prova").innerHTML="formato email errato";
	}
		if(name.match(stringa2)==null){
			document.getElementById("nome").style.borderColor='red';
			document.getElementById("prova1").innerHTML="formato nome errato";
	}
		
		if(cognome.match(stringa2)==null){
			document.getElementById("cognome").style.borderColor='red';
			document.getElementById("prova2").innerHTML="formato cognome errato";
	}
		if(via.match(stringa4)==null){
			document.getElementById("via").style.borderColor='red';
			document.getElementById("prova3").innerHTML="formato via errato";
	}
		if(psw.match(stringa3)==null){
			document.getElementById("psw").style.borderColor='red';
			document.getElementById("prova4").innerHTML="almeno 6 caratteri";
	}
		if((p_iva!="")&&(p_iva.match(stringa3)==null)){
			document.getElementById("p_iva").style.borderColor='red';
			document.getElementById("prova5").innerHTML="formato p_iva errato";
	}
		
		if(pswnew!==psw){
			document.getElementById("pswnew").style.borderColor='red';
			document.getElementById("prova6").innerHTML="password diverse";
	}
		return false;
		}
}


</script>
<%session.setAttribute("err", false); %>
<nav class="navbar navbar-inverse">

		<div  align="center">
		
			
		
				<a href="index.jsp"><img src="img/Untitled-3.png" height="80" width="120" ></a>
			
			 
			 <p ><h1 style="color: #FFF587;">REGISTRAZIONE</h1>
			 </div>
			 
			 
  
   
			

		

	</nav>
<div class="boh" align="center">
<div class="bho2">
<form method="GET" action="Registrazione" id="fo1" name="fo1" onsubmit="return validate()">
<p align="left" style="margin-bottom: 0%; margin-left:90px;">
					<b>Email:</b>
				</p>
	<p class="test"><input class="test" type="text" id="email" name="email" placeholder="inserire email" required></p>
	<p id="prova" style="color:red"></p>
	<p align="left" style="margin-bottom: 0%; margin-left:90px;">
					<b>Password:</b>
				</p>
	<p class="test"><input class="test" type="password" id="psw" name="psw" placeholder="inserire password" required>
	<p id="prova4" style="color:red"></p>
	<p align="left" style="margin-bottom: 0%; margin-left:90px;">
					<b>Inserisci di nuovo la Password:</b>
				</p>
	<p class="test6"> <input type="password" name="pswnew" id="pswnew" placeholder="inserire di nuovo psw" required >
	<p id="prova6" style="color:red"></p>
	<p align="left" style="margin-bottom: 0%; margin-left:90px;">
					<b>Nome:</b>
				</p>
	<p class="test"><input class="test" type="text" id="nome" name="nome" placeholder="inserire nome" required>
	<p id="prova1" style="color:red"></p>
	<p align="left" style="margin-bottom: 0%;margin-left:90px;">
					<b>Cognome:</b>
				</p>
	<p class="test"><input class="test" type="text" id="cognome" name="cognome" placeholder="inserire cognome" required>
	<p id="prova2" style="color:red"></p>
	<p align="left" style="margin-bottom: 0%;margin-left:90px;">
					<b>Via:</b>
				</p>
	<p class="test"><input class="test" type="text" id="via" name="via"  placeholder="inserire via" required>
	<p id="prova3" style="color:red"></p>
	<p align="left" style="margin-bottom: 0%;margin-left:90px;">
					<b>Numero Civico:</b>
				</p>
	<p class="test"><input class="test" type="number" name="nCivico" placeholder="inserire numero civico" min="1" required>
	<p align="left" style="margin-bottom: 0%;margin-left:90px;">
					<b>CAP:</b>
				</p>
	<p class="test"><input class="test" type="number" name="CAP" placeholder="inserire CAP" min="1" required>
	<p align="left" style="margin-bottom: 0%;margin-left:90px;">
					<b>P_IVA<span style="color:red; "> *facoltativo </span>:</b>
				</p>
	<p><input class="test" type="text" id="p_iva" name="p_iva"  placeholder="*partita iva">
	<p id="prova5" style="color:red"></p>
      
	<p class="registrazione"><input style="color:#FFF587" class="btn-primary" type="submit" value="Registrati">
	</form>
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


</body>
</html>