<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Main</title>

<link rel="stylesheet" href="assets/css/styles.css" />




</head>
<body>
	<%@ include file="header.jsp"%>

	<div class='main-container'>


		<div class='analysis-container'>
			<a href="faceAnalysis"> <!--      <div class='face-analysis-btn'>Analyzing
               facial emotions...</div> -->


				<div class='typing-container' style="cursor: pointer;">

					<h1>
						Analyzing <br> facial emotions >> <br>
						<div id="typewriter" class="typewriter-text" style="color: blue;"></div>
					</h1>
				</div>

			</a>
			<!-- 클릭시 faceAnalysis.jsp 이동 -->


			<!--  <div class='search-analysis-btn'>
				<a href="searchAnalysis"><br>Movie<br>Search</a>
				<a href="#"><br>Movie<br>Search</a>
			</div> -->

			<div class='search-analysis-btn' style="width: 35%;">
			<!--  <a> -->
			   <div class="search-title" style="margin-right: 15px;">
        Movie<br>Search
    </div>
			 
			 
			 
			 
			 
			 
			    <div class="search-input">
        <form action="startSocket" method="get">
            <input type="text" name="title" placeholder="Enter Movie Title">
            <button type="submit" style="margin-right: 15px; margin-bottom: 5px;">🔍︎</button>
        </form>
    </div>
			 
			 
			<!--  </a>  -->
				
			</div>




		</div>






		<div class='top100-container'>



			<div class='movie-top100-wrapper'>
				<c:forEach var="m" items="${movieList}">
					<img class='movie-top100poster' alt="0" src="${m.imgurl}">
				</c:forEach>

			</div>


			<%-- 
       <c:forEach var="m" items="${movieList}">
               <img class='movie-top100poster' alt="0" src="${m.imgurl}">
            </c:forEach>  --%>


			<%-- <img class='movie-top100poster' alt="0" src="${movieList[0].imgurl}">
         <img class='movie-top100poster' alt="0" src="${movieList[0].imgurl}">
         <img class='movie-top100poster' alt="0" src="${movieList[0].imgurl}"> --%>

		</div>

		<div class='Tag-container'>




			<!-- 클릭시 tagMovie.jsp 이동 -->
			<a href="fear?fear=1"><div class='main-tag'
					style="background-color: #F60100; color: white;">FEAR</div></a> <a
				href="joy?joy=1"><div class='main-tag'
					style="background-color: #FFFF00; color: black;">JOY</div></a> 
				
				
					<a
				href="sadness?sadness=1"><div class='main-tag'
					style="background-color: #0C70F2; color: white;">SADNESS</div></a> 
					
					
					<a
				href="surprise?surprise=1"><div class='main-tag'
					style="background-color: #FF7F00; color: black;">SURPRISE</div></a> 
					
					
					
				
				<!-- 	<a
				href="boredom?boredom=1"><div class='main-tag'
					style="background-color: #00AC00; color: black;">BOREDOM</div></a> -->
					
					
					 <a
				href="pain?pain=1"><div class='main-tag'
					style="background-color: #00AC00; color: white;">PAIN</div></a> 
					
					<!-- <a
				href="disgust?disgust=1"><div class='main-tag'
					style="background-color: #D110B0; color: black;">DISGUST</div></a> -->
					
					
					 <a
				href="interest?interest=1"><div class='main-tag'
					style="background-color: #D110B0; color: black;">INTEREST</div></a>
					
					
					<!--  <a
				href="disappointment?disappointment=1"><div class='main-tag'
					style="background-color: #808080; color: black;">DISAPPOINTMENT</div></a>
 -->



		</div>


	</div>

	<%@ include file="footer.jsp"%>

	<script> /*롤링배너*/
// script.js

// 스크롤할 wrapper 요소를 가져옵니다.
const wrapper = document.querySelector('.movie-top100-wrapper');
const posterWidth = document.querySelector('.movie-top100poster').clientWidth;
const totalScrollWidth = wrapper.scrollWidth;
const wrapperVisibleWidth = wrapper.clientWidth;

// 자동 스크롤 제어를 위한 변수
let scrollInterval;
let isScrolling = true;
let scrollDirection = 1; // 1이면 오른쪽, -1이면 왼쪽으로 스크롤

