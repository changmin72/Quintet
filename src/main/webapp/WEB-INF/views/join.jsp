<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Join</title>
    <link rel="stylesheet" href="assets/css/styles.css" />
   
</head>

<body>

<%@ include file="header.jsp" %>


    <div class="sign-container">
        <div class="sign-describe">
        
            <h1>개인정보 수집 및 이용 동의서</h1>
            <p>
                Quintet은 사용자의 얼굴을 통해 감정 분석 서비스를 제공합니다. 본 동의서는 해당 서비스 이용에 있어 필요한
                개인정보 수집 및 이용에 관한 동의 절차를 설명하기 위함입니다.
            </p>
            <ul>
                <li>1. 수집하는 개인정보 항목: 이메일, 비밀번호, 닉네임, 성별, 생년월일</li>
                <li>2. 개인정보의 수집 및 이용 목적: 감정 분석을 위한 데이터 분석 및 연구</li>
                <li>3. 개인정보의 보유 및 이용 기간: 서비스 탈퇴 시까지</li>
                <li>4. 개인정보의 제3자 제공: 원칙적으로 수집한 개인정보를 제3자에게 제공하지 않습니다.</li>
                <li>5. 개인정보의 안전성 확보 조치: 안전하게 보호합니다.</li>
                <li>6. 동의 거부에 따른 불이익 안내: 거부할 경우 서비스 이용이 제한될 수 있습니다.</li>
            </ul>
            <p>
                사용자는 위 내용을 충분히 이해하였으며, 본인의 개인정보가 위와 같은 목적으로 수집 및 이용되는 것에 동의합니다.
            </p>
            <div class="sign-buttons">
                <button id="agree" class="button">동의</button>
                <button id="reject" class="button">거부</button>
            <br>
                        <br>
            </div>
        </div>
        <form action="joinmember" method="post">
        <div class="signupin-container">
                <img src="assets/css/QuintetLogo.png" alt="Quintet Logo" class="logo" />
                <div class="form-group">
                    <label for="email">이메일</label>
                    <input type="email" id="email" placeholder="email을 입력해주세요." name="email">
                </div>
                <div class="form-group">
                    <label for="password">비밀번호</label>
                    <input type="password" id="password" placeholder="password를 입력해주세요." name="password">
                </div>
                <div class="form-group">
                    <label for="confirm-password">비밀번호 확인</label>
                    <input type="password" id="confirm-password" placeholder="password를 다시 입력해주세요.">
                </div>
                <div class="form-group">
                    <label for="dob">생년월일</label>
                    <input type="date" id="dob" name="birthdate">
                </div>
                <div class="form-group">
                    <label for="nickname">닉네임</label>
                    <input type="text" id="nickname" placeholder="사용하실 닉네임을 입력해주세요." name="nickname">
                </div>
                <div class="form-group gender-selection">
                    <label>성별</label>
                    
                    
                    <div class="gender-option">
                        <input type="radio" id="male" name="gender" value="m">
                        <label for="male">남</label>
                    </div>
                    
                    <!-- <label for="male">남</label>
                    <input type="radio" id="male" name="gender" value="m"> -->
                    
                    
                    <div class="gender-option">
                        <input type="radio" id="female" name="gender" value="f">
                        <label for="female">여</label>
                    </div>
                    
                    
                 <!--    <label for="female">여</label>
                    <input type="radio" id="female" name="gender" value="f"> -->
                    
                    
                    <div class="gender-option">
                        <input type="radio" id="other" name="gender" value="n">
                        <label for="other">선택안함</label>
                    </div>
                    
                    
                    <!-- <label for="other">선택안함</label>
                    <input type="radio" id="other" name="gender" value="n">
                     -->
                    
                </div>
                <button class="submit-btn" type="submit">회원가입</button>
            </div>
            </form>
        </div>
    </div>
    
    <%@ include file="footer.jsp" %>
    
    <script >
    
    const agreeButton = document.getElementById('agree');
    const rejectButton = document.getElementById('reject');

    // 동의 버튼 마우스 오버 및 아웃 이벤트
    agreeButton.addEventListener('mouseover', () => {
        agreeButton.style.backgroundColor = '#56792b'; // 초록색으로 변경
    });

    agreeButton.addEventListener('mouseout', () => {
        if (!agreeButton.classList.contains('clicked')) {
            agreeButton.style.backgroundColor = '#555'; // 원래 어두운 회색으로 복구
        }
    });

    agreeButton.addEventListener('click', () => {
        if (!agreeButton.classList.contains('clicked')) {
            agreeButton.classList.add('clicked');
            agreeButton.style.backgroundColor = '#56792b'; // 초록색 유지
            agreeButton.innerHTML = '✔️ 동의'; // 브이 체크 모양 추가
            rejectButton.classList.remove('clicked');
            rejectButton.style.backgroundColor = '#555'; // 거부 버튼 회색으로 복구
            rejectButton.innerHTML = '거부'; // 브이 체크 모양 제거
        } else {
            agreeButton.classList.remove('clicked');
            agreeButton.style.backgroundColor = '#555'; // 어두운 회색으로 복구
            agreeButton.innerHTML = '동의'; // 브이 체크 모양 제거
        }
    });

    // 거부 버튼 마우스 오버 및 아웃 이벤트
    rejectButton.addEventListener('mouseover', () => {
        rejectButton.style.backgroundColor = '#be2e22'; // 빨간색으로 변경
    });

    rejectButton.addEventListener('mouseout', () => {
        if (!rejectButton.classList.contains('clicked')) {
            rejectButton.style.backgroundColor = '#555'; // 원래 어두운 회색으로 복구
        }
    });

    rejectButton.addEventListener('click', () => {
        if (!rejectButton.classList.contains('clicked')) {
            rejectButton.classList.add('clicked');
            rejectButton.style.backgroundColor = '#be2e22'; // 빨간색 유지
            rejectButton.innerHTML = '✔️ 거부'; // 브이 체크 모양 추가
            agreeButton.classList.remove('clicked');
            agreeButton.style.backgroundColor = '#555'; // 동의 버튼 회색으로 복구
            agreeButton.innerHTML = '동의'; // 브이 체크 모양 제거
        } else {
            rejectButton.classList.remove('clicked');
            rejectButton.style.backgroundColor = '#555'; // 어두운 회색으로 복구
            rejectButton.innerHTML = '거부'; // 브이 체크 모양 제거
        }
    });

    
    
    
    
    </script>
   
    
    
</body>
<script src="assets/js/Join.js" type="text/javascript"></script>
</html>
