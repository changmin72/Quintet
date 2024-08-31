<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ReviewTable</title>
   
   
    <link rel="stylesheet" href="assets/css/styles.css" />


     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>

<%@ include file="header.jsp" %>


    <div class="reviewtable-container">
        <div class="rtc-searchbar">
            <input type="text" placeholder="Search...">
            <button><i class="fa fa-search"></i></button>
        </div>

        <table class="rtc-table">
            <thead class="rtc-thead">
                <tr>
                    <td>TITLE</td>
                    <td>CONTENT</td>
                    <td>TAG</td>
                </tr>
            </thead>

            <tbody class="rtc-tbody">
            
            <c:forEach var="r" items="${reviewList}">
            <tr>
                    <td>${movieList[(r.moviecode)-1].moviename}</td>
                    <td>${r.content}</td>
                    <td>
                    <c:if test="${!empty r.fear}">공포</c:if> 
                    <c:if test="${!empty r.joy}">재미</c:if> 
                    <c:if test="${!empty r.surprise}">놀람</c:if> 
                    <c:if test="${!empty r.sadness}">슬픔</c:if> 
                    <c:if test="${!empty r.boredom}">지루함</c:if> 
                    <c:if test="${!empty r.pain}">고통</c:if> 
                    <c:if test="${!empty r.disgust}">역겨움</c:if> 
                    <c:if test="${!empty r.interest}">흥미</c:if> 
                    <c:if test="${!empty r.disappointment}">실망</c:if> 
                    </td>
                </tr>
            </c:forEach>
            
            
                
               
            </tbody>
        </table>

        <div class="rtc-pagebtn">
            <button>&lt;</button>
            <button>&gt;</button>
        </div>
    </div>
    
    <%@ include file="footer.jsp" %>
</body>

</html>
