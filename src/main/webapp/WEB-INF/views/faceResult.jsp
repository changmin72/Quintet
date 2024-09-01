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
        <div class="faceresult-row">
            <c:set var="counter" value="1"/>
            <c:forEach var="c" items="${emotion}">
                <c:set var="maxEmotion" value="fear" />
                <c:set var="maxValue" value="${c.fear}" />

                <c:if test="${c.happy > maxValue}">
                    <c:set var="maxEmotion" value="happy" />
                    <c:set var="maxValue" value="${c.happy}" />
                </c:if>

                <c:if test="${c.surprise > maxValue}">
                    <c:set var="maxEmotion" value="surprise" />
                    <c:set var="maxValue" value="${c.surprise}" />
                </c:if>

                <c:if test="${c.sad > maxValue}">
                    <c:set var="maxEmotion" value="sad" />
                    <c:set var="maxValue" value="${c.sad}" />
                </c:if>

                <c:if test="${c.disgust > maxValue}">
                    <c:set var="maxEmotion" value="disgust" />
                    <c:set var="maxValue" value="${c.disgust}" />
                </c:if>

                <c:if test="${c.neutral > maxValue}">
                    <c:set var="maxEmotion" value="neutral" />
                    <c:set var="maxValue" value="${c.neutral}" />
                </c:if>

                <c:if test="${c.angry > maxValue}">
                    <c:set var="maxEmotion" value="angry" />
                    <c:set var="maxValue" value="${c.angry}" />
                </c:if>

                <!-- 카드 1 -->
                <div class="faceresult-card" onclick="flipCard(this)">
                    <div class="faceresult-card-inner">
                    <div class="faceresult-card-front" style="background-image: url('images/${maxEmotion}.png'); background-position: center;  background-repeat: no-repeat; ">
    <a href="faceAnalysis2?faceresultid=${c.faceresultid}" style="display: block; text-align: center; color: black; text-decoration: none; ">
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
