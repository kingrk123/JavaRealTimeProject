<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
</head>
<body>
	<%@include file="UserMenu.jsp"%>
	<div class="container">
		<div class="card">
			<div class="card-header bg-primary text-white">
				<h1>Welcome to WhUserType Register Page</h1>
			</div>
			<div class="card-body">
				<form:form id="myForm" action="save" method="POST"
					modelAttribute="whusertype">
					<!--new Row -->
					<div class="row">
						<div class="col-4">
							<label for="userType"> USERTYPE</label>
						</div>
						<div class="col-4">
							<form:radiobutton path="userType" value="Vendor" />Vendor
							<form:radiobutton path="userType" value="Customer" />Customer
						</div>
						<div class="col-4" id="userTypeError"></div>
					</div>
					<!--new Row -->
					<div class="row">
						<div class="col-4">
							<label for="userCode"> USERCODE</label>
						</div>
						<div class="col-4">
							<form:input path="userCode" class="form-control" />
						</div>
						<div class="col-2" id="userCodeError"></div>
						<div class="col-2" >
						<form:errors path="userCode" cssClass="text-danger"/></div>
					</div>
					<!--new Row -->
					<div class="row">
						<div class="col-4">
							<label for="userFor"> USERFOR</label>
						</div>
						<div class="col-4">
							<form:input path="userFor" class="form-control" readonly="true"/>
						</div>
						<div class="col-4" id="userForError"></div>
					</div>
					<!--new Row -->
					<div class="row">
						<div class="col-4">
							<label for="userMail"> USEREMAIL</label>
						</div>
						<div class="col-4">
							<form:input path="userMail" class="form-control" />
						</div>
						<div class="col-4" id="userMailError"></div>
					</div>
					<!--new Row -->
					<div class="row">
						<div class="col-4">
							<label for="userContact"> USERCONTACT</label>
						</div>
						<div class="col-4">
							<form:input path="userContact" class="form-control" />
						</div>
						<div class="col-4" id="userContactError"></div>
					</div>
					<!--new Row -->
					<div class="row">
						<div class="col-4">
							<label for="idType"> USERIDTYPE</label>
						</div>
						<div class="col-4">
							<form:select path="idType" class="form-control">
								<form:option value="">-SELECT-</form:option>
								<form:option value="PANCARD">PANCARD</form:option>
								<form:option value="AADHAR">AADHAR</form:option>
								<form:option value="OTHER">OTHER</form:option>
							</form:select>
						</div>
						<div class="col-4" id="idTypeError"></div>
					</div>
					
					<!--new Row -->
					<div class="row">
						<div class="col-4">
							<label for="ifOther"> IFOTHER</label>
						</div>
						<div class="col-4">
							<form:input path="ifOther" class="form-control" readonly="true" />
						</div>
						<div class="col-4" id="ifOtherError"></div>
					</div>
					
					
					<!--new Row -->
					<div class="row">
						<div class="col-4">
							<label for="idNum"> ID NUMBER</label>
						</div>
						<div class="col-4">
							<form:input path="idNum" class="form-control" />
						</div>
						<div class="col-4" id="idNumError"></div>
					</div>
					
					
					<!--new Row -->
					<div class="row">
						<div class="col-4">
							<label for="note"> NOTE</label>
						</div>
						<div class="col-4">
							<form:textarea path="note" class="form-control" />
						</div>
						<div class="col-4" id="noteError"></div>
					</div>
					<input type="submit" value="Register" id="register" class="btn btn-success" />
				</form:form>
			</div>
			<div class="card-footer bg-info text-white">
				<b>${message}</b>
			</div>
		</div>
	</div>
