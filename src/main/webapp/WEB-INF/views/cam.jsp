<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Emotion Over Time</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.3.3/echarts.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <h1>Webcam Live Stream</h1>
    <img id="video" width="640" height="480">
    <div id="main" style="width: 800px; height: 600px;"></div>
    <h2>Emotion Detection Result:</h2>
    <p id="emotion"></p>

    <!-- SocketIO -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.7.5/socket.io.js" integrity="sha512-luMnTJZ7oEchNDZAtQhgjomP1eZefnl82ruTH/3Oj/Yu5qYtwL7+dVRccACS/Snp1lFXq188XFipHKYE75IaQQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script type="text/javascript">
        var socket = io.connect('http://localhost:5000');

        var chartDom = document.getElementById('main');
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
    </script>
</body>
</html>
