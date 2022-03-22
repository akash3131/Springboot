<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isELIgnored="false" %>
    <%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.time.LocalDate"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page session="true" %>
    
 <%
Date today = new Date();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
String date = dateFormat.format(today);

LocalDate myDate = LocalDate.now();



%>   

<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if(session==null || session.getAttribute("user")==null){
		response.sendRedirect("index.jsp");
		return;
	}
	

	
%>
 
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
</head>
<body>
	<div class="container">
		<div class="row p-1 mb-2 mt-2  mr-auto ml-auto" style="background-color: #e0b7f4;">
			<div class="col-sm-12">
				<h1 class="text-left">Book Management</h1>
				<h4 class="text-right">Welcome ${user}<br><form action="logout"><button type="submit" class="btn btn">Logout</button></form> </h4>
			</div>
			
		</div>
		<div class="p-4" style="border: 1px solid black">
			<div class="row">
			<form action="addBookPage">
				<div class="col-sm-12 text-right">
					<button type="submit" class="btn btn">Add Book</button>
				</div>
				</form>
			</div>
			<div class="row mt-2">
				<!-- <div class="col-md-4 offset-3"> -->
				<table class="table table-hover table-striped table-bordered">
					<thead>
						<tr>
							<th scope="col">Book Code</th>
							<th scope="col">Book Name</th>
							<th scope="col">Author</th>
							<th scope="col">Date Added</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="e" items="${bookList}">
						<tr>
							<td>${e.id}</td>
							<td>${e.bookName}</td>
							<td>${e.bookAuthor}</td>
							<td><%=myDate%></td>

							<td><form action="addBookPage"style="display: inline">
								<button type="submit" class="btn btn-primary">Edit</button>
							</form> &nbsp;&nbsp;
							<form action="delete/${e.getId()}"  method="post" style="display: inline">
								<button type="submit" class="btn btn-primary">Delete</button>
							</form></td>
						
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<div class="modal fade" id="myModal" role="dialog">

		</div>
		

		
		<div class="row mt-2 mr-auto ml-auto" style="background-color: #e0b7f4;" >
			<div class="col-sm-12" >
				<h1 class="text-center" >--------</h1>
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