<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.reverse {
	background-color: black;
	color: white;
}
</style>
<script>
	$(document).ready(function() {
		$('.leftMenu > li').hover(function() {
			$(this).addClass('reverse');
		}, function() {
			$(this).removeClass('reverse');
		});
	});
	
	/* window.onload = function() {
		alert(${logOn});
	} */
</script>
</head>
</head>
<body>
	<header>
		<div class="container">
			<div class="logo">
				<a href="${pageContext.request.contextPath}/main.do">Grey Sky</a>
			</div>
			<c:choose>
				<c:when test="${logOn == true}">
					<ul class="sideMenu">
						<li class="h_menu"><a href="#">My Page</a></li>
						<li class="h_menu"><a href="${pageContext.request.contextPath}/member/logout.do">LOGOUT</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="sideMenu">
						<li class="h_menu"><a href="${pageContext.request.contextPath}/member/joinForm.do">JOIN</a></li>
						<li class="h_menu"><a href="${pageContext.request.contextPath}/member/loginForm.do">LOGIN</a></li>
					</ul>
				</c:otherwise>
			</c:choose>

		</div>
	</header>
	<nav>
		<div class="container">
			<ul class="leftMenu">
				<li><a href="${pageContext.request.contextPath}/main.do">All</a></li>
				<li><a href="${pageContext.request.contextPath}/main.do">Poster</a></li>
				<li><a href="${pageContext.request.contextPath}/main.do">Postcard</a></li>
				<li><a href="${pageContext.request.contextPath}/main.do">Sticker</a></li>
				<li><a href="${pageContext.request.contextPath}/main.do">Cart</a></li>
				<li><a href="${pageContext.request.contextPath}/main.do">Notice</a></li>
			</ul>
		</div>
	</nav>
</body>
</html>