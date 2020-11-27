	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	    pageEncoding="ISO-8859-1" isELIgnored="false"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
	
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Edit</title>
	</head>
	<body>
		<%@include file="UserMenu.jsp"%>
		<div class="container">
	
			<div class="card">
				<div class="card-header bg-primary text-white text-center">
					<H3>WELCOME TO PART EDIT PAGE</H3>
				</div>
				
				<div class="card-body">
					<form:form action="update" method="POST" modelAttribute="Part">

					<div class="row">
						<div class="col-4">
							<label for="id">PART ID</label>
						</div>
						<div class="col-4">
							<form:input path="id" />
						</div>
						<div class="col-4"></div>
					</div>

					
					<div class="row">
						<div class="col-4">
							<label for="partCode">PART CODE</label>
						</div>
						<div class="col-4">
							<form:input path="partCode" />
						</div>
						<div class="col-4"></div>
					</div>

					<div class="row">
						<div class="col-4">
							<label for="partLen">PART LENGTH</label>
						</div>
						<div class="col-4">
							<form:input path="partLen" />
						</div>
						<div class="col-4"></div>
					</div>
					
					<div class="row">
						<div class="col-4">
							<label for="partWid">PART WIDTH</label>
						</div>
						<div class="col-4">
							<form:input path="partWid" />
						</div>
						<div class="col-4"></div>
					</div>
					
					<div class="row">
						<div class="col-4">
							<label for="partHgt">PART HEIGHT</label>
						</div>
						<div class="col-4">
							<form:input path="partHgt" />
						</div>
						<div class="col-4"></div>
					</div>
					
					
					<div class="row">
						<div class="col-4">
							<label for="baseCost">BEST COST</label>
						</div>
						<div class="col-4">
							<form:input path="baseCost" />
						</div>
						<div class="col-4"></div>
					</div>
					
					


					<div class="row">
						<div class="col-4">
							<label for="baseCurrency">Base Currency</label>
						</div>

						<div class="col-4">
							<form:select path="baseCurrency">
								<form:option value="">-Select-</form:option>
								<form:option value="INR">INR</form:option>
								<form:option value="USD">USD</form:option>
								<form:option value="AUS">AUS</form:option>
								<form:option value="ERU">ERU</form:option>
							</form:select>
						</div>
						<div class="col-4"></div>
					</div>

					<div class="row">
						<div class="col-4">
							<label for="uomOb.uomId">UOM</label>
						</div>

						<div class="col-4">
							<form:select path="uomOb.uomId" class="form-control">
								<form:option value="">--Select--</form:option>
								<%-- <form:options items="${uomList}"
											  itemValue="uomId"
											  itemLabel="UomModel"/> --%>
										<form:options items="${uomMap }"></form:options>	  
							</form:select>
						</div>

						<div class="col-4"></div>
					</div>

						<div class="row">
						<div class="col-4">
							<label for="note">DESCRIPTION</label>
						</div>

						<div class="col-4">
							<form:textarea path="note" />
						</div>

						<div class="col-4"></div>
					</div>
					<div class="row">
						<div class="col-4"></div>
						<div class="col-4">
							<input type="submit" value="Create" class="btn btn-success" /> <input
								type="reset" value="Clear" class="btn btn-danger" />
						</div>
					</div>
				</form:form>
			</div>
			<c:if test="${!empty message }">
				<div class="card-footer bg-info text-white text-center">
					<b>${message}</b>
				</div>
			</c:if>
		</div>
		<!-- card end -->
	</div>
	<!-- container end -->
	 	 
						
	</body>
	</html>