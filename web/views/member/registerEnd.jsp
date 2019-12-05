<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LauXion</title>
<style>
	#Register {
    position: relative;
    left: 50%;
    transform: translateX(-50%);
    font-weight: 600; 
    width: 72.5%;
    margin-top: 50px;
    border-bottom: 1px solid #3e2d1a;
    padding-left: 15px;
}

#Register, #Register>#road, #Register>#arrow {
    color: rgba(32, 45, 26, .45);
    font-family: 'Nanum Myeongjo', serif;
    font-size: 19px;
}

#Register>#road {
    margin-left: 50%;
}

#Register>#road>.arrow {
    padding: 0px 28px;
}

#Register, .road:nth-of-type(5), .arrow:nth-of-type(3) {
    color: #3e2d1a;
}

.end {
	vertical-align: middle;
	position: relative;
	left: 50%;
	top: 50%;
	height: 600px;
	transform: translateX(-50%);
	width: auto;
	text-align: center;
	color: #a07342;
	margin-top: 100px;
}

.end>h1, .end>h3 {
	margin-bottom: 50px;
}

.end>button {
	border: 1px solid #f1ebe4;
	background: #211f22;
	padding: 10px;
	color: #a07342;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>

	<div id="Register"> 회원가입
		<span id="road"> 
		<span class="road"> 약관동의 </span> 
		<span class="arrow"> > </span> 
		<span class="road"> 정보입력 </span> 
		<span class="arrow"> > </span> 
		<span class="road"> 가입완료 </span>
		</span>
	</div>
	<div class="end">
		<h1>회원가입이 완료됐습니다.</h1>
		
		<h3>로그인을 진행해주세요.</h3>
		
		<button onclick="goHome()">로그인하러 가기</button>
	</div>
	<script>
		function goHome(){
			location.href="<%= request.getContextPath()%>/views/member/login.jsp";
		}
	</script>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>