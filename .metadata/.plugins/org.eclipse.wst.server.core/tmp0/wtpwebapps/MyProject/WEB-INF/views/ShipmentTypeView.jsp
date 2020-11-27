<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View</title>
</head>
<body>
	<%@include file="UserMenu.jsp"%>
		<div class="container">
			<div class="card">
				<div class="card-header bg-primary text-white text-center">
	
					<H3>WELCOME TO SHIPMENT TYPE VIEW PAGE</H3>
				</div>
				
				<div class="card-body">
					<a href="excel?id=${ob.shipId }"><img src="../resources/images/excel.png" width="40" height="30"></a> 
					| <a href="pdf?id=${ob.shipId }"><img src="../resources/images/pdf.png" width="40" height="30"></a>
					
						<div class="row">
							<div class="col-4">
								<label for="shipId">SHIPMENT ID</label>
							</div>
							<div class="col-4">
								${ob.shipId}
							</div>
							<div class="col-4"></div>
						</div>
						
						<div class="row">
							<div class="col-4">
								<label for="shipMode">SHIPMENT MODE</label>
							</div>
							<div class="col-4">
								${ob.shipMode}
							</div>
							<div class="col-4"></div>
						</div>
						
						<div class="row">
							<div class="col-4">
								<label for="shipCode">SHIPMENT CODE</label>
							</div>
	
							<div class="col-4">
								${ob.shipCode}
							</div>
	
							<div class="col-4"></div>
						</div>
	
						<div class="row">
							<div class="col-4">
								<label for="enbShip">ENABLE SHIPMENT</label>
							</div>
	
							<div class="col-4">
								${ob.enbShip}
							</div>
	
							<div class="col-4"></div>
						</div>
	
						<div class="row">
							<div class="col-4">
								<label for="shipGrade">SHIPMENT GRADE</label>
							</div>
	
							<div class="col-4">
								${ob.shipGrade}
							</div>
	
							<div class="col-4"></div>
						</div>
						<div class="row">
							<div class="col-4">
								<label for="shipDesc">DESCRIPTION</label>
							</div>
	
							<div class="col-4">
								${ob.shipDesc}
							</div>
	
							<div class="col-4"></div>
						</div>
		
				</div>
			</div>
		</div>
</body>
</html>