// 자동 스크롤 함수
function startAutoScroll() {
    scrollInterval = setInterval(() => {
        wrapper.scrollLeft += 4 * scrollDirection; // 스크롤 속도 조절 가능

        // 오른쪽 끝에 도달하면 방향을 반대로
        if (wrapper.scrollLeft + wrapperVisibleWidth >= totalScrollWidth) {
            scrollDirection = -1;
        }
        // 왼쪽 끝에 도달하면 방향을 반대로
        if (wrapper.scrollLeft <= 0) {
            scrollDirection = 1;
        }
    }, 20); // 스크롤 간격 조절 가능
}

// 자동 스크롤 멈추기 함수
function stopAutoScroll() {
    clearInterval(scrollInterval);
}

// 초기 자동 스크롤 시작
startAutoScroll();

// 'Pause' 버튼 기능 추가
const playPauseButton = document.getElementById('play-pause');
playPauseButton.addEventListener('click', () => {
    if (isScrolling) {
        stopAutoScroll();
        playPauseButton.textContent = 'Play';
    } else {
        startAutoScroll();
        playPauseButton.textContent = 'Pause';
    }
    isScrolling = !isScrolling;
});

// 오른쪽 스크롤 버튼 기능 추가
const scrollRightButton = document.getElementById('scroll-right');
scrollRightButton.addEventListener('click', () => {
    wrapper.scrollLeft += 150 * scrollDirection; // 현재 스크롤 방향에 따라 이동

    // 오른쪽 끝에 도달했는지 확인하고 방향을 반대로
    if (wrapper.scrollLeft + wrapperVisibleWidth >= totalScrollWidth) {
        scrollDirection = -1;
    }
    // 왼쪽 끝에 도달했는지 확인하고 방향을 반대로
    if (wrapper.scrollLeft <= 0) {
        scrollDirection = 1;
    }
});


   
   </script>


	<script>

const boxes = document.querySelectorAll('.main-tag');
const originalColors = []; // 원래 색상들을 저장할 배열

// 각 박스에 대해 이벤트 리스너를 추가
boxes.forEach((box, index) => {
    // 원래 색상을 배열에 저장
    originalColors[index] = window.getComputedStyle(box).backgroundColor;

    // 마우스가 박스에 들어올 때 색상 어두운 버전으로 변경
    box.addEventListener('mouseover', () => {
        const darkerColor = darkenColor(originalColors[index], 0.2); // 색상을 20% 어둡게 변경
        box.style.backgroundColor = darkerColor;
        box.style.transition = 'background-color 0.3s'; // 부드러운 전환 효과
    });

    // 마우스가 박스에서 나갈 때 원래 색상으로 복귀
    box.addEventListener('mouseout', () => {
        box.style.backgroundColor = originalColors[index];
        box.style.transition = 'background-color 0.3s'; // 부드러운 전환 효과
    });
});

// 색상을 어둡게 만드는 함수
function darkenColor(color, percent) {
    const rgb = color.match(/\d+/g); // RGB 값을 추출
    const r = Math.floor(rgb[0] * (1 - percent));
    const g = Math.floor(rgb[1] * (1 - percent));
    const b = Math.floor(rgb[2] * (1 - percent));
    return `rgb(${r}, ${g}, ${b})`;
}


</script>


	<script>
// JavaScript to create typewriter effect and change text
const textElement = document.getElementById("typewriter");
const texts = ["JOY...", "SADNESS...", "BOREDOM...", "ANGER...", "PAIN..."];
const colors = ["#FFD700", "#1E90FF", "#32CD32", "#FF4500", "#800080"]; // 색상 배열
let index = 0;
let charIndex = 0;
let currentText = "";
let isDeleting = false;

function type() {
    // 현재 텍스트의 색상을 설정
    textElement.style.color = colors[index];

    if (isDeleting) {
        currentText = texts[index].substring(0, charIndex--);
    } else {
        currentText = texts[index].substring(0, charIndex++);
    }

    textElement.textContent = currentText;

    if (!isDeleting && charIndex === texts[index].length) {
        setTimeout(() => isDeleting = true, 1000); // Pause before starting to delete
    } else if (isDeleting && charIndex === 0) {
        isDeleting = false;
        index = (index + 1) % texts.length; // Move to the next text
    }

    setTimeout(type, isDeleting ? 50 : 100); // Adjust typing speed here
}

document.addEventListener("DOMContentLoaded", () => {
    setTimeout(type, 500); // Initial delay before typing starts
});

</script>





</body>
</html>