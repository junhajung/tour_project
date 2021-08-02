<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<style>
    #input1 {
    	width: 100%;
        height: 30px;
        border-top: none;
        border-left: none;
        border-right: none;
        border-bottom : 1px solid black;
    }
    #input2 {
   		position:relative;
    	width: 350px;
        height: 30px;
        border-top: none;
        border-left: none;
        border-right: none;
        display: inline-block;
        border-bottom : 1px solid black;
    }
    #img{
    position:absolute;
    
    width:35px;
    height:35px;
    }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>alert('내 지도에 추가되었습니다.');</script>
<h2 style="color:gray; font-weight:bold; text-align:center">추가된 내용</h2>
<p style="color:gray; font-weight:bold; ">제목</p>
	<input  type="text" id="input1" name="title" value="${list.title}" disabled>
	
	<p style="color:gray; font-weight:bold;">메모</p>
	<input  type="text" id="input1" name="memo"value="${list.memo}"disabled>
	
	<p style="color:gray; font-weight:bold;">위치</p>
	<input  type="text" id="input2" value="${list.addr}" disabled>
	<img src="resources/img/123.PNG"id="img" />

</body>
</html>