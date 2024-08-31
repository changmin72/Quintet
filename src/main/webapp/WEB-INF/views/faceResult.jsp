<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        
        
            <!-- 카드 1 -->
            <div class="faceresult-card" onclick="flipCard(this)">
                <div class="faceresult-card-inner">
                    <div class="faceresult-card-front">
                        <a href="faceAnalysis2?faceresultid=${c.faceresultid}" style="text-align:center">분석결과${counter}<br>
                        공포 ${c.fear}<br>
                        행복 ${c.happy}<br>
                        놀람 ${c.surprise}<br>
                        슬픔 ${c.sad}<br>
                        혐오 ${c.disgust}<br>
                        보통 ${c.neutral}<br>
                        화남 ${c.angry}<br>
                      	분석날짜 ${c.analysistime}</a>
                        
                    </div>
                  <!--   <div class="faceresult-card-back">
                        <div class="frc-movietitle">MOVIE TITLE 1</div>
                        <div class="frc-mytag">TAG 1</div>
                        <div class="frc-myreview">REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1REVIEW 1</div>
                        <div class="frc-viewdate">DATE 1</div>
                    </div> -->
                </div>
            </div>
            
            <c:set var="counter" value="${counter+1}" />
            </c:forEach>
            
            
            

        </div>
        
        
        
        
        
        
		


	</div>
	
	<%@ include file="footer.jsp" %>
	
	
	<!-- 일단 다운 -->
	<!--    <script>
        function flipCard(card) {
            card.classList.toggle("flipped");
        }
    </script> -->
</body>

</html>
