<%--
/**
 * <pre>
 * @Author      : gurwns
 * @CreateDate  : 2019. 12. 13. 오후 8:19:31
 * @ModifyDate  : 2019. 12. 13. 오후 8:19:31
 * @fileName    : 
 * @Description :
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
		padding: 6px 0px 0;
	}
	.contents{
		height:650px;
		width:inherit;
	}
	#resultArea{
		border-top:1px solid #211f22;
		border-bottom:1px solid #211f22;
		height:300px;
		width:inherit;
		display:inline-block;
	}
	.btn{
		border:1px solid #a07342;
		background:#211f22;
		color:#e2ceb8;
		height:32px;
		border-radius:5px;
		font-size:11px;
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>
	<div class="container">
		<div class="contents">
			<br /><br /><br /><br />
			<h1 align="center">회원탈퇴 완료</h1>
			<div id="resultArea">
			<br /><br /><br /><br />
				<h2 align="center">정상적으로 회원탈퇴가 완료되었습니다.</h2>
				<br />
				<h3 align="center">그동안 이용해 주셔서 감사합니다.</h3>
			</div>  <!-- resultArea end -->
			<div id="btnArea" align="center">
			<br />
				<button type="button" class="btn" onclick="goHome()">메인으로 돌아가기</button>
			</div>  <!-- btnArea end -->
		</div>  <!-- contents end -->
	</div>  <!-- container end -->
	<%@ include file="../common/footer.jsp" %>W
	<script>
		function goHome(){
			location.href="<%= request.getContextPath() %>/index.jsp";
		}
	</script>
</body>
</html>