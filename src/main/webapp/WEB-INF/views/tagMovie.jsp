<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SearchResult</title>
     <link rel="stylesheet" href="assets/css/styles.css" />
</head>

<body>

<%@ include file="header.jsp" %>

    <div class='searchresult-container'>
	<c:forEach var="c" items="${code}">
        <div class='searchresult-card'>
            <!-- {/* 카드 하나 구역 */} -->
            <div class='src-movietitle'>${movieList[(c.moviecode)-1].moviename }</div>
            <div class='src-peopletag'>
            <c:if test="${c.fear==1}">공포</c:if> 
                    <c:if test="${c.joy==1}">재미</c:if> 
                    <c:if test="${c.surprise==1}">놀람</c:if> 
                    <c:if test="${c.sadness==1}">슬픔</c:if> 
                    <c:if test="${c.boredom==1}">지루함</c:if> 
                    <c:if test="${c.pain==1}">고통</c:if> 
                    <c:if test="${c.disgust==1}">역겨움</c:if> 
                    <c:if test="${c.interest==1}">흥미</c:if> 
                    <c:if test="${c.disappointment==1}">실망</c:if> 
            </div>
            <div class='src-peoplereview'>
           <c:choose>
    <c:when test="${fn:length(movieList[(c.moviecode)-1].plot) > 50}">
        ${fn:substring(movieList[(c.moviecode)-1].plot, 0, 50)}...
    </c:when>
    <c:otherwise>
        ${movieList[(c.moviecode)-1].plot}
    </c:otherwise>
</c:choose>

            
            </div>
        </div>
</c:forEach>
        

    </div>
    
    <%@ include file="footer.jsp" %>
</body>

</html>