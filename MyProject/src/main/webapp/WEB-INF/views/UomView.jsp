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
				<a href="excel?uomid=${ob.uomId}"><img src="../resources/images/excel.png"
					width="40" height="30"></a> 
					| <a href="pdf?uomid=${ob.uomId}""><img src="../resources/images/pdf.png" width="40" height="30"></a>
				
						<div class="row">
							<div class="col-4">
								<label for="uomId">UOM ID</label>
							</div>
							<div class="col-4">
								${ob.uomId}
							</div>
							<div class="col-4"></div>
						</div>		
							
						<div class="row">
							<div class="col-4">
								<label for="uomType">UOM TYPE</label>
							</div>
							<div class="col-4">
								${ob.uomType}
							</div>
							<div class="col-4"></div>
						</div>
						
						<div class="row">
							<div class="col-4">
								<label for="uomModel">UOM MODEL</label>
							</div>
	
							<div class="col-4">
								${ob.uomModel}
							</div>
	
							<div class="col-4"></div>
						</div>
	
						<div class="row">
							<div class="col-4">
								<label for="uomDesc">DESCRIPTION</label>
							</div>
	
							<div class="col-4">
								${ob.uomDesc}
							</div>
	
							<div class="col-4"></div>
						</div>
				</div>
			</div>			
		</div>
</body>
</html>