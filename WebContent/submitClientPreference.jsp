<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Health Insurance Recommendation System</title>

<link href="styles/smart_wizard.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="production/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="production/js/jquery.smartWizard-2.0.min.js"></script>

<script>
	$('input[rel="txtTooltip"]').tooltip({
	  container: 'body'
	});
</script>



<script type="text/javascript">
    $(document).ready(function(){
    	// Smart Wizard     	
  		$('#wizard').smartWizard({transitionEffect:'slide',onLeaveStep:leaveAStepCallback,onFinish:onFinishCallback,enableFinishButton:false});

		
		

       
        $('.buttonPrevious').addClass('btn btn-primary');
        $('.buttonNext').addClass('btn btn-success');
        $('.buttonFinish').addClass('btn btn-default');
		
      function leaveAStepCallback(obj){
        var step_num= obj.attr('rel');
        return validateSteps(step_num);
      }
      
      function onFinishCallback(){
       if(validateAllSteps()){
        $('form').submit();
       }
      }
		});
	   
    function validateAllSteps(){
       var isStepValid = true;
       
       if(validateStep1() == false){
         isStepValid = false;
         $('#wizard').smartWizard('setError',{stepnum:1,iserror:true});         
       }else{
         $('#wizard').smartWizard('setError',{stepnum:1,iserror:false});
       }
	   
	   if(validateStep2() == false){
         isStepValid = false;
         $('#wizard').smartWizard('setError',{stepnum:1,iserror:true});         
       }else{
         $('#wizard').smartWizard('setError',{stepnum:1,iserror:false});
       }
       
       if(validateStep3() == false){
         isStepValid = false;
         $('#wizard').smartWizard('setError',{stepnum:3,iserror:true});         
       }else{
         $('#wizard').smartWizard('setError',{stepnum:3,iserror:false});
       }
       
       if(!isStepValid){
          $('#wizard').smartWizard('showMessage','Please correct the errors before submit');
       }
              
       return isStepValid;
    } 	
		
		
		function validateSteps(step){
		  var isStepValid = true;
      // validate step 1
      if(step == 1){
        if(validateStep1() == false ){
          isStepValid = false; 
          $('#wizard').smartWizard('showMessage','Please correct the errors in this section first.');
          $('#wizard').smartWizard('setError',{stepnum:step,iserror:true});         
        }else{
		
          $('#wizard').smartWizard('setError',{stepnum:step,iserror:false});
        }
      }
	  
	  // validate step 2
      if(step == 2){
        if(validateStep2() == false ){
          isStepValid = false; 
          $('#wizard').smartWizard('showMessage','Please correct the errors in this section.');
          $('#wizard').smartWizard('setError',{stepnum:step,iserror:true});         
        }else{
		
          $('#wizard').smartWizard('setError',{stepnum:step,iserror:false});
        }
      }
      
      // validate step3
      if(step == 3){
        if(validateStep3() == false ){
          isStepValid = false; 
          $('#wizard').smartWizard('showMessage','Please correct the errors in this section.');
          $('#wizard').smartWizard('setError',{stepnum:step,iserror:true});         
        }else{
		
          $('#wizard').smartWizard('setError',{stepnum:step,iserror:false});
        }
      }
      
      return isStepValid;
    }
		
		function validateStep1(){
       var isValid = true; 
	   
	   // Validate Name
       var un = $('#name').val();
       if(!un && un.length <= 0){
         isValid = false;
         $('#msg_name').html('Please fill name').show();
       }else{
         $('#msg_name').html('').hide();
       }
	   
	   // Validate Job
      /* var un = $('#job').val();
       if(!un && un.length <= 0){
         isValid = false;
         $('#msg_job').html('Please fill job').show();
       }else{
         $('#msg_job').html('').hide();
       }
	   */
	   var job = $('#job').val();
		if(!job){
         isValid = false;
         $('#msg_job').html('Please select job class').show();
       }else{
         $('#msg_job').html('').hide();
       }
	   
	   // Validate Salary
       var un = $('#salary').val();
       if(!un && un.length <= 0){
         isValid = false;
         $('#msg_salary').html('Please fill salary').show();
       }else{
         $('#msg_salary').html('').hide();
       }
	   
	   // Validate Gender
       var un = $('input[name="gender"]:checked').val();
       
	   if(un != 'Male' && un != 'Female'){
	    isValid = false;
		$('#msg_gender').html('Please select gender').show();
	   }else{
	   $('#msg_gender').html('').hide();
	   }
	   
	   /*if (un == 'male'){
         $('#msg_gender').html('').hide();
       }
	   
	   else if (un == 'female'){
         $('#msg_gender').html('').hide();
		 
       } else if( un != ' '){
			isValid = false;
			$('#msg_gender').html('Please select gender').show();
       } */
	   
	   // Validate DOB
       var un = $('#single_cal4').val();
       if(!un && un.length <= 0){
         isValid = false;
         $('#msg_birthday').html('Please select date').show();
       }else{
         $('#msg_birthday').html('').hide();
       }
       
       
       
       
       
       
       return isValid;
    }
	
	function validateStep2(){
      var isValid = true;
	  
	  
	  //validate penyakit
	   
	  var penyakit = $('#penyakit').val();
	  var disease = $('input[name="disease"]:checked').val();
		if(!penyakit){
         isValid = false;
         $('#msg_penyakit').html('Please select yes or no').show();
       }else{
         $('#msg_penyakit').html('').hide();
		 if(penyakit=="Yes")
		 {
			if(!disease)
			{
			isValid=false;
			$('#msg_disease').html('Select disease').show();
			}
			else{
			$('#msg_disease').html('').hide();
			}
			
		 }
       }
	  
	  
	 
      //validate disease
	 /* var disease = $('#disease').val();
		if(!disease){
         isValid = false;
         $('#msg_disease').html('Please select disease. If no please select none').show();
       }else{
         $('#msg_disease').html('').hide();
       }
	   */
	 /*  var disease = $('input[name="disease"]:checked').val();
       
	    if(disease != 'None' || disease != 'female'){
	    isValid = false;
		$('#msg_disease').html('Please select disease.').show();
	   }else{
	   $('#msg_disease').html('').hide();
	   }
	   */
	   //validate smoke
	   
	  var smoke = $('#smoke').val();
	  var stop = $('#stop').val(); 
		if(!smoke){
         isValid = false;
         $('#msg_smoke').html('Please select smoking status').show();
       }else{
         $('#msg_smoke').html('').hide();
		 if(smoke=="Quit")
		 {
			if(!stop)
			{
			isValid = false;
			$('#msg_stop').html('How long did you stop smoking').show();
			}
			else{
			$('#msg_stop').html('').hide();
			}
		 }
       }
      
	  
	  
      return isValid;
    }
    
    function validateStep3(){
      var isValid = true;    
	  
	  //validate payment
	 
	  var payment = $('#payment').val();
		if(!payment){
         isValid = false;
         $('#msg_payment').html('Please enter payment amount').show();
       }else{
         $('#msg_payment').html('').hide();
       }
	  
      //validate email  email
      /*var email = $('#email').val();
       if(email && email.length > 0){
         if(!isValidEmailAddress(email)){
           isValid = false;
           $('#msg_email').html('Email is invalid').show();           
         }else{
          $('#msg_email').html('').hide();
         }
       }else{
         isValid = false;
         $('#msg_email').html('Please enter email').show();
       }      */
      return isValid;
    }
    
    // Email Validation
    function isValidEmailAddress(emailAddress) {
      var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
      return pattern.test(emailAddress);
    } 
		
		
