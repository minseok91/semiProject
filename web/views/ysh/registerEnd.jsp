<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/registerEnd.css">
<title>LauXion</title>
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

	<%@ include file="../common/footer.jsp" %>
</body>
</html>