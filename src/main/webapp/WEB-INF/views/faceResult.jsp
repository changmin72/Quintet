<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FaceResult</title>
<link rel="stylesheet" href="assets/css/styles.css" />
</head>

<body>

    <%@ include file="header.jsp" %>

    <div class="faceresult-container">
    <c:set var="counter" value="1"/>
    <c:forEach var="c" items="${emotion}">
        <!-- Your logic to determine maxEmotion and maxValue -->
        <!-- Single Card -->
        <div class="faceresult-card" onclick="flipCard(this)">
            <div class="faceresult-card-inner">
                <div class="faceresult-card-front" style="background-image: url('images/Frame 57.png'); background-position: center;  background-repeat: no-repeat; background-size: cover; ">
                    <a href="faceAnalysis2?faceresultid=${c.faceresultid}" style="display: block; text-align: center;  text-decoration: none; color:white; ">
                        분석결과 ${counter}<br>
                        공포 ${c.fear}<br>
                        행복 ${c.happy}<br>
                        놀람 ${c.surprise}<br>
                        슬픔 ${c.sad}<br>
                        혐오 ${c.disgust}<br>
                        보통 ${c.neutral}<br>
                        화남 ${c.angry}<br>
                        분석날짜 ${c.analysistime}
                    </a>
                </div>
            </div>
        </div>
        <c:set var="counter" value="${counter+1}" />
    </c:forEach>
</div>
    </div>

    <%@ include file="footer.jsp" %>

</body>

</html>
