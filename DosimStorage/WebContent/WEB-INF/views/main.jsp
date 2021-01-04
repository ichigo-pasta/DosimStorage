<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="deco" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("common.css");
</style>
</head>
<body>
<nav>
<table>
	<tr>
		<th><a href="main.do">HOME</a></th>
		<th><a href="dosimStorage.do">도심창고</a></th>
		<th><a href="selStorage.do">신청하기</a></th>
		<th><a href="branchInfo.do">지점안내</a></th>
		<th><a href="loginForm.do">로그인</a></th>
		<th><a href="joinForm.do">회원가입</a></th>
	</tr>
</table>
</nav>
<section>
<deco:body></deco:body>
<hr>
<a href="event1.jsp">*</a>
<a href="event2.jsp">*</a>
<a href="event3.jsp">*</a>
</section>
<footer>
<div>
<ul type="none">
	<li>상호명 : </li>
	<li>주소 : </li>
	<li>전화번호 : </li>
</ul>
</div>
<div>
<ul type="none">
	<li><h4>고객센터</h4></li>
	<li>월  ~ 금 : 10:00 ~ 18:30</li>
	<li>점심시간 : 12:00 ~ 13:00</li>
</ul>
</div>
</footer>
</body>
</html>