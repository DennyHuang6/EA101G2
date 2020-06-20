<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.employee.model.*"%>
<%
	EmployeeVO empVO = (EmployeeVO) request.getAttribute("employeeVO");
	Object obj = session.getAttribute("location");
%>

<html style="height: 100vh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>back-end-index</title>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<style>
	*{
		font-family:微軟正黑體;
	}
	
	.banner img{
		display: inline-block;
		width: 100px;
    height: 100px;
		border-radius: 50%;
		padding: 20px;
		position: relative;
		left: 330px;
		filter: brightness(0.95);
		animation:  rotation .1s infinite linear;
	}
	@keyframes rotation {
    from {-webkit-transform: rotate(0deg);}
    to   {-webkit-transform: rotate(359deg);}
    }
</style>
</head>
<body background="${pageContext.request.contextPath}/images/back-end/back-bg.jpg">

	  <div class="container-fluid" style="hegiht:100vh;">
	  	<div class="row" >
	  		<div class="col-2 bg-secondary text-light border border-dark border-right">
	  		
	  			<div class="row text-light w-100 h-auto">
						<div class="col">
							<img width=150 height=150 class="mx-auto d-block" 
							src="${pageContext.request.contextPath}/back-end/employee/epicshow.do?empno=${employeeVO.empno}" />
						</div>
					</div>
					
	  			<div class="row justify-content-center">
	  				<blockquote class="blockquote text-center">
						  <p class="mb-0 h3">${employeeVO.eName} 您好</p>
						</blockquote>
	  			</div>
	  			
	  			<div class="row shadow bg-secondary h3 justify-content-center">
					 
					 	<a class="btn btn-block btn-secondary " 
					 	href="${pageContext.request.contextPath}/back-end/employee/select_page_employee.jsp">
							<p class="h2 text-white">員工管理</p>
					 	</a>
					  
					 	<a class="btn btn-block btn-secondary " 
					 	href="${pageContext.request.contextPath}/back-end/member/">
							<p class="h2 text-white">會員管理</p>
					 	</a>
					  
					 	<a class="btn btn-block btn-secondary " 
					 	href="${pageContext.request.contextPath}/back-end/">
							<p class="h2 text-white">出餐管理</p>
					 	</a>
					  
					 	<a class="btn btn-block btn-secondary " 
					 	href="${pageContext.request.contextPath}/back-end/booking/">
							<p class="h2 text-white">訂位與桌位管理</p>
					 	</a>
					  
					 	<a class="btn btn-block btn-secondary " 
					 	href="${pageContext.request.contextPath}/back-end/activity/">
							<p class="h2 text-white">活動管理</p>
					 	</a>
					  
					 	<a class="btn btn-block btn-secondary " 
					 	href="${pageContext.request.contextPath}/back-end/livestream/">
							<p class="h2 text-white">直播管理</p>
					 	</a>
					  
					 	<a class="btn btn-block btn-secondary " 
					 	href="${pageContext.request.contextPath}/back-end/liveorder/">
							<p class="h2 text-white">餐點管理</p>
					 	</a>
					  
					 	<a class="btn btn-block btn-secondary " 
					 	href="${pageContext.request.contextPath}/back-end/message/">
							<p class="h2 text-white">FAQ管理</p>
					 	</a>
					  
					</div>

	  		</div>
	  		
	  		<div class="col-10" style="padding:0;">
							
	  			<div class="container-fluid">
						<div class="row banner bg-secondary">
							<img src="${pageContext.request.contextPath}/images/back-end/indexImg/cakeroll.png"	alt="">
							<img src="${pageContext.request.contextPath}/images/back-end/indexImg/cakeroll.png"	alt="">
							<img src="${pageContext.request.contextPath}/images/back-end/indexImg/cakeroll.png"	alt="">
							<img src="${pageContext.request.contextPath}/images/back-end/indexImg/cakeroll.png"	alt="">
							<img src="${pageContext.request.contextPath}/images/back-end/indexImg/cakeroll.png"	alt="">
							<img src="${pageContext.request.contextPath}/images/back-end/indexImg/cakeroll.png"	alt="">
							<img src="${pageContext.request.contextPath}/images/back-end/indexImg/cakeroll.png"	alt="">
							<img src="${pageContext.request.contextPath}/images/back-end/indexImg/cakeroll.png"	alt="">
						</div>
						
						<!-- 放置區開始 -->
						<div class="row" id="back-end-main-area" >
														
						</div>						
						<!-- 放置區結束 -->
						
					</div>
	  		
	  		</div>
	  	</div>
	  </div>
	
	
	<script src="${pageContext.request.contextPath}/js/jquery_3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>