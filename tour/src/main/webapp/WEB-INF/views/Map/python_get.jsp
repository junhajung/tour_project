<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@page import="java.util.Arrays"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type = "text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
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
<body>

<%
String lat = request.getParameter("lat");
String lng= request.getParameter("lng");
String name = request.getParameter("name");
String addr = request.getParameter("addr");

%>

 <form action="${pageContext.request.contextPath}/insert_map" method="post">
	<input  type="hidden" name="name" value=<%= name %>>
	<input  type="hidden" name="lat" value=<%= lat %>>
	<input  type="hidden" name="lng" value=<%= lng %>>
	<input  type="hidden" name="addr" value=<%= addr %>>
	
	<p style="color:gray; font-weight:bold; ">제목</p>
	<input  type="text" id="input1" name="title" >
	
	<p style="color:gray; font-weight:bold;">메모</p>
	<input  type="text" id="input1" name="memo">
	
	<p style="color:gray; font-weight:bold;">위치</p>
	<input  type="text" id="input2" name="addr" value=<%= addr %> disabled>
	<img src="resources/img/123.PNG"id="img" />
	<br/><br/>
	
	<!-- <textarea cols="50" rows="10"></textarea>  -->
	
	<input  type="submit" value='추가' style=" background-color:#D2CEC2;
                      margin-top:20px;
                      margin-left: 150px;
                      padding: 0.5rem 1rem;
                      font-weight:bold;
                      font-size: 13px;
                      border:none;
                      text-align: center;
                      text-decoration: none;
                      border-radius: 4px;
                      display: block;
                      box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
                      cursor: pointer;
                      transition: 0.5s;">
                      
     
</form>

</body>
</html>