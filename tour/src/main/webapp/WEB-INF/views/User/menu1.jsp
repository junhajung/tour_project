<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>

	<form action="${pageContext.request.contextPath}/user/myinfo" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

		<p>ID</p>
		<input type="text" name="userid" value="${vo.userid}" class="form-control" readonly>
		
		<p>현재 비밀번호</p>
		<input type="password" name="oldpw" class="form-control">
		
		<p>NEW YOUR PASSWORD</p>
		<input type="password" name="userpw" class="form-control">
		

		<p>ENTER YOUR NAME</p>
		<input type="text" name="username" value="${vo.username}" class="form-control">
		
		<p>ENTER YOUR PHONE</p>
		<input type="text" name="phone" value="${vo.phone}" class="form-control">


		<p>ENTER YOUR E-MAIL</p>
		<input type="email" name="email" value="${vo.email}" class="form-control">

		<p>REGDATE</p>
		<input type="text" value="${vo.createdDate}" class="form-control" readonly>


		<br />

		<button
			class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
			id="button" name="update" type="submit">Update</button>

	</form>

</body>
</html>