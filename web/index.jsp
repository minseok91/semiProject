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
</style>
</head>
<body>
	<%@ include file="views/common/header.jsp" %>
	<%@ include file="views/common/nav.jsp" %>
	<div class="container">
		<div class="contents">
		<h1>인덱스 페이지입니다.</h1>
		</div>
	</div>
	<%@ include file="views/common/footer.jsp" %>
</body>
</html>