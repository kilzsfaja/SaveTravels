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
<title>Save Travels</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h1>Save Travels</h1>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Name</th>
					<th>Vendor</th>
					<th>Amount</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="travel" items="${allTravels}">
					<tr>
						<td><a href="/travels/${travel.id}"><c:out
									value="${travel.name}" /></a></td>
						<td><c:out value="${travel.vendor}" /></td>
						<td>$<c:out value="${travel.amount}" /></td>
						<td class="d-flex gap-2"><a href="/travels/edit/${travel.id}" class="btn btn-warning">Edit</a>
						<form action="/travels/delete/${travel.id}" method="post">
								<input type="hidden" name="_method" value="delete" /> <input
									type="submit" value="Delete" class="btn btn-danger" />
							</form></td>
					</tr>
				</c:forEach>
			</tbody>	
		</table>
		<div class="border mt-5 p-3">
			<form:form action="/travels/create" method="post"
				modelAttribute="travel">
				<div class="form-group">
					<label for="name">Expense Name:</label>
					<form:input type="text" path="name" class="form-control" />
					<small class="form-text text-danger"><form:errors
							path="name" /></small>
				</div>
				<div class="form-group">
					<label for="vendor">Vendor Name:</label>
					<form:input type="text" path="vendor" class="form-control" />
					<small class="form-text text-danger"><form:errors
							path="vendor" /></small>
				</div>
				<div class="form-group">
					<label for="amount">Amount:</label>
					<form:input type="number" path="amount" step="0.01" min="0.01"
						class="form-control" />
					<small class="form-text text-danger"><form:errors
							path="amount" /></small>
				</div>
				<div class="form-group">
					<label for="description">Description:</label>
					<form:input type="text" path="description" class="form-control" />
					<small class="form-text text-danger"><form:errors
							path="description" /></small>
				</div>
				<input type="submit" value="Submit" class="mt-2 btn btn-success" />
			</form:form>
		</div>
	</div>
</body>
</html>