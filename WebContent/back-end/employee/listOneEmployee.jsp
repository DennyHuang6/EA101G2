<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.employee.model.*"%>
<%@ page import="com.permission.model.*"%>
<%@ page import="java.util.*" %>

<%
	EmployeeVO employeeVO = (EmployeeVO) request.getAttribute("employeeVO");
// 	List<PermissionVO> perlist = 
//(ArrayList<PermissionVO>) request.getAttribute("perVOlist");
	
// 	System.out.println("perVOlist: " + perlist.toString());
// 	for(PermissionVO aper : perlist){
// 		System.out.println("perlist.get: " + aper.getEmpno());
// 	}
	//EmpServlet.java(Concroller), 存入req的employeeVO物件
	//EmpServlet.java(Concroller), 存入req的PermissionVO物件
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Miss M員工個人資料</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/select_page_employee_css.css">
<link	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/back-end-index.css"	rel="stylesheet" type="text/css" media="all" />


<style>
* {
	font-family: 微軟正黑體;
}
</style>
</head>


<body>

<!-- 	<div id="page"> -->

<!-- 		<div id="header"> -->
<!-- 			<div id="logo"> -->
<!-- 				<img width=100 height=100 -->
<%-- 							src="${pageContext.request.contextPath}/back-end/employee/epicshow.do?empno=${sessionScope.employeeVO.empno}" /> --%>
<%-- 				<h1>${sessionScope.employeeVO.eName} 您好</h1> --%>
<!-- 				<span><a href="" rel="" id="changeName" onclick="show()"></a></span> -->
<!-- 			</div> -->
<!-- 			<div id="menu"> -->
<!-- 				<ul> -->
<!-- 					<li class="current_page_item"><a -->
<%-- 						href="${pageContext.request.contextPath}/back-end/employee/select_page_employee.jsp" accesskey="1" --%>
<!-- 						title="">員工管理</a></li> -->
<!-- 					<li class="current_page_item"><a href="" accesskey="2" -->
<!-- 						title="">會員管理</a></li> -->
<!-- 					<li class="current_page_item"><a href="" accesskey="3" -->
<!-- 						title="">出餐管理</a></li> -->
<!-- 					<li class="current_page_item"><a href="" accesskey="4" -->
<!-- 						title="">訂位與桌位管理</a></li> -->
<!-- 					<li class="current_page_item"><a href="" accesskey="5" -->
<!-- 						title="">活動管理</a></li> -->
<!-- 					<li class="current_page_item"><a href="" accesskey="6" -->
<!-- 						title="">直播管理</a></li> -->
<!-- 					<li class="current_page_item"><a href="" accesskey="7" -->
<!-- 						title="">餐點管理</a></li> -->
<!-- 					<li class="current_page_item"><a href="" accesskey="8" -->
<!-- 						title="">FAQ管理</a></li> -->
<!-- 					<li><a href="" accesskey="9" title=""></a></li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div id="main"> -->
			
<!-- 			<div id="welcome"> -->
			
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-xl-7 text-center">
							<img src="${pageContext.request.contextPath}/images/logo.png"
								width="100" height="100" border="0">
						</div>
					</div>
					<div class="row justify-content-center align-items-center">
						<div class="col-xl-7 text-center">
							<div class="alert alert-primary text-center" role="alert">
								<h2>Miss M員工個人資料</h2>
							</div>
						</div>
					</div>
					<div class="row justify-content-center">
						<div class="col-xl-7 text-center">
							<img width=200 height=200 style="border-radius:50%;"
								src="<%=request.getContextPath()%>/back-end/employee/epicshow.do?empno=${employeeVO.empno}" />
						</div>
					</div>

					<div class="row justify-content-center align-items-center">
						<div class="col-xl-7">
			
							<table style="margin-top:10px;"
								class="table table-striped table-bordered table-hover table-sm text-center justify-content-center">
								<thead>
									<tr>
										<th class="align-middle table-primary">員工編號</th>
										<td class="align-middle" name="empno" value="${employeeVO.empno}">${employeeVO.empno}</td>
									</tr>
									<tr>
										<th class="align-middle table-primary">帳號</th>
										<td class="align-middle">${employeeVO.eAccount}</td>
									</tr>
									<tr>
										<th class="align-middle table-primary">密碼</th>
										<td class="align-middle">${employeeVO.ePw}</td>
									</tr>
									<tr>
										<th class="align-middle table-primary">姓名</th>
										<td class="align-middle">${employeeVO.eName}</td>
									</tr>
									<tr>
										<th class="align-middle table-primary">電話</th>
										<td class="align-middle">${employeeVO.ePhone}</td>
									</tr>
									<tr>
										<th class="align-middle table-primary">EMAIL</th>
										<td class="align-middle">${employeeVO.eEmail}</td>
									</tr>
									<tr>
										<th class="align-middle table-primary">職稱</th>
										<td class="align-middle">${employeeVO.eTitle}</td>
									</tr>
									<tr>
										<th class="align-middle table-primary">狀態</th>
										<td class="align-middle">${employeeVO.eStatus}</td>
									</tr>
									
<jsp:useBean id="feaSvc" scope="page" class="com.features.model.FeaturesService"/>
<%-- <jsp:useBean id="perSvc" scope="page" class="com.permission.model.PermissionService"/> --%>
									<tr>
										<th class="align-middle table-primary">權限</th>
										<td class="align-middle">
											<div class="container">
												<div class="row justify-content-md-center">
												
													<c:forEach var="feaVO" items="${feaSvc.all }">
														<c:forEach var="perVO" items="${perVOlist}">
															<c:if test="${perVO.feano == feaVO.feano }">
														<div class="" style="width:50%;">
<!-- 															<label><input type="checkbox" class="form-check-input" id="features"  -->
<%-- 															value="${feaVO.feano}" ${(feaVO.feano == perVO.feano)? 'selected':'' } disabled=true>${feaVO.feaName}</label> --%>
<!-- 															<br/> -->
																<label><input type="checkbox" class="form-check-input" id="features" 
																value="${perVO.feano}" disabled=true checked>${feaVO.feaName}</label>
																<br/>
														</div>
															</c:if>
														</c:forEach>
													</c:forEach>
												</div>
											</div>
												
										</td>
									</tr>
								</thead>
							</table>
			
						</div>
					</div>
					<div class="row justify-content-center">
						<div class="col-xl-7 text-center">
							<form METHOD="post"	ACTION="employee.do">
								<input type="hidden" name="action" value="getOne_For_Update">
								<input type="hidden" name="empno" value="${employeeVO.empno}">
								<input class="btn btn-secondary" type="submit" value="修改資料">
							</form>
						</div>
						
					</div>
				</div>
			
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->




	<script src="${pageContext.request.contextPath}/js/jquery_3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>