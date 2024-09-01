
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SearchAnalysis</title>
     <link rel="stylesheet" href="assets/css/styles.css" />
    <!-- ECharts 라이브러리 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
</head>

<body>

<%@ include file="header.jsp" %>

    <div class="analysis-main-container">
    
        <div class="analysis-container">
            <div class="analysis"></div>
            <div id="analysis-result" class="analysis-result"></div>
        </div>

        
        
    </div>

    <!-- JavaScript 코드 삽입 -->
  <script>
        // Java에서 전달된 데이터를 사용합니다.
        
        var labels = ["공포","행복","놀람","슬픔","지루함","통증","혐오"];
        var counts = [${serch2.fear},${serch2.joy},${serch2.surprise},${serch2.sadness},${serch2.boredom},${serch2.pain},${serch2.disgust}];
        // 차트를 위한 데이터 형식으로 변환
        var chartData = labels.map(function(label, index) {
            return {
                value: counts[index],
                name: label
            };
        });

        var chart = echarts.init(document.getElementById('analysis-result'));

        var option = {
            legend: {
                top: 'bottom'
            },
            toolbox: {
                show: true,
                feature: {
                    mark: { show: true },
                    dataView: { show: true, readOnly: false },
                    restore: { show: true },
                    saveAsImage: { show: true }
                }
            },
            series: [
                {
                    name: 'Emotion Chart',
                    type: 'pie',
                    radius: [50, 150],
                    center: ['50%', '50%'],
                    roseType: 'area',
                    itemStyle: {
                        borderRadius: 8
                    },
                    data: chartData
                }
            ]
        };

        chart.setOption(option);
    </script>

<%@ include file="footer.jsp" %>
</body>

</html>
