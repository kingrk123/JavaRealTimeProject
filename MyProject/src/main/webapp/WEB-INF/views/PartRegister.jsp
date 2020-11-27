
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
            <H2>WELCOME TO PART REGISTER PAGE</H2>
        </div>
        <div class="card-body">
            <form:form action="save" method="post" modelAttribute="Part">

                <div class="row">
                    <div class="col-4">
                        <label for="partCode">PART CODE</label>
                    </div>
                    <div class="col-4">
                        <form:input path="partCode" />
                    </div>
                    <div class="col-4" id="partCodeError"></div>
                </div>

                <div class="row">
                    <div class="col-4">
                        <label for="partLen">PART LENGTH</label>
                    </div>
                    <div class="col-4">
                        <form:input path="partLen" />
                    </div>
                    <div class="col-4" id="partLenError"></div>
                </div>
                
                <div class="row">
                    <div class="col-4">
                        <label for="partWid">PART WIDTH</label>
                    </div>
                    <div class="col-4">
                        <form:input path="partWid" />
                    </div>
                    <div class="col-4" id="partWidError"></div>
                </div>
                
                <div class="row">
                    <div class="col-4">
                        <label for="partHgt">PART HEIGHT</label>
                    </div>
                    <div class="col-4">
                        <form:input path="partHgt" />
                    </div>
                    <div class="col-4" id="partHgtError"></div>
                </div>
                
                
                <div class="row">
                    <div class="col-4">
                        <label for="baseCost">BEST COST</label>
                    </div>
                    <div class="col-4">
                        <form:input path="baseCost" />
                    </div>
                    <div class="col-4" id="baseCostError"></div>
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
                    <div class="col-4" id="baseCurrencyError"></div>
                </div>

<%--                 <div class="row">
                    <div class="col-4">
                        <label for="uomOb.uomId">UOM</label>
                    </div>

                    <div class="col-4">
                        <form:select path="uomOb.uomId" class="form-control">
                            <form:option value="">--Select--</form:option>
                            <form:options items="${uomList}"
                                          itemValue="uomId"
                                          itemLabel="UomModel"/>
                                    <form:options items="${uomMap }"></form:options>	  
                        </form:select>
                    </div>

                    <div class="col-4" id="uomOb.uomIdError"></div>
                </div>
 --%>
                    <div class="row">
                    <div class="col-4">
                        <label for="note">DESCRIPTION</label>
                    </div>

                    <div class="col-4">
                        <form:textarea path="note" />
                    </div>

                    <div class="col-4" id="noteError"></div>
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
		$("#partCodeError").hide();
		$("#partLenError").hide();
		$("#partWidError").hide();
        $("#partHgtError").hide();
        $("#baseCostError").hide();
        $("#baseCurrencyError").hide();
       // $("#uomOb.uomIdError").hide();
        $("#noteError").hide();

		//2. Define flag for error section

		var partCodeError = false;
		var partLenError = false;
		var partWidError = false;
        var partHgtError = false;
        var baseCostError = false;
        var baseCurrencyError = false;
        //var uomOb.uomIdError = false;
        var noteError = false;

        

		//3. Link with action/event

		$("#partCode").keyup(function(){
		validate_partCode();
		});
		$("#partLen").keyup(function(){
		validate_partLen();
		});
        $("#partWid").keyup(function(){
		validate_partWid();
		});
        $("#partHgt").keyup(function(){
		validate_partHgt();
		});
        $("#baseCost").keyup(function(){
		validate_baseCost();
		});
        $("#note").keyup(function(){
		validate_note();
		});
		$("#baseCurrency").change(function(){
			validate_baseCurrency();
			});
           
			//4. define one validation function
			function validate_partCode(){
			var val=$("#partCode").val();
			if(val==''){
			$("#partCodeError").show();
			$("#partCodeError").html("Enter <b>ENTER PART CODE</b>")
			$("#partCodeError").css("color","red");
			partCodeError = false;
			}else{
			$("#partCodeError").hide();
			partCodeError = true;
			}
			return partCodeError;
			}

            function validate_partLen(){
			var val=$("#partLen").val();
			if(val==''){
			$("#partLenError").show();
			$("#partLenError").html("Enter <b>ENTER PART LENGTH</b>")
			$("#partLenError").css("color","red");
			partLenError = false;
			}else{
			$("#partLenError").hide();
			partLenError = true;
			}
			return partLenError;
			}

            function validate_partWid(){
			var val=$("#partWid").val();
			if(val==''){
			$("#partWidError").show();
			$("#partWidError").html("Enter <b>ENTER PART WIDTH</b>")
			$("#partWidError").css("color","red");
			partWidError = false;
			}else{
			$("#partWidError").hide();
			partWidError = true;
			}
			return partWidError;
			}

            function validate_partHgt(){
			var val=$("#partHgt").val();
			if(val==''){
			$("#partHgtError").show();
			$("#partHgtError").html("Enter <b>ENTER PART HEIGHT</b>")
			$("#partHgtError").css("color","red");
			partHgtError = false;
			}else{
			$("#partHgtError").hide();
			partHgtError = true;
			}
			return partHgtError;
			}

            function validate_baseCost(){
			var val=$("#baseCost").val();
			if(val==''){
			$("#baseCostError").show();
			$("#baseCostError").html("Enter <b>ENTER BASE COST</b>")
			$("#baseCostError").css("color","red");
			baseCostError = false;
			}else{
			$("#baseCostError").hide();
			baseCostError = true;
			}
			return baseCostError;
			}

            function validate_note(){
			var val=$("#note").val();
			if(val==''){
			$("#noteError").show();
			$("#noteError").html("Enter <b>ENTER DESCRIPTION</b>")
			$("#noteError").css("color","red");
			noteError = false;
			}else{
			$("#noteError").hide();
			noteError = true;
			}
			return noteError;
			}
            function validate_baseCurrency(){
				var val=$("#baseCurrency").val();
				if(val==''){
				$("#baseCurrencyError").show();
				$("#baseCurrencyError").html("Choose <b>ENTER BASE CURRENCY</b>");
				$("#baseCurrencyError").css("color","red");
				baseCurrencyError = false;
				}else{
				$("#baseCurrencyError").hide();
				baseCurrencyError = true;
				}
				return baseCurrencyError ;
				}
			
			// on click submit button
			$("#register").click(function(){
			//on click submit button
			//a. reset flags to false
            
	        partCodeError = false;
	        partLenError = false;
            partWidError = false;
            partHgtError = false;
            baseCostError = false;
            baseCurrencyError = false;
           // uomOb.uomIdError = false;
            noteError = false;


			//b. call all validate function
            validate_partCode();
		    validate_partLen();
		    validate_partWid();
		    validate_partHgt();
		    validate_baseCost();
		    validate_baseCurrency();
		    validate_note();
		
			//c. check if all are true then submit else dont
			if(partCodeError && partLenError && partWidError  && partHgtError && baseCostError && noteError && baseCurrencyError){
			return true;
			}
			else 
				return false;
			});
			});
	</script>

</body>
</html>

