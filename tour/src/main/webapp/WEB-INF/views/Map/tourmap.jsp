<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!doctype html>
<head>

<script type="text/javascript" src="markerclusterer_compiled.js"></script>

<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>관광지도</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
	href="resources/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="resources/css/tourmap.css">
<link rel="stylesheet" href="resources/css/slicknav.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/fontawesome-all.min.css">
<link rel="stylesheet" href="resources/css/style.css">
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


				<div id="map">
					<iframe src='http://127.0.0.1:9099/ROOT/chungnam' width=1160px,
						height=700px frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0> </iframe>
				</div>

				<br /> <br />

				<div class="row">
					<div class="col-lg-12">
						<!-- Section Tittle -->
						<div class="section-tittle text-center mb-80">
							<span>Most visited places</span>
							<h2>Tour Guide</h2>
						</div>
					</div>
				</div>


				<div class="row">
					<c:forEach var="vo" items="${list}">

						<div class="col-lg-4 col-md-6 col-sm-6">
							<div class="single-location mb-30">
								<div class="location-img">
									<img
										src="${pageContext.request.contextPath}/naver_image?title=${vo.title}">
								</div>
								<div class="location-details">
									<p>${vo.title}</p>
									<a href="${vo.link}" class="location-btn">Link</a>
								</div>
							</div>
						</div>

					</c:forEach>
				</div>


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