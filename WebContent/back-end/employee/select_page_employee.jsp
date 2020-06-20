<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.employee.model.*"%>
<%
	EmployeeVO empVO = (EmployeeVO) request.getAttribute("employeeVO");
// 	Object obj = session.getAttribute("location");
%>

<html style="height: 100vh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>back-end-index</title>
<link	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"	rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/select_page_employee_css.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<style>
	*{
		font-family:微軟正黑體;
	}
</style>
</head>
<body>

<!-- 	  <div class="container-fluid"> -->
<!-- 	  	<div class="row" style=""> -->
<!-- 	  		<div class="col-2 bg-secondary text-light"> -->
	  		
<!-- 	  			<div class="row text-light w-100 h-auto"> -->
<!-- 						<div class="col"> -->
<!-- 							<img width=150 height=150 class="mx-auto d-block"  -->
<%-- 							src="${pageContext.request.contextPath}/back-end/employee/epicshow.do?empno=${sessionScope.employeeVO.empno}" /> --%>
<!-- 						</div> -->
<!-- 					</div> -->
					
<!-- 	  			<div class="row justify-content-center"> -->
<!-- 	  				<blockquote class="blockquote text-center"> -->
<%-- 						  <p class="mb-0 h3">${sessionScope.employeeVO.eName} 您好</p> --%>
<!-- 						</blockquote> -->
<!-- 	  			</div> -->
	  			
<!-- 	  			<div class="row shadow bg-secondary h3 justify-content-center"> -->
					 
<!-- 					 	<a class="btn btn-block btn-secondary "  -->
<%-- 					 	href="${pageContext.request.contextPath}/back-end/employee/select_page_employee.jsp"> --%>
<!-- 							<p class="h2 text-white">員工管理</p> -->
<!-- 					 	</a> -->
					  
<!-- 					 	<a class="btn btn-block btn-secondary "  -->
<%-- 					 	href="${pageContext.request.contextPath}/back-end/member/"> --%>
<!-- 							<p class="h2 text-white">會員管理</p> -->
<!-- 					 	</a> -->
					  
<!-- 					 	<a class="btn btn-block btn-secondary "  -->
<%-- 					 	href="${pageContext.request.contextPath}/back-end/"> --%>
<!-- 							<p class="h2 text-white">出餐管理</p> -->
<!-- 					 	</a> -->
					  
<!-- 					 	<a class="btn btn-block btn-secondary "  -->
<%-- 					 	href="${pageContext.request.contextPath}/back-end/booking/"> --%>
<!-- 							<p class="h2 text-white">訂位與桌位管理</p> -->
<!-- 					 	</a> -->
					  
<!-- 					 	<a class="btn btn-block btn-secondary "  -->
<%-- 					 	href="${pageContext.request.contextPath}/back-end/activity/"> --%>
<!-- 							<p class="h2 text-white">活動管理</p> -->
<!-- 					 	</a> -->
					  
<!-- 					 	<a class="btn btn-block btn-secondary "  -->
<%-- 					 	href="${pageContext.request.contextPath}/back-end/livestream/"> --%>
<!-- 							<p class="h2 text-white">直播管理</p> -->
<!-- 					 	</a> -->
					  
<!-- 					 	<a class="btn btn-block btn-secondary "  -->
<%-- 					 	href="${pageContext.request.contextPath}/back-end/liveorder/"> --%>
<!-- 							<p class="h2 text-white">餐點管理</p> -->
<!-- 					 	</a> -->
					  
<!-- 					 	<a class="btn btn-block btn-secondary "  -->
<%-- 					 	href="${pageContext.request.contextPath}/back-end/message/"> --%>
<!-- 							<p class="h2 text-white">FAQ管理</p> -->
<!-- 					 	</a> -->
					  
<!-- 					</div> -->

<!-- 	  		</div> -->
	  		
<!-- 	  		<div class="col-10 bg-light"> -->
	  			
	  			<div class="container">
						<div class="row justify-content-center">
							<div class="col-xl-6 text-center">
								<img src="${pageContext.request.contextPath}/images/logo.png"
									width="100" height="100" border="0">
							</div>
						</div>
						
						<div class="row">
							<div class="col-xl">
								<div style="height: 30px; background-color: #666;"></div>
							</div>
						</div>
						<br/>
						
						<div class="row justify-content-center ">
								<div class="col-xl-2 text-center">
									<form method="post" action="${pageContext.request.contextPath}/back-end/employee/employee.do">
										<b>選擇員工姓名:</b> 
										<select class="custom-select d-block w-100" size="" name="empno" id="">
											<c:forEach var="employeeVO" items="${empSvc.all}">
												<option value="${employeeVO.empno}">${employeeVO.eName}
											</c:forEach>
										</select> 
										<input type="hidden" name="action" value="getOne_For_Display">
										<input class="btn btn-outline-success" type="submit" value="送 出">
									</form>
								</div>
								
								<div class="col-xl-3">
									<form method="post" action="${pageContext.request.contextPath}/back-end/employee/employee.do">
										<div class="row text-center">
											<div class="col">
												<b>輸入員工編號(如E0000001):</b> 
												<input type="text" name="empno"	class="form-control"> 
												<input type="hidden" name="action" value="getOne_For_Display"> 
												<input class="btn btn-outline-success" type="submit" name="送出">
												
											</div>
										</div>
									</form>
								</div>
								
						</div>
						
						<div class="row">
							<div class="col">
								<div id="errorPage">
									<c:if test="${! empty errorMsgs}">
									<p>請修正以下錯誤:</p>
									<ul>
										<c:forEach var="message" items="${errorMsgs}">
										<li>${message}</li>
										</c:forEach>
									</ul>
									</c:if>
								</div>
							</div>
						</div>
						
						<div class="row justify-content-center">
							<div class="col-xl-3 chefPic">
								<figure class="figure">
								<figcaption class="figure-caption" style="font-size:1.3em;">新增員工</figcaption>
								<br/><br/>
								<a href="${pageContext.request.contextPath}/back-end/employee/addEmployee.jsp">
								<img src="${pageContext.request.contextPath}/images/back-end/employee/selectPage03.png" class="card-img-top" alt="...">
								</a>
								</figure>
							</div>
							
							<div class="col-xl-3 chefPic">
								<figure class="figure">
								<figcaption class="figure-caption" style="font-size:1.3em;">查詢所有員工</figcaption>
								<br/><br/>
								<a href="${pageContext.request.contextPath}/back-end/employee/listAllEmployee.jsp">
								<img src="${pageContext.request.contextPath}/images/back-end/employee/selectPage02.png" class="card-img-top" alt="...">
								</a>
								</figure> 
							</div>
							
							<div class="col-xl-3 chefPic">
								<figure class="figure">
								<figcaption class="figure-caption" style="font-size:1.3em;">個人資料修改</figcaption>
								<br/><br/>
								<a href="${pageContext.request.contextPath}/back-end/employee/update_employee_input.jsp">
								<img src="${pageContext.request.contextPath}/images/back-end/employee/selectPage01.png" class="card-img-top" alt="...">
								</a>
								</figure> 
							</div>
						</div>
						
					</div>
	  		
	  		
<!-- 	  		</div> -->
<!-- 	  	</div> -->
<!-- 	  </div> -->
	
	
	<script src="${pageContext.request.contextPath}/js/jquery_3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>