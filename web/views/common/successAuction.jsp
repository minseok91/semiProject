<%--
/**
 * <pre>
 * @Author      : gurwns
 * @CreateDate  : 2019. 12. 16. 오후 10:30:35
 * @ModifyDate  : 2019. 12. 16. 오후 10:30:35
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
<title>Insert title here</title>
</head>
<body>
	<script>
		alert("성공적으로 경매가 등록되었습니다.");
		location.href="<%= request.getContextPath() %>/views/myPage/sale/auctionList.jsp";
	</script>
</body>
</html>