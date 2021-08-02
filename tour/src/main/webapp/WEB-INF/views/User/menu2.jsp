<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
<form action = "${pageContext.request.contextPath}/user/mydelete" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<p>ENTER YOUR ID</p>
		<input type="text" name="userid" id="userid" class="form-control" >

		<p>ENTER YOUR PASSWORD</p>
		<input type="password" name="userpw" id="userpw" class="form-control">
		
		<br/><br/>
		
		<button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
			id="button" name="update" type="submit">회원탈퇴</button>
</form>
</body>
</html>