</script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>

<script>
        $(document).ready(function (){
            $("#smoke").change(function() {
                // foo is the id of the other select box 
                if ($(this).val() == "Quit") {
                    $("#foo").show();
                }else{
                    $("#foo").hide();
                } 
            });
        });
    </script>
	
	<script>
        $(document).ready(function (){
            $("#penyakit").change(function() {
                // foo is the id of the other select box 
                if ($(this).val() == "Yes") {
                    $("#penyakit1").show();
                }else{
                    $("#penyakit1").hide();
                } 
            });
        });
    </script>

<!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
	
	<!-- iCheck -->
    <link href="vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <link href="vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
    <!-- Select2 -->
    <link href="vendors/select2/dist/css/select2.min.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="vendors/switchery/dist/switchery.min.css" rel="stylesheet">
    <!-- starrr -->
    <link href="vendors/starrr/dist/starrr.css" rel="stylesheet">

  </head>
  

<body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="adminIndex.html" class="site_title"><span>Health Insurance</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile">
              <div class="profile_pic">
                <img src="production/images/user.png" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>${username}</h2><br>
				<a href="updateStaff" class="btn btn-primary btn-xs">Update Account</a>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3> &nbsp </h3>
                <ul class="nav side-menu">
                  
                  
                  <li><a><i class="fa fa-bar-chart-o"></i> Insurance Packages <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="createPackage">Register new package</a></li>
                      <li><a href="managePackage">Update package</a></li>
                      
                    </ul>
                  </li>
                  <li><a><i class="fa fa fa-user-md"></i> Client <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="submitPreference">Submit client preferences</a></li>
                      <li><a href="viewClient">View client preferences</a></li>
                      
                    </ul>
                  </li>
				 
                  
                  
                  
                </ul>
              </div>
              <div class="menu_section">
                <h3>&nbsp</h3>
                <ul class="nav side-menu">
				<li><a href="logout"><i class="fa fa-power-off"></i> Logout <span class=""></span></a>
                  
                    
                  </li>
                  
                             
                  
                </ul>
              </div>

            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        
        <!-- /top navigation -->

        <!-- page content -->

