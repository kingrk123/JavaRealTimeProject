	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	    pageEncoding="ISO-8859-1" isELIgnored="false"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Data</title>
	</head>
	<body>
		<%@include file="UserMenu.jsp"%>
		<div class="container">
	
			<div class="card">
				<div class="card-header bg-primary text-white text-center">
	
					<H3>WELCOME TO ORDER PAGE</H3>
				</div>
				<div class="card-body">
					<a href="excel"><img src="../resources/images/excel.png"
						width="40" height="30"></a> | <a href="pdf"><img
						src="../resources/images/pdf.png" width="40" height="30"></a>
					
					<c:choose>
						<c:when test="${!empty list }">
							<table class="table table-hover">
							<tr class="bg-success text-white">
								<th>ID</th>
								<th>MODE</th>
								<th>CODE</th>
								<th>TYPE</th>
								<th>ORDER-ACCEPT</th>
								<th>NOTE</th>
								<tH colspan="3" align="center">OPERATIONS</th>
							</tr>
						
							<c:forEach items="${list}" var="ob">
							<tr>
								<td>${ob.orderId}</td>
								<td>${ob.orderMode}</td>
								<td>${ob.orderCode}</td>
								<td>${ob.orderType}</td>
								<td>${ob.orderAcpt}</td>
								<td>${ob.orderDesc}</td>
								<td><a href="delete?omid=${ob.orderId}"
										class="btn btn-danger"> <!-- <img src="../resources/images/delete.png" width="20" height="20" /> -->
											DELETE
									</a>
								</td>

								<td><a href="edit?omid=${ob.orderId}" 
										class="btn btn-info"><!-- <img	src="../resources/images/edit.png" width="20" height="20" /> -->
										EDIT
									</a>
								</td>

								<td><a href="view?omid=${ob.orderId}"
										class="btn btn-warning"> <!-- <img src="../resources/images/view.png" width="20" height="20" /> -->
										VIEW
									</a>
								</td>
							</tr>
					</c:forEach>
						</table>
					</c:when>
					<c:otherwise>
						<H4>NO DATA FOUND!!</H4>
					</c:otherwise>
				</c:choose>
			</div>

			<c:if test="${!empty message }">
				<c:choose>
					<c:when test="${opr eq 'DEL'}">
						<div class="card-footer bg-danger text-white text-center">
							<b>${message }</b>
						</div>
					</c:when>
					<c:otherwise>
						<div class="card-footer bg-info text-white text-center">
							<b>${message }</b>
						</div>
					</c:otherwise>
				</c:choose>
			</c:if>
				</div>
			</div>
					
	</body>
	</html>