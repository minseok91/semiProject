<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/salesAccount.css">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		 <canvas id="myChart"></canvas> 

		</div>

	<script>
		 let myChart = document.getElementById('myChart').getContext('2d');
	
		let massPopchart = new Chart(myChart, {
			type: 'bar', // bar, horizontalbar, pie, line, doughnut
			data:{
				labels:['Boston','Worcester','Springfield','Lowell','Cambridge','New Bedford'],
				datasets:[{
					label:'Population',
					data:[
						617594,
						181041,
						153060,
						106519,
						105162,
						95072
					]
				}]
			},
			options:{}
		}); 
		</script>
</body>
</html>