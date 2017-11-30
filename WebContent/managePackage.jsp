<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
    
    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="manageStaff" class="site_title"><span>Health Insurance</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile">
              <div class="profile_pic">
                <img src="production/images/user.png" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>Admin</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
           <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3> &nbsp </h3>
                <ul class="nav side-menu">
                  <li><a href="manageStaff"><i class="fa fa-home"></i> Home <span class=""></span></a>
                    
                  </li>
                  <li><a><i class="fa fa-edit"></i> Staff <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="registerStaff.jsp">Register new staff</a></li>
                      
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bar-chart-o"></i> Insurance Packages <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="registerPackageAdmin.jsp">Register new package</a></li>
                      <li><a href="managePackage">Update package</a></li>
                     </ul>
                  </li>
                  <li><a><i class="fa fa-sitemap"></i> Rule <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="uploadForm.jsp">Upload new rules</a></li>
                      <li><a href="manageRule">Manage rules</a></li>
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
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Register New Package</h3>
              </div>

              <div class="title_right">
                
              </div>
            </div>
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  
                  <div class="x_content">
                  
                  

				
                    <form class="form-horizontal form-label-left" action="managePackage" method="post">
					
                      <c:forEach items="${pack}" var="p">
                      <span class="section">Package Info</span>

                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Package ID <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" value="${p.packageID}" readonly name="packageID"  required="required" type="text">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Package Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="text" name="packageName" value="${p.packageName}" required="required" class="form-control col-md-7 col-xs-12" title="firstname lastname">
                        </div>
                      </div>
                      
					</c:forEach>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Illness Covered<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        
                          <input id="tags_1" type="text" name="illness" class="form-control col-md-7 col-xs-12" value="<c:forEach items="${illness}" var="p">${p.diseaseName}, </c:forEach>" />
                            
                        </div>
                      </div>
                        
                                          
                      <div class="item form-group">
                        <label for="password" class="control-label col-md-3">Package Type *</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select name="packageType" class="form-control" required>
                         
                          <c:forEach items="${item}" var="i">
                         
                            <option value="${i.packageType}" <c:forEach items="${pack}" var="p"> ${i.packageType == p.packageType ? 'selected="selected"' : ''} </c:forEach>>${i.packageType}</option>
                            
                            </c:forEach>
                            
                             
                          </select>
                        </div>
                      </div>
					  
					  
					  
                      
                      <input type="hidden" id="action" name="action"></input>
                      
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                          <button type="reset" class="btn btn-primary">Cancel</button>
                          <button type="submit" onClick="actionButton()" class="btn btn-danger">Delete</button>
                          <button type="submit" onClick="submitButton()" class="btn btn-success">Update</button>
                        </div>
                      </div>
                      
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
    <!-- validator -->
    <script src="vendors/validator/validator1.js"></script>
	<!-- jquery.inputmask -->
    <script src="vendors/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
	<!-- jQuery Tags Input -->
    <script src="vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
<script>

function actionButton(){
	var result = confirm("Want to delete?");
	if (result) {
		var action = "delete";
		//confirm("Are you sure want to delete package ?");
		//alert("test sikit "+action);
		
		//var action = document.getElementById("update").value;
		//alert("test sikit "+action);
		
		
		document.getElementById("action").value = action;
		//document.getElementById("option").innerHTML = "cb";
	}
	
}

function submitButton(){
	
	var result = confirm("Want to update?");
	if (result) {
	var action = "update";
	
	//alert("test sikit "+action);
	
	//var action = document.getElementById("update").value;
	//alert("test sikit "+action);
	
	
	document.getElementById("action").value = action;
	//document.getElementById("option").innerHTML = "cb";
	}
}
</script>
    <!-- validator -->
    <script>
      // initialize the validator function
      validator.message.date = 'not a real date';

      // validate a field on "blur" event, a 'select' on 'change' event & a '.required' classed multifield on 'keyup':
      $('form')
        .on('blur', 'input[required], input.optional, select.required', validator.checkField)
        .on('change', 'select.required', validator.checkField)
        .on('keypress', 'input[required][pattern]', validator.keypress);

      $('.multi.required').on('keyup blur', 'input', function() {
        validator.checkField.apply($(this).siblings().last()[0]);
      });

      $('form').submit(function(e) {
        e.preventDefault();
        var submit = true;

        // evaluate the form using generic validaing
        if (!validator.checkAll($(this))) {
          submit = false;
        }

        if (submit)
          this.submit();

        return false;
      });
    </script>
    <!-- /validator -->
	
	<!-- jQuery Tags Input -->
    <script>
      function onAddTag(tag) {
        alert("Add benefit: " + tag);
      }

      function onRemoveTag(tag) {
        alert("Removed benefit: " + tag);
      }

      function onChangeTag(input, tag) {
        alert("Changed benefit: " + tag);
      }

      $(document).ready(function() {
        $('#tags_1').tagsInput({
          width: 'auto'
        });
      });
    </script>
    <!-- /jQuery Tags Input -->
	
	<!-- jQuery Tags Input -->
    <script>
      function onAddTag(tag) {
        alert("Add benefit: " + tag);
      }

      function onRemoveTag(tag) {
        alert("Removed benefit: " + tag);
      }

      function onChangeTag(input, tag) {
        alert("Changed benefit: " + tag);
      }

      $(document).ready(function() {
        $('#tags_2').tagsInput({
          width: 'auto'
        });
      });
    </script>
    <!-- /jQuery Tags Input -->
	
	<!-- jquery.inputmask -->
    <script>
      $(document).ready(function() {
        $(":input").inputmask();
      });
    </script>
    <!-- /jquery.inputmask -->
  </body>
</html>