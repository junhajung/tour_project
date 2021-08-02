<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title> 코스 </title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon" href="resources/img/favicon.ico">
<!-- CSS here -->
   <link rel="stylesheet" href="resources/css/bootstrap.min.css">
   <link rel="stylesheet" href="resources/css/slicknav.css">
   <link rel="stylesheet" href="resources/css/flaticon.css">
   <link rel="stylesheet" href="resources/css/animate.min.css">
   <link rel="stylesheet" href="resources/css/magnific-popup.css">
   <link rel="stylesheet" href="resources/css/fontawesome-all.min.css">
   <link rel="stylesheet" href="resources/css/themify-icons.css">
   <link rel="stylesheet" href="resources/css/slick.css">
   <link rel="stylesheet" href="resources/css/nice-select.css">
   <link rel="stylesheet" href="resources/css/style.css">
   <link rel="stylesheet" href="resources/css/contact.css">
            <link rel="stylesheet" href="resources/css/tourmap.css">
</head>

<body>
	<!-- Preloader Start -->
	<div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
				<div class="preloader-img pere-text">
					<img src="resources/img/logo/loder.jpg" alt="">
				</div>
			</div>
		</div>
	</div>
	<!-- Preloader Start -->
  <header>
	<!-- Header Start -->
		<div class="header-area header-transparent">
			<div class="main-header">
				<div class="header-bottom  header-sticky">
					<div class="container-fluid">
						<div class="row align-items-center">
							<!-- Logo -->
							<div class="col-xl-2 col-lg-2 col-md-1">
								<div class="logo">
									<a class="logo" href="${pageContext.request.contextPath}/home"> # TRIP </a>
								</div>
							</div>
							<div class="col-xl-10 col-lg-10 col-md-8">
								<!-- Main-menu -->
								<div class="main-menu d-none d-lg-block">
									<nav>
										<ul id="navigation">
											<li><a href="${pageContext.request.contextPath}/tourmap"> <i
													class="fas fa-map-marker-alt"></i> 관광지도
											</a></li>
											<li><a href="${pageContext.request.contextPath}/stay"> <i class="fas fa-home"></i> 숙소
											</a></li>
											<li><a href="#"> <i class="fas fa-map-signs"></i>
													관광코스
											</a>
												<ul class="submenu">
													<li><a href="${pageContext.request.contextPath}/contact">태안</a></li>
													<li><a href="${pageContext.request.contextPath}/contact1">아산</a></li>
													<li><a href="${pageContext.request.contextPath}/contact2">천안</a></li>
													<li><a href="${pageContext.request.contextPath}/contact3">공주</a></li>
													<li><a href="${pageContext.request.contextPath}/contact4">부여</a></li>
													<li><a href="${pageContext.request.contextPath}/contact5">보령</a></li>
												</ul></li>

											<li><a href="#"> <i class="fas fa-heart"></i> 인기 관광지
											</a>
												<ul class="submenu">
													<li><a href="${pageContext.request.contextPath}/popular">인기 Top8</a></li>
													<li><a href="${pageContext.request.contextPath}/blog2">인스타그램 인기</a></li>
												</ul></li>
											<li><a href="${pageContext.request.contextPath}/food"> <i class="fas fa-utensils"></i>
													맛집
											</a></li>
											<li><a href="${pageContext.request.contextPath}/activity"> <i class="fas fa-child"></i>
													액티비티
											</a></li>
											<security:authorize access="!isAuthenticated()">
												<li class="add-list"><a
													href="${pageContext.request.contextPath}/user/login">
														Sign in </a></li>
											</security:authorize>
											
											<security:authorize access="isAuthenticated()">
											<security:authorize access="hasAuthority('admin')">
												<li class="add-list"><a href="#"> My Page</a>
												<ul class="submenu">
													<li><a href="${pageContext.request.contextPath}/mymap">My place</a></li>
													<li><a href="${pageContext.request.contextPath}/user/admin_user">회원 관리</a></li>
													<li><a href="${pageContext.request.contextPath}/user/content_list">게시글 관리</a></li>
													<li><a href="${pageContext.request.contextPath}/user/logout">Logout</a></li>
												</ul></li>
											</security:authorize>
											<security:authorize access="hasAuthority('user')">
												<li class="add-list"><a href="#"> My Page</a>
												<ul class="submenu">
													<li><a href="${pageContext.request.contextPath}/mymap">My place</a></li>
													<li><a href="${pageContext.request.contextPath}/user/myreply">내 댓글 확인</a></li>
													<li><a href="${pageContext.request.contextPath}/user/myinfo">내 정보 수정</a></li>
													<li><a href="${pageContext.request.contextPath}/user/logout">Logout</a></li>
												</ul></li>
											</security:authorize>
											</security:authorize>
										</ul>

									</nav>
								</div>
							</div>
							<!-- Mobile Menu -->
							<div class="col-12">
								<div class="mobile_menu d-block d-lg-none"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Header End -->
	</header>
	
	<main>
		<!-- Hero Start-->
		<div
			class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center ">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center pt-50">
							<h2>Tour Guide</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Hero End -->

		<!-- Popular Locations Start -->
		<div class="popular-location section-padding30">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<!-- Section Tittle -->
						<div class="section-tittle text-center mb-80">
							<span>Most visited places</span>
							<h2>충남 관광지</h2>
						</div>
					</div>
				</div>


				<div id="map" style="height: 500px; width:1000px;" ></div>
				<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"> </script>
