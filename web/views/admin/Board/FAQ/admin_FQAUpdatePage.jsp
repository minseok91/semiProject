<%--
/**
 * <pre>
 * @Author      : 안동환
 * @CreateDate  : 2019. 12. 15. 오후 8:25:04
 * @ModifyDate  : 2019. 12. 15. 오후 8:25:04
 * @fileName    : 
 * @Description :
 * </pre>
 */
--%>
<%@page import="com.kh.lp.admin.reply.model.vo.Reply"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.lp.admin.board.model.vo.*
	,java.util.*"%>
<%
	Board list = (Board)request.getAttribute("list");
	ArrayList<Reply> rList = (ArrayList<Reply>)request.getAttribute("Rlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<title>FAQ 상세</title>
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

.contents {
	width: 100%;
	height: 90%;
	margin-top: 5%;
}

#infoBox {
	width: 90%;
	height: 100%;
	margin: 0 auto;
}

#infoTable {
	border: 1px solid;
	width: 1000px;
	height: 566px;
	margin: 0 auto;
	border-collapse: collapse;
}

td:nth-of-type(1) {
	font-weight: bold;
	text-align: center;
	color: #404040;
	background: #EAEAEA;
	border-bottom: 1px solid;
}

td:nth-of-type(2) {
	color: #000000;
	border-bottom: 1px solid;
}
input:nth-of-type(text) {
	border: hidden;
}
#infoBox>h3 {
	text-align: center;
}

#buttonBox {
	margin-top: 30px;
	width: 225px;
	margin-left: auto;
	margin-right: auto;
}

#buttonBox button {
	background: rgb(33, 31, 34);
	border: 1px solid rgb(33, 31, 34);
	color: rgb(160, 115, 66);
}
#infoTable td:nth-child(1){
	width: 200px;
}
#boardContents {
	width: 783px;
	height: 350px;
	resize: none;
	overflow: hidden;
}
input[type="text"] {
	width: 90%;
	margin-left: 30px;
	border: hidden;
}
input[type="text"]:focus {
	outline: none;
}
#category {
	margin-left: 30px;
	height: 30px;
}
#today {
	color: #404040;
}
#comment_top {
	border-bottom: none;
		background: white;
}
#comment_bottom {
	border-top: none;
	text-align:right;
	background: white;
}
#comment_btn {
	margin-right: 30px;
	width: 75px;
	height: 48px;
	background: rgb(33, 31, 34);
	border: 1px solid rgb(33, 31, 34);
	color: rgb(160, 115, 66);
}
#comment_div {
	margin: 0 auto;
	width: 986px;
	height: 300px;
	background: white;
	overflow: scroll;
}
#comment_text {
	width: 861px;
	float: left;
	border: 1px solid;
	height: 45px;
	margin-left:10px;
	resize: none; 
	
}
#comment {
	width: 99%;
	height: 60px;
	margin-top: 28px;
	text-align: left;
}
#comment div:nth-child(1){
float: left; 

}
#comment div:nth-child(2){
padding-left: 136px; 
}
#comment div:nth-child(3){
margin-top: 27px; 
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>회원정보 관리 상세</title>
</head>
<body>
	<%@ include file="../../common/headerPage.jsp"%>
	<div id="container" class="contents">
		<div id="contents" class="contents">
			<div id="infoBox">
				<form action="<%=request.getContextPath()%>/updateBoard.bo" method="post" onsubmit="return ok()">
					<h3 align="center">게시판 상세</h3>
					<input type="hidden" name="pageAddress" value="admin">
					<table id="infoTable">
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" value="<%=list.getBoardTitle()%>" ></td>
						</tr>
						<tr>
							<td>게시판 종류</td>
							<td><input type="hidden" name="category" value="BT4" readonly>
								<input type="text"  value="FAQ" readonly>
							</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="text" name="writer"
								value="<%=list.getBoardMemberName()%>"readonly>
								<input type="hidden" name="memberNo" value="<%= list.getBoardMemberNo()%>">
								<input type="hidden" name="boardId" value="<%= list.getBoardId() %>">
								</td>
						</tr>
						<tr>
							<td>작성일</td>
							<td id="today"><input type="text" id="today" name="date" value="<%= list.getBoardDate() %>"readonly></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea id="boardContents" name="content" ><%= list.getBoardContent() %></textarea></td>
						</tr>
					</table>
					<div id="buttonBox">
						<button id="back">뒤로 가기</button>
						<button id="submit">수정 하기</button>
						<button id="delete">삭제 하기</button>
					</div>
				</form>
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
		<%-- $("#buttonBox > button").click(function(){
			location.href="<%=request.getContextPath()%>
		/selectAll.bo";
		}).mouseover(function() {
			$("#buttonBox > button").css({
				'cursor' : 'pointer'
			})
		}) --%>
		var nn = false;
		$("#submit").click(function(){
			nn = true;
		})
		$("#back").click(function(){
			window.history.back();
		})
		$("#delete").click(function(){
			location.href="<%=request.getContextPath()%>/deleteBoard.bo?boardId=<%=list.getBoardId()%>&type=<%=list.getBoardType()%>"
		})
			function ok(){
				return nn;
			}
	</script>
</body>
</html>