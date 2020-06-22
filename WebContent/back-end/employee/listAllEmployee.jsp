<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.employee.model.*"%>
<%@ page import="com.permission.model.*"%>
<%@ page import="com.features.model.*"%>

<%
	EmployeeService empSvc = new EmployeeService();
	List<EmployeeVO> list = empSvc.getAll();
	pageContext.setAttribute("list", list);
	
	PermissionService perSvc = new PermissionService();
	List<PermissionVO> perlist = perSvc.getAll();
	pageContext.setAttribute("perlist", perlist);

// 	FeaturesService feaSvc = new FeaturesService();
// 	List<FeaturesVO> fealist = feaSvc.getAll();
// 	pageContext.setAttribute("fealist", fealist);
%>

<html>
<head>
<meta charset="UTF-8">
<title>所有員工資料 listAllEmployee.jsp</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/select_page_employee_css.css">
<link	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/back-end-index.css"	rel="stylesheet" type="text/css" media="all" />

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
</style>
</head>
<body>

	<div id="page">

		<div id="header">
			<div id="logo">
				<img width=100 height=100
							src="${pageContext.request.contextPath}/back-end/employee/epicshow.do?empno=${sessionScope.employeeVO.empno}" />
				<h1>${sessionScope.employeeVO.eName} 您好</h1>
				<span><a href="" rel="" id="changeName" onclick="show()"></a></span>
			</div>
			<div id="menu">
				<ul>
					<li class="current_page_item"><a
						href="${pageContext.request.contextPath}/back-end/employee/select_page_employee.jsp" accesskey="1"
						title="">員工管理</a></li>
					<li class="current_page_item"><a href="" accesskey="2"
						title="">會員管理</a></li>
					<li class="current_page_item"><a href="" accesskey="3"
						title="">出餐管理</a></li>
					<li class="current_page_item"><a href="" accesskey="4"
						title="">訂位與桌位管理</a></li>
					<li class="current_page_item"><a href="" accesskey="5"
						title="">活動管理</a></li>
					<li class="current_page_item"><a href="" accesskey="6"
						title="">直播管理</a></li>
					<li class="current_page_item"><a href="" accesskey="7"
						title="">餐點管理</a></li>
					<li class="current_page_item"><a href="" accesskey="8"
						title="">FAQ管理</a></li>
					<li><a href="" accesskey="9" title=""></a></li>
				</ul>
			</div>
		</div>
		<div id="main">

			<div id="welcome">
			
				<%-- 錯誤表列 --%>
				<div class="container-fluid">
					<c:if test="${not empty errorMsgs}">
						<font style="color: red">請修正以下錯誤:</font>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li style="color: red">${message}</li>
							</c:forEach>
						</ul>
					</c:if>
			
					<div class="row justify-content-center">
						<div class="col-7 text-center">
							<img src="${pageContext.request.contextPath}/images/logo.png" width="100" height="100" border="0">
						</div>
					</div>
			
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover table-sm text-center justify-content-center">
							<tr class="table-primary">
								<th scope="row" class="text-nowrap">員工編號</th>
								<th scope="row" class="text-nowrap">圖片</th>
								<th scope="row" class="text-nowrap">員工帳號</th>
								<th scope="row" class="text-nowrap">員工姓名</th>
								<th scope="row" class="text-nowrap">員工電話</th>
								<th scope="row" class="text-nowrap">EMAIL</th>
								<th scope="row" class="text-nowrap">職稱</th>
								<th scope="row" class="text-nowrap">權限</th>
								<th scope="row" class="text-nowrap">狀態</th>
								<th scope="row" class="text-nowrap">修改</th>
							</tr>
							<%@ include file="page1.file"%>
							<c:forEach var="employeeVO" items="${list}" begin="<%=pageIndex%>"
								end="<%=pageIndex+rowsPerPage-1%>">
			
								<tr>
									<th scope="row" class="align-middle">${employeeVO.empno}</th>
									<td class="align-middle">
										<img width=100 height=100
										src="<%=request.getContextPath()%>/back-end/employee/epicshow.do?empno=${employeeVO.empno}" /></td>
									<td class="align-middle">${employeeVO.eAccount}</td>
<%-- 									<td class="align-middle">${employeeVO.ePw}</td> --%>
									<td class="align-middle">${employeeVO.eName}</td>
									<td class="align-middle">${employeeVO.ePhone}</td>
									<td class="align-middle">${employeeVO.eEmail}</td>
									<td class="align-middle">${employeeVO.eTitle}</td>
									<td class="align-middle">
										
										
<jsp:useBean id="feaSvc" scope="page" class="com.features.model.FeaturesService"/>
										<c:forEach var="permissionVO" items="${perlist}">
											<c:if test="${employeeVO.empno == permissionVO.empno}">
												 <c:forEach var="featuresVO" items="${feaSvc.all}">
													 <c:if test="${featuresVO.feano == permissionVO.feano}">
													 		<div class="">${featuresVO.feaName}</div>
													 </c:if>
												 </c:forEach>
											</c:if>
										</c:forEach>
									</td>
									<td class="align-middle">
										<select name="eStatus" class="" disabled>
											<option name="" value="0">離職</option>
											<option name="" value="1">在職</option>
											<option name="" value="2">留職停薪</option>
										</select>
<%-- 										${employeeVO.eStatus} --%>
									</td>
									<td class="align-middle">
										<FORM METHOD="post"
											ACTION="${pageContext.request.contextPath}/back-end/employee/employee.do">
											<input class="btn btn-secondary" type="submit" value="修改">
											<input type="hidden" name="empno" value="${employeeVO.empno}">
											<input type="hidden" name="action" value="getOne_For_Update">
										</FORM>
			<%-- 							<%= session.removeAttribute("employeeVO")%>  --%>
								</tr>
							</c:forEach>
						</table>
					</div>
					<%@ include file="page2.file"%>
				</div>
			</div>
		</div>
	</div>
	


	<script src="${pageContext.request.contextPath}/js/jquery_3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>