<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.employee.model.*"%>

<%
	EmployeeVO employeeVO = (EmployeeVO) request.getAttribute("employeeVO");
	//EmpServlet.java(Concroller), 存入req的employeeVO物件
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Miss M員工個人資料修改</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
<!-- <!-- 				<span><a href="" rel="" id="changeName" onclick="show()"></a></span> --> 
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
			<div class="col-xl-7  text-center">
				<img src="${pageContext.request.contextPath}/images/logo.png"
					width="100" height="100" border="0">
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-xl-7  text-center">
				<div class="alert alert-primary text-center" role="alert">
					<h2>Miss M員工個人資料修改</h2>
				</div>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-xl-7  text-center">
				<img id="epicShow" width=150 height=150 style="border-radius:50%;" 
					src="<%=request.getContextPath()%>/back-end/employee/epicshow.do?empno=${employeeVO.empno}" />
			</div>
		</div>

			
	<form method="post" action="employee.do" name="form1" enctype="multipart/form-data">
<!-- 		<div class="container"> -->
			<div class="row justify-content-center">
				<div class="col-xl-7 ">
					
						<table style="margin-top:15px;"
							class="table table-striped table-bordered table-hover table-sm text-center justify-content-center">
							<tbody>
								<tr>
									<th scope="col" class=" align-middle table-primary">員工編號</th>
									<td scope="col" class=" align-middle">
									<input class="form-control" type="text" name="empno"
										value="${employeeVO.empno}" readonly="readonly"/>
									</td>
								</tr>
								<tr>
									<th scope="col" class="align-middle table-primary">帳號</th>
									<td scope="col" class="align-middle">
									<input class="form-control" type="text" name="eAccount"
										value="${employeeVO.eAccount}" readonly="readonly"/>
									</td>
								</tr>
								<tr>
									<th scope="col" class="align-middle table-primary">密碼</th>
									<td scope="col" class="align-middle"><input class="form-control" type="password" name="ePw"
										value="${employeeVO.ePw}" /></td>
								</tr>
								<tr>
									<th scope="col" class="align-middle table-primary">姓名</th>
									<td scope="col" class="align-middle"><input class="form-control" class="" type="text"
										name="eName" value="${employeeVO.eName}" /></td>
								</tr>
								<tr>
									<th scope="col" class="align-middle table-primary">電話</th>
									<td scope="col" class="align-middle"><input class="form-control" type="text"
										name="ePhone" value="${employeeVO.ePhone}" /></td>
								</tr>
								<tr>
									<th scope="col" class="align-middle table-primary">EMAIL</th>
									<td scope="col" class="align-middle"><input class="form-control" type="email"
										name="eEmail" value="${employeeVO.eEmail}" /></td>
								</tr>
								<tr class="">
									<th scope="row" class="align-middle table-primary" scope="col">員工圖片</th>
									<td scope="col" class=""><input class="btn btn-secondary" type="file" name="ePic" id="ePic"/></td>
								</tr>
								<tr class="text-center">
									<th scope="col" class="align-middle table-primary">職稱</th>
									<td scope="col" class="">
										<select name="eTitle" class="custom-select d-block w-100">
											<option name="" value="店長">店長</option>
											<option name="" value="員工" selected="true">員工</option> 						
										</select> 
									
	<%-- 								<input class="form-control" type="text"	name="eTitle" value="${employeeVO.eTitle}" /> --%>
									</td>
								</tr>
								<tr class="text-center justify-content-center center">
									<th scope="col" class="align-middle table-primary">狀態</th>
									<td scope="col" class="align-middle justify-content-center">
										<select name="eStatus" class="custom-select d-block w-100">
											<option name="" value="0">離職</option>
											<option name="" value="1" selected="true">在職</option> 		
											<option value="2">留職停薪</option>				
										</select> 
									</td>
								</tr>
	
<jsp:useBean id="feaSvc" scope="page" class="com.features.model.FeaturesService"/>
	
								<tr>
									<th scope="col" class="align-middle table-primary">權限</th>
									<td scope="col" class="align-middle">
										<div class="container">
											<div class="row justify-content-md-center">
												<c:forEach var="feaVO" items="<%=feaSvc.getAll() %>">
													<div class="" style="width:50%;">
														<label><input type="checkbox" class="form-check-input" name="feano" 
														value="${feaVO.feano}">${feaVO.feaName}</label>
														<br/>
													</div>
												</c:forEach>
											</div>
										</div>
									</td>
								</tr>
								
							</tbody>
						</table>
						
					</div>
				</div>
				
				<div class="row justify-content-center">
					<div class="col-xl-7 text-center">
						<input type="hidden" name="action" value="update">
						<input class="btn btn-secondary" type="submit" value="送出修改">		
					</div>
				</div>
				
<!-- 		</div> -->
	</form>
				
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
</div>

	<script>
		
		$(function(){
			$('#ePic').change(function(){
				var reader = new FileReader();
				var ePic = $('#ePic')[0].files[0];
				reader.readAsDataURL(ePic);
				reader.onload = function(){
					var img = $('#epicShow');
					img.attr('src',this.result);
				}
			});
		});

 	</script>
	<script src="${pageContext.request.contextPath}/js/jquery_3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>