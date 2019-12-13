<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.container {
		width: 1080px;
		margin: 0 auto;
		padding: 6px 0px 0;
}
.contents{
		height:650px;
		width:inherit;
}

.head {
    position: relative;
    width: 900px;
    left: 50%;
    transform: translateX(-50%);
    border-bottom: 1px solid #3e2d1a;
    padding-bottom: 7px;
    margin-top: 50px;
}

.head>span {
    font-family: 'Nanum Myeongjo', serif;
    font-size: 15px;
    font-weight: bold;
    margin-right: 1%; 
    color: #3e2d1a;
}

.title {
	font-weight: bold;
}

form {
	display: inline;
	margin: 0;
	padding: 0;
}

.search {
	margin-left: 28.5%;
	border-left: 5px solid #3e2d1a;
	margin-right: 1%;
	padding-left: 0.5%;
	font-size: 13px;
}

select {
	border: none;
	box-shadow: 0px 0px 5px 0px rgba(33,31,34,0.45);
	font-weight: normal;
	width: 130px;
	padding: 3px
}

select, option {
	color: #a6a6a6;
}

#content {
	border: none;
	box-shadow: 0px 0px 5px 0px rgba(33,31,34,0.45);
	font-weight: normal;
	margin-left: 1%;
	padding: 3px;
}

input[type=submit] {
	width: 54px;
    background: #211f24;
    color: #cca071;
    border: 1px solid #a07342;
    margin-left: 1%;
    font-weight: normal;
}

.list {
	position: relative;	
	width: 800px;
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

.pagingArea {
	position: relative;
    left: -6%;
    top: 5%;
    text-align: center;
    width: auto;
}

.pagingArea button {
	border: none;
	padding: 0;
	background: none;
	margin: 0 3px;
}
	
</style>
<title>LauXion</title>
<link rel="shortcut icon" href="<%= request.getContextPath() %>/img/favicon.ico" type="image/x-icon"/>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>
	<div class="container">
		<div class="contents">
		<div class="head">
			<span class="title">< 경매 진행중인 가방 상품 ></span> <span class="search">검색</span>
			<span class="content">
				<form action="" method="get">
					<select name="keyword" id="keyword">
						<option value="brand">브랜드명</option>
						<option value="content">모델명</option>
					</select> 
					
					<input type="search" name="content" id="content" placeholder="브랜드명">
					<input type="submit" value="검색">
				</form>
			</span>
		</div>
		
		<div class="list">
			<table>
				<tr>
<%-- 				<% 
					for(int i=1; i<11; i++) { 
						if(i == 10*(i-4)-5) { // 5, 15, 25, ... -> </tr><tr>, 10, 20, ... -> </tr>
				%>
					</tr><tr>
					<% } %> --%>
					<td>
						<div id="img">
                        	<div class="price">￦2,314,000</div>
                            <img src="../../img/bag1.jpg" alt="" >
                        </div>
                        <span class="content">Cartier Marcello De Cartier handbag Bro…</span>
                        <div class="time">End in 8h 55m</div>
					</td>
				<!-- <tr>
					<td>
						<div id="img">
                        	<div class="price">￦2,314,000</div>
                            <img src="../../img/bag1.jpg" alt="" >
                        </div>
                        <span class="content">Cartier Marcello De Cartier handbag Bro…</span>
                        <div class="time">End in 8h 55m</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦2,314,000</div>
                            <img src="../../img/bag1.jpg" alt="" >
                        </div>
                        <span class="content">Cartier Marcello De Cartier handbag Bro…</span>
                        <div class="time">End in 8h 55m</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦2,314,000</div>
                            <img src="../../img/bag1.jpg" alt="" >
                        </div>
                        <span class="content">Cartier Marcello De Cartier handbag Bro…</span>
                        <div class="time">End in 8h 55m</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦2,314,000</div>
                            <img src="../../img/bag1.jpg" alt="" >
                        </div>
                        <span class="content">Cartier Marcello De Cartier handbag Bro…</span>
                        <div class="time">End in 8h 55m</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦2,314,000</div>
                            <img src="../../img/bag1.jpg" alt="" >
                        </div>
                        <span class="content">Cartier Marcello De Cartier handbag Bro…</span>
                        <div class="time">End in 8h 55m</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="img">
                        	<div class="price">￦2,314,000</div>
                            <img src="../../img/bag1.jpg" alt="" >
                        </div>
                        <span class="content">Cartier Marcello De Cartier handbag Bro…</span>
                        <div class="time">End in 8h 55m</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦2,314,000</div>
                            <img src="../../img/bag1.jpg" alt="" >
                        </div>
                        <span class="content">Cartier Marcello De Cartier handbag Bro…</span>
                        <div class="time">End in 8h 55m</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦2,314,000</div>
                            <img src="../../img/bag1.jpg" alt="" >
                        </div>
                        <span class="content">Cartier Marcello De Cartier handbag Bro…</span>
                        <div class="time">End in 8h 55m</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦2,314,000</div>
                            <img src="../../img/bag1.jpg" alt="" >
                        </div>
                        <span class="content">Cartier Marcello De Cartier handbag Bro…</span>
                        <div class="time">End in 8h 55m</div>
					</td>
					<td>
						<div id="img">
                        	<div class="price">￦2,314,000</div>
                            <img src="../../img/bag1.jpg" alt="" >
                        </div>
                        <span class="content">Cartier Marcello De Cartier handbag Bro…</span>
                        <div class="time">End in 8h 55m</div>
					</td>
				</tr> -->
<%-- 					<% } %>
				<% } %> --%>
			</table>
		</div> <!-- watchList End -->
		<div class="pagingArea">
			<button><<처음</button>
			<button><이전</button>
			<button>1</button>
			<button>2</button>
			<button>3</button>
			<button>4</button>
			<button>5</button>
			<button>다음></button>
			<button>마지막>></button>
		</div>
		</div> <!-- contents End -->
	</div> <!-- container End -->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>