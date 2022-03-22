<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.time.LocalDate"%>
<%@page isELIgnored="false"%>

<%
Date today = new Date();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
String date = dateFormat.format(today);

LocalDate myObj = LocalDate.now();



%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Hind+Siliguri:wght@600&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/css/add-book-style.css" />
<title>Library Management</title>
</head>

<body>
	<nav class="navbar navbar-light">
		<div class="container-fluid">
			<span class="navbar-text"> Library Management</span> <span
				id="user-show"> &#128400; ${currentuser}</span>
			<form class="d-flex" action="/logout">
				<button class="logout-btn btn btn-primary" type="submit">
					logout</button>
			</form>
		</div>
	</nav>
	<div class="container-fluid edit-book-div" style="text-align: center">
		<span class="edit-book-heading"> Add Book Details </span>
	</div>

	<div class="container author-form">
		<form action="addbook" method="post">
			<div class="mb-3 row">
				<label class="col-sm-2 col-form-label">Book Code</label>
				<div class="col-sm-10">
					<input type="text" class="form-control input-field" name="bookCode" required>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="inputPassword" class="col-sm-2 col-form-label">Book
					Name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control input-field" name="bookName" required>
				</div>
			</div>

			<div class="mb-3 row">
				<label class="col-sm-2 col-form-label">Author</label> 
				<select
					class="form-select input-field form-select-btn"
					aria-label="Default select example" name="bookAuthor">
					<option selected>Author</option>
					<option>Robert Cecil</option>
					<option>Andy Huint</option>
					<option>Rhondya Byrne</option>
					<option>William Shakesphere</option>
					<option>Priyanand Shukla</option>
					<option>Noah Harari</option>
					<option>Brian Tracy</option>
					<option>HC Verma</option>
					<option>Rakesh Sherma</option>
				</select>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 col-form-label">Added On</label>
				<div class="col-sm-10">
					<input type="text" readonly
						class="form-control-plaintext input-field" value="<%=myObj%>"
						name="dateTime">
				</div>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
			<button type="reset" class="btn btn-primary">Cancel</button>
		</form><br>
		<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong>${bookCodeError}</strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
	</div>
	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>

</html>