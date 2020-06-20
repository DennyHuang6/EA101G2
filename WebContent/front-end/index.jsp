<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.employee.model.*"%>
<%
	//put memVO Object
	EmployeeVO empVO = (EmployeeVO) request.getAttribute("employeeVO");
	
%>

<html lang="zh-Hant-TW">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<title>Miss M</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/nprogress.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<!-- 自定義CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/front-end-index.css">
<!-- font-awesome CSS-->
<script src="https://use.fontawesome.com/0114a256f7.js"></script>

<style>
* {
	font-family: 微軟正黑體;
}

.banner-block {
	position: absolute;
	top: 25%;
	left: -40%;
	color: #EEE;
}

.banner-block h1 {
	font-size: 5em;
}

.banner-block p {
	font-size: 2em;
}

.mtb-30 {
	margin: 30px;
}

.w-80 {
	width: 80%;
}

.chefinfo {
	font-size: 1.8em;
}

.chefinfo {
	margin: auto;
}
/* Always set the map height explicitly to define the size of the div
* element that contains the map. */
#map {
	height: 100%;
}
/* Optional: Makes the sample page fill the window. */
/* html, body { */
/* 	height: 100%; */
/* 	margin: 0; */
/* 	padding: 0; */
/* } */
</style>

</head>
<body>

	<!-- first navbar -->
	<div class="container-fluid">
		<div class="row">

			<div class="col">
				<div class="header-user-info">
					<a id="member" href="#"> <i class="fa fa-user"></i> 會員中心
					</a> <a id="cart" href="#"> <i class="fa fa-shopping-cart"></i> 購物車
					</a> <a id="myfavor" href="#"> <i class="fa fa-heart"></i> 追蹤清單
					</a> <a id="menberlogin" href="menberRegPage.html"> <i
						class="fa fa-unlock-alt"></i> 會員登入
					</a>
