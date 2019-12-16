<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String) request.getAttribute("msg");
	String msg2 = request.getParameter("msg");
	System.out.println(msg2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<!-- 성공페이지 -->
<form action="" id="form1"></form>
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
				$("#form1").attr("action", "<%= request.getContextPath() %>/deleteMember");
				$("#form1").attr("method", "post");
				$("#form1").submit();
			}
		<% } else if(msg == "successMemberYP") { %>
			alert("회원정보 수정을 완료했습니다. 로그인을 다시 해주세요");
			location.href="<%= request.getContextPath() %>/index.jsp";
		<% } %>
		<% if(msg2 == "success") { %>
			alert("경매가 정상적으로 등록되었습니다.");
			location.href = "<%= request.getContextPath() %>/views/myPage/sale/auctionList.jsp";
		<% } %>
		}
	</script>
</body>
</html>