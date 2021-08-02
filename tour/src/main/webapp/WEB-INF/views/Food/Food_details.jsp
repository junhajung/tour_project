<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" crossorigin="anonymous"></script>
<style>
#map {
	height: 300px;
	width: 100%;
}
</style>

<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>food detail</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="resources/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/searchdetail.css">
<link rel="stylesheet" href="resources/css/slicknav.css">
<link rel="stylesheet" href="resources/css/animate.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">
<link rel="stylesheet" href="resources/css/fontawesome-all.min.css">
<link rel="stylesheet" href="resources/css/themify-icons.css">
<link rel="stylesheet" href="resources/css/slick.css">
<link rel="stylesheet" href="resources/css/nice-select.css">
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
			class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center pt-50">
							<h2>음식점 상세</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Hero End -->
		
		<!--================Blog Area =================-->

		<section class="blog_area single-post-area section-padding">

			<div class="container">
				<div class="row">

					<security:authorize access="isAuthenticated() ">
						<security:authorize access="hasAuthority('user')">
							<div class="col-lg-8 posts-list">
								<div class="single-post">

									<div class="feature-img">
										<img class="card-img rounded-0"
											src="${pageContext.request.contextPath}/food_image?name=${foodlist.name}">
									</div>

									<div class="blog_details">

										<h2>${foodlist.name}</h2>


										<p class="excert">${foodlist.content}</p>



										<!--  https://themify.me/themify-icons  -->
										<div class="col-lg-12 offset-lg-0">
											<div class="media contact-info">
												<span class="contact-info__icon"><i
													class="ti-location-pin"></i></span>
												<div class="media-body">
													<h3>주소 : &nbsp; &nbsp; ${foodlist.addr}</h3>

												</div>
											</div>
											<div class="media contact-info">
												<span class="contact-info__icon"><i
													class="ti-line-double"></i></span>
												<div class="media-body">
													<h3>카테고리 : ${foodlist.kate}</h3>
												</div>
											</div>
											<div class="media contact-info">
												<span class="contact-info__icon"><i
													class="ti-info-alt"></i></span>
												<div class="media-body">
													<h3>연락처 :&nbsp; &nbsp; ${foodlist.phone}</h3>
												</div>
											</div>

										</div>


										<div id="map"></div>

										<script>
											function initMap() {

												var map = new google.maps.Map(
														document
																.getElementById('map'),
														{
															zoom : 16,
															center : new google.maps.LatLng(
																	'${foodlist.lat}',
																	'${foodlist.lng}'),
														});

												var infowindow = new google.maps.InfoWindow();

												var marker, i;
												marker = new google.maps.Marker(
														{
															id : i,
															position : new google.maps.LatLng(
																	'${foodlist.lat}',
																	'${foodlist.lng}'),
															map : map
														});

												google.maps.event
														.addListener(
																marker,
																'click',
																(function(
																		marker,
																		i) {
																	return function() {
																		infowindow
																				.setContent('${foodlist.addr}');
																		infowindow
																				.open(
																						map,
																						marker);
																	}
																})(marker, i));
											}
										</script>
										<script async defer
											src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCUGYhhiNdmmRJtBb7EFj0VVQfpVoC356o&callback=initMap">
											
										</script>

									</div>
								</div>
							</div>
						</security:authorize>
					</security:authorize>



					<security:authorize access="isAuthenticated() ">
						<security:authorize access="hasAuthority('admin')">
							<div class="col-lg-8 posts-list">
								<div class="single-post">
									<form action="${pageContext.request.contextPath}/user/content_update"
										method="post" enctype="multipart/form-data">
										<input type="hidden" value="food" name="role"> <input
											type="hidden" value="${foodlist.id}" name="id"> <input
											type="hidden" value="${foodlist.name}" name="prename">
										<input
											type="hidden" value="" name="info"> <input
											type="hidden" value="" name="tag"> <input
											type="hidden" value="" name="others"> <input
											type="hidden" value="" name="subtitle">
										<div class="feature-img">
											<img class="card-img rounded-0"
												src="${pageContext.request.contextPath}/food_image?name=${foodlist.name}">
										</div>




										<div class="form-group">
											<input type="file" name="img1" style="display: block;"
												id="files" /> <br />
										</div>

										<div class="blog_details">

											<h2>
												<input name="name" value="${foodlist.name}"
													class="form-control">
											</h2>


											<p class="excert">
												<textarea style="height: 300px;" name="content"
													class="form-control">${foodlist.content}</textarea>

											</p>



											<!--  https://themify.me/themify-icons  -->
											<div class="col-lg-12 offset-lg-0">
												<div class="media contact-info">
													<span class="contact-info__icon"><i
														class="ti-location-pin"></i></span> 주소 : &nbsp; &nbsp; <input
														value=" ${foodlist.addr}" name="addr" class="form-control">

												</div>
												<div class="media contact-info">
													<span class="contact-info__icon"><i
														class="ti-line-double"></i></span> <label>카테고리:&nbsp;&nbsp;</label>
													<select name="kate" id="kateid">
														<option value="${foodlist.kate}">${foodlist.kate}</option>
														<option value="한식">한식</option>
														<option value="중식">중식</option>
														<option value="양식">양식</option>
														<option value="일식">일식</option>
													</select>

												</div>
												<div class="media contact-info">
													<span class="contact-info__icon"><i
														class="ti-info-alt"></i></span> 연락처 :&nbsp; &nbsp; <input
														value="${foodlist.phone}" name="phone"
														class="form-control">
												</div>

												<div class="media contact-info">
													<span class="contact-info__icon"><i
														class="ti-info-alt"></i></span> 메뉴 : &nbsp; &nbsp;<input
														value="${foodlist.menu}" name="menu" class="form-control">
												</div>

												<div class="media contact-info">
													<span class="contact-info__icon"><i
														class="ti-info-alt"></i></span>
													<div class="media-body">
														<h3>
															위도 : <input value="${foodlist.lat}" name="lat"
																class="form-control">
														</h3>
													</div>
												</div>
												<div class="media contact-info">
													<span class="contact-info__icon"><i
														class="ti-info-alt"></i></span>
													<div class="media-body">
														<h3>
															경도 : <input value="${foodlist.lng}" name="lng"
																class="form-control">
														</h3>
													</div>
												</div>

												<div class="media contact-info">
													<span class="contact-info__icon"><i
														class="ti-info-alt"></i></span> <label>지역:&nbsp;&nbsp;</label> <select
														name="region" id="stayid">
														<option selected="${foodlist.region}">
															${foodlist.region}</option>
														<option value="논산">논산</option>
														<option value="계룡">계룡</option>
														<option value="서산">서산</option>
														<option value="예산">예산</option>
														<option value="공주">공주</option>
														<option value="보령">보령</option>
														<option value="아산">아산</option>
														<option value="천안">천안</option>
														<option value="태안">태안</option>
														<option value="서천">서천</option>
														<option value="부여">부여</option>
														<option value="당진">당진</option>
														<option value="금산">금산</option>
														<option value="청양">청양</option>
														<option value="홍성">홍성</option>
													</select>
												</div>
												<div style="text-align: center; margin-bottom: 20px;">
													<input type="submit" class="btn btn-success" value="수정" />
												</div>

											</div>

										</div>
									</form>
								</div>
							</div>

						</security:authorize>
					</security:authorize>


					<security:authorize access="!isAuthenticated() ">
						<div class="col-lg-8 posts-list">
							<div class="single-post">

								<div class="feature-img">
									<img class="card-img rounded-0"
										src="${pageContext.request.contextPath}/food_image?name=${foodlist.name}">
								</div>

								<div class="blog_details">

									<h2>${foodlist.name}</h2>


									<p class="excert">${foodlist.content}</p>



									<!--  https://themify.me/themify-icons  -->
									<div class="col-lg-12 offset-lg-0">
										<div class="media contact-info">
											<span class="contact-info__icon"><i
												class="ti-location-pin"></i></span>
											<div class="media-body">
												<h3>주소 : &nbsp; &nbsp; ${foodlist.addr}</h3>

											</div>
										</div>
										<div class="media contact-info">
											<span class="contact-info__icon"><i
												class="ti-line-double"></i></span>
											<div class="media-body">
												<h3>카테고리 : ${foodlist.kate}</h3>
											</div>
										</div>
										<div class="media contact-info">
											<span class="contact-info__icon"><i
												class="ti-info-alt"></i></span>
											<div class="media-body">
												<h3>연락처 : &nbsp; &nbsp;${foodlist.phone}</h3>
											</div>
										</div>

									</div>


									<div id="map"></div>

									<script>
										function initMap() {

											var map = new google.maps.Map(
													document
															.getElementById('map'),
													{
														zoom : 16,
														center : new google.maps.LatLng(
																'${foodlist.lat}',
																'${foodlist.lng}'),
													});

											var infowindow = new google.maps.InfoWindow();

											var marker, i;
											marker = new google.maps.Marker(
													{
														id : i,
														position : new google.maps.LatLng(
																'${foodlist.lat}',
																'${foodlist.lng}'),
														map : map
													});

											google.maps.event
													.addListener(
															marker,
															'click',
															(function(marker, i) {
																return function() {
																	infowindow
																			.setContent('${foodlist.addr}');
																	infowindow
																			.open(
																					map,
																					marker);
																}
															})(marker, i));
										}
									</script>
									<script async defer
										src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCUGYhhiNdmmRJtBb7EFj0VVQfpVoC356o&callback=initMap">
										
									</script>

								</div>
							</div>
						</div>
					</security:authorize>



					<div class="col-lg-4">
						<div class="blog_right_sidebar">
							<aside class="single_sidebar_widget search_widget">
								<form action="${pageContext.request.contextPath}/search">
									<div class="form-group">
										<div class="input-group mb-3">
											<input type="hidden" value="all" name="type"> <input
												type="text" class="form-control" name="text"
												placeholder='Search Keyword' onfocus="this.placeholder = ''"
												onblur="this.placeholder = 'Search Keyword'">
											<div class="input-group-append">
												<button class="btns" value="Search" type="submit">
													<i class="ti-search"></i>
												</button>
											</div>
										</div>
									</div>

									<button
										class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
										type="submit" value="Search">Search</button>
								</form>
							</aside>


						</div>

						<div class="blog_right_sidebar">
							<aside class="single_sidebar_widget search_widget">
								<h4 class="widget_title">Comments ( ${cntReply} )</h4>
								<form
									action="${pageContext.request.contextPath}/food_details?name=${foodlist.name}"
									method="post">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}">


									<div class="form-group">
										<security:authorize access="isAuthenticated()">
											<security:authorize access="hasAuthority('user')">
												<div class="input-group mb-3">
													<textarea class="form-control" name="reply" id="reply"
														rows="3" cols="1" placeholder='댓글을 입력하세요.'></textarea>
													<div class="input-group-append">
														<button
															class="button rounded-0 primary-bg text-white w-100 btn_1"
															id="button" type="submit">등록</button>
													</div>
												</div>
											</security:authorize>
										</security:authorize>

										<security:authorize access="isAuthenticated()">
											<security:authorize access="hasAuthority('admin')">
												<div class="input-group mb-3">
													<textarea class="form-control" name="reply" id="reply" rows="3" cols="1" placeholder='관리자는 댓글 사용이 불가합니다' readonly></textarea>
													<div class="input-group-append">
														<button
															class="button rounded-0 primary-bg text-white w-100 btn_1" id="button" type="submit">등록</button>
													</div>
												</div>
											</security:authorize>
										</security:authorize>

										<security:authorize access="!isAuthenticated()">
											<div class="input-group mb-3">
												<textarea class="form-control" name="reply" id="reply"
													rows="3" cols="1" placeholder='댓글을 입력하세요.'></textarea>
												<div class="input-group-append">
													<button
														class="button rounded-0 primary-bg text-white w-100 btn_1"
														id="button" type="submit">등록</button>
												</div>
											</div>
										</security:authorize>

										<c:forEach var="list" items="${replyList}">
											<div class="input-group mb-3">

												내용 : ${list.reply} <br /> 작성자 : ${list.userid}
												<div class="time hidden-xs">
													작성시간 :
													<fmt:formatDate value="${list.createdDate}"
														pattern="yyyy/MM/dd HH:mm" />
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

													<div style="float: right;">

														<security:authorize access="isAuthenticated()">
															<security:authorize access="hasAuthority('user')">
																<security:authentication property="principal.username"
																	var="user_id" />
																<c:if test="${user_id eq list.userid}">
																	<a href="${pageContext.request.contextPath}/reply/reply_delete?id=${list.id}&name=${list.name}"
																		style="color: black;">삭제</a>
																</c:if>
															</security:authorize>

															<security:authorize access="hasAuthority('admin')">
																<a
																	href="${pageContext.request.contextPath}/reply/reply_delete?id=${list.id}&name=${list.name}"
																	style="color: black;">삭제</a>
															</security:authorize>
														</security:authorize>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</form>
							</aside>
						</div>

					</div>
				</div>
			</div>
		</section>
		<!--================ Blog Area end =================-->
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
	s
	<script src="./resources/js/plugins.js"></script>
	<script src="./resources/js/main.js"></script>

</body>

</html>