<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Meta, title, CSS, favicons, etc. -->
	<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1">

				<title>Gentellela Alela! |</title> <!-- Bootstrap -->
				<link href="vendors/bootstrap/dist/css/bootstrap.min.css"
					rel="stylesheet">
					<!-- Font Awesome -->
					<link href="vendors/font-awesome/css/font-awesome.min.css"
						rel="stylesheet">
						<!-- NProgress -->
						<link href="vendors/nprogress/nprogress.css" rel="stylesheet">
							<!-- Ion.RangeSlider -->
							<link href="vendors/normalize-css/normalize.css" rel="stylesheet">
								<link href="vendors/ion.rangeSlider/css/ion.rangeSlider.css"
									rel="stylesheet">
									<link
										href="vendors/ion.rangeSlider/css/ion.rangeSlider.skinFlat.css"
										rel="stylesheet">
										<!-- Bootstrap Colorpicker -->
										<link
											href="vendors/mjolnic-bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css"
											rel="stylesheet">

											<link href="vendors/cropper/dist/cropper.min.css"
												rel="stylesheet">

												<!-- Custom Theme Style -->
												<link href="build/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="index.html" class="site_title"><span>Health Insurance</span>
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
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>Form advanced</h3>
						</div>

						<div class="title_right">
							<div
								class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Search for..."> <span
										class="input-group-btn">
											<button class="btn btn-default" type="button">Go!</button>
									</span>
								</div>
							</div>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
									

						<!-- form input knob -->
						<div class="col-md-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>Customer Information</h2>
									
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
								
								
									<c:forEach items="${clientInfo}" var="p">
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
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Gender </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        <label class="form-control col-md-7 col-xs-12" for="first-name">${p.clientGender}</span>
                        
                         </label>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Illness </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        <label class="form-control col-md-7 col-xs-12" for="first-name">${p.clientIllness}</span>
                        
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
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Monthly Payment </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        <label class="form-control col-md-7 col-xs-12" for="first-name">${monthlypay}</span>
                        
                         </label>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Date of Birth </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        <label class="form-control col-md-7 col-xs-12" for="first-name">${p.clientDOB}</span>
                        
                         </label>
                        </div>
                      </div>
                  </div>
                  
									</c:forEach>
									<br>
									Illness color <font color="red">red</font> are not covered by insurance.
								</div>
							</div>


							<c:forEach items="${recommendPackage}" var="p">
								<div class="x_panel">
									<div class="x_title">
										<h2>${p.packageName }</h2>


										<div class="clearfix"></div>
									</div>
									<div class="x_content">
										<p>${p.packageType }</p>
										<c:forEach items="${packageDiease}" var="i">
											<div class="col-md-2">
												<c:if test="${p.packageName == i.diseaseID}">
													<c:forEach items="${clientIllness}" var="v">
														<c:if test="${i.diseaseName == v.diseaseName}">
															<font color="red">
														</c:if>
													</c:forEach>
                      ${i.diseaseName}</font>

												</c:if>
											</div>
										</c:forEach>
									</div>
								</div>
							</c:forEach>



						</div>
						<!-- /form input knob -->

					</div>




					<div class="row">
						<div class="col-md-12">

							


							

							
						</div>
					</div>
				</div>
			</div>
			<!-- /page content -->

			<!-- footer content -->
			<footer>
			<div class="pull-right">
				Gentelella - Bootstrap Admin Template by <a
					href="https://colorlib.com">Colorlib</a>
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
	<!-- bootstrap-daterangepicker -->
	<script src="js/moment/moment.min.js"></script>
	<script src="js/datepicker/daterangepicker.js"></script>
	<!-- Ion.RangeSlider -->
	<script src="vendors/ion.rangeSlider/js/ion.rangeSlider.min.js"></script>
	<!-- Bootstrap Colorpicker -->
	<script
		src="vendors/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
	<!-- jquery.inputmask -->
	<script
		src="vendors/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
	<!-- jQuery Knob -->
	<script src="vendors/jquery-knob/dist/jquery.knob.min.js"></script>
	<!-- Cropper -->
	<script src="vendors/cropper/dist/cropper.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="build/js/custom.min.js"></script>

	<!-- bootstrap-daterangepicker -->
	<script>
		$(document)
				.ready(
						function() {
							var cb = function(start, end, label) {
								console.log(start.toISOString(), end
										.toISOString(), label);
								$('#reportrange_right span').html(
										start.format('MMMM D, YYYY') + ' - '
												+ end.format('MMMM D, YYYY'));
							};

							var optionSet1 = {
								startDate : moment().subtract(29, 'days'),
								endDate : moment(),
								minDate : '01/01/2012',
								maxDate : '12/31/2015',
								dateLimit : {
									days : 60
								},
								showDropdowns : true,
								showWeekNumbers : true,
								timePicker : false,
								timePickerIncrement : 1,
								timePicker12Hour : true,
								ranges : {
									'Today' : [ moment(), moment() ],
									'Yesterday' : [
											moment().subtract(1, 'days'),
											moment().subtract(1, 'days') ],
									'Last 7 Days' : [
											moment().subtract(6, 'days'),
											moment() ],
									'Last 30 Days' : [
											moment().subtract(29, 'days'),
											moment() ],
									'This Month' : [ moment().startOf('month'),
											moment().endOf('month') ],
									'Last Month' : [
											moment().subtract(1, 'month')
													.startOf('month'),
											moment().subtract(1, 'month')
													.endOf('month') ]
								},
								opens : 'right',
								buttonClasses : [ 'btn btn-default' ],
								applyClass : 'btn-small btn-primary',
								cancelClass : 'btn-small',
								format : 'MM/DD/YYYY',
								separator : ' to ',
								locale : {
									applyLabel : 'Submit',
									cancelLabel : 'Clear',
									fromLabel : 'From',
									toLabel : 'To',
									customRangeLabel : 'Custom',
									daysOfWeek : [ 'Su', 'Mo', 'Tu', 'We',
											'Th', 'Fr', 'Sa' ],
									monthNames : [ 'January', 'February',
											'March', 'April', 'May', 'June',
											'July', 'August', 'September',
											'October', 'November', 'December' ],
									firstDay : 1
								}
							};

							$('#reportrange_right span').html(
									moment().subtract(29, 'days').format(
											'MMMM D, YYYY')
											+ ' - '
											+ moment().format('MMMM D, YYYY'));

							$('#reportrange_right').daterangepicker(optionSet1,
									cb);

							$('#reportrange_right').on('show.daterangepicker',
									function() {
										console.log("show event fired");
									});
							$('#reportrange_right').on('hide.daterangepicker',
									function() {
										console.log("hide event fired");
									});
							$('#reportrange_right')
									.on(
											'apply.daterangepicker',
											function(ev, picker) {
												console
														.log("apply event fired, start/end dates are "
																+ picker.startDate
																		.format('MMMM D, YYYY')
																+ " to "
																+ picker.endDate
																		.format('MMMM D, YYYY'));
											});
							$('#reportrange_right').on(
									'cancel.daterangepicker',
									function(ev, picker) {
										console.log("cancel event fired");
									});

							$('#options1').click(
									function() {
										$('#reportrange_right').data(
												'daterangepicker').setOptions(
												optionSet1, cb);
									});

							$('#options2').click(
									function() {
										$('#reportrange_right').data(
												'daterangepicker').setOptions(
												optionSet2, cb);
									});

							$('#destroy').click(
									function() {
										$('#reportrange_right').data(
												'daterangepicker').remove();
									});

						});
	</script>

	<script>
		$(document)
				.ready(
						function() {
							var cb = function(start, end, label) {
								console.log(start.toISOString(), end
										.toISOString(), label);
								$('#reportrange span').html(
										start.format('MMMM D, YYYY') + ' - '
												+ end.format('MMMM D, YYYY'));
							};

							var optionSet1 = {
								startDate : moment().subtract(29, 'days'),
								endDate : moment(),
								minDate : '01/01/2012',
								maxDate : '12/31/2015',
								dateLimit : {
									days : 60
								},
								showDropdowns : true,
								showWeekNumbers : true,
								timePicker : false,
								timePickerIncrement : 1,
								timePicker12Hour : true,
								ranges : {
									'Today' : [ moment(), moment() ],
									'Yesterday' : [
											moment().subtract(1, 'days'),
											moment().subtract(1, 'days') ],
									'Last 7 Days' : [
											moment().subtract(6, 'days'),
											moment() ],
									'Last 30 Days' : [
											moment().subtract(29, 'days'),
											moment() ],
									'This Month' : [ moment().startOf('month'),
											moment().endOf('month') ],
									'Last Month' : [
											moment().subtract(1, 'month')
													.startOf('month'),
											moment().subtract(1, 'month')
													.endOf('month') ]
								},
								opens : 'left',
								buttonClasses : [ 'btn btn-default' ],
								applyClass : 'btn-small btn-primary',
								cancelClass : 'btn-small',
								format : 'MM/DD/YYYY',
								separator : ' to ',
								locale : {
									applyLabel : 'Submit',
									cancelLabel : 'Clear',
									fromLabel : 'From',
									toLabel : 'To',
									customRangeLabel : 'Custom',
									daysOfWeek : [ 'Su', 'Mo', 'Tu', 'We',
											'Th', 'Fr', 'Sa' ],
									monthNames : [ 'January', 'February',
											'March', 'April', 'May', 'June',
											'July', 'August', 'September',
											'October', 'November', 'December' ],
									firstDay : 1
								}
							};
							$('#reportrange span').html(
									moment().subtract(29, 'days').format(
											'MMMM D, YYYY')
											+ ' - '
											+ moment().format('MMMM D, YYYY'));
							$('#reportrange').daterangepicker(optionSet1, cb);
							$('#reportrange').on('show.daterangepicker',
									function() {
										console.log("show event fired");
									});
							$('#reportrange').on('hide.daterangepicker',
									function() {
										console.log("hide event fired");
									});
							$('#reportrange')
									.on(
											'apply.daterangepicker',
											function(ev, picker) {
												console
														.log("apply event fired, start/end dates are "
																+ picker.startDate
																		.format('MMMM D, YYYY')
																+ " to "
																+ picker.endDate
																		.format('MMMM D, YYYY'));
											});
							$('#reportrange').on('cancel.daterangepicker',
									function(ev, picker) {
										console.log("cancel event fired");
									});
							$('#options1').click(
									function() {
										$('#reportrange').data(
												'daterangepicker').setOptions(
												optionSet1, cb);
									});
							$('#options2').click(
									function() {
										$('#reportrange').data(
												'daterangepicker').setOptions(
												optionSet2, cb);
									});
							$('#destroy').click(
									function() {
										$('#reportrange').data(
												'daterangepicker').remove();
									});
						});
	</script>

	<script>
		$(document).ready(function() {
			$('#single_cal1').daterangepicker({
				singleDatePicker : true,
				calender_style : "picker_1"
			}, function(start, end, label) {
				console.log(start.toISOString(), end.toISOString(), label);
			});
			$('#single_cal2').daterangepicker({
				singleDatePicker : true,
				calender_style : "picker_2"
			}, function(start, end, label) {
				console.log(start.toISOString(), end.toISOString(), label);
			});
			$('#single_cal3').daterangepicker({
				singleDatePicker : true,
				calender_style : "picker_3"
			}, function(start, end, label) {
				console.log(start.toISOString(), end.toISOString(), label);
			});
			$('#single_cal4').daterangepicker({
				singleDatePicker : true,
				calender_style : "picker_4"
			}, function(start, end, label) {
				console.log(start.toISOString(), end.toISOString(), label);
			});
		});
	</script>

	<script>
		$(document).ready(
				function() {
					$('#reservation').daterangepicker(
							null,
							function(start, end, label) {
								console.log(start.toISOString(), end
										.toISOString(), label);
							});
				});
	</script>
	<!-- /bootstrap-daterangepicker -->

	<!-- Ion.RangeSlider -->
	<script>
		$(document).ready(function() {
			$("#range_27").ionRangeSlider({
				type : "double",
				min : 1000000,
				max : 2000000,
				grid : true,
				force_edges : true
			});
			$("#range").ionRangeSlider({
				hide_min_max : true,
				keyboard : true,
				min : 0,
				max : 5000,
				from : 1000,
				to : 4000,
				type : 'double',
				step : 1,
				prefix : "$",
				grid : true
			});
			$("#range_25").ionRangeSlider({
				type : "double",
				min : 0,
				max : 99,
				grid : true
			});
			$("#range_26").ionRangeSlider({
				type : "double",
				min : 0,
				max : 10000,
				step : 500,
				grid : true,
				grid_snap : true
			});
			$("#range_31").ionRangeSlider({
				type : "double",
				min : 0,
				max : 100,
				from : 30,
				to : 70,
				from_fixed : true
			});
			$(".range_min_max").ionRangeSlider({
				type : "double",
				min : 0,
				max : 100,
				from : 30,
				to : 70,
				max_interval : 50
			});
			$(".range_time24").ionRangeSlider({
				min : +moment().subtract(12, "hours").format("X"),
				max : +moment().format("X"),
				from : +moment().subtract(6, "hours").format("X"),
				grid : true,
				force_edges : true,
				prettify : function(num) {
					var m = moment(num, "X");
					return m.format("Do MMMM, HH:mm");
				}
			});
		});
	</script>
	<!-- /Ion.RangeSlider -->

	<!-- Bootstrap Colorpicker -->
	<script>
		$(document).ready(function() {
			$('.demo1').colorpicker();
			$('.demo2').colorpicker();

			$('#demo_forceformat').colorpicker({
				format : 'rgba',
				horizontal : true
			});

			$('#demo_forceformat3').colorpicker({
				format : 'rgba',
			});

			$('.demo-auto').colorpicker();
		});
	</script>
	<!-- /Bootstrap Colorpicker -->

	<!-- jquery.inputmask -->
	<script>
		$(document).ready(function() {
			$(":input").inputmask();
		});
	</script>
	<!-- /jquery.inputmask -->

	<!-- jQuery Knob -->
	<script>
		$(function($) {

			$(".knob")
					.knob(
							{
								change : function(value) {
									//console.log("change : " + value);
								},
								release : function(value) {
									//console.log(this.$.attr('value'));
									console.log("release : " + value);
								},
								cancel : function() {
									console.log("cancel : ", this);
								},
								/*format : function (value) {
								 return value + '%';
								 },*/
								draw : function() {

									// "tron" case
									if (this.$.data('skin') == 'tron') {

										this.cursorExt = 0.3;

										var a = this.arc(this.cv) // Arc
										, pa // Previous arc
										, r = 1;

										this.g.lineWidth = this.lineWidth;

										if (this.o.displayPrevious) {
											pa = this.arc(this.v);
											this.g.beginPath();
											this.g.strokeStyle = this.pColor;
											this.g.arc(this.xy, this.xy,
													this.radius
															- this.lineWidth,
													pa.s, pa.e, pa.d);
											this.g.stroke();
										}

										this.g.beginPath();
										this.g.strokeStyle = r ? this.o.fgColor
												: this.fgColor;
										this.g.arc(this.xy, this.xy,
												this.radius - this.lineWidth,
												a.s, a.e, a.d);
										this.g.stroke();

										this.g.lineWidth = 2;
										this.g.beginPath();
										this.g.strokeStyle = this.o.fgColor;
										this.g.arc(this.xy, this.xy,
												this.radius - this.lineWidth
														+ 1 + this.lineWidth
														* 2 / 3, 0,
												2 * Math.PI, false);
										this.g.stroke();

										return false;
									}
								}
							});

			// Example of infinite knob, iPod click wheel
			var v, up = 0, down = 0, i = 0, $idir = $("div.idir"), $ival = $("div.ival"), incr = function() {
				i++;
				$idir.show().html("+").fadeOut();
				$ival.html(i);
			}, decr = function() {
				i--;
				$idir.show().html("-").fadeOut();
				$ival.html(i);
			};
			$("input.infinite").knob({
				min : 0,
				max : 20,
				stopper : false,
				change : function() {
					if (v > this.cv) {
						if (up) {
							decr();
							up = 0;
						} else {
							up = 1;
							down = 0;
						}
					} else {
						if (v < this.cv) {
							if (down) {
								incr();
								down = 0;
							} else {
								down = 1;
								up = 0;
							}
						}
					}
					v = this.cv;
				}
			});
		});
	</script>
	<!-- /jQuery Knob -->

	<!-- Cropper -->
	<script>
		$(document)
				.ready(
						function() {
							var $image = $('#image');
							var $download = $('#download');
							var $dataX = $('#dataX');
							var $dataY = $('#dataY');
							var $dataHeight = $('#dataHeight');
							var $dataWidth = $('#dataWidth');
							var $dataRotate = $('#dataRotate');
							var $dataScaleX = $('#dataScaleX');
							var $dataScaleY = $('#dataScaleY');
							var options = {
								aspectRatio : 16 / 9,
								preview : '.img-preview',
								crop : function(e) {
									$dataX.val(Math.round(e.x));
									$dataY.val(Math.round(e.y));
									$dataHeight.val(Math.round(e.height));
									$dataWidth.val(Math.round(e.width));
									$dataRotate.val(e.rotate);
									$dataScaleX.val(e.scaleX);
									$dataScaleY.val(e.scaleY);
								}
							};

							// Tooltip
							$('[data-toggle="tooltip"]').tooltip();

							// Cropper
							$image.on(
									{
										'build.cropper' : function(e) {
											console.log(e.type);
										},
										'built.cropper' : function(e) {
											console.log(e.type);
										},
										'cropstart.cropper' : function(e) {
											console.log(e.type, e.action);
										},
										'cropmove.cropper' : function(e) {
											console.log(e.type, e.action);
										},
										'cropend.cropper' : function(e) {
											console.log(e.type, e.action);
										},
										'crop.cropper' : function(e) {
											console.log(e.type, e.x, e.y,
													e.width, e.height,
													e.rotate, e.scaleX,
													e.scaleY);
										},
										'zoom.cropper' : function(e) {
											console.log(e.type, e.ratio);
										}
									}).cropper(options);

							// Buttons
							if (!$
									.isFunction(document
											.createElement('canvas').getContext)) {
								$('button[data-method="getCroppedCanvas"]')
										.prop('disabled', true);
							}

							if (typeof document.createElement('cropper').style.transition === 'undefined') {
								$('button[data-method="rotate"]').prop(
										'disabled', true);
								$('button[data-method="scale"]').prop(
										'disabled', true);
							}

							// Download
							if (typeof $download[0].download === 'undefined') {
								$download.addClass('disabled');
							}

							// Options
							$('.docs-toggles').on(
									'change',
									'input',
									function() {
										var $this = $(this);
										var name = $this.attr('name');
										var type = $this.prop('type');
										var cropBoxData;
										var canvasData;

										if (!$image.data('cropper')) {
											return;
										}

										if (type === 'checkbox') {
											options[name] = $this
													.prop('checked');
											cropBoxData = $image
													.cropper('getCropBoxData');
											canvasData = $image
													.cropper('getCanvasData');

											options.built = function() {
												$image.cropper(
														'setCropBoxData',
														cropBoxData);
												$image.cropper('setCanvasData',
														canvasData);
											};
										} else if (type === 'radio') {
											options[name] = $this.val();
										}

										$image.cropper('destroy').cropper(
												options);
									});

							// Methods
							$('.docs-buttons')
									.on(
											'click',
											'[data-method]',
											function() {
												var $this = $(this);
												var data = $this.data();
												var $target;
												var result;

												if ($this.prop('disabled')
														|| $this
																.hasClass('disabled')) {
													return;
												}

												if ($image.data('cropper')
														&& data.method) {
													data = $.extend({}, data); // Clone a new one

													if (typeof data.target !== 'undefined') {
														$target = $(data.target);

														if (typeof data.option === 'undefined') {
															try {
																data.option = JSON
																		.parse($target
																				.val());
															} catch (e) {
																console
																		.log(e.message);
															}
														}
													}

													result = $image.cropper(
															data.method,
															data.option,
															data.secondOption);

													switch (data.method) {
													case 'scaleX':
													case 'scaleY':
														$(this).data('option',
																-data.option);
														break;

													case 'getCroppedCanvas':
														if (result) {

															// Bootstrap's Modal
															$(
																	'#getCroppedCanvasModal')
																	.modal()
																	.find(
																			'.modal-body')
																	.html(
																			result);

															if (!$download
																	.hasClass('disabled')) {
																$download
																		.attr(
																				'href',
																				result
																						.toDataURL());
															}
														}

														break;
													}

													if ($.isPlainObject(result)
															&& $target) {
														try {
															$target
																	.val(JSON
																			.stringify(result));
														} catch (e) {
															console
																	.log(e.message);
														}
													}

												}
											});

							// Keyboard
							$(document.body).on(
									'keydown',
									function(e) {
										if (!$image.data('cropper')
												|| this.scrollTop > 300) {
											return;
										}

										switch (e.which) {
										case 37:
											e.preventDefault();
											$image.cropper('move', -1, 0);
											break;

										case 38:
											e.preventDefault();
											$image.cropper('move', 0, -1);
											break;

										case 39:
											e.preventDefault();
											$image.cropper('move', 1, 0);
											break;

										case 40:
											e.preventDefault();
											$image.cropper('move', 0, 1);
											break;
										}
									});

							// Import image
							var $inputImage = $('#inputImage');
							var URL = window.URL || window.webkitURL;
							var blobURL;

							if (URL) {
								$inputImage
										.change(function() {
											var files = this.files;
											var file;

											if (!$image.data('cropper')) {
												return;
											}

											if (files && files.length) {
												file = files[0];

												if (/^image\/\w+$/
														.test(file.type)) {
													blobURL = URL
															.createObjectURL(file);
													$image
															.one(
																	'built.cropper',
																	function() {

																		// Revoke when load complete
																		URL
																				.revokeObjectURL(blobURL);
																	}).cropper(
																	'reset')
															.cropper('replace',
																	blobURL);
													$inputImage.val('');
												} else {
													window
															.alert('Please choose an image file.');
												}
											}
										});
							} else {
								$inputImage.prop('disabled', true).parent()
										.addClass('disabled');
							}
						});
	</script>
	<!-- /Cropper -->
</body>
</html>