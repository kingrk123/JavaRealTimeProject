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
					<H3>WELCOME TO SHIPMENT TYPE EDIT PAGE</H3>
				</div>
				
				<div class="card-body">
					<form:form action="update" method="POST" modelAttribute="shipmentType">
	 	 
						<div class="row">
							<div class="col-4">
								<label for="shipId">SHIPMENT ID</label>
							</div>
							<div class="col-4">
								<form:input path="shipId" readonly="true" />
							</div>
							<div class="col-4"></div>
						</div>		
							
						<div class="row">
							<div class="col-4">
								<label for="shipMode">SHIPMENT MODE</label>
							</div>
							<div class="col-4">
								<form:select path="shipMode">
									<form:option value="">--Select--</form:option>
									<form:option value="Air">Air</form:option>
									<form:option value="Ship">Ship</form:option>
									<form:option value="Train">Train</form:option>
									<form:option value="Truck">Truck</form:option>
								</form:select>
							</div>
							<div class="col-4"></div>
						</div>
						
						<div class="row">
							<div class="col-4">
								<label for="shipCode">SHIPMENT CODE</label>
							</div>
	
							<div class="col-4">
								<form:input path="shipCode" />
							</div>
	
							<div class="col-4"></div>
						</div>
	
						<div class="row">
							<div class="col-4">
								<label for="enbShip">ENABLE SHIPMENT</label>
							</div>
	
							<div class="col-4">
								<form:select path="enbShip">
									<form:option value="">--Select--</form:option>
									<form:option value="Yes">Yes</form:option>
									<form:option value="No">No</form:option>
								</form:select>
							</div>
	
							<div class="col-4"></div>
						</div>
	
						<div class="row">
							<div class="col-4">
								<label for="shipGrade">SHIPMENT GRADE</label>
							</div>
	
							<div class="col-4">
								<form:radiobutton path="shipGrade" value="A" />
								A
								<form:radiobutton path="shipGrade" value="B" />
								B
								<form:radiobutton path="shipGrade" value="C" />
								C
							</div>
	
							<div class="col-4"></div>
						</div>
						<div class="row">
							<div class="col-4">
								<label for="shipDesc">DESCRIPTION</label>
							</div>
	
							<div class="col-4">
								<form:textarea path="shipDesc" />
							</div>
	
							<div class="col-4"></div>
						</div>
						<div class="row">
							<div class="col-4"></div>
							<div class="col-4">
								<input type="submit" value="Update" class="btn btn-success" /> 
							</div>
						</div>
					</form:form>
				</div>
			</div>			
		</div>
	</body>
	</html>