<script type="text/javascript">
$(document).ready(function(){
	  $("#userTypeError").hide();
	  $("#userCodeError").hide();
	  $("#userMailError").hide();
	  $("#userContactError").hide();
	  $("#idTypeError").hide();
	  $("#idNumError").hide();
	  $("#noteError").hide();

	  var userTypeError = false;
	  var userCodeError = false;
	  var userMailError = false;
	  var userContactError = false;
	  var idTypeError = false;
	  var idNumError = false;
	  var noteError = false;


	  $('input[type="radio"][name="userType"]').change(function(){
	     validate_userType();
		 autoFill_userFor();
	  });
	  $("#userCode").keyup(function(){
	     validate_userCode();
	  });

	  $("#userMail").keyup(function(){
		 validate_userMail();
	  });

	  $("#userContact").keyup(function(){
	     validate_userContact();
	  });

	  $("#idType").change(function(){
	    validate_idType();
	  });

	  $("#idNum").keyup(function(){
	    validate_idNum();
	  });

	  $("#note").keyup(function(){
         validate_note();
	  });


	  function autoFill_userFor(){
	     var val=$('input[type="radio"][name="userType"]:checked').val();
		 if(val=='Vendor'){
		   $("#userFor").val("Purchase");
		   $("#userFor").css("color","blue");
		 }else if(val=='Customer'){
	  	   $("#userFor").val("Sale");
	   	   $("#userFor").css("color","green");
		 }
	  }

	  function validate_userType(){
	    var val=$('input[type="radio"][name="userType"]:checked').length;
		//if one radio button is selected then length=1 else length is zero
		if(val==0){
		  $("#userTypeError").show();
	  	  $("#userTypeError").html("Please choose <b>User Type</b>");
	 	  $("#userTypeError").css("color","red");
		  userTypeError = false;
		}else{
		  $("#userTypeError").hide();
		  userTypeError = true;
		}
	    return userTypeError;
	  }


	  function validate_userCode(){
	    var val=$("#userCode").val();
		var exp=/^[A-Z]{2,8}$/;
	    if(val==''){
		  $("#userCodeError").show();
		  $("#userCodeError").html("Enter <b>User Code</b>");
	   	  $("#userCodeError").css("color","red");
		  userCodeError = false;
		}else if(!exp.test(val)) {
		  $("#userCodeError").show();
		  $("#userCodeError").html("Enter <b>Upper Case (2-8)</b> letters only");
	   	  $("#userCodeError").css("color","red");
		  userCodeError = false;
		}else{
		  $("#userCodeError").hide();
		  userCodeError = true;
		}
	    return userCodeError;
	  }

	  function validate_userMail(){
	     var val=$("#userMail").val();
	     var exp=/^[a-zA-Z0-9-_]+\@[a-zA-Z]{2,8}\.[a-z]{2,6}$/;
		 if(val==''){
		   $("#userMailError").show();
	       $("#userMailError").html("Enter <b> User Mail</b>");
		   $("#userMailError").css("color","red");
		   userMailError = false;
		 }else if(!exp.test(val)){
		   $("#userMailError").show();
	       $("#userMailError").html("Not a Valid <b> User Mail</b>");
		   $("#userMailError").css("color","red");
		   userMailError = false;
		 
		 }else{
	  	   $("#userMailError").hide();
		    userMailError = true;

	         
		 }
	     return userMailError;
	  }


	  function validate_userContact(){
	    var val = $("#userContact").val();
	    var exp = /^(\+91)?[6-9][0-9]{9}$/;
		if(val==''){
		   $("#userContactError").show();
		   $("#userContactError").html("Enter <b>User Contact</b>");
		   $("#userContactError").css("color","red");
		   userContactError = false;
		}else if(!exp.test(val)){
		   $("#userContactError").show();
		   $("#userContactError").html("Invaild <b>User Contact</b>");
		   $("#userContactError").css("color","red");
		   userContactError = false;
		}else{
		   $("#userContactError").hide();
		   userContactError = true;
		}
	     return userContactError;
	  }

	  function validate_idType(){
	    var val = $("#idType").val();
		if(val==''){
		  $("#idTypeError").show();
		  $("#idTypeError").html("Choose <b>ID Type </b>");
	  	  $("#idTypeError").css("color","red");
		  idTypeError = false;
		}else{
	      $("#idTypeError").hide();
		  idTypeError = true;

		  if(val=='OTHER') {
		    $("#ifOther").attr("readonly",false);
		  }else{
		    $("#ifOther").val(''); 
		    $("#ifOther").attr("readonly",true);
		  }
		}
		return idTypeError;
	  }
	   
	  function validate_idNum(){
	     var val= $("#idNum").val();
		 var exp=/^[A-Za-z0-9-._]{4,20}$/;
		 if(val==''){
		   $("#idNumError").show();
	 	   $("#idNumError").html("Enter <b>ID Number</b>");
	  	   $("#idNumError").css("color","red");
		   idNumError = false;
		 }else if(!exp.test(val)){
		   $("#idNumError").show();
	 	   $("#idNumError").html("Invaild <b>ID Number</b>");
	  	   $("#idNumError").css("color","red");
		   idNumError = false;

		 }else{
		   $("#idNumError").hide();
		   idNumError = true;
		 }
		 return idNumError;
	   }

	   function validate_note(){
		   var val = $("#note").val();
		   if(val==''){
               $("#noteError").show();
               $("#noteError").html("Enter <b>Note </b>");
               $("#noteError").css("color","red");
               noteError = false;
		   }else{
			   $("#noteError").hide();
			   noteError = true;
		   }
		   return noteError;
	   }
	 
	   // **************on click submit button****************
	    $("#register").click(function(){
	       	userTypeError = false;
			userCodeError = false;
	        userMailError = false;
	        userContactError = false;
	        idTypeError = false;
	        idNumError = false;
	        noteError = false;

			validate_userType();
	        validate_userCode();
			validate_userMail();
			validate_userContact();
			validate_idType();
			validate_idNum();
			validate_note();

			if(userTypeError && userCodeError && userMailError && userContact
			   && idTypeError && idNumError && noteError)
			  return true;
	        else 
			  return false;

		});
	    // ******************  (^^)  **************************
	  

	});
	</script>
</body>
</html>

