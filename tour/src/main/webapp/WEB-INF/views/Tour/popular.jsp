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
<title> 인기 관광지 </title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="resources/img/favicon.ico">


<!-- CSS here -->
<link rel="stylesheet" href="resources/css/popular.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/slicknav.css">
<link rel="stylesheet" href="resources/css/animate.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">
<link rel="stylesheet" href="resources/css/fontawesome-all.min.css">
<link rel="stylesheet" href="resources/css/themify-icons.css">
<link rel="stylesheet" href="resources/css/themify-icons.css">
<link rel="stylesheet" href="resources/css/slick.css">
<link rel="stylesheet" href="resources/css/nice-select.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/responsive.css">


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
	var MAX_NUM = 23;

	var flag = false; // 어느 메뉴인지 판단
	var flag1 = false; // Enter키 사용 유무
	var flag2 = false; // Enter키 눌렀을시 ESC를 제외한 키 작동 X
	var flag3 = false;

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
		
	   new Audio('resources/sounds/Top+one+안면도+꽃다리_2002년+안면도+국제+꽃박람회를+기념하여+만든+다리_+일출과.mp3'),
	   new Audio('resources/sounds/Top+two+해미읍성_조선+시대의+대표적인+읍성이다_+읍성이란+읍을+둘러싸고+세운+평지성.mp3'),
	   new Audio('resources/sounds/Top+three+수덕사.mp3'),
	   new Audio('resources/sounds/Top+four+독립기념관_독립기념관은+우리민족의+5천년+역사+속에서+무수한+외세의+침략에.mp3'),
	   new Audio('resources/sounds/Top+five+대둔산_대둔산은+논산시를+비롯해+금산군과+전라북도+완주군이+경계를+이루면서.mp3'),
	   new Audio('resources/sounds/Top+six+현충사_+본전+내에는+이순신장군의+영정과+일생+기록화인+십경도가+있으며+국보.mp3'),
	   new Audio('resources/sounds/Top+seven+동학사_동학사는+문필봉(文筆峰)이+있어서+대+강+백들이+많이+배출된+곳으.mp3'),
	   new Audio('resources/sounds/Top+eight+광덕산_광덕산은+아산시+송악면과+천안시+광덕면을+경계로+하고+있는+산으로.mp3'),
	   
	   new Audio('resources/sounds/인스타_논산.mp3'), 
	   new Audio('resources/sounds/인스타_계룡.mp3'),
	   new Audio('resources/sounds/인스타_서산.mp3'),
	   new Audio('resources/sounds/인스타_예산.mp3'),
	   new Audio('resources/sounds/인스타_공주.mp3'),
	   new Audio('resources/sounds/인스타_보령.mp3'),
	   new Audio('resources/sounds/인스타_아산.mp3'),
	   new Audio('resources/sounds/인스타_천안.mp3'),
	   
	   new Audio('resources/sounds/태안_백화산_하산할+때는+서쪽+능선을+따라+내려가면+곰봉을+거쳐+이만봉에+닿는다_+곰봉은+.mp3'),
	   new Audio('resources/sounds/서천+_천방산_천방산은+3개면에+걸칠만큼+산자락이+넓고+큰+서천+제일의+산이다__춘장대해수.mp3'),
	   new Audio('resources/sounds/부여_구드래국민관광지_구드래는+백마강과+어울려+빼어난+경승을+이루고+조각공원이+잘+꾸며져+.mp3'),
	   new Audio('resources/sounds/당진_아미산_산이+위치하고+있는+곳은+당진시+남부에+위치하고+있는+면천면에+있는+산으로+다.mp3'),
	   new Audio('resources/sounds/금산_.mp3'),
	   new Audio('resources/sounds/청양_칠갑산도립공원_칠갑산은+해발+561M의+높이로+크고+작은+봉우리와+계곡을+지닌+명산으.mp3'),
	   new Audio('resources/sounds/홍성_.mp3')
	   

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
	
	<main>

		<!-- Hero Start-->
		<div
			class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center pt-50">
							<h2>인기 관광지</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Hero End -->
		<!--================Blog Area =================-->

		<div id="contents">
			<div class="wrap_contView">
				<h3>지역</h3>
				<table>
					<tr>
						<td><a href='${pageContext.request.contextPath}/tour_region?region=논산'>논산</a></td>
						<td><a href='${pageContext.request.contextPath}/tour_region?region=계룡'>계룡</a></td>
						<td><a href='${pageContext.request.contextPath}/tour_region?region=서산'>서산</a></td>
						<td><a href='${pageContext.request.contextPath}/tour_region?region=예산'>예산</a></td>
						<td><a href='${pageContext.request.contextPath}/tour_region?region=공주'>공주</a></td>
						<td><a href='${pageContext.request.contextPath}/tour_region?region=보령'>보령</a></td>
						<td><a href='${pageContext.request.contextPath}/tour_region?region=아산'>아산</a></td>
						<td><a href='${pageContext.request.contextPath}/tour_region?region=천안'>천안</a></td>
					</tr>
					<tr>
						<td><a href='${pageContext.request.contextPath}/tour_region?region=태안'>태안</a></td>
						<td><a href='${pageContext.request.contextPath}/tour_region?region=서천'>서천</a></td>
						<td><a href='${pageContext.request.contextPath}/tour_region?region=부여'>부여</a></td>
						<td><a href='${pageContext.request.contextPath}/tour_region?region=당진'>당진</a></td>
						<td><a href='${pageContext.request.contextPath}/tour_region?region=금산'>금산</a></td>
						<td><a href='${pageContext.request.contextPath}/tour_region?region=청양'>청양</a></td>
						<td><a href='${pageContext.request.contextPath}/tour_region?region=홍성'>홍성</a></td>					
					</tr>
				</table>

			</div>
		</div>

		<section class="blog_area section-padding">

			<div class="container">
				<div class="row">
					<div class="col-lg-8 mb-5 mb-lg-0">
						<div class="blog_left_sidebar">
							

					<!--  Top 10이 list(obj) -->
					<c:forEach var="obj" items="${list}">

							<article class="blog_item">
									<div class="blog_item_img">
											<a href="${pageContext.request.contextPath}/tour_details?name=${obj.name}">
												<img class="card-img rounded-0" src="${pageContext.request.contextPath}/tour_image?name=${obj.name}">
											</a>
										<h3 class="blog_item_date"> Top${obj.rank}</h3>
									</div>

									<div class="blog_details">
										<form action="${pageContext.request.contextPath}/tour_details?name=${obj.name}"
											method="post">
											<a class="d-inline-block" href="${pageContext.request.contextPath}/tour_details?name=${obj.name}">
												<h2>${obj.name}</h2>
											</a>
										</form>
										<p># ${obj.tag}</p>
									</div>
								</article>
						</c:forEach>


						</div>
					</div>
					<div class="col-lg-4">
						<div class="blog_right_sidebar">
							<aside class="single_sidebar_widget search_widget">
								<form
									action="${pageContext.request.contextPath}/search">
									<div class="form-group">
										<div class="input-group mb-3">
											<input type="hidden" value="all" name="type">
											<input type="text" class="form-control" name="text"
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
					</div>
				</div>
			</div>
		</section>

		<!--================Blog Area =================-->


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

	<!-- Nice-select, sticky -->
	<script src="./resources/js/jquery.nice-select.min.js"></script>
	<script src="./resources/js/jquery.sticky.js"></script>
	<script src="./resources/js/jquery.magnific-popup.js"></script>

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