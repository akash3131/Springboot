<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<title>Login</title>
<style>
	fieldset {
    border: 1px solid #000;
}
#info-block section {
    border: 2px solid black;
}

.file-marker > div {
    padding: 0 3px;
    margin-top: -0.8em;
    
}
.box-title {
    background: white none repeat scroll 0 0;
    display: inline-block;
    padding: 0 2px;
    margin-left: 3em;
}
</style>
</head>
<body>

	<div class="container">
		
		<div class="row mt-5">
			
			<div class="col-md-6 offset-3">
				<div style="background-color: #e0b7f4;margin-bottom:-8px;" >
				<h1 class="text-center" >LOGIN</h1>
			</div>
			<aside id="info-block">
 				 <section class="file-marker mt-3">
 				 <div>
 				 <div class="box-title">
        Login
      </div>
				<form action="validate"class="p-2" >
					<!-- <h1 class="text-center">Login</h1> -->
					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label> <input
							type="email" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Enter email"
							name="email"
							> 
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="password" class="form-control" id="exampleInputPassword1"
							placeholder="Password"
							name="password"
							>
					</div>
						<div class="text-center">
							<button type="submit" class="btn btn-primary text-center">Submit</button>
						</div>
				</form>
				</div>
				  </section>
			</aside>
				<div class="" style="background-color: #e0b7f4;" >
				<h1 class="text-center" >All Rights Reserved</h1>
			</div>
			</div>
		</div>
		
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>