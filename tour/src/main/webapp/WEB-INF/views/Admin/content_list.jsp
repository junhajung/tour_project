<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta charset="utf-8">
<script type = "text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title> 게시글 관리 </title>
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
<body>

<br/><br/><br/>
<div class="container">
<div class="row">
	 		
	 	<div class="col-md-3">
	 		<br/>
	 		
	 			
	            	<div class="col-sm-5 control-label">
	                	<label for="kateid">카테고리</label>
	            	</div>
	            	<div class="col-sm-10">
	           		<select name="kateid" class="form-control" onchange="select(value)" id="select">
	           			<option value="selec" selected="selected"> 선택하세요 </option>
						<option value="stay"> stay </option>
						<option value="tour"> tour </option>
						<option value="food"> food </option>
					</select> 
					</div>
      			 
				<script>
					function select(value){
						if(value=="stay"){
							$('#tour1').hide();
							$('#food1').hide();
							$('#stay1').show();
							$('#stay1').html(
							'<form  action="${pageContext.request.contextPath}/user/content_insert" method="post" enctype="multipart/form-data">' +
							  '<input type="hidden" value="stay" name="role">' +
							  '<input type="hidden" value="" name="subtitle">' +
							  '<input type="hidden" value="" name="menu">' +
							  '<input type="hidden" value="" name="phone">' +
							  '<input type="hidden" value="" name="others">' +
							  '<input type="hidden" value="" name="tag">' +
							  
							  
							  '<div class="form-group">'+
							  	'<input type="file" name="img1"  style="display: block;" id="files" required/> <br/>'+
			  				  '</div>'+	
								
							  '<div class="form-group">'+
				            	'<div class="col-sm-5 control-label">'+
				                	'<label for="id">상호명</label>'+
				            	'</div>'+
				           		 '<div class="col-sm-10 text-left">'+
				              	 	 '<input type="text" class="form-control" name="name"  placeholder="name" required>'+ 
				            	 '</div>'+
			      			 '</div>'+
			      			 '<div class="form-group">'+
				            	'<div class="col-sm-5 control-label">'+
				                	'<label for="id">위도</label>'+
				            	'</div>'+
				           		 '<div class="col-sm-10 text-left">'+
				              	 	 '<input type="text" class="form-control" name="lat"  placeholder="lat" required>'+ 
				            	 '</div>'+
			      			 '</div>'+
			      			 '<div class="form-group">'+
				            	'<div class="col-sm-5 control-label">'+
				                	'<label for="id">경도</label>'+
				            	'</div>'+
				           		 '<div class="col-sm-10 text-left">'+
				              	 	 '<input type="text" class="form-control" name="lng"  placeholder="lng" required>'+ 
				            	 '</div>'+
			      			 '</div>'+
			      			'<div class="form-group">'+
			            	'<div class="col-sm-5 control-label">'+
			                	'<label for="id">지역</label>'+
			            	'</div>'+
			           		 '<div class="col-sm-10 text-left">'+
					             '<select name="region" class="form-control">'+
			           			'<option selected="selected"> 선택하세요 </option>' +
								'<option> 논산 </option>' +
								'<option> 계룡 </option>' +
								'<option> 서산 </option>' +
								'<option> 예산 </option>' +
								'<option> 공주 </option>' +
								'<option> 보령 </option>' +
								'<option> 아산 </option>' +
								'<option> 천안 </option>' +
								'<option> 태안 </option>' +
								'<option> 서천 </option>' +
								'<option> 부여 </option>' +
								'<option> 당진 </option>' +
								'<option> 금산 </option>' +
								'<option> 청양 </option>' +
								'<option> 홍성 </option>' +
								'</select>' + 
			            	 '</div>'+
		      			 '</div>'+
			      		'<div class="form-group">'+
			            	'<div class="col-sm-5 control-label">'+
			                	'<label for="id">카테고리</label>'+
			            	'</div>'+
			           		 '<div class="col-sm-10 text-left">'+
					             '<select name="kate" class="form-control">'+
			           			'<option selected="selected"> 선택하세요 </option>' +
								'<option> 관광호텔 </option>' +
								'<option> 콘도/리조트 </option>' +
								'<option> 굿스테이 </option>' +
								'<option> 한옥스테이 </option>' +
								'<option> 펜션 </option>' +
								'<option> 가족호텔 </option>' +
								'</select>' + 
			            	 '</div>'+
		      			 '</div>'+
		      			'<div class="form-group">'+
		            	'<div class="col-sm-5 control-label">'+
		                	'<label for="id">주소</label>'+
		            	'</div>'+
		           		 '<div class="col-sm-10 text-left">'+
		              	 	 '<input type="text" class="form-control" name="addr"  placeholder="주소" required>'+ 
		            	 '</div>'+
	      			 '</div>'+
	      			'<div class="form-group">'+
	            	'<div class="col-sm-5 control-label">'+
	                	'<label for="id">객실정보</label>'+
	            	'</div>'+
	           		 '<div class="col-sm-10 text-left">'+
	              	 	 '<input type="text" class="form-control" name="info"  placeholder="객실정보" required>'+ 
	            	 '</div>'+
      			 '</div>'+
			      			 '<div class="form-group">'+
				            	'<div class="col-sm-5 control-label">'+
				                	'<label for="id">상세설명</label>'+
				            	'</div>'+
				           		 '<div class="col-sm-10 text-left">'+
				              	 	 '<textarea name="content" rows="15" placeholder="상세설명을 입력하세요." class="form-control"></textarea>'+ 
				            	 '</div>'+
			      			 '</div>'+
			      			 
			      			'<div class="input-group" style = "display: flex; justify-content: center; align-items: center;" >'+	
			                 '<input type="submit" value="상품등록" class="btn btn-success" value="제출" />'+
			                 '</div>'+
						 '</form>'
							  )
						}
						
						if(value=="tour"){
							$('#stay1').hide();
							$('#food1').hide();
							$('#tour1').show();
							$('#tour1').html(
								'<form  action="${pageContext.request.contextPath}/user/content_insert" method="post" enctype="multipart/form-data">' +
								  '<input type="hidden" value="tour" name="role">' +
								  '<input type="hidden" value="" name="menu">' +
								  '<input type="hidden" value="" name="phone">' +
								  '<input type="hidden" value="" name="info">' +
								  
								  '<div class="form-group">'+
								  	'<input type="file" name="img1"  style="display: block;" id="files" required/> <br/>'+
				  				  '</div>'+	
									
								  '<div class="form-group">'+
					            	'<div class="col-sm-5 control-label">'+
					                	'<label for="id">관광지명</label>'+
					            	'</div>'+
					           		 '<div class="col-sm-10 text-left">'+
					              	 	 '<input type="text" class="form-control" name="name"  placeholder="name" required>'+ 
					            	 '</div>'+
				      			 '</div>'+
				      			 '<div class="form-group">'+
					            	'<div class="col-sm-5 control-label">'+
					                	'<label for="id">위도</label>'+
					            	'</div>'+
					           		 '<div class="col-sm-10 text-left">'+
					              	 	 '<input type="text" class="form-control" name="lat"  placeholder="lat" required>'+ 
					            	 '</div>'+
				      			 '</div>'+
				      			 '<div class="form-group">'+
					            	'<div class="col-sm-5 control-label">'+
					                	'<label for="id">경도</label>'+
					            	'</div>'+
					           		 '<div class="col-sm-10 text-left">'+
					              	 	 '<input type="text" class="form-control" name="lng"  placeholder="lng" required>'+ 
					            	 '</div>'+
				      			 '</div>'+
				      			'<div class="form-group">'+
				            	'<div class="col-sm-5 control-label">'+
				                	'<label for="id">지역</label>'+
				            	'</div>'+
				           		 '<div class="col-sm-10 text-left">'+
						             '<select name="region" class="form-control">'+
				           			'<option selected="selected"> 선택하세요 </option>' +
									'<option> 논산 </option>' +
									'<option> 계룡 </option>' +
									'<option> 서산 </option>' +
									'<option> 예산 </option>' +
									'<option> 공주 </option>' +
									'<option> 보령 </option>' +
									'<option> 아산 </option>' +
									'<option> 천안 </option>' +
									'<option> 태안 </option>' +
									'<option> 서천 </option>' +
									'<option> 부여 </option>' +
									'<option> 당진 </option>' +
									'<option> 금산 </option>' +
									'<option> 청양 </option>' +
									'<option> 홍성 </option>' +
									'</select>' + 
				            	 '</div>'+
			      			 '</div>'+
			      			'<div class="form-group">'+
			            	'<div class="col-sm-5 control-label">'+
			                	'<label for="id">주소</label>'+
			            	'</div>'+
			           		 '<div class="col-sm-10 text-left">'+
			              	 	 '<input type="text" class="form-control" name="addr"  placeholder="주소" required>'+ 
			            	 '</div>'+
		      			 '</div>'+
		      			'<div class="form-group">'+
		            	'<div class="col-sm-5 control-label">'+
		                	'<label for="id">카테고리</label>'+
		            	'</div>'+
		           		 '<div class="col-sm-10 text-left">'+
		              	 	 '<input type="text" class="form-control" name="kate"  placeholder="카테고리" required>'+ 
		            	 '</div>'+
	      			 	'</div>'+
			      		'<div class="form-group">'+
			            	'<div class="col-sm-5 control-label">'+
			                	'<label for="id">태그</label>'+
			            	'</div>'+
			           		 '<div class="col-sm-10 text-left">'+
			              	 	 '<input type="text" class="form-control" name="tag"  placeholder="태그" required>'+ 
			            	 '</div>'+
		      			 '</div>'+
			      			'<div class="form-group">'+
			            	'<div class="col-sm-5 control-label">'+
			                	'<label for="id">타이틀</label>'+
			            	'</div>'+
			           		 '<div class="col-sm-10 text-left">'+
			              	 	 '<input type="text" class="form-control" name="subtitle"  placeholder="타이틀" required>'+ 
			            	 '</div>'+
		      			 '</div>'+
			      			'<div class="form-group">'+
			            	'<div class="col-sm-5 control-label">'+
			                	'<label for="id">휠체어 진입 여부</label>'+
			            	'</div>'+
			           		 '<div class="col-sm-10 text-left">'+
			              	 	 '<input type="text" class="form-control" name="others"  placeholder="휠체어 진입 여부" required>'+ 
			            	 '</div>'+
			  			 '</div>'+
		      			 '<div class="form-group">'+
			            	'<div class="col-sm-5 control-label">'+
			                	'<label for="id">상세설명</label>'+
			            	'</div>'+
			           		 '<div class="col-sm-10 text-left">'+
			              	 	 '<textarea name="content" rows="15" placeholder="상세설명을 입력하세요." class="form-control"></textarea>'+ 
			            	 '</div>'+
		      			 '</div>'+
		      			 
		      			'<div class="input-group" style = "display: flex; justify-content: center; align-items: center;" >'+	
		                 '<input type="submit" value="상품등록" class="btn btn-success" value="제출" />'+
		                 '</div>'+
						  '</form>'
							  )
						}
						if(value=="food"){
							$('#tour1').hide();
							$('#stay1').hide();
							$('#food1').show();
							$('#food1').html(
								'<form  action="${pageContext.request.contextPath}/user/content_insert" method="post" enctype="multipart/form-data">' +
								  '<input type="hidden" value="food" name="role">' +
								  '<input type="hidden" value="" name="tag">' +
								  '<input type="hidden" value="" name="subtitle">' +
								  '<input type="hidden" value="" name="others">' +
								  '<input type="hidden" value="" name="info">' +
								  
								  
								  '<div class="form-group">'+
								  	'<input type="file" name="img1"  style="display: block;" id="files" required/> <br/>'+
				  				  '</div>'+	
									
								  '<div class="form-group">'+
					            	'<div class="col-sm-5 control-label">'+
					                	'<label for="id">상호명</label>'+
					            	'</div>'+
					           		 '<div class="col-sm-10 text-left">'+
					              	 	 '<input type="text" class="form-control" name="name"  placeholder="name" required>'+ 
					            	 '</div>'+
				      			 '</div>'+
				      			 '<div class="form-group">'+
					            	'<div class="col-sm-5 control-label">'+
					                	'<label for="id">위도</label>'+
					            	'</div>'+
					           		 '<div class="col-sm-10 text-left">'+
					              	 	 '<input type="text" class="form-control" name="lat"  placeholder="lat" required>'+ 
					            	 '</div>'+
				      			 '</div>'+
				      			 '<div class="form-group">'+
					            	'<div class="col-sm-5 control-label">'+
					                	'<label for="id">경도</label>'+
					            	'</div>'+
					           		 '<div class="col-sm-10 text-left">'+
					              	 	 '<input type="text" class="form-control" name="lng"  placeholder="lng" required>'+ 
					            	 '</div>'+
				      			 '</div>'+
				      			'<div class="form-group">'+
				            	'<div class="col-sm-5 control-label">'+
				                	'<label for="id">지역</label>'+
				            	'</div>'+
				           		 '<div class="col-sm-10 text-left">'+
						             '<select name="region" class="form-control">'+
				           			'<option selected="selected"> 선택하세요 </option>' +
									'<option> 논산 </option>' +
									'<option> 계룡 </option>' +
									'<option> 서산 </option>' +
									'<option> 예산 </option>' +
									'<option> 공주 </option>' +
									'<option> 보령 </option>' +
									'<option> 아산 </option>' +
									'<option> 천안 </option>' +
									'<option> 태안 </option>' +
									'<option> 서천 </option>' +
									'<option> 부여 </option>' +
									'<option> 당진 </option>' +
									'<option> 금산 </option>' +
									'<option> 청양 </option>' +
									'<option> 홍성 </option>' +
									'</select>' + 
				            	 '</div>'+
			      			 '</div>'+
			      			'<div class="form-group">'+
			            	'<div class="col-sm-5 control-label">'+
			                	'<label for="id">분류</label>'+
			            	'</div>'+
			           		 '<div class="col-sm-10 text-left">'+
					             '<select name="kate" class="form-control">'+
			           			'<option selected="selected"> 선택하세요 </option>' +
								'<option> 한식 </option>' +
								'<option> 일식 </option>' +
								'<option> 양식 </option>' +
								'<option> 중식 </option>' +
								'</select>' + 
			            	 '</div>'+
		      			 '</div>'+
			      			'<div class="form-group">'+
			            	'<div class="col-sm-5 control-label">'+
			                	'<label for="id">주소</label>'+
			            	'</div>'+
			           		 '<div class="col-sm-10 text-left">'+
			              	 	 '<input type="text" class="form-control" name="addr"  placeholder="주소" required>'+ 
			            	 '</div>'+
		      			 '</div>'+
			      			'<div class="form-group">'+
			            	'<div class="col-sm-5 control-label">'+
			                	'<label for="id">메뉴</label>'+
			            	'</div>'+
			           		 '<div class="col-sm-10 text-left">'+
			              	 	 '<input type="text" class="form-control" name="menu"  placeholder="메뉴" required>'+ 
			            	 '</div>'+
		      			 '</div>'+
			      			'<div class="form-group">'+
			            	'<div class="col-sm-5 control-label">'+
			                	'<label for="id">전화번호</label>'+
			            	'</div>'+
			           		 '<div class="col-sm-10 text-left">'+
			              	 	 '<input type="text" class="form-control" name="phone"  placeholder="전화번호" required>'+ 
			            	 '</div>'+
		      			 '</div>'+
		      			 '<div class="form-group">'+
			            	'<div class="col-sm-5 control-label">'+
			                	'<label for="id">상세설명</label>'+
			            	'</div>'+
			           		 '<div class="col-sm-10 text-left">'+
			              	 	 '<textarea name="content" rows="15" placeholder="상세설명을 입력하세요." class="form-control"></textarea>'+ 
			            	 '</div>'+
		      			 '</div>'+
		      			 
		      			'<div class="input-group" style = "display: flex; justify-content: center; align-items: center;" >'+	
		                 '<input type="submit" value="상품등록" class="btn btn-success" value="제출" />'+
		                 '</div>'+
								  '</form>'
							  )
						}
					}
				
				</script>
				</div>
	 			<div class="col-md-7">
	 			<br/><br/><br/>
			<div id="stay1"></div>
			<div id="tour1"></div>
			<div id="food1"></div>
			</div>
			</div>
		</div>
</body>
</html>