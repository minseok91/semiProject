<%--
/**
 * <pre>
 * @Author      : gurwns
 * @CreateDate  : 2019. 12. 6. 오전 4:06:48
 * @ModifyDate  : 2019. 12. 6. 오전 4:06:48
 * @fileName    : findIdResult.jsp
 * @Description : 아이디 찾기 결과 페이지
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberId = request.getParameter("memberId");
%>
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
			<br /><br />
			<h2 align="center">아이디 찾기 결과</h2>
			<div id="resultArea" align="center">
				<br /><br /><br />
				<p>조회하신 고객님의 아이디는 다음과 같습니다.</p>
				<h3><%= memberId %></h3>
			</div>  <!-- resultArea end -->
			<div id="btnArea" align="right">
				<br />
				<button class="btn" onclick="goHome()">메인으로 돌아가기</button>
				<button class="btn" onclick="findPwd()">비밀번호 찾기</button>
			</div>  <!-- btnArea -->
		</div>  <!-- contents end -->
	</div>  <!-- container end -->
	<%@ include file="../common/footer.jsp" %>
	<script>
		function goHome(){
			location.href="<%= request.getContextPath() %>/index.jsp";
		}
		function findPwd(){
			location.href="<%= request.getContextPath() %>/views/member/findPwd.jsp";
		}
	</script>
</body>
</html>