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
    <!-- iCheck -->
    <link href="vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>

    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
    <!-- File Upload -->
    <link href="production/styles/fileupload.css" rel="stylesheet">
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
                  
                  <style>
                  
                  </style>
                  
                  
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
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              

              
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Form Upload </h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Drop or upload rules text files</h2>
                    <ul class="nav navbar-right panel_toolbox">
                    
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <p>Drag multiple files to the box below for upload or click to select files.</p>
                    <p>This section only accept TEXT file only. ".txt"</p>
                    
                    <label class="control-label">Select File</label>
					<form action="createRule" method="post" enctype="multipart/form-data" >
					<input name="browse_button" type="button" value="Browse" class="btn btn-primary" onclick="invokeFileBrowser()" />
					<input type="text" id="fileName" class="">
					
					<input type="file" class="fileinput_textbox " required="required" name="uploadFile" id="uploadFile" onchange="transferFileName()"/>
					<!-- <input type="file" onChange="transferFileName()" id="fileName" name="file" class="fileinput_textbox">
					 <input type="text" name="action" value="upload"> -->
					 </br>
					<button submit class="btn btn-primary" >Upload</button>
                    </form>
                    <br />
                    <br />
                    <br />
                    <br />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->
        <script>
        
        function invokeFileBrowser()
    	{
    		$('#uploadFile').show().trigger('click').hide()
    	}
    	

    	function transferFileName()
    	{
    		document.getElementById('fileName').value = document.getElementById('uploadFile').value
    	}
        </script>

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
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
    <!-- Dropzone.js -->
    <script src="vendors/dropzone/dist/min/dropzone.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
  </body>
</html>