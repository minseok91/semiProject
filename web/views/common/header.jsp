<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="chrome">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/header.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<header>
	<div id="top-header">
		<div class="container">
			<div id="th1">
				<p id="left">
                	Second-hand Luxury Watch & Bag Auction<br />
                	100% Authenticity Guaranteed
            	</p>
				<p id="logo" style="display: inline-block; margin-bottom: 10px;">
					<a href="#"><img src="<%= request.getContextPath() %>/img/LauXion_logo.png" alt="" id="logo"></a>
				</p>
				<p id="login" style="display: inline-block;">
					<a href="">로그인</a>
                	<a href="">회원가입</a>        	
				</p>
			</div>
		</div>
	</div>
</header>
</html>