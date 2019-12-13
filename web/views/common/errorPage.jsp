<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LauXion</title>
<!-- favicon불러오는 링크 -->
<link rel="shortcut icon" href="<%= request.getContextPath() %>/img/favicon.ico" type="image/x-icon"/>
</head>
<body>
	<script>
		window.onload = function(){
			<% if(msg == "failLogin") { %>
			alert("아이디와 비밀번호를 확인해주세요");
			location.href = "<%= request.getContextPath() %>/views/member/login.jsp";
		<% } else if(msg == "wrongPwd"){ %>
			alert("비밀번흐를 다시 확인해주세요");
			location.href="views/myPage/memberChange/userInfoChange.jsp";
		<% } else if(msg == "failDelete") { %>
			alert("회원탈퇴에 실패했습니다. 다시 시도해주세요");
			location.href="<%= request.getContextPath() %>/index.jsp";
		<% } %>
		}
	</script>
</body>
</html>