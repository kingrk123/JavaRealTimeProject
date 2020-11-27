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
					<H3>WELCOME TO UOM EDIT PAGE</H3>
				</div>
				
				<div class="card-body">
					<form:form action="update" method="POST" modelAttribute="Uom">
	 	 
						<div class="row">
							<div class="col-4">
								<label for="uomId">UOM ID</label>
							</div>
							<div class="col-4">
								<form:input path="uomId" readOnly="true"></form:input>
							</div>
							<div class="col-4"></div>
						</div>		
							
						<div class="row">
							<div class="col-4">
								<label for="uomType">UOM TYPE</label>
							</div>
							<div class="col-4">
								<form:select path="uomType" >
									<form:option value="">--Select--</form:option>
									<form:option value="Packaging">Packaging</form:option>
									<form:option value="No Packaging">No Packaging</form:option>
									<form:option value="Train">--NA--</form:option>
								</form:select>
							</div>
							<div class="col-4"></div>
						</div>
						
						<div class="row">
							<div class="col-4">
								<label for="uomModel">UOM MODEL</label>
							</div>
	
							<div class="col-4">
								<form:input path="uomModel"/>
							</div>
	
							<div class="col-4"></div>
						</div>
	
						<div class="row">
							<div class="col-4">
								<label for="uomDesc">DESCRIPTION</label>
							</div>
	
							<div class="col-4">
								<form:textarea path="uomDesc"/>
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