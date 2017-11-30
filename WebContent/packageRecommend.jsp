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

<script type="text/javascript">
    $(document).ready(function(){
    	// Smart Wizard     	
  		$('#wizard').smartWizard({transitionEffect:'slide',onLeaveStep:leaveAStepCallback,onFinish:onFinishCallback,enableFinishButton:false});

		
		

        $('.buttonNext').addClass('btn btn-success');
        $('.buttonPrevious').addClass('btn btn-primary');
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
                <img src="production/images/img.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2><%= session.getAttribute( "username" ) %></h2><br>
				<button type="button" class="btn btn-primary btn-xs">Update Account</button>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3> &nbsp </h3>
                <ul class="nav side-menu">
                  <li><a href="staffHome.html"><i class="fa fa-home"></i> Home <span class=""></span></a>
                    
                  </li>
                  
                  <li><a><i class="fa fa-bar-chart-o"></i> Insurance Packages <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="registerPackageStaff.jsp">Register new package</a></li>
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
                    <h2>Client Information </h2>
                    
                    <div class="clearfix"></div>
                  </div>
				  <c:forEach items="${clientInfo}" var="p">
                  <div class="x_content">
                    <br />
                    <div id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                    
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Name </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        <label class="form-control col-md-7 col-xs-12" for="first-name">${p.clientName}</span>
                        
                         </label>
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Job Class </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        <label class="form-control col-md-7 col-xs-12" for="first-name">${p.jobclass}</span>
                        
                         </label>
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Gender</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        <label class="form-control col-md-7 col-xs-12" for="first-name">${p.clientGender}</span>
                        
                         </label>
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Smoking Status </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        <label class="form-control col-md-7 col-xs-12" for="first-name">${p.smokingStatus}</span>
                        
                         </label>
                        </div>
                      </div>
                      <c:if test="${p.smokingStatus == 'Quit'}">
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Quit Duration </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        <label class="form-control col-md-7 col-xs-12" for="first-name">${p.quitDuration}</span>
                        
                         </label>
                        </div>
                      </div>
                      </c:if>
					  
					 
                      <div class="x_title"></div>
                      <div class="x_title">
                      <h2>Recommended </h2>
                    
                    <div class="clearfix"></div>
                      
                      </div>
                      <div class="form-group">
                        
                      </div>
                      
                      
                      
                      
                      
                      
                       <div class="col-md-12 col-sm-12 col-xs-12 text-center">
                       <ul class="pagination pagination-split">
                       <li>
                       <form action="packDetails" method="post">
                       
                       <div class="col-md-3 col-xs-12 widget widget_tally_box">
                        <div class="x_panel ui-ribbon-container fixed_height_4500">
                        <c:if test="${(value1>value2&&value1>value3)||value1==value2||value1==value3}">
                          <div class="ui-ribbon-wrapper">
                         
                                                        
                            <div class="ui-ribbon">
                              Suggested
                            </div>
                           
                          </div>
                          </c:if>
                          
                          <div class="x_title">
                          <input type="hidden" value="${ruleno }" name="ruleNo">
                          <input type="hidden" value="${RM1 }" name="monthlypay">
                            <h3>RM${RM1}</h3>
                            <div class="clearfix"></div>
                          </div>
                          <div class="x_content">

                            <div style="text-align: center; margin-bottom: 17px">
                              <span class="chart" data-percent="${value1}">
                                                  <span class="percent"></span>
                              </span>
                            </div>
							<c:forEach items="${recommendPackage}" var="p">
                            <h3 class="name_title">${p.packageName}</h3>
                            <p>${p.packageType}</p>

                            <div class="divider"></div>
                            </c:forEach>
                            <button type="" class="btn btn-primary btn-block" >View <span> details</span></button>
							
                            
                            <p></p>

                          </div>
                        </div>
                      </div>
                      </form>
                      </li>
                      
                      <li>
                      <form action="packDetails" method="post">
                      <div class="col-md-3 col-xs-12 widget widget_tally_box">
                        <div class="x_panel ui-ribbon-container fixed_height_4500">
                        <c:if test="${value2>value3&&value2>value1||value2==value1||value2==value3}">
                          <div class="ui-ribbon-wrapper">
                         
                                                        
                            <div class="ui-ribbon">
                              Suggested
                            </div>
                           
                          </div>
                          </c:if>
                          
                          <div class="x_title">
                          <input type="hidden" value="${ruleno }" name="ruleNo">
                          <input type="hidden" value="${RM2 }" name="monthlypay">
                            <h3>RM${RM2}</h3>
                            <div class="clearfix"></div>
                          </div>
                          <div class="x_content">

                            <div style="text-align: center; margin-bottom: 17px">
                              <span class="chart" data-percent="${value2}">
                                                  <span class="percent"></span>
                              </span>
                            </div>
							<c:forEach items="${recommendPackage}" var="p">
                            <h3 class="name_title">${p.packageName}</h3>
                            <p>${p.packageType}</p>

                            <div class="divider"></div>
                            </c:forEach>
                            <button type="" class="btn btn-primary btn-block" >View <span> details</span></button>
							
                            
                            <p></p>

                          </div>
                        </div>
                      </div>
                      </form>
                      </li>
                      
                      <li>
                      <form action="packDetails" method="post">
                      <div class="col-md-3 col-xs-12 widget widget_tally_box">
                        <div class="x_panel ui-ribbon-container fixed_height_4500">
                        <c:if test="${value3>value2&&value3>value1||value3==value1||value3==value2}">
                          <div class="ui-ribbon-wrapper">
                         
                                                        
                            <div class="ui-ribbon">
                              Suggested
                            </div>
                           
                          </div>
                          
                          </c:if>
                          <div class="x_title">
                          <input type="hidden" value="${ruleno }" name="ruleNo">
                          <input type="hidden" value="${RM3 }" name="monthlypay">
                            <h3>RM${RM3}</h3>
                            <div class="clearfix"></div>
                          </div>
                          <div class="x_content">

                            <div style="text-align: center; margin-bottom: 17px">
                              <span class="chart" data-percent="${value3}">
                                                  <span class="percent"></span>
                              </span>
                            </div>
							<c:forEach items="${recommendPackage}" var="p">
                            <h3 class="name_title">${p.packageName}</h3>
                            <p>${p.packageType}</p>

                            <div class="divider"></div>
                            </c:forEach>
                            
                                <button type="" class="btn btn-primary btn-block" >View <span> details</span></button>
                                
							
                            
                            <p></p>

                          </div>
                        </div>
                      </div>
                      </form>
                      </li>
                      </ul>
</div>
                    </div>
                  </div>
				  </c:forEach>
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
    <!-- Chart.js -->
    <script src="vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- jQuery Sparklines -->
    <script src="vendors/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
    <!-- easy-pie-chart -->
    <script src="vendors/jquery.easy-pie-chart/dist/jquery.easypiechart.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>

    <!-- chart js -->
    <!-- <script type="text/javascript" src="js/moment/moment.min.js"></script> -->
    <!-- <script src="js/chartjs/chart.min.js"></script> -->
    <!-- bootstrap progress js -->
    <!-- <script src="js/progressbar/bootstrap-progressbar.min.js"></script> -->
    <!-- icheck -->
    <!-- <script src="js/icheck/icheck.min.js"></script> -->

    <!-- <script src="/build/js/custom.min.js"></script> -->

    <!-- pace -->
    <!-- <script src="js/pace/pace.min.js"></script> -->

    <!-- sparkline -->
    <!-- <script src="js/sparkline/jquery.sparkline.min.js"></script> -->
    <!-- easypie -->
    <!-- <script src="js/easypie/jquery.easypiechart.min.js"></script> -->
    <script>
      $(function() {
        $('.chart').easyPieChart({
          easing: 'easeOutElastic',
          delay: 3000,
          barColor: '#26B99A',
          trackColor: '#fff',
          scaleColor: false,
          lineWidth: 20,
          trackWidth: 16,
          lineCap: 'butt',
          onStep: function(from, to, percent) {
            $(this.el).find('.percent').text(Math.round(percent));
          }
        });
      });
    </script>

    <script>
      $(document).ready(function() {
        Chart.defaults.global.legend = {
          enabled: false
        };

        new Chart(document.getElementById("canvas_line"), {
          type: 'line',
          data: {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [{
              label: "My First dataset",
              backgroundColor: "rgba(38, 185, 154, 0.31)",
              borderColor: "rgba(38, 185, 154, 0.7)",
              pointBorderColor: "rgba(38, 185, 154, 0.7)",
              pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
              pointHoverBackgroundColor: "#fff",
              pointHoverBorderColor: "rgba(220,220,220,1)",
              pointBorderWidth: 1,
              data: [31, 74, 6, 39, 20, 85, 7]
            }, {
              label: "My Second dataset",
              backgroundColor: "rgba(3, 88, 106, 0.3)",
              borderColor: "rgba(3, 88, 106, 0.70)",
              pointBorderColor: "rgba(3, 88, 106, 0.70)",
              pointBackgroundColor: "rgba(3, 88, 106, 0.70)",
              pointHoverBackgroundColor: "#fff",
              pointHoverBorderColor: "rgba(151,187,205,1)",
              pointBorderWidth: 1,
              data: [82, 23, 66, 9, 99, 4, 2]
            }]
          },
        });

        new Chart(document.getElementById("canvas_line1"), {
          type: 'line',
          data: {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [{
              label: "My First dataset",
              backgroundColor: "rgba(38, 185, 154, 0.31)",
              borderColor: "rgba(38, 185, 154, 0.7)",
              pointBorderColor: "rgba(38, 185, 154, 0.7)",
              pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
              pointHoverBackgroundColor: "#fff",
              pointHoverBorderColor: "rgba(220,220,220,1)",
              pointBorderWidth: 1,
              data: [31, 74, 6, 39, 20, 85, 7]
            }, {
              label: "My Second dataset",
              backgroundColor: "rgba(3, 88, 106, 0.3)",
              borderColor: "rgba(3, 88, 106, 0.70)",
              pointBorderColor: "rgba(3, 88, 106, 0.70)",
              pointBackgroundColor: "rgba(3, 88, 106, 0.70)",
              pointHoverBackgroundColor: "#fff",
              pointHoverBorderColor: "rgba(151,187,205,1)",
              pointBorderWidth: 1,
              data: [82, 23, 66, 9, 99, 4, 2]
            }]
          },
        });

        new Chart(document.getElementById("canvas_line2"), {
          type: 'line',
          data: {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [{
              label: "My First dataset",
              backgroundColor: "rgba(38, 185, 154, 0.31)",
              borderColor: "rgba(38, 185, 154, 0.7)",
              pointBorderColor: "rgba(38, 185, 154, 0.7)",
              pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
              pointHoverBackgroundColor: "#fff",
              pointHoverBorderColor: "rgba(220,220,220,1)",
              pointBorderWidth: 1,
              data: [31, 74, 6, 39, 20, 85, 7]
            }, {
              label: "My Second dataset",
              backgroundColor: "rgba(3, 88, 106, 0.3)",
              borderColor: "rgba(3, 88, 106, 0.70)",
              pointBorderColor: "rgba(3, 88, 106, 0.70)",
              pointBackgroundColor: "rgba(3, 88, 106, 0.70)",
              pointHoverBackgroundColor: "#fff",
              pointHoverBorderColor: "rgba(151,187,205,1)",
              pointBorderWidth: 1,
              data: [82, 23, 66, 9, 99, 4, 2]
            }]
          },
        });

        new Chart(document.getElementById("canvas_line3"), {
          type: 'line',
          data: {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [{
              label: "My First dataset",
              backgroundColor: "rgba(38, 185, 154, 0.31)",
              borderColor: "rgba(38, 185, 154, 0.7)",
              pointBorderColor: "rgba(38, 185, 154, 0.7)",
              pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
              pointHoverBackgroundColor: "#fff",
              pointHoverBorderColor: "rgba(220,220,220,1)",
              pointBorderWidth: 1,
              data: [31, 74, 6, 39, 20, 85, 7]
            }, {
              label: "My Second dataset",
              backgroundColor: "rgba(3, 88, 106, 0.3)",
              borderColor: "rgba(3, 88, 106, 0.70)",
              pointBorderColor: "rgba(3, 88, 106, 0.70)",
              pointBackgroundColor: "rgba(3, 88, 106, 0.70)",
              pointHoverBackgroundColor: "#fff",
              pointHoverBorderColor: "rgba(151,187,205,1)",
              pointBorderWidth: 1,
              data: [82, 23, 66, 9, 99, 4, 2]
            }]
          },
        });

        new Chart(document.getElementById("canvas_line4"), {
          type: 'line',
          data: {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [{
              label: "My First dataset",
              backgroundColor: "rgba(38, 185, 154, 0.31)",
              borderColor: "rgba(38, 185, 154, 0.7)",
              pointBorderColor: "rgba(38, 185, 154, 0.7)",
              pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
              pointHoverBackgroundColor: "#fff",
              pointHoverBorderColor: "rgba(220,220,220,1)",
              pointBorderWidth: 1,
              data: [31, 74, 6, 39, 20, 85, 7]
            }, {
              label: "My Second dataset",
              backgroundColor: "rgba(3, 88, 106, 0.3)",
              borderColor: "rgba(3, 88, 106, 0.70)",
              pointBorderColor: "rgba(3, 88, 106, 0.70)",
              pointBackgroundColor: "rgba(3, 88, 106, 0.70)",
              pointHoverBackgroundColor: "#fff",
              pointHoverBorderColor: "rgba(151,187,205,1)",
              pointBorderWidth: 1,
              data: [82, 23, 66, 9, 99, 4, 2]
            }]
          },
        });
      });
    </script>
    
    <script>
      $('document').ready(function() {
        $(".sparkline_one").sparkline([2, 4, 3, 4, 5, 4, 5, 4, 3, 4, 5, 6, 7, 5, 4, 3, 5, 6], {
          type: 'bar',
          height: '40',
          barWidth: 9,
          colorMap: {
            '7': '#a1a1a1'
          },
          barSpacing: 2,
          barColor: '#26B99A'
        });

        $(".sparkline_two").sparkline([2, 4, 3, 4, 5, 4, 5, 4, 3, 4, 5, 6, 7, 5, 4, 3, 5, 6], {
          type: 'line',
          width: '200',
          height: '40',
          lineColor: '#26B99A',
          fillColor: 'rgba(223, 223, 223, 0.57)',
          lineWidth: 2,
          spotColor: '#26B99A',
          minSpotColor: '#26B99A'
        });
      })
    </script>
  </body>
</html>