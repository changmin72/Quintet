<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mypage</title>
<link rel="stylesheet" href="assets/css/styles.css" />
</head>

<body>

<%@ include file="header.jsp" %>


	<div class='mypage-container'>
		<a href="searchResult"><div class='mypage-text'>Search
				Movie Analysis</div></a>
				 
				 
				 
				 <a href="faceResult?email=${user.email}"><div class='mypage-text'>Facial
				Analysis</div></a>
				
				
				 <a href="reviewTable?email=${user.email}"><div class='mypage-text'>${user.email }</div></a>

		<div class='mypage-teamdescribe'>
			Team. Quintet <br> 감정분석을 통한 영화 분류 및 추천 서비스 <br> T : 010
			9562 1837<br> E : kaypsilonbeh@gmail.com<br> 전라남도 목포시용당동
			970-23 AI메타버스센터<br> 스마트인재개발원 DCX 기반 빅데이터 분석서비스 개발자 과정<br>
			Copyright © 2024 QUINTET All Right Reserved.

		</div>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>

</html> --%>