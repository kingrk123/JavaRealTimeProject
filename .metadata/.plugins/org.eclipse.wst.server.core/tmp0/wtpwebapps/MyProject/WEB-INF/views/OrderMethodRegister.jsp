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
				<H2>WELCOME TO ORDER REGISTER PAGE</H2>
			</div>
			<div class="card-body">
				<form:form action="save" method="post" modelAttribute="orderMethod">					<div class="row">
						<div class="col-4">
							<label for="orderMode">ORDER MODE</label>
						</div>
						<div class="col-4">
							<form:radiobutton path="orderMode" id="orderMode1" value="Sale"/>Sale
							<form:radiobutton path="orderMode" id="orderMode2" value="Purchase"/>Purchase
						</div>
						<div class="col-4" id="orderModeError"></div>
					</div>
					<div class="row">
						<div class="col-4">
							<label for="orderCode">ORDER CODE</label>
						</div>

						<div class="col-4">
							<form:input path="orderCode"/>
						</div>

						<div class="col-4" id="orderCodeError"></div>
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

						<div class="col-4" id="orderTypeError"></div>
					</div>

					<div class="row">
						<div class="col-4">
							<label for="orderAcpt">ORDER ACCEPT</label>
						</div>

						<div class="col-4">
							<form:checkbox path="orderAcpt" value="Multi-Model"/>Multi-Model
							<form:checkbox path="orderAcpt" value="Accept Return"/>Accept Return
						</div>

						<div class="col-4" id="orderAcptError"></div>
					</div>
					<div class="row">
						<div class="col-4">
							<label for="orderDesc">DESCRIPTION</label>
						</div>

						<div class="col-4">
							<form:textarea path="orderDesc"/>
						</div>

						<div class="col-4" id="orderDescError"></div>
					</div>
					<div class="row">
						<div class="col-4"></div>
						<div class="col-4">
							<input type="submit" value="Create" class="btn btn-success" id="register"/> <input
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
        
          //-- hide error section when Page is loaded---
          $("#orderModeError").hide();
          $("#orderCodeError").hide();
          $("#orderTypeError").hide();
          $("#orderAcptError").hide();
          $("#orderDescError").hide();
        
        
         // ---error falgs--
          var orderModeError = false;
          var orderCodeError = false;
          var orderTypeError = false;
          var orderAcptError = false;
          var orderDescError = false;
        
         //---action events----------
          $('input[type="radio"][name="orderMode"]').change(function(){
             validate_orderMode();
          });
        
          $("#orderCode").keyup(function(){
             validate_orderCode();
          });
          $("#orderType").change(function(){
            validate_orderType();
          });
        
          $('input[type="checkbox"][name="orderAcpt"]').change(function(){
             validate_orderAcpt();
          });
        
          $("#orderDesc").keyup(function(){
            validate_note();
          });
          
        
        
          //--validation functions---
          function validate_orderMode(){
            var val = $('input[type="radio"][name="orderMode"]:checked').length;
            if(val==0){
                $("#orderModeError").show();
                $("#orderModeError").html("Choose <b>ORDER MODE</b>");
                 $("#orderModeError").css("color","red");
                orderModeError = false;
            }else{
               $("#orderModeError").hide();
               orderModeError = true;
            }
            return orderModeError;
          }
        
          function validate_orderCode(){
            var val = $("#orderCode").val();
            var exp=/^[A-Z]{2,8}$/;
            if(val==''){
              $("#orderCodeError").show();
              $("#orderCodeError").html("Enter <b> ORDER CODE</b>");
              $("#orderCodeError").css("color","red");
              orderCodeError = false;	
            }else if(!exp.test(val)){
              $("#orderCodeError").show();
              $("#orderCodeError").html("Enter Only<b> 2-8 UPPER CASE CHARS</b>");
              $("#orderCodeError").css("color","red");
              orderCodeError = false;	
            }else{
              $("#orderCodeError").hide();
              orderCodeError = true;
            }
            return orderCodeError;
          }
        
          function validate_orderType(){
            var val = $("#orderType").val();
            if(val==''){
              $("#orderTypeError").show();
              $("#orderTypeError").html("Choose one<b> ORDER TYPE</b>");
              $("#orderTypeError").css("color","red");
              orderTypeError = false;
            }else{
              $("#orderTypeError").hide();
              orderTypeError = true;
            }
            return orderTypeError;
          }
        
          function validate_orderAcpt(){
            var val = $('input[type="checkbox"][name="orderAcpt"]:checked').length;
            if(val==''){
              $("#orderAcptError").show();
              $("#orderAcptError").html("Choose at least one<b> ORDER ACPT</b>");
              $("#orderAcptError").css("color","red");
              orderAcptError = false;
            }else{
              $("#orderAcptError").hide();
              orderAcptError = true;
            }
        
            return orderAcptError;
          }
        
          function validate_note(){
           var val = $("#orderDesc").val();
           var exp= /^[A-Za-z0-9.-_]{10,150}$/;
           if(val==''){
              $("#orderDescError").show();
              $("#orderDescError").html("Enter <b> DESCRIPTION </b>");
              $("#orderDescError").css("color","red");
              noteError = false;
            }else if(!exp.test(val)){
              $("#orderDescError").show();
              $("#orderDescError").html("Allowed chars<b> min=10,max=150 <br/> Also A/a/9 and . - _ ONLY</b>");
              $("#orderDescError").css("color","red");
              orderDescError = false;
            }else{
              $("#orderDescError").hide();
              orderDescError = true;
            }
           return orderDescError;
          }


  // on click submit button 
  $("#register").click(function(){
      orderModeError = false;
	  orderCodeError = false;
	  orderTypeError = false;
      orderAcptError = false;
	  noteError = false;

      validate_orderMode();
	  validate_orderCode();
	  validate_orderType();
	  validate_orderAcpt();
	  validate_note();

	  if(orderModeError && orderCodeError && orderTypeError && orderAcptError && noteError )
	    return true;
      else return false;
  });


});
</script>



</body>
</html>