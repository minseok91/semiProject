<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
</head><link rel="icon" type="image/png" sizes="32x32" href="image/loginimg(2).png">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style> 
	
</style>
<style type="text/css">
	html, body {
		padding: 0;
		margin: 0;
		width: 100%;
		height: 100%;
	}
	#header {
		background: rgb(33, 31, 34);
		width: 100%;
		height: 200px;
		
	}
	#header_bottom {
		width: 100%;
		height: 0px;
		background: rgb(160, 115, 66);
	}
	#img_div {
		width: 1000px;
		height: 160px;
		margin-left: auto;
		margin-right: auto;
		padding-top: 40px;
		background: rgb(33, 31, 34);
	}
	#img_div > div {
		margin-left: auto;
		margin-right: auto;
		width: 329.75px;
		height: 150px;
	}
	
	#img_div > div > img {
		height: 100%;
	}
	#container {
		width: 100%;
		height: 100%;
	}
	#login_div {
		width: 1000px;
		height: 600px;
		margin-left: auto;
		margin-right: auto;
	}
	#header_bottom > div{
		width: 1000px;
		height: 0px;
		background: rgb(160, 115, 66);
	}
	#login_div > table{
		text-align: center;
		margin-left: auto;
		margin-right: auto;
	}
	input[type="text"]{
		width: 250px;
		height: 30px;
		border: solid 1px rgb(160, 115, 66);
		border-radius: 5px;
	}
	
	input[type="password"]{
		width: 250px;
		height: 30px;
		border: solid 1px rgb(160, 115, 66);
		border-radius: 5px;
	}
	
	input[type="submit"] {
		width: 100px;
		height: 50px;
		background: rgb(33, 31, 34);
		color: #e2ceb8;
		border: none;
		border-radius: 5px; 
	}
	#login_div > p{
	margin-left: 330px;
	margin-top: 150px;
	font-size: 15px;
	height: 30px;
	width: 107px;
	}
	input[type='submit']:hover {
		background: rgb(160, 115, 66);
	}
	</style>
</head>
<body>
	<form action="<%= request.getContextPath() %>/login.me" method="post">
		<div id="header">
		<div id="img_div">
			<div>
				<img alt="" src="../image/loginimg.png" id="login_img" onclick="nextPage">
			</div>
			
		</div>
	</div>
	<div id="header_bottom">
		<div>
		</div>
	</div>
	<div id="container">
		<div id="login_div">
				<p>관리자 로그인
			<table>
				<tr>
					<td>&nbsp;</td>
					<td><input type="text" name="memberId"></td>
					<td rowspan ="2"><input type="submit" value="로그인"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="password" name="memberPwd"></td>
				</tr>
			</table>
		</div>
	</div>
	</form>
</body>
</html>