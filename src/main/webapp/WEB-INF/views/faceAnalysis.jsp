<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    // 세션에서 메시지를 가져오기
    String msg = (String) session.getAttribute("msg");

    // 메시지를 JavaScript로 전달하기 위해 변수에 저장
    if (msg != null) {
%>
    <script>
        var sessionMessage = "<%= msg %>";
    </script>
<%
        // 메시지를 표시한 후 세션에서 제거
        session.removeAttribute("msg");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FaceAnalysis</title>
<link rel="stylesheet" href="assets/css/styles.css" />
<!-- ECharts 라이브러리 추가 -->
<script src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.3.3/echarts.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<%@ include file="header.jsp"%>
	
	


	<div class="analysis-main-container">
		
		 <c:if test="${!empty user}">
               <button id="saveEmotionDataBtn">save</button>
                </c:if>
		<div class="analysis-container">

			<div class="analysis">
				<img id="video" width="640" height="480">
			</div>
			<div id="analysis-result" class="analysis-result"></div>
		</div>
		<!-- 폼태그시작 -->
		<form action="sendreview" method="post">
			<div class="comment-container">
				<!-- 감상평 작성해서 db에 저장하기 -->
				<div class="comment-left">
					<div class="comment-movietitle">MOVIE TITLE</div>
					<select class="select-movietitle" name="moviecode">

						<c:forEach var="m" items="${movieList}">

							<option value="${m.moviecode}">${m.moviename}</option>
						</c:forEach>
						<!-- Add more movie options as needed -->
					</select>
					<div class="comment-content">REVIEW*</div>
					<textarea class="input-review"
						placeholder="Enter your review here..." name="content"></textarea>
				</div>
				<div class="comment-right">
					<div class="comment-emotions">
						<span>Emotions</span> 
						<label><input type="hidden"
							name="email" value="${user.email}"> </label>
							
							<label><input
							type="checkbox" name="fear" value="1"> Fear</label> <label><input
							type="checkbox" name="joy" value="1"> Joy</label> <label><input
							type="checkbox" name="surprise" value="1"> Surprise</label> <label><input
							type="checkbox" name="sadness" value="1"> Sadness</label> <label><input
							type="checkbox" name="boredom" value="1"> Boredom</label> <label><input
							type="checkbox" name="pain" value="1"> Pain</label> <label><input
							type="checkbox" name="disgust" value="1"> Disgust</label> <label><input
							type="checkbox" name="interest" value="1"> Interest</label> <label><input
							type="checkbox" name="disappointment" value="1">
							Disappointment</label>
					</div>
					<input class="send-btn" type="submit" value="SEND >>">
					<!-- <div class="send-btn">SEND >></div> -->



				</div>
			</div>
		</form>
		<!-- 폼태그 끝 -->
	</div>

	<!-- ECharts 차트 렌더링을 위한 JavaScript -->
<script>
    // 세션 메시지가 존재할 경우 alert로 메시지 표시
    if (typeof sessionMessage !== 'undefined' && sessionMessage !== '') {
        alert(sessionMessage);
    }
</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.7.5/socket.io.js"
		integrity="sha512-luMnTJZ7oEchNDZAtQhgjomP1eZefnl82ruTH/3Oj/Yu5qYtwL7+dVRccACS/Snp1lFXq188XFipHKYE75IaQQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script type="text/javascript">
    var socket = io.connect('http://localhost:5000');

    var chartDom = document.getElementById('analysis-result');
    var myChart = echarts.init(chartDom);
    var option;

    // 데이터를 저장할 배열 초기화
    var emotionData = {
        happy: [],
        sad: [],
        angry: [],
        fear: [],
        surprise: [],
        disgust: [],
        neutral: [],
        time: []  // 타임스탬프 저장용
    };

    function updateChart() {
        var seriesList = [];
        for (var key in emotionData) {
            if (key !== 'time') {
                seriesList.push({
                    type: 'line',
                    name: key,
                    showSymbol: false,
                    data: emotionData[key].map(function (value, index) {
                        return [emotionData.time[index], value];
                    }),
                    encode: {
                        x: 'time',
                        y: key
                    }
                });
            }
        }

        option = {
            title: {
                text: 'Emotion Over Time'
            },
            tooltip: {
                trigger: 'axis'
            },
            xAxis: {
                type: 'category',
                nameLocation: 'middle',
                data: emotionData.time
            },
            yAxis: {
                name: 'Emotion Intensity',
                type: 'value'
            },
            series: seriesList
        };

        myChart.setOption(option);
    }

    // 클라이언트에서 프레임 요청
    socket.emit('request_frame');

    // 프레임을 받아 이미지로 업데이트
    socket.on('video_frame', function (data) {
        document.getElementById('video').src = 'data:image/jpeg;base64,' + data;
    });

    // 감정 분석 결과를 받아 차트와 텍스트 업데이트
    socket.on('emotion_result', function (data) {
        if (data.length > 0) {
            var emotions = data[0].emotions;
            var currentTime = new Date().toLocaleTimeString();

            // 감정 데이터 업데이트
            for (var key in emotions) {
                if (emotionData[key]) {
                    emotionData[key].push(emotions[key]);
                }
            }
            emotionData.time.push(currentTime);

            // 차트 업데이트
            updateChart();

            // 감정 결과를 텍스트로 업데이트
            document.getElementById('emotion').innerText = JSON.stringify(emotions, null, 2);
        }
    });
    
    
    /* DB 저장 */
 
        function sumArray(arr) {
            return arr.reduce((a, b) => a + b, 0);
        }

        function sendEmotionDataToServer() {
        	const emotionSums = {
        		    email: "${user.email}",
        		    happy: parseFloat(sumArray(emotionData.happy)),
        		    sad: parseFloat(sumArray(emotionData.sad)),
        		    angry: parseFloat(sumArray(emotionData.angry)),
        		    fear: parseFloat(sumArray(emotionData.fear)),
        		    surprise: parseFloat(sumArray(emotionData.surprise)),
        		    disgust: parseFloat(sumArray(emotionData.disgust)),
        		    neutral: parseFloat(sumArray(emotionData.neutral))
        		};


            fetch('/boot/saveEmotionData', 
            	{
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(emotionSums)
            })
            .then(response => response.text())
           .then(data => {
    window.location.href = '/boot/main';  // 성공 시 main.jsp로 리다이렉션
})
        }

        // 버튼에 이벤트 리스너 추가
        document.getElementById('saveEmotionDataBtn').addEventListener('click', function() {
            sendEmotionDataToServer();
        });
    
    
</script>




	<%@ include file="footer.jsp"%>
</body>
</html>
