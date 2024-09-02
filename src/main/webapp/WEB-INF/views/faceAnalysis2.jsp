<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FaceAnalysis</title>
<link rel="stylesheet" href="assets/css/styles.css" />
<!-- ECharts 라이브러리 추가 -->
<script src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
<!-- <script
	src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.3.3/echarts.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

 <script src="https://cdn.jsdelivr.net/npm/echarts@latest/dist/echarts.min.js"></script>
</head>
<body>

	<%@ include file="header.jsp"%>


	<div class="analysis-main-container">
		
		<div class="analysis-container" style='height: 750px'>

	
			<div id="analysis-result" class="analysis-result2" style='height: 750px'></div>
		</div>
		
	</div>

	<!-- ECharts 차트 렌더링을 위한 JavaScript -->

	

<script >
//This example requires ECharts v5.5.0 or later



var chartDom = document.getElementById('analysis-result');
var myChart = echarts.init(chartDom);
var option;



option = {
  tooltip: {
    trigger: 'item'
  },
  legend: {
    top: '5%',
    left: 'center'
  },
  series: [
    {
      name: 'Access From',
      type: 'pie',
      radius: ['40%', '120%'],
      center: ['50%', '90%'],
      // adjust the start and end angle
      startAngle: 180,
      endAngle: 360,
      data: [
        { value: ${emotion2.fear}, name: 'fear' },
        { value: ${emotion2.happy}, name: 'happy' },
        { value: ${emotion2.surprise}, name: 'surprise' },
        { value: ${emotion2.sad}, name: 'sad' },
        { value: ${emotion2.disgust}, name: 'disgust' },
        { value: ${emotion2.neutral}, name: 'neutral' },
        { value: ${emotion2.angry}, name: 'angry' }
        
      ]
    }
  ]
};

option && myChart.setOption(option);
</script>


	<%@ include file="footer.jsp"%>
</body>
</html>
