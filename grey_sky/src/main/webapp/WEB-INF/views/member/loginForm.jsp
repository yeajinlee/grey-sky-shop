<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="result" value="${param.result}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
body {
	background-color: #f9f9f9;
}

h1 {
	width: auto;
	height: 0%;
	text-align: center;
	margin: 50px auto;
	padding: 30px 5px 15px 5px;
	font-size: 44px;
	font-weight: bold;
}

a {
	color: black;
	text-decoration: none;
	display: inline-block;
}

a:hover {
	color: black;
}

form {
	width: 400px;
	margin: auto;
	padding: 10px;
	line-height: 2em
}

#id, #pwd {
	width: 350px;
	margin: 10px 15px;
}

.bottom_btn {
	margin: 30px auto;
	text-align: center;
}

footer {
	background-color: lightgrey;
	padding: 30px 50px 65px;
	margin-top: 100px;
	line-height: 2rem;
	margin-bottom: 0px;
}
</style>
<c:choose>
	<c:when test="${result == 'loginFailed'}">
		<script>
			window.onload = function() {
				alert("등록되지 않은 아이디이거나 아이디 또는 비밀번호를 잘못 입력하셨습니다.");
			}
			
		</script>
	</c:when>
</c:choose>
</head>
<body>
	<h1>
		<a href="${pageContext.request.contextPath}/main.do">Grey Sky</a>
	</h1>
	<div>
		<form action="${pageContext.request.contextPath}/member/login.do"
			method="post" name="login">
			<input type="text" name="id" placeholder="아이디" id="id"><br>
			<input type="password" name="pwd" placeholder="비밀번호" id="pwd"><br>
			<div class="bottom_btn">
				<input type="button" class="btn btn-outline-dark" value="회원가입" onclick="join()"> &nbsp;
				<input type="submit" class="btn btn-dark" value="로그인">
			</div>
		</form>
	</div>
	<script>
		function join() {
			location.href = "${pageContext.request.contextPath}/member/joinForm.do";
		}
		
		
		
	</script>
</body>
</html>