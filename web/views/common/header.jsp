<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.lp.member.model.vo.*"%>
<%
	Member loginMember = (Member) session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="chrome">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title></title>
<style>
	header {
		position: relative;
    	width: 100%;
    	height: 96px;
    	vertical-align: middle;
	}
	header #top-header{
    	height: 96px;
    	width: 100%;
		background: #211f22;
		text-align: center;
	}
	header>#th1 {
		width: inherit;
		height: inherit;
		text-align: center;
	}
	
	header .container #left {
		display: inline-block;
		text-align: left;
    	font-size: 13px;
    	font-weight: bold;
    	color: #a07f5c;
	}
	
	#top-header>.container, #top-header>.container>#th1 {
		height: inherit;
	}
	
	.container>#th1 #left {
		position: absolute;
    	right: 72%;
    	top: 22%;
	}
	
	.container>#th1 #logo {
		position: absolute;
    	left: 50%;
    	margin-top: -2.5%;
    	transform: translateX(-50%);
	}
	
	.container>#th1 #headerlogin {
		position: absolute;
    	display: inline-block;
    	left: 79%;
    	top: 38%;
	}
	
	header .container #headerlogin a {
		display: inline;
    	color: #a07f5c;
    	margin: 10px;
    	padding: 10px;
    	text-decoration: none;
    	
	}
	
	header .container #headerlogin a:hover {
		color: #211f22;
   		background-color: #a07f5c;
    	transition: 0.5s;
    	text-decoration: none;
	}
</style>
</head>
<header>
	<div id="top-header">
		<div class="container">
			<div id="th1">
				<p id="left">
                	Second-hand Luxury Watch & Bag Auction<br />
                	100% Authenticity Guaranteed
            	</p>
				<p id="logo" style="display: inline-block; margin-bottom: 10px;">
					<a href="<%=request.getContextPath() %>"><img src="<%= request.getContextPath() %>/img/LauXion_logo.png" alt="" id="logo"></a>
				</p>
				<p id="headerlogin" style="display: inline-block;">
					<% if(loginMember == null) { %>
					<a href="<%= request.getContextPath() %>/views/member/login.jsp">로그인</a>
                	<a href="<%= request.getContextPath() %>/views/member/registerAgreement.jsp">회원가입</a> 
					<% } else { %>
					<a href="<%= request.getContextPath() %>/logout.me">로그아웃</a>
					<a href="<%= request.getContextPath() %>/views/myPage/buy/wishList.jsp">마이페이지</a>
					<% } %>       	
				</p>
			</div>  <!-- th1 end -->
		</div>  <!-- container end -->
	</div>  <!-- top-header end -->
</header>
</html>