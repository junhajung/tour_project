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
<title>숙소</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon" href="resources/img/favicon.ico">
<!-- CSS here -->
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/css/slicknav.css">
	<link rel="stylesheet" href="resources/css/tourmap.css">
	<link rel="stylesheet" href="resources/css/flaticon.css">
	<link rel="stylesheet" href="resources/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="resources/css/style.css">
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
	var MAX_NUM = 6;
	
	var flag = false; // 어느 메뉴인지 판단
	var flag1 = false; // Enter키 사용 유무
	var flag2 = false; // Enter키 눌렀을시 ESC를 제외한 키 작동 X
	var flag3 = false; // Enter키 
	
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
	
	var audioFile1 = [
	   new Audio('resources/sounds/관광호텔___천안센트럴관광호텔_충남+천안시+서북구+성정공원+오로+육십사_총+객실+육십+스탠 (1).mp3'), 
	   new Audio('resources/sounds/콘도_리조트___천안상록리조트_충남+천안시+동남구+수신면+수신로+오백칠십육_총+객실+이백오 (1).mp3'),
	   new Audio('resources/sounds/굿스테이___에벤에셀펜션_충남+태안군+원북면+신두해변길+삼십구+다시+사_가족룸+십일+그룹룸.mp3'),
	   new Audio('resources/sounds/한옥스테이___공주한옥마을_충남+공주시+관광단지길+십이_고마관+여덟동+나루관+세동+웅진관+.mp3'),
	   new Audio('resources/sounds/펜션___바다사랑_충남+보령시+대천항일길+육십칠+다시+삼십_럭셔리룸+팔+디럭스룸+육+캠핑카.mp3'),
	   new Audio('resources/sounds/가족호텔___천안상록리조트+상록호텔_충남+천안시+수신면+수신로+오백칠십육_총+객실+백+__.mp3')
	]
	
	
	window.addEventListener("keydown", (e) => {
		  const key = document.getElementById(e.key);
		  
		  if(start){
		  if(!flag2){
		  if(e.key == "1"){ 
		     flag = false;
		     flag3 = true;
			 
		     console.log(i);
		     if (key) {
		        i++;
		        if (i <= 4){
		        	if(j != -1){
		        	audioFile1[j].pause();
		        	audioFile1[j].currentTime = 0;
		        	}
		        	key.classList.add(audioFile[i].play());
		        }
		           
		        if (i == 5){
		        	if(j != -1){
		        	audioFile1[j].pause();
		        	audioFile1[j].currentTime = 0;
		        	}
		           i = 0;
		           key.classList.add(audioFile[i].play());
		        }
		        else
		           i = 0;
		     }
		  }
		  else if(e.key == "2"){
		     flag = false;
		     flag3 = true;
		     if(key){
		        	i--;
		        if(i == -2 || i == -1){
		        	if(j != -1){
		        	audioFile1[j].pause();
		        	audioFile1[j].currentTime = 0;
		        	}
		           i = 4;
		           key.classList.add(audioFile[i].play());
		        }
		        if(i >= 0){
		        	if(j != -1){
		        	audioFile1[j].pause();
		        	audioFile1[j].currentTime = 0;
		        	}
		           key.classList.add(audioFile[i].play());
		        }
		     }
		  }
		  else if(e.key == "q"){ 
			     flag = true;
			     flag3 = false;
			     if (key) {
			        j++;
			        console.log(j);
			        if (j <= MAX_NUM - 1){
			        	if(j != 0){
				        	audioFile1[j-1].pause();
				        	audioFile1[j-1].currentTime = 0;
				        }
			           key.classList.add(audioFile1[j].play());
			        }
			        if (j == MAX_NUM){
			        	 audioFile1[j-1].pause();
				           audioFile1[j-1].currentTime = 0;
			           j = 0;
			           key.classList.add(audioFile1[j].play());
			        }
			        else
			           j = 0;
			     }
			  }
			  else if(e.key == "w"){
			     flag = true;
			     flag3 = false;
			     if(key){
			        	j--;
			        if(j == -2 || j == -1){
			        	if(j != -2){
			        	audioFile1[j+1].pause();
			        	audioFile1[j+1].currentTime = 0;
			        	}
			           j = MAX_NUM - 1;
			           key.classList.add(audioFile1[j].play());
			        }
			        if(j >= 0){
			        	audioFile1[j+1].pause();
			        	audioFile1[j+1].currentTime = 0;
			           key.classList.add(audioFile1[j].play());
			        }
			     }
			  }
			  }
		  
		  if(flag3){
			  if(e.key == "Enter"){
				     console.log(flag);
				     if(key){
				        if (a == 0){
				           flag1 = true;
				           flag2 = true;
				           a++;
				           if(j != -1){
				           audioFile1[j].pause();
				        	audioFile1[j].currentTime = 0;
				           }
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
			           if(j != -1){
			           audioFile1[j].pause();
			        	audioFile1[j].currentTime = 0;
			           }
			           key.classList.add(cancel.play()); // 취소하셨습니다.
			        }
			     }
			  }
		  }
		  
		  
		  if(check){
		  if(e.key == "F2"){
			  if(j != -1){
				  audioFile1[j].pause();
			      audioFile1[j].currentTime = 0;
				  }
		     check = false;
		     i = -1;
		     j = -1;
		     history.replaceState({}, null, location.pathname);
		     if(key) {
		    	 start = false;
		     	key.classList.add(stop.play()); // 기능을 종료합니다.
		  	}
		  }
		  }
		  
		  }
		  if (!check){
		  if(e.key == "F2"){
		        check = true;
		     if(key) {
		    	 start = true;
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
	
	
	 <audio data-key="49" src="resources/sounds/관광지도.mp3"></audio>
	
	
	<main>

		<!-- Hero Start-->
		<div
			class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center ">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center pt-50">
							<h2> Stay </h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!--Hero End -->
		<!-- Categories Area Start -->
		<div class="categories-area section-padding30">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<!-- Section Tittle -->
						<div class="section-tittle text-center mb-80">
							<span>We are offering for you</span>
							<h2> Stay </h2>
						</div>
					</div>
				</div>


				<div class="row">

					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="single-cat text-center mb-50">
							<div class="cat-icon">
								<a href="${pageContext.request.contextPath}/staykate_list?name=관광호텔">
									<span class="flaticon-bed"></span>
								</a>
							</div>

							<div class="cat-cap">
								<h5>
									<a href="${pageContext.request.contextPath}/staykate_list?name=관광호텔">관광호텔
									</a>
								</h5>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="single-cat text-center mb-50">
							<div class="cat-icon">
								<a href="${pageContext.request.contextPath}/staykate_list?name=콘도/리조트">
									<span class="flaticon-bed"></span>
								</a>
							</div>

							<div class="cat-cap">
								<h5>
									<a href="${pageContext.request.contextPath}/staykate_list?name=콘도/리조트">콘도/리조트
									</a>
								</h5>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="single-cat text-center mb-50">
							<div class="cat-icon">
								<a href="${pageContext.request.contextPath}/staykate_list?name=굿스테이">
									<span class="flaticon-home"></span>
								</a>
							</div>

							<div class="cat-cap">
								<h5>
									<a href="${pageContext.request.contextPath}/staykate_list?name=굿스테이">굿스테이
									</a>
								</h5>
							</div>
						</div>
					</div>


					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="single-cat text-center mb-50">
							<div class="cat-icon">
								<a href="${pageContext.request.contextPath}/staykate_list?name=한옥스테이">
									<span class="flaticon-bed"></span>
								</a>
							</div>

							<div class="cat-cap">
								<h5>
									<a href="${pageContext.request.contextPath}/staykate_list?name=한옥스테이">한옥스테이
									</a>
								</h5>
							</div>
						</div>
					</div>


					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="single-cat text-center mb-50">
							<div class="cat-icon">
								<a href="${pageContext.request.contextPath}/staykate_list?name=펜션">
									<span class="flaticon-bed"></span>
								</a>
							</div>

							<div class="cat-cap">
								<h5>
									<a href="${pageContext.request.contextPath}/staykate_list?name=펜션">펜션
									</a>
								</h5>
							</div>
						</div>
					</div>


					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="single-cat text-center mb-50">
							<div class="cat-icon">
								<a href="${pageContext.request.contextPath}/staykate_list?name=가족호텔">
									<span class="flaticon-respect"></span>
								</a>
							</div>

							<div class="cat-cap">
								<h5>
									<a href="${pageContext.request.contextPath}/staykate_list?name=가족호텔">가족호텔
									</a>
								</h5>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
		<!-- Categories Area End -->


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