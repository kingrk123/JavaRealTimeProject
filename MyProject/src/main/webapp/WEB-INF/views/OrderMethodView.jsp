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
					<H3>WELCOME TO ORDER VIEW PAGE</H3>
				</div>
				
				<div class="card-body">
					<a href="excel?omid=${ob.orderId}"><img src="../resources/images/excel.png" width="40" height="30"></a> 
					| <a href="pdf?omid=${ob.orderId}"><img src="../resources/images/pdf.png" width="40" height="30"></a>

					
					<form:form action="update" method="POST" modelAttribute="OrderMethod">
	 	 
						<div class="row">
							<div class="col-4">
								<label for="orderId">ORDER ID</label>
							</div>
							<div class="col-4">
								${ob.orderId}
							</div>
							<div class="col-4"></div>
						</div>		
							
						<div class="row">
							<div class="col-4">
								<label for="orderMode">ORDER MODE</label>
							</div>
							<div class="col-4">
								${ob.orderMode}
							</div>
							<div class="col-4"></div>
						</div>
						
						<div class="row">
							<div class="col-4">
								<label for="orderCode">ORDER CODE</label>
							</div>
	
							<div class="col-4">
								${ob.orderCode}
							</div>
	
							<div class="col-4"></div>
						</div>
						
						<div class="row">
							<div class="col-4">
								<label for="orderType">ORDER TYPE</label>
							</div>
	
							<div class="col-4">
								${ob.orderType}
							</div>
							<div class="col-4"></div>
						</div>
						
						<div class="row">
							<div class="col-4">
								<label for="orderAcpt">ORDER ACCEPT</label>
							</div>
	
							<div class="col-4">
								${ob.orderAcpt}
							</div>
	
							<div class="col-4"></div>
						</div>
						
						<div class="row">
							<div class="col-4">
								<label for="orderDesc">DESCRIPTION</label>
							</div>
	
							<div class="col-4">
								${ob.orderDesc}
							</div>
	
							<div class="col-4"></div>
						</div>
				
					</form:form>
				</div>
			</div>			
		</div>
</body>
</html>