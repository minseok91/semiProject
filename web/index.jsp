<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LauXion</title>
<!-- favicon불러오는 링크 -->
<link rel="shortcut icon" href="<%= request.getContextPath() %>/img/favicon.ico" type="image/x-icon"/>
<style>
	.container {
		width: 1080px;
		margin: 0 auto;
		paading: 6px 0px 0;
	}
	.contents{
		height:650px;
		width:inherit;
	}
	
.list {
	position: relative;	
	left: 50%;
	transform: translateX(-50%);
	text-align: center;
}

.list>table {
	position: relative;
    left: 7%;
	border-collapse: separate;
	border-spacing: 40px;
}

.list > img {
	position: relative;
    left: 49%;
    transform: translateX(-50%);
    width: 100%;
}

td {
	width: 120px;
	box-shadow: 0px 0px 8px 0px rgba(33,31,34,0.45);
}

#img {
	width: 100px;
	margin-left: auto;
	margin-right: auto;
}

#img>img {
	width: 100px;
	height: 100px;
}

.price {
	margin-top: 8px;
	background-color: rgba(33, 31, 34, 0.863);
	font-size: 11px;
    text-align: center;
    background-color: #211f22;
    background-color: rgba(33, 31, 34, 0.863);
    color: #fff;
    width: 100px;
}

td>.content, .time {
	font-size: 12px;
}

td>.content {
	position: relative;
	text-align: left;
	white-space: pre-wrap;
	left: 2%;
}

.time {
	background: #a07342;
	border-radius: 5px;
	color: #fff;
	margin: 0 5px 5px 5px;
}
</style>
</head>
<body>
	<%@ include file="views/common/header.jsp" %>
	<%@ include file="views/common/nav.jsp" %>
	<div class="container">
		<div class="contents">
			<div class="list">
			<table>
					<tr id="watch">
						<!-- 6개 제한 -->
					</tr>
			</table>
			<img alt="" src="<%=request.getContextPath()%>/img/add.png">
			<table>
				<tr id="bag">
					
				</tr>
			</table>
		</div>
	</div>
	</div>
	<%@ include file="views/common/footer.jsp" %>
	
	<script type="text/javascript">
		$(function() {
			const lp = "<%= request.getContextPath() %>";
			$.get("<%= request.getContextPath() %>/watchsix.se", function(response) {
				console.log(response);
				const arr = response.split("#");
				let temp="";
				
				for(i in arr) {
					var arr2 = arr[i].split("::");
					
         			temp += "<td>"
					temp += "<div id='img'><div class='price'>"+ arr2[2] +"</div><img src='"+ lp +"/img/appraisal/"+ arr2[3] +"'></div>";
					if(arr2[4].length+arr2[5].length < 10)
						temp += "<span class='content'>"+arr2[4] + "<br>" + arr2[5]+"</span>";
					else 
						temp += "<span class='content'>"+arr2[4] + " " + arr2[5]+"</span>";
					
					temp += "<div class='time'>"+arr2[6]+"</div>";
					temp += "<div hidden>"+ arr2[0] +"</div>";
					temp += "<div hidden>"+ arr2[3] +"</div>";
					temp += "</td>";
					}
					
					
					$("#watch").append(temp);
				});
			
				$.get("<%= request.getContextPath() %>/bagsix.se", function(response) {
					console.log(response);
					const arr = response.split("#");
					let temp="";
					
					for(i in arr) {
						var arr2 = arr[i].split("::");
						
	         			temp += "<td>"
						
						temp += "<div id='img'><div class='price'>"+ arr2[2] +"</div><img src='"+ lp +"/img/appraisal/"+ arr2[3] +"'></div>";
						if(arr2[4].length+arr2[5].length < 10)
							temp += "<span class='content'>"+arr2[4] + "<br>" + arr2[5]+"</span>";
						else 
							temp += "<span class='content'>"+arr2[4] + " " + arr2[5]+"</span>";
						temp += "<div class='time'>"+arr2[6]+"</div>";
						temp += "<div hidden>"+ arr2[0] +"</div>";
						temp += "<div hidden>"+ arr2[3] +"</div>";
						temp += "</td>";
						}
						
						
						$("#bag").append(temp);
				})
			});
	</script>
</body>
</html>