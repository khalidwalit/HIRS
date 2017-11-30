<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


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
													<td><input type="text" name="ruleno" value="${p.ruleno}">${p.ruleno}</td>
													<td>${p.age}</td>
													<td>${p.job}</td>
													<td>${p.smoke}</td>
													<td>${p.quit}</td>
													<td>${p.illness}</td>
													<td>${p.gender}</td>
													<td>${p.monthlypay}</td>
													<td>${p.recommend}</td>
													<td><button submit>view</button></td>
												</tr>
                        
                        </c:forEach>
                       
                       
                      </tbody>
                    </table>
</body>
</html>