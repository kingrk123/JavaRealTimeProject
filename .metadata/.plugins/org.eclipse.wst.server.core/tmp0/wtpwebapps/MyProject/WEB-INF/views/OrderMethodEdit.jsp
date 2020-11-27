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
					<H3>WELCOME TO ORDER EDIT PAGE</H3>
				</div>
				
				<div class="card-body">
					<form:form action="update" method="POST" modelAttribute="OrderMethod">
	 	 
						<div class="row">
							<div class="col-4">
								<label for="orderId">ORDER ID</label>
							</div>
							<div class="col-4">
								<form:input path="orderId" readonly="true" />
							</div>
							<div class="col-4"></div>
						</div>		
							
						<div class="row">
							<div class="col-4">
								<label for="orderMode">ORDER MODE</label>
							</div>
							<div class="col-4">
								<form:radiobutton path="orderMode" value="Sale"/>Sale
								<form:radiobutton path="orderMode" value="Purchase"/>Purchase
							</div>
							<div class="col-4"></div>
						</div>
						
						<div class="row">
							<div class="col-4">
								<label for="orderCode">ORDER CODE</label>
							</div>
	
							<div class="col-4">
								<form:input path="orderCode"/>
							</div>
	
							<div class="col-4"></div>
						</div>
						
						<div class="row">
							<div class="col-4">
								<label for="orderType">ORDER TYPE</label>
							</div>
	
							<div class="col-4">
								<form:select path="orderType">
									<form:option value="">--Select--</form:option>
									<form:option value="FIFO">FIFO</form:option>
									<form:option value="LIFO">LIFO</form:option>
									<form:option value="FCFO">FCFO</form:option>
									<form:option value="FEFO">FEFO</form:option>
								</form:select>
							</div>
	
							<div class="col-4"></div>
						</div>
						
						<div class="row">
							<div class="col-4">
								<label for="orderAcpt">ORDER ACCEPT</label>
							</div>
	
							<div class="col-4">
								<form:checkbox path="orderAcpt" value="Multi-Model"/>Multi-Model
								<form:checkbox path="orderAcpt" value="Accept Return"/>Accept Return
							</div>
	
							<div class="col-4"></div>
						</div>
						
						<div class="row">
							<div class="col-4">
								<label for="orderDesc">DESCRIPTION</label>
							</div>
	
							<div class="col-4">
								<form:textarea path="orderDesc"/>
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