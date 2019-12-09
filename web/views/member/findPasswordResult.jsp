<%--
/**
 * <pre>
 * @Author      : gurwns
 * @CreateDate  : 2019. 12. 9. 오후 8:04:58
 * @ModifyDate  : 2019. 12. 9. 오후 8:04:58
 * @fileName    : findPasswordResult.jsp
 * @Description : 비밀번호변경결과페이지
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LauXion</title>
<!-- favicon불러오는 링크 -->
<link rel="shortcut icon" href="<%= request.getContextPath() %>/img/favicon.ico" type="image/x-icon"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	.btn{
		border:1px solid #a07342;
		background:#211f22;
		color:#e2ceb8;
		height:32px;
		border-radius:5px;
		font-size:11px;
	}
	#resultArea{
		border-top:1px solid #211f22;
		border-bottom:1px solid #211f22;
		height:300px;
		width:inherit;
		display:inline-block;
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>
	<div class="container">
		<div class="contents">
		<br /><br /><br /><br />
		<h2 align="left">비밀번호 변경 완료</h2>
			<div id="resultArea">
			<br /><br /><br /><br />
				<h3 align="center">비밀번호가 정상적으로 변경되었습니다.</h3>
				<br />
				<h3 align="center">변경된 비밀번호로 로그인해주세요</h3>
			</div>  <!-- resultArea end -->
			<div id="btnArea" align="right">
				<br />
				<button class="btn" onclick="goHome()">메인으로 돌아가기</button>
			</div>  <!-- btnArea -->
		</div>  <!-- contents end -->
	</div>  <!-- container end -->
	<%@ include file="../common/footer.jsp" %>
	<script>
		function goHome(){
			location.href="<%= request.getContextPath() %>/index.jsp";
		}
	</script>
</body>
</html>