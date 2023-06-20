<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Travels</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-10">
				<h1 class="my-5">View Expense</h1>
			</div>
			<div class="col-2">
				<a href="/travels">Go back!</a>
			</div>
		</div>
		<div class="border mt-5 p-3">
		<h5>
		Expense Name:
		<c:out value="${travel.name}" />
		</h5>
		<h5>
		Vendor Name:
		<c:out value="${travel.vendor}" />
		</h5>
		<h5>
		Amount: $
		<c:out value="${travel.amount}" />
		</h5>
		<h5>
		Description:
		<c:out value="${travel.description}" />
		</h5>
		</div>
	</div>
</body>
</html>