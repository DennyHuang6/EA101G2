<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.employee.model.*"%>
<%@ page import="com.permission.model.*"%>
<%@ page import="com.features.model.*"%>

<%
	EmployeeVO empVO = (EmployeeVO) request.getAttribute("employeeVO");
// 	FeaturesVO feaVO = (FeaturesVO) request.getAttribute("ferturesVO");
// 	PermissionVO perVO = (PermissionVO) request.getAttribute("permissionVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>員工資料新增 - addEmployee.jsp</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/select_page_employee_css.css">
<link	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/back-end-index.css"	rel="stylesheet" type="text/css" media="all" />

<style>
	*{
		font-family:微軟正黑體;
	}
</style>

</head>
<body bgcolor='white'>

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
				<div class="container">
	
					<div class="row justify-content-center">
						<div class="col-7 text-center">
							<a href="${pageContext.request.contextPath}/back-end/backindex.jsp">
								<img src="${pageContext.request.contextPath}/images/logo.png"
								width="100" height="100" border="0">
							</a>
						</div>
					</div>
			
					<div class="row justify-content-center">
						<div id="col text-center">
							<div class="alert alert-primary text-center" role="alert">
								<h2>Miss M員工資料新增</h2>
							</div>
						</div>
					</div>
						
					<div class="row justify-content-center">
						<div id="col-7 text-center">
							<%-- 錯誤表列 --%>
							<c:if test="${not empty errorMsgs}">
								<font style="color: red">請修正以下錯誤:</font>
								<ul>
									<c:forEach var="message" items="${errorMsgs}">
										<li style="color: red">${message}</li>
									</c:forEach>
								</ul>
							</c:if>
						</div>
					</div>
					
					<div class="row align-items-center justify-content-center" >
						<div class="col-6 text-center" id="epicPreview">
							<img style="height:150px;" src="${pageContext.request.contextPath}/images/user-circle.png">
						</div>
					</div>	
			
					<FORM METHOD="post" ACTION="employee.do" name="form1" enctype="multipart/form-data">
						<div class="row justify-content-center">
							<div id="col-7 text-center">
								<table class="table table-striped table-bordered table-hover table-sm text-center">
									<tr>
										<th class="align-middle table-primary" scope="col">員工帳號</th>
										<td><input type="TEXT" name="eAccount" size="10" class="form-control"
											 value="<%= (empVO ==null ) ? "abc" : empVO.geteAccount()%>"></td>
									</tr>
									
									<tr>
										<th class="align-middle table-primary" scope="col">員工姓名</th>
										<td><input type="TEXT" name="eName" size="20" class="form-control" 
											value="<%=(empVO==null)? "羊駝" : empVO.geteName()%>" /></td>
									</tr>
									<tr>
										<th class="align-middle table-primary" scope="col">員工電話</th>
										<td><input type="TEXT" name="ePhone" size="10" class="form-control"
											value="<%= (empVO == null)? "0987654321" : empVO.getePhone()%>"/></td>
									</tr>
			
									<tr>
										<th class="align-middle table-primary" scope="col">員工信箱</th>
										<td><input type="email" name="eEmail" size="50" class="form-control"
											value="<%= (empVO == null) ? "fengptt47@gmail.com" : empVO.getePhone()%>"/></td>
									</tr>
									<tr>
										<th class="align-middle table-primary" scope="col">員工圖片</th>
										<td><input type="file" name="ePic" id="ePic"
											class="btn btn-secondary text-center"/></td>
									</tr>
									
									<tr>
										<th class="align-middle table-primary" scope="col">員工職稱</th>
										<td class="align-items-center">
									    <select name="eTitle" id="eTitle" class="custom-select d-block w-100">
									      <option name="" value="店長">店長</option>
									      <option name="" value="員工" selected="true">員工</option>
									    </select>
										</td>
									</tr>
			
									<tr>
										<th class="align-middle table-primary" scope="col">員工狀態</th>
										<td class="align-items-center">
											<select name="eStatus" class="custom-select d-block w-100">
												<option name="" value="0">離職</option>
												<option name="" value="1" selected="true">在職</option> 						
											</select> 
										</td>
									</tr>
									
<jsp:useBean id="feaSvc" scope="page" class="com.features.model.FeaturesService"/>
<%-- <jsp:useBean id="perSvc" scope="page" class="com.permission.model.PermissionService"/> --%>
									<tr>
										<th class="align-middle table-primary" scope="col">員工權限</th>
										<td class="align-items-center">
											<div class="container">
												<div class="row justify-content-md-center">
													<c:forEach var="feaVO" items="<%=feaSvc.getAll() %>">
														<div class="" style="width:50%;">
															<label><input type="checkbox" class="form-check-input" name="feanos" 
															value="${feaVO.feano}">${feaVO.feaName}</label>
															<br/>
														</div>
													</c:forEach>
												</div>
											</div>
										</td>
									</tr>
										
								</table>
							</div>
						</div>
						
						<div class="row justify-content-center">
							<input type="hidden" name="action" value="insert"> 
							<input type="submit" value="送出新增" class="btn btn-outline-success">
						</div>
					</FORM>
					
				</div>
			</div>
		</div>
	</div>

	
	<br>

	<script>
		$('#ePic').on('change',function(){
			if(typeof(FileReader) !== "underfined"){
				var epicPreview = $('#epicPreview');
				epicPreview.empty();
				var reader = new FileReader();
				
				reader.onload = function(e){
					$("<img />",{
						"src": e.target.result,
						"class":"thumb-image" ,
						"style": "border-radius:50%; width:150px; height:150px; text-align: center; margin-bottom:15px;"
					}).appendTo(epicPreview);
				}
				epicPreview.show();
				reader.readAsDataURL($(this)[0].files[0]);
			  } else {
			    alert("This browser does not support FileReader.");
			  }
		});
 	</script>
	<script src="${pageContext.request.contextPath}/js/jquery_3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>