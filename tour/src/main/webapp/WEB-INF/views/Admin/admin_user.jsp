<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<meta charset="utf-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>회원관리</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="../resources/css/userinfo.css">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="../resources/css/slicknav.css">
<link rel="stylesheet" href="../resources/css/animate.min.css">
<link rel="stylesheet" href="../resources/css/magnific-popup.css">
<link rel="stylesheet" href="../resources/css/fontawesome-all.min.css">
<link rel="stylesheet" href="../resources/css/themify-icons.css">
<link rel="stylesheet" href="../resources/css/themify-icons.css">
<link rel="stylesheet" href="../resources/css/slick.css">
<link rel="stylesheet" href="../resources/css/nice-select.css">
<link rel="stylesheet" href="../resources/css/style.css">
<link rel="stylesheet" href="../resources/css/responsive.css">

</head>

<body>
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

      <div class="container section-padding30">

         <div class="row">

            <table class="table">
               <thead>
                  <tr>
                     <th scope="col"></th>
                     <th scope="col">USERID</th>
                     <th scope="col">EMAIL</th>
                     <th scope="col">PHONE</th>
                     <th scope="col">DATE</th>
                     <th></th>
                  </tr>
               </thead>

               <tbody>
                  <c:forEach var="list" items="${list}">
                  	<c:if test="${'a' ne list.userid}">
                     <tr>

                        <th scope="row"></th>
                        <td>${list.userid}</td>
                        <td>${list.email}</td>
                        <td>${list.phone}</td>
                        <td>${list.createdDate}</td>
                        <td><a href="${pageContext.request.contextPath}/user/delete?userid=${list.userid}" style="color: black;"  onclick="return confirm('삭제하시겠습니까?');">삭제</a></td>

                     </tr>
                     </c:if>
                  </c:forEach>
               </tbody>
            </table>

         </div>

         <div class="row">
            <div class="col-sm-12">
               <ul id="pagination" class="pagination"></ul>
            </div>
         </div>

         <!-- twbspagination cdn -->
         <script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
         <script type="text/javascript">

         $("#pagination").twbsPagination({
            totalPages : Number('${totPages}'), //model.addAttribute("totPages", 23)
            visiblePages : 10,
            startPage : Number('${param.page}'),
            initiateStartPageClick : false,
            onPageClick : function(event, page) {
               window.location.href = "${pageContext.request.contextPath}/user/admin_user?page="+page;
            }
         });
         
      </script>
      </div>
   </main>

   <!-- Scroll Up -->
   <div id="back-top">
      <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
   </div>


   <!-- JS here -->

   <!-- All JS Custom Plugins Link Here here -->
   <script src="../resources/js/vendor/modernizr-3.5.0.min.js"></script>
   <!-- Jquery, Popper, Bootstrap -->
   <script src="../resources/js/vendor/jquery-1.12.4.min.js"></script>
   <script src="../resources/js/popper.min.js"></script>
   <script src="../resources/js/bootstrap.min.js"></script>
   <!-- Jquery Mobile Menu -->
   <script src="../resources/js/jquery.slicknav.min.js"></script>

   <!-- Jquery Slick , Owl-Carousel Plugins -->
   <script src="../resources/js/owl.carousel.min.js"></script>
   <script src="../resources/js/slick.min.js"></script>
   <!-- One Page, Animated-HeadLin -->
   <script src="../resources/js/wow.min.js"></script>
   <script src="../resources/js/animated.headline.js"></script>
   <script src="../resources/js/jquery.magnific-popup.js"></script>

   <!-- Nice-select, sticky -->
   <script src="../resources/js/jquery.nice-select.min.js"></script>
   <script src="../resources/js/jquery.sticky.js"></script>

   <!-- contact js -->
   <script src="../resources/js/contact.js"></script>
   <script src="../resources/js/jquery.form.js"></script>
   <script src="../resources/js/jquery.validate.min.js"></script>
   <script src="../resources/js/mail-script.js"></script>
   <script src="../resources/js/jquery.ajaxchimp.min.js"></script>

   <!-- Jquery Plugins, main Jquery -->
   <script src="../resources/js/plugins.js"></script>
   <script src="../resources/js/main.js"></script>

</body>
</html>