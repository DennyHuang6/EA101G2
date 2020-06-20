<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.employee.model.*"%>
<%@ page import="java.util.*"%>

<html lang="zh-Hant-TW">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Miss M員工登入</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/nprogress.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<!-- 自定義CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/back-end-login.css">
<!-- font-awesome CSS-->
<script src="https://use.fontawesome.com/0114a256f7.js"></script>

<style>
*{
/* 	font-size:1em; */
}
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
}

.container{
	margin-top:100px;
	taxt-align:center;
}

div{
	margin:15px;
}
@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<body>

<form class="form-signin" action="${pageContext.request.contextPath}/employeelogin.do" name="form2" method="post">
	<div class="container justify-content-md-center">
		<div class="row justify-content-md-center">
			<div class="col-md-5">
			
				<div class="row my-0">
					<img class="mb-4 rounded mx-auto d-block" src="${pageContext.request.contextPath}/images/logo.png" alt="MISS-M logo"
						width="150" height="150">
				</div>
				
				<div class="row justify-content-center" style="margin-top: 0px; margin-bottom: 10px;">
					<h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
				</div>
				
				<div class="row">
					<input class="form-control" type="text" id="eAccount" name="eAccount" 
						placeholder="請輸入帳號" required autofocus> 
				</div>
				
				<div class="row">
					<input class="form-control" type="password" id="ePw" name="ePw" placeholder="請輸入密碼" required>
				</div>
				
				<div class="row my-0">
					<label><input type="checkbox" value="remember-me">記住我</label>
				</div>
				
				<div class="row my-0 text-danger justify-content-md-center" >
					<c:if test="${! empty errorMsgs}" var="message">
						<c:forEach var="message" items="${errorMsgs}">
							${message}
						</c:forEach>
					</c:if>
				</div>
				
				<div class="row">
					<input type="hidden" name="action" value="login">
					<button type="submit" name="" class="btn btn-lg btn-primary btn-block">登 入</button>
				</div>
				
				<div class="row justify-content-center">
					<p class="text-muted">&copy; 2020</p>
				</div>
				
			</div>
		</div>
	</div>
</form>


	<script src="${pageContext.request.contextPath}/js/jquery_3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>