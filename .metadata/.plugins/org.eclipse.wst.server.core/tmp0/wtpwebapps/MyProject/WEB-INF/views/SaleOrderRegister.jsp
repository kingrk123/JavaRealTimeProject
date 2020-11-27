<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
            <H2>WELCOME TO SALE REGISTER PAGE</H2>
        </div>
        <div class="card-body">
            <form:form action="save" method="POST" modelAttribute="SaleOrder">
                <div class="row">
                    <div class="col-4">
                        <label for="ordCode">ORDER CODE</label>
                    </div>
                    <div class="col-4">
                    	<form:input path="ordCode"/>
                    </div>
                    <div class="col-4" id="ordCodeError" ></div>
                </div>


               <%--  <div class="row">
                    <div class="col-4">
                        <label for="ordCode">SHIPMENT CODE</label>
                    </div>

                    <div class="col-4">
                        <form:input path="ordCode" />
                    </div>

                    <div class="col-4" id="ordCodeError"></div>
                </div>
 --%>
                <div class="row">
                    <div class="col-4">
                        <label for="customer">CUSTOMER</label>
                    </div>

                    <div class="col-4">
                        <form:input path="customer" />
                    </div>

                    <div class="col-4" id="customerError"></div>
                </div>
                
                <div class="row">
                    <div class="col-4">
                        <label for="refNum">REF NO.</label>
                    </div>

                    <div class="col-4">
                        <form:input path="refNum" />
                    </div>

                    <div class="col-4" id="refNumError"></div>
                </div>


                <div class="row">
                    <div class="col-4">
                        <label for="stMode">STOCK MODE</label>
                    </div>

                    <div class="col-4">
                        <form:radiobutton path="stMode" id="stMode1"  value="Grade" />
                        Grade
                        <form:radiobutton path="stMode" id="stMode2" value="Margin" />
                        Margin
                    </div>

                    <div class="col-4" id="stModeError"></div>
                </div>
                
                <div class="row">
                    <div class="col-4">
                        <label for="stSource">STOCK SOURCE</label>
                    </div>

                    <div class="col-4">
                        <form:select path="stSource">
                            <form:option value="">--Select--</form:option>
                            <form:option value="Open">Open</form:option>
                            <form:option value="Avail">Avail</form:option>
                            <form:option value="Refund">Refund</form:option>
                        </form:select>
                    </div>

                    <div class="col-4" id="stSourceError"></div>
                </div>
                
                
                
                <div class="row">
                    <div class="col-4">
                        <label for="saleDesc">DESCRIPTION</label>
                    </div>

                    <div class="col-4">
                        <form:textarea path="saleDesc" />
                    </div>

                    <div class="col-4" id="saleDescError"></div>
                </div>
                <div class="row">
                    <div class="col-4"></div>
                    <div class="col-4">
                        <input type="submit" value="Create" class="btn btn-success" id="register" /> <input
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
		$("#ordCodeError").hide();
		$("#customerError").hide();
		$("#refNumError").hide();
        $("#stModeError").hide();
        $("#stSourceError").hide();
        $("#saleDescError").hide();

		//2. Define flag for error section

		var ordCodeError = false;
		var customerError = false;
		var refNumError = false;
        var stModeError = false;
        var stSourceError = false;
        var saleDescError = false;

		//3. Link with action/event

		$("#ordCode").keyup(function(){
		validate_ordCode();
        
		});
		$("#customer").keyup(function(){
		validate_customer();
		});
		
		$("#refNum").keyup(function(){
			validate_refNum();
		});

		$("#saleDesc").keyup(function(){
			validate_saleDesc();
		});
		
        $("#stSource").change(function(){
			validate_stSource();
			});   
        $('input[type="radio"][name="stMode"]').change(function(){
			validate_stMode();
			});  

        //4. define one validation function
       
			function validate_ordCode(){
			var val=$("#ordCode").val();
			if(val==''){
			$("#ordCodeError").show();
			$("#ordCodeError").html("Enter <b>ORDER CODE</b>")
			$("#ordCodeError").css("color","red");
			ordCodeError = false;
			}else{
			$("#ordCodeError").hide();
			ordCodeError = true;
			}
			return ordCodeError;
			}

			function validate_customer(){
				var val=$("#customer").val();
				if(val==''){
				$("#customerError").show();
				$("#customerError").html("Enter <b>Customer</b>")
				$("#customerError").css("color","red");
				customerError = false;
				}else{
				$("#customerError").hide();
				customerError = true;
				}
				return customerError;
				}

			function validate_refNum(){
				var val=$("#refNum").val();
				if(val==''){
				$("#refNumError").show();
				$("#refNumError").html("Enter <b>Enter REF NUMBER</b>")
				$("#refNumError").css("color","red");
				refNumError = false;
				}else{
				$("#refNumError").hide();
				refNumError = true;
				}
				return refNumError;
				}
			
			
			function validate_saleDesc(){
				var val=$("#saleDesc").val();
				if(val==''){
				$("#saleDescError").show();
				$("#saleDescError").html("Enter <b>SALE DESCRIPTION</b>");
				$("#saleDescError").css("color","red");
				saleDescError = false;
				}else{
				$("#saleDescError").hide();
				saleDescError = true;
				}
				return saleDescError;
				}
						
			function validate_stSource(){
				var val=$("#stSource").val();
				if(val==''){
				$("#stSourceError").show();
				$("#stSourceError").html("Choose <b>SHIPMENT MODE</b>");
				$("#stSourceError").css("color","red");
				stSourceError = false;
				}else{
				$("#stSourceError").hide();
				stSourceError = true;
				}
				return stSourceError ;
				}

			
            function validate_stMode(){
				var val=$("#stMode").val();
				if(val==''){
				$("#stModeError").show();
				$("#stModeError").html("Choose <b>Choose MODE</b>");
				$("#stModeError").css("color","red");
				stModeError = false;
				}else{
				$("#stModeError").hide();
				stModeError = true;
				}
				return stModeError ;
				}    


            function validate_stMode(){
				var val= $('input[type="radio"][name="stMode"]:checked').length;
				if(val==0){
				$("#stModeError").show();
				$("#stModeError").html("Choose <b>CHOOSE SHIPMENT GRADE</b>");
				$("#stModeError").css("color","red");
				stModeError = false;
				}else{
				$("#stModeError").hide();
				stModeError = true;
				}
				return stModeError ;
				}    

            
			// on click submit button
			$("#register").click(function(){
			//on click submit button
			//a. reset flags to false
             stSourceError = false;
		     ordCodeError = false;
		     refNumError = false;
             stModeError = false;
             saleDescError = false;

			//b. call all validate function
			validate_ordCode();
            validate_saleDesc();
            validate_stSource();
            validate_stMode();
            validate_refNum();
            validate_customer();
			//c. check if all are true then submit else dont     
			if(ordCodeError && stSourceError && refNumError && saleDescError && stModeError && customerError){
			return true;
			}
			else 
				return false;
			});
			});
	</script>
</body>
</html>

