<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>회원가입</title>
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
<form id="signFrm" name="signFrm" method="POST" action="${pageContext.request.contextPath}/user/join">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<main class="container">

			<p class="mt-5 mb-3 text-muted"># TRIP</p>

			<h1 class="h3 mb-3 fw-normal">DISCOVER GREAT PLACE WITH US!</h1>

			<div class="mb-3">
			<input type="text" class="form-control" id="userid" name="userid" placeholder="ID">
		</div>
		
		<div class="row">
			<div class="mb-3 col-4">
				<input type="button" id="check" value="ID 중복체크">
			</div>
			
			<div class="mb-3 col-8" id="idCheck">
			</div>
		</div>

		<div class="mb-3">
			<input type="password" class="form-control" name="userpw" id="userpw" placeholder="Password">
		</div>

		<div class="mb-3">
			<input type="password" class="form-control" name="userpw1" id="userpw1" placeholder="Re-Password">
		</div>

		<div class="mb-3">
			<input type="email" class="form-control" name="email" id="email" placeholder="E-mail">  
		</div>
			
		<div class="mb-3">
			<input type="text" class="form-control" name="username"  id="username" placeholder="Name">
		</div>

		<div class="mb-3">
			<input type="text" class="form-control" name="phone" id="userphone" placeholder="Phone Number">
		</div>

		<div class="mb-3">
			<select class="form-control" name="userauth" hidden="">
				<option value="user" autofocus="autofocus">user</option>
				<option value="admin">admin</option>
			</select>
		</div>

		<div class="mb-3">
			<input type="date" class="form-control" name="regdate" hidden="">
		</div>

		<br />

		<div class="col-mb-5 mb-3">
			<a href="${pageContext.request.contextPath}/user/join">
				<button class="btn btn-lg btn-primary" id="join" type="submit">회원가입</button>
				
			</a>
		</div>

	</main>
</form>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(function() {
			
			var idx = false;
			
			$('#join').click(function() {
				if($.trim($('#userid').val()) == '') {
					alert("아이디를 입력해주세요.");
					$('#userid').focus();
					return false;
				}else if($.trim($('#userpw').val()) == '') {
					alert("패스워드를 입력해주세요.");
					$('#userpw').focus();
					return false;
				}
				
				//패스워드 확인
				else if($('#userpw').val() != $('#userpw1').val()) {
					alert('패스워드가 다릅니다!');
					$('#userpw').focus();
					return false;
				}
				if($.trim($('#email').val()) == '') {
					alert("이메일을 입력해주세요.");
					$('#email').focus();
					return false;
				}
				
				if($('#email').val().indexOf("@") == -1){
					alert("올바른 이메일 형식이 아닙니다.")
					$('#email').focus();
					return false;
				}
				if($.trim($('#username').val()) == '') {
					alert("이름을 입력해주세요.");
					$('#username').focus();
					return false;
				}
				
				if($.trim($('#userphone').val()) == '') {
					alert("번호를 입력해주세요.");
					$('#userphone').focus();
					return false;
				}
				
				if(idx==false) {
					alert("아이디 중복체크를 해주세요");
					return false;
				}else{
					alert("회원가입에 성공했습니다");
					$('#signFrm').submit();
				}
				
			});
			
			$('#check').click(function(){
				$.ajax({
					url : "${pageContext.request.contextPath}/user/idcheck",
					type: "GET",
					data : {
						"userid" : $('#userid').val()
					},
					success: function(data) {
						if(data==0 && $.trim($('#userid').val()) != '') {
							idx=true;
							$('userid').attr("readonly", true);
							var html = "<style='color: green'> 사용가능합니다 </style>"
							$('#idCheck').empty();
							$('#idCheck').append(html);
						}else{
							var html = "<style='color: red'> 사용불가능합니다 </style>"
								$('#idCheck').empty();
								$('#idCheck').append(html);
						}
					},
					error : function() {
						alert("시스템 오류입니다.");
				}
			});
		});
	});
	</script>

</body>
</html>