<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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


    <div class='searchresult-container' id="search-results">
<c:forEach var="c" items="${search}">
        <div class='searchresult-card' >
           <div class='text-box' >${c.movietitle }</div>
             <div class="info-overlay" >
             <div class='text-box'><a href="serch2?resultid=${c.resultid}">TAG</a> <br>
             			공포 ${c.fear}<br>
                        행복 ${c.joy}<br>
                        놀람 ${c.surprise}<br>
                        슬픔 ${c.sadness}<br>
                        지루함 ${c.boredom}<br>
                        통증 ${c.pain}<br>
                        혐오 ${c.disgust}
             </div>
            </div>
        

    </div>
   
    </c:forEach>
    
    
    
     </div>
    <%@ include file="footer.jsp" %>
</body>

</html>