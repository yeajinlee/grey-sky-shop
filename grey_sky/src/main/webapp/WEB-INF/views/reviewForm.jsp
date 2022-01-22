<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Question Form</title>
    <link rel="stylesheet" href="resources/css/reviewForm.css">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
    </script>
</head>
<body>
    <header>
        <div class="container">
            <div class="logo"><a href="main.html">Grey Sky</a></div>
            <ul class="sideMenu">
                <li id="join"><a href="join.html">JOIN</a></li>
                <li id="login"><a href="login.html">LOGIN</a></li>
            </ul>
        </div>
    </header>
    <nav>
        <div class="container">
            <ul class="leftMenu">
                <li><a href="main.html">All</a></li>
                <li><a href="#">Poster</a></li>
                <li><a href="#">Postcard</a></li>
                <li><a href="#">Sticker</a></li>
                <li><a href="#">Cart</a></li>
                <li><a href="#">Notice</a></li>
            </ul>
        </div>
    </nav>
    <div class="rForm">
        
    </div>
    <footer>
        <div class="top">
            <div class="container">
                <a href="#" >사업 문의</a> /
                <a href="#">개인정보처리방침</a> /
                <a href="#">사업자 정보</a>
            </div>
        </div>
        <div class="container">
            <strong>
                대표자: 이예진
            </strong>
            <br>사진 출처: <a href="https://unsplash.com/"><u>Unsplash</u></a>
            <div class="copyright">
                DESIGNED BY YEAJIN LEE
            </div>
        </div>
    </footer>
</body>
</html>