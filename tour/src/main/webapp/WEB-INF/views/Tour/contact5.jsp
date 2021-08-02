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
        <title> 관광코스 </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
		<link rel="shortcut icon" type="image/x-icon" href="resources/img/favicon.ico">
		<!-- CSS here -->
            <link rel="stylesheet" href="resources/css/bootstrap.min.css">
            <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
            <link rel="stylesheet" href="resources/css/slicknav.css">
            <link rel="stylesheet" href="resources/css/flaticon.css">
            <link rel="stylesheet" href="resources/css/price_rangs.css">
            <link rel="stylesheet" href="resources/css/animate.min.css">
            <link rel="stylesheet" href="resources/css/magnific-popup.css">
            <link rel="stylesheet" href="resources/css/fontawesome-all.min.css">
            <link rel="stylesheet" href="resources/css/themify-icons.css">
            <link rel="stylesheet" href="resources/css/slick.css">
            <link rel="stylesheet" href="resources/css/nice-select.css">
            <link rel="stylesheet" href="resources/css/style.css">
            <link rel="stylesheet" href="resources/css/contact.css">
   </head>

   <body>
    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
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
        <div class="hero-area3 hero-overly2 d-flex align-items-center ">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8 col-lg-9">
                        <div class="hero-cap text-center pt-50 pb-20">
                            <h2>관광코스</h2>
                        </div>
                        <!--Hero form -->
                        
                    </div>
                </div>
            </div>
        </div>
        <!--Hero End -->
        <br/><br/>

        
     	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
		<script>
			$(function(){
				$('.1').click(function(){
					$('.보령냉풍욕장').show(); $('.궁중수라상').hide(); $('.대천해수욕장').hide(); $('.외연도').hide(); 
				});
				$('.2').click(function(){
					$('.보령냉풍욕장').hide(); $('.궁중수라상').show(); $('.대천해수욕장').hide(); $('.외연도').hide(); 
				});
				$('.3').click(function(){
					$('.보령냉풍욕장').hide(); $('.궁중수라상').hide(); $('.대천해수욕장').show(); $('.외연도').hide(); 
				});
	
				$('.4').click(function(){
					$('.보령냉풍욕장').hide(); $('.궁중수라상').hide(); $('.대천해수욕장').hide(); $('.외연도').show(); 
				});
	
			});
			
		</script>   
		<script>
			$(document).ready(function(){
				$(".1").trigger("click");
			});
		</script>
    	           
        <br/>
        
	  <div class ="보령">
        
        <div class="container">
        <div class="titleType1">
        	<div class="tit">
        		<h2> 보령 대천해수욕장 머드축제</h2>
        	</div>
        	<div class="area_address">
        		<span class="address"> 충청남도  </span>
        		<span id="dist">  코스총거리 : 58.3km</span>
        	</div>
        
        </div>
        <br/><br/>
        <p style="font-size: 18px;">  대한민국 충청남도 서해안에 있는 시이다. 동쪽은 청양군·부여군, 서쪽은 서해에 면하며, 남쪽은 서천군, 북쪽은 홍성군과 접하고 있다. 장항선과 서해안고속도로가 연결된다. 대천항과 대천해수욕장, 무창포해수욕장 등이 있고, 매년 보령머드축제를 개최한다.</p>
        </div>
        
        
        
        <!-- listing Area Start -->
        <div class="listing-area pt-30 pb-30">
            <div class="container">
               
                <div id="map"></div>

			      <script>
			      function initMap() {
			    	  var map = new google.maps.Map(document.getElementById('map'), {
			    	    zoom: 11,
			    	    center: {lat: 36.30172822291019, lng: 126.35391064931993},
			    	    mapTypeId: google.maps.MapTypeId.ROADMAP
			    	  });
			    	  
			    	  var flightPlanCoordinates = [
			    	    {"lat": 36.37489542414131,"lng": 126.67248945593539},
			    	    {"lat": 36.35169261698977,"lng": 126.60668822709845},
			    	    {"lat": 36.30555958942444,"lng": 126.51606601909722},
			    	    {"lat": 36.22818575130791,"lng": 126.07836355382354},
			    	    
			    	  ];

			    	  var flightPath = new google.maps.Polyline({
			    	    path: flightPlanCoordinates,
			    	    geodesic: true,
			    	    strokeColor: '#FF0000',
			    	    strokeOpacity: 1.0,
			    	    strokeWeight: 2
			    	  });

			    	  flightPath.setMap(map); 
			    	  var locations = [
			    	      ['<div class="wrap"><div class="text-box"><h4>보령냉풍욕장</h4><div class="img-box"><img src="${pageContext.request.contextPath}/imagePreview?name=보령 냉풍욕장"></div><a href="${pageContext.request.contextPath}/blog_details?name=보령 냉풍욕장"><br/><p>상세보기</p></a></div>', 36.37489542414131, 126.67248945593539],
			    	      ['<div class="wrap"><div class="text-box"><h4>궁중수라상</h4><div class="img-box"><img src="${pageContext.request.contextPath}/imagePreview11?name=궁중수라상"></div><a href="${pageContext.request.contextPath}/food_details?name=궁중수라상"><br/><p>상세보기</p></a></div>', 36.35169261698977, 126.60668822709845],
			    	      ['<div class="wrap"><div class="text-box"><h4>대천해수욕장</h4><div class="img-box"><img src="${pageContext.request.contextPath}/imagePreview?name=대천해수욕장"></div><a href="${pageContext.request.contextPath}/blog_details?name=대천해수욕장"><br/><p>상세보기</p></a></div>', 36.30555958942444, 126.51606601909722],
			    	      ['<div class="wrap"><div class="text-box"><h4>외연도</h4><div class="img-box"><img src="${pageContext.request.contextPath}/imagePreview?name=외연도"></div><a href="${pageContext.request.contextPath}/blog_details?name=외연도"><br/><p>상세보기</p></a></div>', 36.22818575130791, 126.07836355382354],
			    	    ];
			    	  
			    	  var infowindow = new google.maps.InfoWindow();
			    	  
			    	var marker, i;
		    	    for (i = 0; i < locations.length; i++) {  
		    	      marker = new google.maps.Marker({
		    	        id:i,
		    	        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
		    	        map: map
		    	      });

		    	      google.maps.event.addListener(marker, 'click', (function(marker, i) {
		    	        return function() {
		    	          infowindow.setContent(locations[i][0]);
		    	          infowindow.open(map, marker);
		    	        }
		    	      })(marker, i));
		    	    }
			    	      
			    	}
			      </script>
                 <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCUGYhhiNdmmRJtBb7EFj0VVQfpVoC356o&callback=initMap"> </script> 
            </div>
        </div>
        
        <div class="listing-details-area">
	        <div class="container">
	          <div class="row">
	          
	        	 <div class="col-lg-3 col-md-6">
	            	<div class="single-listing mb-30">
		        		 <div class="list-img" style="postion:relative" >
		        		  
		        		  <div class="1" id="cursor_test">
		           			 <img src="${pageContext.request.contextPath}/imagePreview?name=보령 냉풍욕장" style="height:200px">
		           			<span class="imtext"> 보령<br/>냉풍욕장 </span>
		           		  </div>
		     		    </div>
		      	    </div>
		        </div>
		        
		        <div class="col-lg-3 col-md-6">
	            	<div class="single-listing mb-30">
		        		 <div class="list-img">
		        		 <div class="2"  id="cursor_test">
		           			 <img src="${pageContext.request.contextPath}/imagePreview11?name=궁중수라상" style="height:200px">
		           			  <span class="imtext"> 궁중수라상 </span>
		           		 </div>
		     		    </div>
		      	    </div>
		        </div>
		        

			      
			      
		        
		        <div class="col-lg-3 col-md-6">
	            	<div class="single-listing mb-30">
		        		 <div class="list-img">
		        		 <div class="3"  id="cursor_test">
		           			 <img src="${pageContext.request.contextPath}/imagePreview?name=대천해수욕장" style="height:200px">
		           			  <span class="imtext"> 대천 <br> 해수욕장 </span>
		           		 </div>
		     		    </div>
		      	    </div>
		        </div>
		        
		        <div class="col-lg-3 col-md-6">
	            	<div class="single-listing mb-30">
		        		 <div class="list-img">
		        		 <div class="4"  id="cursor_test">
		           			 <img src="${pageContext.request.contextPath}/imagePreview?name=외연도" style="height:200px">
		           			  <span class="imtext"> 외연도 <br/> 리조트 </span>
		           	     </div>
		     		    </div>
		      	    </div>
		        </div>
		     </div>
	        </div>
        </div>
        
        <br/><br/>

      <div class="보령냉풍욕장">  
	   	  <div id="ballon"  class="container" style="border: 1px solid #e6e6e6; border-radius: 10px; text-align: center;">
	       	<div class="tit" style="text-align:center">
	       	<br/>
	       		<h2 style="text-align:bold"> 보령냉풍욕장 </h2>
	       	</div>
	       	<div  style="text-align:center">
	       		<span> 충청남도 보령시 청라면 냉풍욕장길 223 </span>
	       	</div>
	
	        <br/>
	        
	        
	        <div style="display: inline-block; position: relative; ">
		        <img src="${pageContext.request.contextPath}/imagePreview?name=보령 냉풍욕장" style=" height: 300px; width:300px; float:center; margin:20px; ">
		    	<img src="resources/img/blog/보령냉풍욕장.PNG" style=" height: 300px; width:300px; float:center; margin:20px; ">
		    	<img src="resources/img/blog/보령냉풍욕장1.PNG" style=" height: 300px; width:300px; float:center; margin:20px; ">
		    	
			</div>
        	 
        	 <br/>
        	 <span> 폭염,냉풍욕장,냉풍,보령,폐광,자연풍,자연바람,탄광 <br/> </span>
	      </div>
      </div>
      
     <div class="궁중수라상">  
	   	  <div class="container" style="border: 1px solid #e6e6e6; border-radius: 10px; text-align: center;">
	       	<div class="tit" style="text-align:center">
	       	<br/>
	       		<h2 style="text-align:bold"> 궁중수라상 </h2>
	       	</div>
	       	<div  style="text-align:center">
	       		<span> 충청남도 보령시 동대동 1044 </span>
	       	</div>
	
	        <br/>
	        
	        
	        <div style="display: inline-block; position: relative; ">
		        <img src="${pageContext.request.contextPath}/imagePreview11?name=궁중수라상" style=" height: 300px; width:300px; float:center; margin:20px; ">
		    	<img src="resources/img/blog/궁중수라상.PNG" style=" height: 300px; width:300px; float:center; margin:20px; ">
		    	<img src="resources/img/blog/궁중수라상1.PNG" style=" height: 300px; width:300px; float:center; margin:20px; ">
			</div>
        	 
        	 <br/>
        	 <span> 보령,한정식,간장게장 <br/> </span>
	      </div>
      </div>
      
      
     <div class="대천해수욕장">  
     
	   	  <div class="container" style="border: 1px solid #e6e6e6; border-radius: 10px; text-align: center;">
	       	<div class="tit" style="text-align:center">
	       	<br/>
	       		<h2 style="text-align:bold"> 대천해수욕장 </h2>
	       	</div>
	       	<div  style="text-align:center">
	       		<span>  충청남도 보령시 신흑동 일원 </span>
	       	</div>
	
	        <br/>
	        
	        
	        <div style="display: inline-block; position: relative; ">
		        <img src="${pageContext.request.contextPath}/imagePreview?name=대천해수욕장" style=" height: 300px; width:300px; float:center; margin:20px; ">
		    	<img src="resources/img/blog/대천해수욕장.PNG" style=" height: 300px; width:300px; float:center; margin:20px; ">
		    	<img src="resources/img/blog/대천해수욕장1.PNG" style=" height: 300px; width:300px; float:center; margin:20px; ">
			</div>
        	 
        	 <br/>
        	 <span> 보령,해수욕장,머드,머드축제,CNN,대천,조개구이,진흙 <br/> </span>
	      </div>
      </div>
      
      
          <div class="외연도">  
	   	  <div class="container" style="border: 1px solid #e6e6e6; border-radius: 10px; text-align: center;">
	       	<div class="tit" style="text-align:center">
	       	<br/>
	       		<h2 style="text-align:bold"> 외연도 </h2>
	       	</div>
	       	<div  style="text-align:center">
	       		<span> 충청남도 보령시 오천면 외연도1길 166-1 </span>
	       	</div>
	
	        <br/>
	        
	        
	        <div style="display: inline-block; position: relative; ">
		        <img src="${pageContext.request.contextPath}/imagePreview?name=외연도" style=" height: 300px; width:300px; float:center; margin:20px; ">
		    	<img src="resources/img/blog/외연도.PNG" style=" height: 300px; width:300px; float:center; margin:20px; ">
		    	<img src="resources/img/blog/외연도1.PNG" style=" height: 300px; width:300px; float:center; margin:20px; ">
			</div>
        	 
        	 <br/>
        	 <span> 외연도,1박2일,우럭,보령,유인도,외연열도,해무,상록수림 <br/> </span>
	      </div>
      </div>
      
      
      
        <br/><br/><br/>  
        
	</div>
		
		

			


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
                                <a href="https://www.facebook.com/chungnamwhere/"><i class="fab fa-facebook-f"></i></a>
                                <a href="https://tour.chungnam.go.kr"><i class="fas fa-globe"></i></a>
                                <a href="https://www.instagram.com/chungnamtour/?hl=ko"><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
        </div>
        <!-- Footer End-->
    </footer>
    <!-- Scroll Up -->
    <div id="back-top" >
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
        <script src="./resources/js/price-range.js"></script>
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