<!--<table align="center" border="0" cellpadding="0" cellspacing="0">-->



<div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Recommend Packages</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    
                  </div>
                </div>
              </div>
            </div>
            <div class="clearfix"></div>

            <div class="row">

              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    
                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

<c:url value="/submitPreference" var="url">
	<c:param name="GenerateRecommend" value="submitPreference"/>
</c:url>


<form class="form-horizontal form-label-left" action="${url}" method="post">
  <input type='hidden' name="issubmit" value="1">
<!-- Tabs -->
<p>Enter customer preferences</p>
  		<div id="wizard" class="form_wizard wizard_horizontal">
  			<ul class="wizard_steps">
  				<li>
                          <a href="#step-1">
                            <span class="step_no">1</span>
                            <span class="step_descr">
                                              Step 1<br />
                                              <small>Enter Basic Details</small>
                                          </span>
                          </a>
                        </li>
			
			
  				<li>
                          <a href="#step-2">
                            <span class="step_no">2</span>
                            <span class="step_descr">
                                              Step 2<br />
                                              <small>Disease Declaration</small>
                                          </span>
                          </a>
                        </li>
  				<li>
                          <a href="#step-3">
                            <span class="step_no">3</span>
                            <span class="step_descr">
                                              Step 3<br />
                                              <small>Payment Willing To Pay</small>
                                          </span>
                          </a>
                        </li>
  				
  			</ul>
  			<div id="step-1">	
            
            <table cellspacing="3" cellpadding="3" align="center">
          			<tr>
                    	<td align="center" colspan="3">&nbsp;</td>
          			</tr>
          			
          			<% 
          			String clientID = "C700";
