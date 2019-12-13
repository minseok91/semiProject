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
	width: 86%;
	left: 50%;
	transform: translateX(-50%);
	text-align: center;
}

.list>table {
	
	border-collapse: separate;
	border-spacing: 40px;
}

td {
	width: 120px;
	box-shadow: 0px 0px 8px 0px rgba(33,31,34,0.45);
}

td>img {
    width: 768%;
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

td>a>.content, .time {
	font-size: 12px;
}

td>.content {
	position: relative;
	text-align: left;
	white-space: pre-wrap;
	left: 2%;
	font-size: 12px;
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
					<tr>
						<%
							for (int i = 0; i < 6; i++) {
						%>
						<!-- 6개 제한 -->
						<td>
							<a style="cursor: pointer;" onclick="detail()">
								<p id="num"></p>
								<div id="img">
									<div class="price">￦720,000</div>
									<img src="<%=request.getContextPath()%>/img/watch1.jpg"
										alt="">
								</div> <span class="content">Omega Speedmaster Black Dial</span>
								<div class="time">3 days 13 : 42</div>
							</a>
						</td>
						<%
							}
						%>
					</tr>
				<tr>
					<td>
						<img alt="" src="<%=request.getContextPath()%>/img/add.png">
					</td>
				</tr>
				
				<tr>
						<%
							for (int i = 0; i < 6; i++) {
						%>
						<!-- 6개 제한 -->
						<td>
							<a style="cursor: pointer;" onclick="detail()">
								<p id="num"></p>
								<div id="img">
									<div class="price">￦2,314,000</div>
									<img src="<%= request.getContextPath() %>/img/bag1.jpg" alt="" >
								<span class="content">Cartier Marcello De Cartier handbag Bro…</span>
								<div class="time">3 days 13 : 42</div>
							</a>
						</td>
						<%
							}
						%>
					</tr>
			</table>
		</div>
	</div>
	</div>
	<%@ include file="views/common/footer.jsp" %>
	
	<script type="text/javascript">
		function detail() {
			const num = document.getElementById('num');
			
			location.href="<%= request.getContextPath() %>"/views/goods/watchList.jsp;
			<%-- location.href="<%= request.getContextPath() %>"/[서블릿링크]?num=num; --%>
		} 
	</script>
</body>
</html>