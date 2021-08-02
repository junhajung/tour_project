<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>MAIN 화면</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="manifest" href="site.webmanifest">
	<link rel="shortcut icon" type="image/x-icon" href="resources/img/favicon.ico">

	<!-- CSS here -->
	<link rel="stylesheet" href="resources/css/home.css">
	<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
	<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
	<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/css/flaticon.css">
	<link rel="stylesheet" href="resources/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="resources/css/nice-select.css">
	<link rel="stylesheet" href="resources/css/style.css">			
	<link rel="stylesheet" href="resources/css/slicknav.css">	
	
	
	<script>
	var start = false; // on, off
	var check = false; // start check
	var url = document.location.href.split('?start=');
	if(url[1]){
	   start = true;
	   check = true;
	}
	var i = -1;
	var j = -1;
	var a = 0;
	var b = 0;
	
	var flag = false; // 어느 메뉴인지 판단
	var flag1 = false; // Enter키 사용 유무
	var flag2 = false; // Enter키 눌렀을시 ESC를 제외한 키 작동 X
	
	var select = new Audio('resources/sounds/선택하시겠습니까_.mp3')
	var cancel = new Audio('resources/sounds/취소하셨습니다.mp3')
	var starts = new Audio('resources/sounds/기능을+시작합니다.mp3')
	var stop = new Audio('resources/sounds/기능을+종료합니다.mp3')
	
	var audioFile = [
	      new Audio('resources/sounds/숙소.mp3'), 
	      new Audio('resources/sounds/인기+Top+eight.mp3'), // 추가
	      new Audio('resources/sounds/인스타그램+인기순위.mp3'), // 추가
	      new Audio('resources/sounds/맛집.mp3'),
	      new Audio('resources/sounds/액티비티.mp3')
	]
	
	
	window.addEventListener("keydown", (e) => {
	  const key = document.getElementById(e.key);
	  
	  if(start){
	  if(!flag2){
	  if(e.key == "1"){ 
	     flag = false;
	     console.log(i);
	     if (key) {
	        i++;
	        if (i <= 4)
	           key.classList.add(audioFile[i].play());
	        if (i == 5){
	           i = 0;
	           key.classList.add(audioFile[i].play());
	        }
	        else
	           i = 0;
	     }
	  }
	  else if(e.key == "2"){
	     flag = false;
	     if(key){
	        i--;
	        if(i == -2 || i == -1){
	           i = 4;
	           key.classList.add(audioFile[i].play());
	        }
	        if(i >= 0){
	           key.classList.add(audioFile[i].play());
	        }
	     }
	  }

	  }
	  if(e.key == "Enter"){
	     console.log(flag);
	     if(key){
	        if (a == 0){
	           flag1 = true;
	           flag2 = true;
	           a++;
	              key.classList.add(select.play()); // 선택하시겠습니까?
	        }
	        if (a == 1){
	           move();
	        }
	     }
	  }
	  
	  else if(e.key == "Escape"){
	     if(key){
	        if(flag1){
	           flag1 = false;
	           flag2 = false;
	           a = 0;
	           key.classList.add(cancel.play()); // 취소하셨습니다.
	        }
	     }
	  }
	  if(check){
	  if(e.key == "F2"){
	     check = false;
	     i = -1;
	     j = -1;
	     history.replaceState({}, null, location.pathname);
	     if(key) {start = false;
	     key.classList.add(stop.play()); // 기능을 종료합니다.
	  }
	  }
	  }
	  
	  }
	  if (!check){
	  if(e.key == "F2"){
	        check = true;
	     if(key) {start = true;
	     key.classList.add(starts.play()); // 기능을 시작합니다.
	     }
	  }
	  }
	});
	
	function move(){
	   console.log(flag);
	   if(!flag){
	      
	   if (i == 0)
	      location.href = "/ROOT/stay?start="  + start
	   else if (i == 1)
	      location.href = "/ROOT/popular?start="  + start
	   else if (i == 2)
	      location.href = "/ROOT/instagram?start="  + start
	   else if (i == 3)
	      location.href = "/ROOT/food?start="  + start
	   else if (i == 4)
	      location.href = "/ROOT/activity?start="  + start
	   }
	}
 </script>
																			
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
  
 		<div id="1"></div>
		<div id="2"></div>
		<div id="3"></div>
		<div id="q"></div>
		<div id="w"></div>
		<div id="Enter"></div>
		<div id="Escape"></div>
		<div id="F2"></div>
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
											<li>
												<a href="${pageContext.request.contextPath}/tourmap"> 
												<i class="fas fa-map-marker-alt"></i> 관광지도 </a>
											</li>
											
											<li> 
												<a href="${pageContext.request.contextPath}/stay"> <i class="fas fa-home"></i> 숙소 </a>
											</li>
											
											<li><a href="#"> <i class="fas fa-map-signs"></i> 관광코스 </a>
												<ul class="submenu">
													<li><a href="${pageContext.request.contextPath}/contact">태안</a></li>
													<li><a href="${pageContext.request.contextPath}/contact1">아산</a></li>
													<li><a href="${pageContext.request.contextPath}/contact2">천안</a></li>
													<li><a href="${pageContext.request.contextPath}/contact3">공주</a></li>
													<li><a href="${pageContext.request.contextPath}/contact4">부여</a></li>
													<li><a href="${pageContext.request.contextPath}/contact5">보령</a></li>
												</ul>
											</li>

											<li><a href="#"> <i class="fas fa-heart"></i> 인기 관광지 </a>
												<ul class="submenu">
													<li><a href="${pageContext.request.contextPath}/popular">인기 Top8</a></li>
													<li><a href="${pageContext.request.contextPath}/instagram">인스타그램 인기</a></li>
												</ul>
											</li>
											
											<li>
												<a href="${pageContext.request.contextPath}/food"> 
												<i class="fas fa-utensils"></i> 맛집 </a>
											</li>
											
											<li>
												<a href="${pageContext.request.contextPath}/activity"> 
												<i class="fas fa-child"></i> 액티비티 </a>
											</li>
											
											<security:authorize access="!isAuthenticated()">
												<li class="add-list">
													<a href="${pageContext.request.contextPath}/user/login"> Sign in </a>
												</li>
											</security:authorize>
											
											<security:authorize access="isAuthenticated()">
											<security:authorize access="hasAuthority('admin')">
												<li class="add-list"><a href="#"> My Page</a>
													<ul class="submenu">
														<li><a href="${pageContext.request.contextPath}/mymap">My place</a></li>
														<li><a href="${pageContext.request.contextPath}/user/admin_user">회원 관리</a></li>
														<li><a href="${pageContext.request.contextPath}/user/content_list">게시글 관리</a></li>
														<li><a href="${pageContext.request.contextPath}/user/logout">Logout</a></li>
													</ul>
												</li>
											</security:authorize>
											<security:authorize access="hasAuthority('user')">
												<li class="add-list"><a href="#"> My Page</a>
													<ul class="submenu">
														<li><a href="${pageContext.request.contextPath}/mymap">My place</a></li>
														<li><a href="${pageContext.request.contextPath}/user/myreply">내 댓글 확인</a></li>
														<li><a href="${pageContext.request.contextPath}/user/myinfo">내 정보 수정</a></li>
														<li><a href="${pageContext.request.contextPath}/user/logout">Logout</a></li>
													</ul>
												</li>
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
		<!-- Hero Area Start-->
		<div class="slider-area">
				<!-- 비디오 Start-->
					<div class="video-container">
						<video id="background_video" playsinline="playsinline" muted="muted" preload="yes"
							autoplay="autoplay" loop="loop" id="vjs_video_739_html5_api"
							class="video-js" data-setup='{"autoplay":"any"}' >
							
							<source src="./resources/img/hashtrip1.mp4" type="video/mp4" >
						</video>
					</div>
				
			  <div class="slider-height d-flex align-items-center">
					<div class="container">
					<div class="row justify-content-center">
				
						<div class="col-xl-8 col-lg-9">
							<!-- Hero Caption -->
							<div class="hero__caption">
								<span>Explore the city</span>
								<h1>Discover Great Place</h1>
							</div>

							<!--Hero form -->
							<form action="${pageContext.request.contextPath}/search" method="get" class="search-box">
								<div class="input-form">
									<input type="text" name="text" placeholder="What are you looking for?">
								</div>

								<div class="select-form">
									<div class="select-itms">
										<select name="type" id="select1">
											<option value="all">전체</option>
											<option value="place">숙소</option>
											<option value="eat">맛집</option>
											<option value="tour">관광</option>
										</select>
									</div>
								</div>
								<div class="search-form">
									<input type="submit" value="Search"/>
								</div>
							</form>
						</div>
						</div>
						
					</div>
				</div>
		</div>
		<!--Hero Area End-->
</main>


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