double d;
for (int i = 1; i <= 7; i++) {
	d = Math.random() * 10;
	clientID = clientID + ((int)d);

		}
					%>
					<input readOnly  type="hidden" name="clientID" value="<%=clientID%>"></input>
					<div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Name <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="text" id="name" name="clientName" value="" class="form-control col-md-7 col-xs-12"><span id="msg_name"></span>
                            </div>
                    </div>
					
					<div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Job Class <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-6">
							<select class="form-control col-md-7 col-xs-12" id="job" name="jobClass" class="txtBox">
							<option value="" disabled selected>Please select</option>
							<option value="JOB CLASS 1">Class 1 Jobs with the lowest level of risk.</option>
							<option value="JOB CLASS 2">Class 2 Jobs in closed buildings, occasionally engaging in manual labour or outdoor activities.</option> 
							<option value="JOB CLASS 3">Class 3 Working light manual labor with/without the use of tools or machinery.</option>
							<option value="JOB CLASS 4">Class 4 work in site constructions, deal with heavy and dangerous machinery.</option> 
																	
							</select>
                              <span id="msg_job"></span>
                            </div>
                            
                            <label name="nickname" rel="txtTooltip" title="Class 1 (White Collar)
                             White collar workers with the 9-5 jobs. Eg Teacher, Lecturer.
                             Class 2 (Overseers)
                             Eg waiters, bakers.
                             Class 3 (Skillful Workers)
                             Eg mechanics and chefs/cooks.
                             Class 4 (Industrial workers/ Blue Collar)
                             This class holds all the hard labour jobs. Insurance coverage for people who fall under this is generally very high" data-toggle="tooltip" data-placement="right" class="tooltip-test control-label fa fa-info-circle fa-2x" style="font-size:20px;color:#42BEBC;"></label>
                          
                            
                            
                            
                    </div>

					
					
						<div class="item form-group">
                            <label for="salary" class="control-label col-md-3 col-sm-3 col-xs-12">Salary <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                             
							  <input id="salary" class="form-control col-md-7 col-xs-12" required type="text" name="salary" data-inputmask="'mask' : '9999'">
                          <span class="fa fa-money form-control-feedback right" aria-hidden="true"></span>
							  <span id="msg_salary"></span>
                            </div>
                          </div>	
						<div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Gender <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <div id="" class="btn-group" data-toggle="buttons">
                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" id="gender" name="gender" value="Male"> &nbsp; Male &nbsp; </input>
                                </label>
                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" id="gender" name="gender" value="Female"> Female </input>
                                </label>
                              </div>
							  <span id="msg_gender"></span>
							 
                            </div>
							
                          </div>
<div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Date Of Birth <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input  type="text" class="form-control col-md-7 col-xs-12" id="single_cal4" name="DOB" placeholder="Select Date" aria-describedby"inputSuccess2Status4"><span id="msg_birthday"></span>
                             <span class="fa fa-calendar form-control-feedback right" aria-hidden="true"></span>
							</div>
                          </div>						  
          			
          			 
                                                   			
  			   </table>          			
        </div>
  			<div id="step-2">
            	
            <table cellspacing="3" cellpadding="3" align="center">
          			<tr>
                    	<td align="center" colspan="3">&nbsp;</td>
          			</tr> 

					<div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Have any disease ? <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
							<select class="form-control col-md-7 col-xs-12" id="penyakit" name="penyakit" class="txtBox">
							<option value="" disabled selected>Please select</option>
							<option value="Yes">Yes</option>
							<option value="No">No</option> 
														
							</select>
                              <span id="msg_penyakit"></span>
                            </div>
                    </div>					
					<div class="item form-group" id="penyakit1" style="display:none;">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Type Of Disease <span class="required">*</span>
                            </label>
                            <div class="col-md-7 col-sm-9 col-xs-12">
							
							<div class="x_panel">
							
					<div class="x_content">
						<div class="checkbox">
						 <c:forEach items="${illness}" var="p">
						<div class="fa-hover col-md-4 col-sm-9 col-xs-12">
						<input type="checkbox" class="flat" name="disease" id="disease" value="${p.diseaseID}"> ${p.diseaseName}
                        </div>
                        </c:forEach>
						
					</div>	
					</div>
					</div>
					
				  
              
						<span id="msg_disease"></span>	
							
						</div>
                    </div>
					<div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Smoker <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
							<select class="form-control col-md-7 col-xs-12" id="smoke" name="smoke" class="txtBox">
							<option value="" disabled selected>Please select</option>
							<option value="Yes">Yes</option>
							<option value="No">No</option> 
							<option value="Quit">Quit</option>							
							</select>
                              <span id="msg_smoke"></span>
                            </div>
                    </div>

					<div class="item form-group" id="foo" style="display:none;">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">How long you quit <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
							<select class="form-control col-md-7 col-xs-12" id="stop" name="stop" class="txtBox">
							<option value="" disabled selected>Please select</option>
							<option value="Below 1 year">Below 1 year</option>
							<option value="1 year to 2 years">1 year to 2 years</option> 
							<option value="2 years to 3 years">2 years to 3 years</option>
							<option value="3 years and above">3 years and above</option>							
							</select>
                              <span id="msg_stop"></span>
                            </div>
                    </div>
          			
          			 
          			                                  			
  			   </table>        
        </div>                      
  			<div id="step-3">
            	
            <table cellspacing="3" cellpadding="3" align="center">
          			<tr>
                    	<td align="center" colspan="3">&nbsp;</td>
          			</tr>        
          			<div class="item form-group">
                            <label for="payment" class="control-label col-md-3 col-sm-3 col-xs-12">Payment Amount <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
							<select class="form-control col-md-7 col-xs-12" name="monthlyPayment" id="payment" class="txtBox">
							<option value="" disabled selected>Please select</option>
							<option value="100 - 300">RM100 to RM300</option>
							<option value="301 - 500">RM301 to RM500</option> 
							<option value="501 - 700">RM501 to RM700</option>	
							<option value="701 - 900">RM701 to RM900</option>						
							</select>
                              <span id="msg_payment"></span>
                            </div>
                    </div>
          			                                 			
  			   </table>               				          
        </div>
  			
  		</div>
