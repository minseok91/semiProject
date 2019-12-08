<%--
/**
 * <pre>
 * @Author      : minseok
 * @CreateDate  : 2019. 12. 5. 오후 12:03:13
 * @ModifyDate  : 2019. 12. 5. 오후 12:03:13
 * @fileName    : 	noticeDetail.jsp
 * @Description :	게시판 상세
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.lp.board.model.vo.*"  %>
    <% Board b = (Board) request.getAttribute("b"); %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
</head><link rel="icon" type="image/png" sizes="32x32" href="image/loginimg(2).png">
<title>Insert title here</title>
<style>
	html, body {
	padding: 0;
	margin: 0;
	width: 100%;
	height: 100%;
}
.container {
	width: 1080px;
	height: 800px;
	margin-left: auto;
	margin-right: auto;
}
.contents{
	width: 100%;
	height: 90%;
	margin-top: 10%;
	
}
#infoBox {
	width: 90%;
	height: 100%;
	margin: 0 auto;
}
#infoTable {
	margin-top: 56px;
	margin-left: 38%;	
	width: 45%;
	border-collapse: collapse;
}
#infoTable  td{
	height: 60px;
}
td:nth-of-type(1) {
	font-weight: bold;
	color: #404040;
}
td:nth-of-type(2) {
	color: #000000;
}
#infoBox > h3{
	text-align: center;
}
#buttonBox {
	margin-top: 30px;
	width: 73.03px;
	margin-left: auto;
	margin-right: auto;
}
#buttonBox button {
	background: rgb(33, 31, 34);
	border: 1px solid rgb(33, 31, 34);
	color: rgb(160, 115, 66);
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>회원정보 관리 상세</title>
</head>
<body>
	<%@ include file="headerPage.jsp" %>
	<div id="container" class="contents">
		<div id="contents" class="contents">
			<div id="infoBox">
			<h3>게시판 상세보기</h3>
				<table id="infoTable">
					<tr>
						<td>제목</td>
						<td><%=b.getbTitle() %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><%=b.getbWriter() %></td>
					</tr>
					<tr>
						<td>작성일</td>
						<td><%=b.getbDate() %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><%=b.getbContent() %></td>
					</tr>
				</table>
				<div id="buttonBox">
						<button>뒤로 가기</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$("#salesHistory").click(function(){
			location.href = "admin_SalesHistory.jsp";
		}).mouseover(function(){
			$("#salesHistory").css({'cursor':'pointer'})
		})
		$("#purchaseHistory").click(function(){
			location.href = "admin_purchaseHistory.jsp";
		}).mouseover(function(){
			$("#purchaseHistory").css({'cursor':'pointer'})
		})
		$("#buttonBox > button").click(function(){
			location.href="<%= request.getContextPath()%>/selectAll.bo";
		}).mouseover(function(){
			$("#buttonBox > button").css({'cursor':'pointer'})
		})
	</script>
</body>
</html>