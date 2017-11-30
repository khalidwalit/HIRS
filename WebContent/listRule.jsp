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
            

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Rule List </h2>
                    <ul class="nav navbar-right panel_toolbox">
                    
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    
                     
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>Rule No</th>
													<th>Age Category</th>
													<th>Job Class</th>
													<th>Smoking Status</th>
													<th>Quit Duration</th>
													<th>Illness Status</th>
													<th>Gender</th>
													<th>Monthly Payment</th>
													<th>Recommend</th>
													<th>Action</th>
                        </tr>
                      </thead>


                      <tbody>
                     
                      <c:forEach items="${rule}" var="p">
                      
                                                  <tr>
                                                  <form action="manageRule" method="post">
													<td>${p.ruleno}</td>
													<td>
													<select  name="age" class="form-control input-sm"  required>
													
													
                         
                            						<option  value="YOUNG" ${p.age == "YOUNG" ? 'selected="selected"' : ''} >YOUNG</option>
                            						<option  value="TEENAGE" ${p.age == "TEENAGE" ? 'selected="selected"' : ''}>TEENAGE</option>
                            						<option  value="ADULT" ${p.age == "ADULT" ? 'selected="selected"' : ''}>ADULT</option>
                            						<option value="OLD" ${p.age == "OLD" ? 'selected="selected"' : ''}>OLD</option>
                            
                            						

													</select>
													
													
													</td>
													<td>
													
													
													<select  name="job" class="form-control input-sm"  required>
													
													
                         
                            						<option  value="JOB CLASS 1" ${p.job == "JOB CLASS 1" ? 'selected="selected"' : ''} >JOB CLASS 1</option>
                            						<option  value="JOB CLASS 2" ${p.job == "JOB CLASS 2" ? 'selected="selected"' : ''}>JOB CLASS 2</option>
                            						<option  value="JOB CLASS 3" ${p.job == "JOB CLASS 3" ? 'selected="selected"' : ''}>JOB CLASS 3</option>
                            						<option value="JOB CLASS 4" ${p.job == "JOB CLASS 4" ? 'selected="selected"' : ''}>JOB CLASS 4</option>
                            
                            						

													</select>
													
													
													</td>
													<td>
													
													<select  name="smoke" class="form-control input-sm"  required>
													
                            						<option  value="YES" ${p.smoke == "YES" ? 'selected="selected"' : ''} >YES</option>
                            						<option  value="NO" ${p.smoke == "NO" ? 'selected="selected"' : ''}>NO</option>
                            						
													</select>
													
													</td>
													<td>
													
													<select  name="quit" class="form-control input-sm"Up>
													
                            						<option  value="" ${p.quit == "" ? 'selected="selected"' : ''} ></option>
                            						<option  value="Below 1 year" ${p.quit == "Below 1 year" ? 'selected="selected"' : ''}>Below 1 year</option>
                            						<option  value="1 year to 2 years" ${p.quit == "1 year to 2 years" ? 'selected="selected"' : ''} >1 year to 2 years</option>
                            						<option  value="2 years to 3 years" ${p.quit == "2 years to 3 years" ? 'selected="selected"' : ''}>2 years to 3 years</option>
                            						<option  value="3 years and above" ${p.quit == "3 years and above" ? 'selected="selected"' : ''} >3 years and above</option>
                            						
                            						
													</select>
													
													
													</td>
													<td>
													
													<select  name="illness" class="form-control input-sm"  required>
													
                            						<option  value="YES" ${p.illness == "YES" ? 'selected="selected"' : ''} >YES</option>
                            						<option  value="NO" ${p.illness == "NO" ? 'selected="selected"' : ''}>NO</option>
                            						
													</select>
													
													</td>
													<td>
													
													<select  name="gender" class="form-control input-sm" required>
													
                            						<option  value="MALE" ${p.gender == "MALE" ? 'selected="selected"' : ''} >MALE</option>
                            						<option  value="FEMALE" ${p.gender == "FEMALE" ? 'selected="selected"' : ''}>FEMALE</option>
                            						
													</select>
													
													</td>
													<td>
													<select  name="monthlypay" class="form-control input-sm"  required>
													
                            						<option  value="100 - 300" ${p.monthlypay == "100 - 300" ? 'selected="selected"' : ''} >100 - 300</option>
                            						<option  value="301 - 500" ${p.monthlypay == "301 - 500" ? 'selected="selected"' : ''}>301 - 500</option>
                            						<option  value="501 - 700" ${p.monthlypay == "501 - 700" ? 'selected="selected"' : ''} >501 - 700</option>
                            						<option  value="701 - 900" ${p.monthlypay == "701 - 900" ? 'selected="selected"' : ''}>701 - 900</option>
                            						
													</select>
													</td>
													<td>
													
													<select  name="recommend" class="form-control input-sm"  required>
													
                            						<option  value="low" ${p.recommend == "low" ? 'selected="selected"' : ''} >low</option>
                            						<option  value="medium" ${p.recommend == "medium" ? 'selected="selected"' : ''}>medium</option>
                            						<option  value="high" ${p.recommend == "high" ? 'selected="selected"' : ''}>high</option>
                            						
													</select>
													
													</td>
													<td>
													
													<input hidden readOnly size="2" type="text" name="ruleno" value="${p.ruleno}">
													<input hidden type="text" id="action" name="action">
													
													<button type="submit" onClick="updateButton()" class="btn btn-block btn-primary btn-xs">Update</button>
													<button type="submit" onClick="deleteButton()" class="btn btn-block btn-danger btn-xs">Delete</button>
													<!-- <a href="manageRule?action=view&ruleno=${p.ruleno}" class="btn btn-block btn-primary btn-xs" >Update</a>
													<a href="manageRule?action=delete&ruleno=${p.ruleno}" class="btn btn-block btn-primary btn-xs" >Delete</a>
													-->
													</td>
													</form>
												</tr>
                       
                        </c:forEach>
                       
                       
                      </tbody>
                    </table>
                     
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
    <!-- iCheck -->
    <script src="vendors/iCheck/icheck.min.js"></script>
    <!-- Datatables -->
    <script src="vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="vendors/datatables.net-scroller/js/datatables.scroller.min.js"></script>
    <script src="vendors/jszip/dist/jszip.min.js"></script>
    <script src="vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="vendors/pdfmake/build/vfs_fonts.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
    <script>