<!-- End SmartWizard Content -->  		
</form> 
  		
 </div>
                </div>
              </div>
            </div>
          </div>
        </div>
<!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Health Insurance Recommendation System
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>
	
	<!-- jQuery -->
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="vendors/nprogress/nprogress.js"></script>
    <!-- jQuery Smart Wizard -->
    <script src="vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
	<!-- bootstrap-daterangepicker -->
    <script src="production/js/moment/moment.min.js"></script>
    <script src="production/js/datepicker/daterangepicker.js"></script>
	<!-- Select2 -->
    <script src="vendors/select2/dist/js/select2.full.min.js"></script>
	<!-- iCheck -->
    <script src="vendors/iCheck/icheck.min.js"></script>
	 <!-- bootstrap-wysiwyg -->
    <script src="vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
    <script src="vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
    <script src="vendors/google-code-prettify/src/prettify.js"></script>
	<!-- Switchery -->
    <script src="vendors/switchery/dist/switchery.min.js"></script>
	 <!-- Parsley -->
    <script src="vendors/parsleyjs/dist/parsley.min.js"></script>
	 <!-- Autosize -->
    <script src="vendors/autosize/dist/autosize.min.js"></script>
	<!-- jQuery autocomplete -->
    <script src="vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
	<!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
	<!-- jquery.inputmask -->
    <script src="vendors/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
	
	<script>
      $(document).ready(function() {
        $('#single_cal1').daterangepicker({
          singleDatePicker: true,
          calender_style: "picker_1"
        }, function(start, end, label) {
          console.log(start.toISOString(), end.toISOString(), label);
        });
        $('#single_cal2').daterangepicker({
          singleDatePicker: true,
          calender_style: "picker_2"
        }, function(start, end, label) {
          console.log(start.toISOString(), end.toISOString(), label);
        });
        $('#single_cal3').daterangepicker({
          singleDatePicker: true,
          calender_style: "picker_3"
        }, function(start, end, label) {
          console.log(start.toISOString(), end.toISOString(), label);
        });
        $('#single_cal4').daterangepicker({
          singleDatePicker: true,
          calender_style: "picker_4"
        }, function(start, end, label) {
          console.log(start.toISOString(), end.toISOString(), label);
        });
      });
    </script>
	
	<!-- jquery.inputmask -->
    <script>
      $(document).ready(function() {
        $(":input").inputmask();
      });
    </script>
    <!-- /jquery.inputmask -->
	
	
</script>
</body>
</html>
