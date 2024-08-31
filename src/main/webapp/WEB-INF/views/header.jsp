<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Header</title>

<link rel="stylesheet" href="assets/css/styles.css" />

</head>

<body>
	<div class="header-container">
		<div class="logo-container">
			<a href="main"> <img src="assets/css/QuintetLogo.png"
				alt="Quintet Logo" class="logo" />
			</a>

		</div>

		<div class="right-container">
			<!-- 추가된 div -->
			<div class="link-container">
				<c:if test="${empty user}">
					<a href="join">Join</a>
					<a href="login">Login</a>
				</c:if>
				<c:if test="${!empty user}">
					<a href="logout">Logout</a>
				</c:if>





			</div>
			<!--  <a href="myPage"> -->
			<div class="menu-icon">
				<div class="bar"></div>
				<div class="bar"></div>
				<div class="bar"></div>
			</div>
			<!-- </a> -->
		</div>
	</div>
	<!-- 토글 -->
	<div class="toggle-content" style="display: none;">
		<!-- 여기에 숨겨졌다가 나타날 내용을 추가하세요 -->
		<div class='mypage-container'>
			<a href="searchResult1?email=${user.email}">
			<div class='mypage-text'>Search Movie Analysis</div>
			</a> 
			
			<a href="faceResult1?email=${user.email}">
			<div class='mypage-text'>Facial Analysis</div>
			</a>
			
			<a href="reviewTable?email=${user.email }">
			<div class='mypage-text'>Comment</div>
			</a>

			<div class='mypage-teamdescribe'>
				Team. Quintet <br> 감정분석을 통한 영화 분류 및 추천 서비스 <br> T : 010
				9562 1837<br> E : kaypsilonbeh@gmail.com<br> 전라남도 목포시용당동
				970-23 AI메타버스센터<br> 스마트인재개발원 DCX 기반 빅데이터 분석서비스 개발자 과정<br>
				Copyright © 2024 QUINTET All Right Reserved.

			</div>
		</div>
	</div>

	<script>
    document.querySelector('.menu-icon').addEventListener('click', function() {
        var toggleContent = document.querySelector('.toggle-content');
        if (toggleContent.style.display === 'none' || toggleContent.style.display === '') {
            toggleContent.style.display = 'block';
        } else {
            toggleContent.style.display = 'none';
        }
    });
</script>

</body>

</html>