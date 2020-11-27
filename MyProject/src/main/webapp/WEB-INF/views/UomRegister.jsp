<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
</head>
<body>
	<%@include file="UserMenu.jsp"%>
	<div class="container">

		<div class="card">

			<div
				class="card-header bg-primary text-center text-white text-uppercase">
				<H2>WELCOME TO UOM REGISTER PAGE</H2>
			</div>
			<div class="card-body">
				<form:form action="save" method="post" modelAttribute="uom">

					<div class="row">
						<div class="col-4">
							<label for="uomType">UOM TYPE</label>
						</div>
						<div class="col-4">
							<form:select path="uomType" class="form-control">
								<form:option value="">--Select--</form:option>
								<form:option value="Packaging">Packaging</form:option>
								<form:option value="No Packaging">No Packaging</form:option>
								<form:option value="Train">--NA--</form:option>
							</form:select>

						</div>
						<div class="col-4"
						 id="uomTypeError">
						</div>
					</div>

					<div class="row">
						<div class="col-4">
							<label for="uomModel">Uom Model</label>
						</div>

						<div class="col-4">
							<form:input path="uomModel" class="form-control"/>
						</div>

						<div class="col-2" id="uomModelError"></div>
						<div class="col-2">
						<form:errors path ="uomModel" cssClass="text-danger"/>
						</div>
					</div>

					<div class="row">
						<div class="col-4">
							<label for="uomDesc">DESCRIPTION</label>
						</div>

						<div class="col-4">
							<form:textarea path="uomDesc" class="form-control"/>
						</div>

						<div class="col-4" id="noteError">
						</div>
					</div>
					<div class="row">
						<div class="col-4"></div>
						<div class="col-4">
							<input type="submit" value="Create" id="register"  class="btn-success" /> <input
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
	
	<script>
	$(document).ready(function(){
		//1. Hide Error section
		$("#uomModelError").hide();
		$("#noteError").hide();
		$("#uomTypeError").hide();
		//2. Define flag for error section
		var uomModelError = false;
		var noteError = false;
		var uomTypeError = false;
		//3. Link with action/event
		$("#uomModel").keyup(function(){
		validate_uomModel();
		});

		$("#uomModel").blur(function(){
			validate_uomModel_ajax();
		});
		
		$("#uomDesc").keyup(function(){
		validate_note();
		});
		$("#uomType").change(function(){
			validate_uomType();
			});
			//4. define one validation function
			function validate_uomModel(){
			var val=$("#uomModel").val();
			if(val==''){
			$("#uomModelError").show();
			$("#uomModelError").html("Enter <b>UOM MODEL</b>")
			$("#uomModelError").css("color","red");
			uomModelError = false;
			}else{
			$("#uomModelError").hide();
			uomModelError = true;
			}
			return uomModelError;
			}
			function validate_note(){
				var val=$("#uomDesc").val();
				if(val==''){
				$("#noteError").show();
				$("#noteError").html("Enter <b>UOM DESCRIPTION</b>");
				$("#noteError").css("color","red");
				noteError = false;
				}else{
				$("#noteError").hide();
				noteError = true;
				}
				return noteError;
				}
			function validate_uomType(){
				var val=$("#uomType").val();
				if(val==''){
				$("#uomTypeError").show();
				$("#uomTypeError").html("Choose <b>UOM TYPE</b>");
				$("#uomTypeError").css("color","red");
				uomTypeError = false;
				}else{
				$("#uomTypeError").hide();
				uomTypeError = true;
				}
				return uomTypeError ;
				}
			// on click submit button
			$("#register").click(function(){
			//on click submit button
			//a. reset flags to false
			uomModelError = false;
			noteError = false;
			uomTypeError = false;
			//b. call all validate function
			validate_uomModel();
			validate_note();
			validate_uomType();
			//c. check if all are true then submit else dont
			if(uomModelError && noteError && uomTypeError){
			return true;
			}
			else 
				return false;
			});
			});



	/* AJAX CALL */
	 function validate_uomModel_ajax(){
	     var val = $("#uomModel").val();

	     $.ajax({
	     	url : 'modelExist',
	     	data: { "model": $("#uomModel").val()},
	     	success:function(resTxt){
	          if(resTxt!=''){
	          	 $("#uomModelError").show();
	     	         $("#uomModelError").html(resTxt);
	     	         $("#uomModelError").css("color","red");
	     	        // $("#uomModel").val("");
	     	         $("#uomModel").focus();//place cursor back
	          }else{
	          	$("#uomModelError").hide();
	          	$("#uomModelError").html("");
	          }
	     	}	
	     });
	 }
	</script>
</body>
</html>