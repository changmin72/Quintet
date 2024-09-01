<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
     <link rel="stylesheet" href="assets/css/styles.css" />
</head>

<body>

<%@ include file="header.jsp" %>


    <div class="sign-container">
     <!--   <div class="sign-describe">
   <img alt="pop" src="images/pop.png">
        </div>  -->
        <form action="gologin">
        <div class="signupin-container">
            
           
            
                <img src="assets/css/QuintetLogo.png" alt="Quintet Logo" class="logo" />
                <div class="form-group">
                    <label for="login-email">이메일</label>
                    <input type="email" id="login-email" placeholder="email을 입력해주세요." name="email">
                </div>
                <div class="form-group">
                    <label for="login-password">비밀번호</label>
                    <input type="password" id="login-password" placeholder="password를 입력해주세요." name="password">
                </div>
                <button class="submit-btn" type="submit">로그인</button>
           
        </div>
        </form>
    </div>
    
    <%@ include file="footer.jsp" %>
</body>

</html>