function updateButton(){
	
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


function deleteButton(){
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
</script>
    <!-- Datatables -->
    <script>
      $(document).ready(function() {
        var handleDataTableButtons = function() {
          if ($("#datatable-buttons").length) {
            $("#datatable-buttons").DataTable({
              dom: "Bfrtip",
              buttons: [
                {
                  extend: "copy",
                  className: "btn-sm"
                },
                {
                  extend: "csv",
                  className: "btn-sm"
                },
                {
                  extend: "excel",
                  className: "btn-sm"
                },
                {
                  extend: "pdfHtml5",
                  className: "btn-sm"
                },
                {
                  extend: "print",
                  className: "btn-sm"
                },
              ],
              responsive: true
            });
          }
        };

        TableManageButtons = function() {
          "use strict";
          return {
            init: function() {
              handleDataTableButtons();
            }
          };
        }();

        $('#datatable').dataTable();

        $('#datatable-keytable').DataTable({
          keys: true
        });

        $('#datatable-responsive').DataTable();

        $('#datatable-scroller').DataTable({
          ajax: "js/datatables/json/scroller-demo.json",
          deferRender: true,
          scrollY: 380,
          scrollCollapse: true,
          scroller: true
        });

        $('#datatable-fixed-header').DataTable({
          fixedHeader: true
        });

        var $datatable = $('#datatable-checkbox');

        $datatable.dataTable({
          'order': [[ 1, 'asc' ]],
          'columnDefs': [
            { orderable: false, targets: [0] }
          ]
        });
        $datatable.on('draw.dt', function() {
          $('input').iCheck({
            checkboxClass: 'icheckbox_flat-green'
          });
        });

        TableManageButtons.init();
      });
    </script>
    <!-- /Datatables -->
  </body>
</html>