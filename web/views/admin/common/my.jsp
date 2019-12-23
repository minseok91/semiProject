<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		 <canvas id="myChart"></canvas> 

		</div>

	<script>
		 let myChart = document.getElementById('myChart').getContext('2d');
	$(function(){
		/* $.ajax({
			url:,
			
		}) */
	})
		let massPopchart = new Chart(myChart, {
			type: 'bar', // bar, horizontalbar, pie, line, doughnut
			data:{
				labels:['7월','8월','9월','10월','11월','12월'],
				datasets:[{
					label:'월',
					data:[
						157594,
						157041,
						153560,
						156519,
						155162,
						159072
					]
				}]
			},
			options:{}
		}); 
		</script>
</body>
</html>