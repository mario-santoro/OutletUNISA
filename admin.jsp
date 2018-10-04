<%@page import="java.util.ArrayList"%>
<%@page import="model.Utente"%>
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
.boh{

 background-color: white;
 margin-left: 18%;
margin-right: 18%;
margin-bottom: 2%;
border: 2px solid #526E9B;
border-radius:10px;
padding: 30px 10px 30px 10px;

 }
td{
padding: 10px 20px 10px 0px;
border-bottom: 2px solid #ccc;
opacity:20%;

}
</style>
</head>

<body>
<%ArrayList<Utente> u=(ArrayList<Utente>)request.getAttribute("utenti"); %>
<nav class="navbar navbar-inverse">

		<div  align="center">
		
			
		
				<a href=""><img src="img/Untitled-3.png" height="80" width="120" ></a>
			
			 
			 <p ><h1 style="color: #FFF587;">Pannello Admin</h1>
			   <a href="Logout"><span style="align:right;"
							class="glyphicon glyphicon-log-out"></span> Logout</a>
			 </div>


	</nav>
	<div class="boh"  align="center">
<table id="demo">
<tr><th>Email</th><th>Nome</th><th>Cognome</th><th>P_IVA</th></tr>
  <%for(int i =0; i<u.size(); i++) {%> 
   <tr><td>
   <%=u.get(i).getEmail()%>
    </td><td>
    <%=u.get(i).getNome()%></td><td>
   <%=u.get(i).getCognome()%>
    </td><td>  <%=u.get(i).getP_iva()%></td>
    <td> <a href="CancellaUtente?email=<%=u.get(i).getEmail()%>&p_iva=<%=u.get(i).getP_iva()%>">
          <span class="glyphicon glyphicon-remove"></span>
        </a></td><tr>
<%} %>
</table>
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