<!-- 					<div class="dropdown-menu"> -->
<!-- 						<form class="px-4 py-3"> -->
<!-- 							<div class="form-group"> -->
<!-- 								<label for="exampleDropdownFormEmail1">帳號</label> <input -->
<!-- 									type="email" class="form-control" id="account" -->
<!-- 									placeholder="..."> -->
<!-- 							</div> -->
<!-- 							<div class="form-group"> -->
<!-- 								<label for="exampleDropdownFormPassword1">密碼</label> <input -->
<!-- 									type="password" class="form-control" id="password" -->
<!-- 									placeholder="..."> -->
<!-- 							</div> -->
<!-- 							<div class="form-group"> -->
<!-- 								<div class="form-check"> -->
<!-- 									<input type="checkbox" class="form-check-input" -->
<!-- 										id="dropdownCheck"> <label class="form-check-label" -->
<!-- 										for="dropdownCheck"> 記住我 </label> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<button id="submitBtn" type="submit" class="btn btn-primary"> -->
<!-- 								登 入</button> -->
<!-- 						</form> -->
<!-- 						<div class="dropdown-divider"></div> -->
<!-- 						<a class="dropdown-item" href="#">註冊</a> <a class="dropdown-item" -->
<!-- 							href="#">忘記密碼</a> -->
<!-- 					</div> -->
					<a href="#" style="display: none;"> <i
						class="fa fa-share-square"></i> 會員登出
					</a>
				</div>
			</div>
		</div>
	</div>


	<!-- second navbar -->
	<div class="header-bottom container">

		<nav class="secondnavbar navbar navbar-expand-xl navbar-light">
			<a class="navbar-brand" href="index.html"><img
				src="../images/logo.png" alt="Miss M logo"
				style="width: 70px; height: 70px;"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="#">首頁</a>
					</li>

					<li class="nav-item"><a class="nav-link" href="#">線上訂餐</a></li>

					<li class="nav-item"><a class="nav-link"
						href="booking/booking.html">線上訂位</a></li>

					<li class="nav-item"><a class="nav-link" href="#">活動快訊</a></li>

					<li id="livestream" class="nav-item"><a class="nav-link"
						href="#">直播間</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> FAQ </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">關於我們</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
						</div></li>
				</ul>
				<form class="form-inline">
					<div class="">
						<input class="form-control mr-sm-2" type="search"
							placeholder="Search" aria-label="Search">
					</div>
					<div class="">
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
					</div>
				</form>
			</div>
		</nav>

	</div>


	<div id="main" class="container">
		<!-- 輪播 data-interval控制速度-->
		<div id="carousel" class="carousel slide" data-ride="carousel"
			data-interval="2500">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
			</ol>

			<div class="carousel-inner" style="width: 100%; height: auto;">
				<div class="carousel-item active">
					<img src="../images/front-end/indexImg/0003.jpg"
						class="w-100 img-responsive d-sm-flex" alt="甜點1">
					<div class="carousel-caption d-none d-md-block banner-block">
						<h1>輕鬆環境</h1>
						<p>品嘗就是要讓自己放鬆享受</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="../images/front-end/indexImg/0005.jpg"
						class="w-100 img-responsive d-sm-flex" alt="甜點2">
					<div class="carousel-caption d-none d-md-block banner-block">
						<h1>美味餐點</h1>
						<p>家人、朋友分享的美食饗宴</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="../images/front-end/indexImg/0006.jpg"
						class="w-100 img-responsive d-sm-flex" alt="甜點3">
					<div class="carousel-caption d-none d-md-block banner-block">
						<h1>休閒氣氛</h1>
						<p>讓你捨不得回家的愉悅心情</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="../images/front-end/indexImg/草莓_巧克力.jpg"
						class="w-100 img-responsive d-sm-flex" alt="甜點4">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<!-- memu info -->
		<div class="row mtb-30">
			<div class="col text-center">
				<img src="../images/front-end/indexImg/introduce-title2.jpg"
					class="img-fluid" alt="">
			</div>
		</div>


		<!-- restaurant introduction -->

		<div class="row mtb-30">
			<div class="col text-center mx-auto d-block">
				<img src="../images/front-end/indexImg/introduce-title1.jpg" alt=""
					class="img-fluid">
			</div>
		</div>
		<div class="introduce-bg2">
			<div class="row">
				<div class="col-md" style="width: auto;">
					<img src="../images/front-end/indexImg/introduce-2.jpg"
						class="img-fluid img-thumbnail">
				</div>
				<div class="col-md Caption">
					<p>精湛廚藝，一味入魂，食的藝術</p>
				</div>
				<div class="col-md" style="width: auto;">
					<img src="../images/front-end/indexImg/introduce-3.jpg"
						class="img-fluid img-thumbnail">
				</div>
				<div class="col-md Caption">
					<p>動物友善，歡迎毛小孩與其他寵物</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md" style="width: auto;">
					<img src="../images/front-end/indexImg/introduce-4.jpg"
						class="img-fluid img-thumbnail">
				</div>
				<div class="col-md Caption">
					<p>健康取向，好的食材、合理的價格</p>
				</div>
				<div class="col-md" style="width: auto;">
					<img src="../images/front-end/indexImg/introduce-5.jpg"
						class="img-fluid img-thumbnail">
				</div>
				<div class="col-md Caption">
					<p>主廚當家，美味把關，道道精彩</p>
				</div>
			</div>
		</div>


		<!-- chef info -->
		<div class="row mtb-30">
			<div class="col text-center">
				<img src="../images/front-end/indexImg/introduce-title3.jpg"
					class="img-fluid" alt="">
			</div>
		</div>
		<div class="row w-80 chefinfo">
			<div class="col-sm col-md">
				<figure class="figure">
					<img src="../images/front-end/indexImg/chef-2.jpg"
						class="img-fluid" alt="">
					<figcaption class="figure-caption text-right">行政主廚 -
						Peter Wu</figcaption>
				</figure>
			</div>
			<div class="col-sm col-md">
				<figure class="figure">
					<img src="../images/front-end/indexImg/chef-3.jpg"
						class="img-fluid" alt="">
					<figcaption class="figure-caption text-right">第一主廚 -
						MARY JANE</figcaption>
				</figure>
			</div>
			<div class="col-sm col-md">
				<figure class="figure">
					<img src="../images/front-end/indexImg/chef-1.jpg"
						class="img-fluid" alt="">
					<figcaption class="figure-caption text-right">首席主廚 -
						Jeff Lee</figcaption>
				</figure>
			</div>
		</div>

	</div>

	<div class="jumbotron text-center footer-height">
		<h3>My Google Maps Demo</h3>
		<!--The div element for the map -->
		<div id="map" width=100% height=100></div>
		<h1 class="sidplay-4">Miss M</h1>
		<p class="lead">營業時間：00：00~24：00 全年無休</p>
		<p class="lead">連絡電話：03-4567890</p>
		<p class="lead">地址：桃園市中壢區中央路300號</p>
		<p class="lead">聯繫方式：Miss_M@miss.com.tw</p>
		<img src="../images/front-end/indexImg/applestore.jpg" alt="appstore"
			id="appStoreImg">
	</div>


	<script src="../js/main.js"></script>
	<script src="../js/nprogress.js"></script>

	<script>
		// Initialize and add the map
		function initMap() {
			// The location of Uluru, 
			var iii = {
				lat : 24.967774,
				lng : 121.191631
			};
			// The map, centered at Uluru
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 9,
				center : iii
			});
			// The marker, positioned at Uluru
			var marker = new google.maps.Marker({
				position : iii,
				map : map
			});
		}
	</script>

	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=key&callback=initMap">
		
	</script>
	<script src="${pageContext.request.contextPath}/js/jquery_3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>