<script>
 function initMap() {
	 
	 
	 
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 9,
    center: {lat: 36.34336332178587, lng: 127.20574743353538},
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
  const iconBase = "resources/img/";
	  const icons = {
	    stay: {
	      icon: iconBase + "stay.png",
	    },
	    tour: {
	      icon: iconBase + "tour.png",
	    },
	    icon: {
	      icon: iconBase + "icon.png",
	    },
	  };
  var flightPlanCoordinates = [
	  <c:forEach items='${list2}' var="list">
	    {"lat": ${list.stx},"lng": ${list.sty}, type:"tour",},
	  </c:forEach>
	    
	    <c:forEach items='${list3}' var="list">
	    {"lat": ${list.stx},"lng": ${list.sty}, type:"stay",},
	  </c:forEach>
	    
	    <c:forEach items='${list4}' var="list">
	    {"lat": ${list.lat},"lng": ${list.lng}, type:"icon",},
	  </c:forEach>
  ];
  var locations = [
	  <c:forEach items='${list2}' var="list">
	  ['${list.name}',${list.stx}, ${list.sty}],
	  </c:forEach>  
	  <c:forEach items='${list3}' var="list">
	  ['${list.name}',${list.stx}, ${list.sty}],
	  </c:forEach>  
	  <c:forEach items='${list4}' var="list">
	  ['${list.name}',${list.lat}, ${list.lng}],
	  </c:forEach>  
    ];
  
  
  var infowindow = new google.maps.InfoWindow();
  
var marker, i;
var markers = [];
   for (i = 0; i < locations.length; i++) {  
     marker = new google.maps.Marker({
       id:i,
       position: new google.maps.LatLng(locations[i][1], locations[i][2]),
       icon: icons[flightPlanCoordinates[i].type].icon,
       map: map,
     });
	markers.push(marker);
     google.maps.event.addListener(marker, 'click', (function(marker, i) {
       return function() {
    	   infowindow.setContent(locations[i][0]);
         infowindow.open(map, marker);
       }
     })(marker, i));
     
     
   }
   
   var clusterOptions = {
		   imagePath: "https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m",
		   gridSize: 30,
		   zoomOnClick: false,
		   maxZoom: 10,
		 };
   var cluster = new MarkerClusterer(map, markers, clusterOptions)
   
   const styles = cluster.getStyles();
   for (let i=0; i<styles.length; i++) {
     styles[i].textColor = "black";
     styles[i].textSize = 10;
   }
}
 </script>

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCUGYhhiNdmmRJtBb7EFj0VVQfpVoC356o&callback=initMap"> </script>

			</div>
		</div>
		<!-- Popular Locations End -->

	</main>
	<footer>
		<!-- Footer Start-->
		<div class="footer-area">
			<div class="container">
				<div class="footer-bottom">
					<div class="row d-flex justify-content-between align-items-center">
						<div class="col-xl-9 col-lg-8">
							<div class="footer-copy-right">
								<p>@CopyRight</p>
							</div>
						</div>
						<div class="col-xl-3 col-lg-4">
							<!-- Footer Social -->
							<div class="footer-social f-right">
								<a href="https://www.facebook.com/chungnamwhere/"><i
									class="fab fa-facebook-f"></i></a> <a
									href="https://tour.chungnam.go.kr"><i class="fas fa-globe"></i></a>
								<a href="https://www.instagram.com/chungnamtour/?hl=ko"><i
									class="fab fa-instagram"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer End-->
	</footer>
	<!-- Scroll Up -->
	<div id="back-top">
		<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
	</div>


<!-- JS here -->
	<!-- All JS Custom Plugins Link Here here -->
	<script src="./resources/js/vendor/modernizr-3.5.0.min.js"></script>
	<!-- Jquery, Popper, Bootstrap -->
	<script src="./resources/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="./resources/js/popper.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script src="./resources/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="./resources/js/owl.carousel.min.js"></script>
	<script src="./resources/js/slick.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
	<script src="./resources/js/wow.min.js"></script>
	<script src="./resources/js/animated.headline.js"></script>
	<script src="./resources/js/jquery.magnific-popup.js"></script>

	<!-- Nice-select, sticky -->
	<script src="./resources/js/jquery.nice-select.min.js"></script>
	<script src="./resources/js/jquery.sticky.js"></script>

	<!-- contact js -->
	<script src="./resources/js/contact.js"></script>
	<script src="./resources/js/jquery.form.js"></script>
	<script src="./resources/js/jquery.validate.min.js"></script>
	<script src="./resources/js/mail-script.js"></script>
	<script src="./resources/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="./resources/js/plugins.js"></script>
	<script src="./resources/js/main.js"></script>

</body>
</html>