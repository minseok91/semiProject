<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 성공페이지 -->
	<script>
		window.onload = function(){
			<% if(msg == "successMember") { %>
			alert("회원정보 수정을 완료 했습니다.");
			location.href = "<%= request.getContextPath() %>/views/myPage/memberChange/memberInfoChange.jsp";
		<% } else if(msg == "wrongPwd"){ %>
			alert("비밀번흐를 다시 확인해주세요");
			location.href="views/myPage/memberChange/userInfoChange.jsp";
		<% } else if(msg == "delete") {%>
			if(confirm("정말 탈퇴하시겠습니까?")){
				console.log("탈퇴완료");
			}
		<% } %>
		}
	</script>
</body>
</html>