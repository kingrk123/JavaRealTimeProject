
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
            <H2>WELCOME TO SHIPMENT TYPE REGISTER PAGE</H2>
        </div>
        <div class="card-body">
            <form:form action="save" method="post" modelAttribute="shipmentType">

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
                    <div class="col-4" id="shipModeError" ></div>
                </div>


                <div class="row">
                    <div class="col-4">
                        <label for="shipCode">SHIPMENT CODE</label>
                    </div>

                    <div class="col-4">
                        <form:input path="shipCode" />
                    </div>

                    <div class="col-2" id="shipCodeError"></div>
                    <div class="col-2">
                    <form:errors path ="shipCode" cssClass="text-danger"/>
                    </div>
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

                    <div class="col-4" id="enbShipError"></div>
                </div>

                <div class="row">
                    <div class="col-4">
                        <label for="shipGrade">SHIPMENT GRADE</label>
                    </div>

                    <div class="col-4">
                        <form:radiobutton path="shipGrade" id="shipGrade1"  value="A" />
                        A
                        <form:radiobutton path="shipGrade" id="shipGrade2" value="B" />
                        B
                        <form:radiobutton path="shipGrade" id="shipGrade3" value="C" />
                        C
                    </div>

                    <div class="col-4" id="shipGradeError"></div>
                </div>
                <div class="row">
                    <div class="col-4">
                        <label for="shipDesc">DESCRIPTION</label>
                    </div>

                    <div class="col-4">
                        <form:textarea path="shipDesc" />
                    </div>

                    <div class="col-4" id="shipDescError"></div>
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

		$("#shipModeError").hide();
		$("#shipCodeError").hide();
		$("#enbShipError").hide();
        $("#shipGradeError").hide();
        $("#shipDescError").hide();

		//2. Define flag for error section

		var shipModeError = false;
		var shipCodeError = false;
		var enbShipError = false;
        var shipGradeError = false;
        var shipDescError = false;

		//3. Link with action/event

		$("#shipCode").keyup(function(){
		validate_shipCode();
        
		});
		$("#shipDesc").keyup(function(){
		validate_shipDesc();
		});
		$("#shipMode").change(function(){
			validate_shipMode();
			});
        $("#enbShip").change(function(){
			validate_enbShip();
			});   
        $('input[type="radio"][name="shipGrade"]').change(function(){
			validate_shipGrade();
			});  
			//4. define one validation function
			function validate_shipCode(){
			var val=$("#shipCode").val();
			if(val==''){
			$("#shipCodeError").show();
			$("#shipCodeError").html("Enter <b>SHIPMENT CODE</b>")
			$("#shipCodeError").css("color","red");
			shipCodeError = false;
			}else{
			$("#shipCodeError").hide();
			shipCodeError = true;
			}
			return shipCodeError;
			}

			function validate_shipDesc(){
				var val=$("#shipDesc").val();
				if(val==''){
				$("#shipDescError").show();
				$("#shipDescError").html("Enter <b>SHIPMENT DESCRIPTION</b>");
				$("#shipDescError").css("color","red");
				shipDescError = false;
				}else{
				$("#shipDescError").hide();
				shipDescError = true;
				}
				return shipDescError;
				}
			function validate_shipMode(){
				var val=$("#shipMode").val();
				if(val==''){
				$("#shipModeError").show();
				$("#shipModeError").html("Choose <b>SHIPMENT MODE</b>");
				$("#shipModeError").css("color","red");
				shipModeError = false;
				}else{
				$("#shipModeError").hide();
				shipModeError = true;
				}
				return shipModeError ;
				}


            function validate_enbShip(){
				var val=$("#enbShip").val();
				if(val==''){
				$("#enbShipError").show();
				$("#enbShipError").html("Choose <b>Enable SHIPMENT</b>");
				$("#enbShipError").css("color","red");
				enbShipError = false;
				}else{
				$("#enbShipError").hide();
				enbShipError = true;
				}
				return enbShipError ;
				}    


            function validate_shipGrade(){
				var val= $('input[type="radio"][name="shipGrade"]:checked').length;
				if(val==0){
				$("#shipGradeError").show();
				$("#shipGradeError").html("Choose <b>CHOOSE SHIPMENT GRADE</b>");
				$("#shipGradeError").css("color","red");
				shipGradeError = false;
				}else{
				$("#shipGradeError").hide();
				shipGradeError = true;
				}
				return shipGradeError ;
				}    

            
			// on click submit button
			$("#register").click(function(){
			//on click submit button
			//a. reset flags to false
             shipModeError = false;
		     shipCodeError = false;
		     enbShipError = false;
             shipGradeError = false;
             shipDescError = false;

			//b. call all validate function
			validate_shipCode();
            validate_shipDesc();
            validate_shipMode();
            validate_enbShip();
            validate_shipGrade();
			//c. check if all are true then submit else dont
			if(shipModeError && enbShipError && shipCodeError && shipDescError && shipGradeError ){
			return true;
			}
			else 
				return false;
			});
			});
	</script>
</body>
</html>

