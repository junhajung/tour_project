<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>로그인</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- CSS here -->
<link rel="stylesheet" href="../resources/css/join.css">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/slicknav.css">
<link rel="stylesheet" href="../resources/css/animate.min.css">
<link rel="stylesheet" href="../resources/css/magnific-popup.css">
<link rel="stylesheet" href="../resources/css/fontawesome-all.min.css">
<link rel="stylesheet" href="../resources/css/themify-icons.css">
<link rel="stylesheet" href="../resources/css/slick.css">
<link rel="stylesheet" href="../resources/css/nice-select.css">
<link rel="stylesheet" href="../resources/css/style.css">
<link rel="stylesheet" href="../resources/css/responsive.css">

</head>

<body class="text-center">

	<main class="container">
		
		
		<p class="mt-5 mb-3 text-muted"># TRIP</p>

			<h1 class="h3 mb-3 fw-normal">Please sign in</h1>
			<form action="${pageContext.request.contextPath}/user/loginProcess" method="POST" >
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			
			<div class="mb-3">
				<input type="text" class="form-control" name="userid" placeholder="Id">
			</div>
			
			<div class="line-box">
				<input type="password" class="form-control" name="userpw" placeholder="Password">
			</div>
			<br /><br/><br/>


			<div class = "col-mb-5 mb-3">
				<button class="btn btn-lg btn-primary" type="submit"> 로그인 </button>		
			</div>
	</form>			
			<div class = "col-mb-5 mb-3">
			<a href="${pageContext.request.contextPath}/user/joinget">
				<button class="btn btn-lg btn-primary" type="submit"> 
				회원가입  </button></a>
			</div>

		
	</main>

</body>
</html>