<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/semantic/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="../css/semantic/semantic.min.js"></script>
</head>
<style>
	html, body {
		padding:0;
		margin:0;
	}
	#header{
		background:black;
		height:100px;
		width:100%;
	}
	#header2{
		background:rgb(159,115,70);
		height:100px;
		width:100%;
	}
	#footer{
		position:absolute;
	    bottom:0;
	    width:100%;
	    height:70px;   
	    background:#000;
	    
	}
	#main{
		margin-top:100px;
		text-align:center;
		/* border:1px solid black; */
		height:250px;
		width:100%;
	}
	#head{
		/*폰트*/
	}
	#contents{
		/* border:1px solid blue; */
		height:250px;
		width:700px;
		display:inline-block;
	}
	#loginbox{
		/* border:1px solid blue; */
		border-top:1px solid #211f22;
		border-bottom:1px solid #211f22;
		height:200px;
		width:700px;
		display:inline-block;
		
	}
	#login{
		
		float:left;
		 /* border:1px solid blue;  */
		height:200px;
		width:50%;
		display:inline-block;
		text-align:center;
	}
	#find{
		
		float:right;
		/* border:1px solid blue; */
		height:200px;
		width:49%;
		display:inline-block;
		text-align:center;
	}
	#table1{
	font-size:13px;
/* 	text-align:center; */
		padding:15px;	
/* 		margin:13%; */
		width:320px;
		display:inline-block;
		padding-top:66px;
		padding-left:28px;
	}
	#table1>tbody>tr>td:first-child {
		text-align:left;
		padding-right:10px;
		/* margin-right:10px; */
	}
	#table1>tbody>tr>td:nth-child(2) {
		text-align:left;
		padding-right:10px;
		/* margin-right:10px; */
	}
	#table1>tbody>tr>td {
/*  		margin:10px; */
	}
	#table2{
	font-size:13px;
/* 	text-align:center; */
		padding:13px;	
		margin:10%;
		width:290px;
		margin-left:28px;
				margin-top:40px;
	}
	#table2 > * {
		margin:10px;
	}
	#table2>tbody>tr>td:first-child {
		text-align:left;
		margin-right:10px;
	}
	
	#line{
	opacity:0.1;
	margin-top:10px;
	margin-bottom:30px;
	float:left;
	height:170px;
 		border:1px solid black; 
	}
	#btn_login{
		width:5px;
		height:5px;
	}
	.btn {
		border:1px solid #a07342;
		background:#211f22;
		color:#e2ceb8;
	}
	.login{
		width:50px;
		height:50px;
		border-radius:5px;
		font-size:11px;
	}
	.find{
		width:80px;
		height:25px;
		border-radius:5px;
		float:right;
		font-size:11px;
	}
</style>
<body>
	<div id="main">
		<div id="contents">
			<h5 style="float:left; margin-left:10px;">회원 로그인</h5>
			<div id="loginbox">
				<div id="login">
					<form action="" method="post">
					<table id="table1"><!--  border="1"> -->
						<tr> 
							<td id="head">아이디</td>
							<td><input type="text"></td>
							<td rowspan="2" ><button class="btn login" type="submit">로그인</button></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password"></td>
						</tr>
					</table>
					</form>
				</div>
				<div id="line"></div>
				<div id="find">
					<table id="table2"> 
						<tr> 
							<td>회원   아이디를   잊으셨나요?</td>
							<td></td>
							<td><button class="btn find">아이디 찾기</button></td>
						</tr>
						<tr>
							<td>비밀번호를  잊으셨나요?</td>
							<td></td>
							<td><button class="btn find">비밀번호 찾기</button></td>
						</tr>
						<tr>
							<td>아직  회원이  아니신가요?</td>
							<td></td>
							<td><button class="btn find">회원가입</button></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>