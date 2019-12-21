<%--
/**
 * <pre>
 * @Author      : 안동환
 * @CreateDate  : 2019. 12. 20. 오전 6:02:11
 * @ModifyDate  : 2019. 12. 20. 오전 6:02:11
 * @fileName    : 게시판 상세 페이지
 * @Description :
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록</title>
<style>
.container {
	margin: 0 auto;
	padding-bottom: 10px;
}

.contents {
	margin-top: 30px;
	width: inherit;
	height: 650px;
}
#myPageMenu {
	width: 200px;
	height: 1080px;
	border-right: 2px solid black;
	display: inline-block;
	float: left;
	margin-right: 10px;
}
#h3 {
	font-family: 'Nanum Myeongjo', serif;
	background-color: #211f22;
	padding-top: 7px;
	padding-bottom: 7px;
	color: #a07342;
	margin-top: 0px; 
}
#menu  dt {
	font-size: 1.5em;
	font-family: 'Nanum Myeongjo', serif;
	margin-top: 50px;
	margin-bottom: 10px;
 }
#menu  dd {
	font-size: 15px;
	margin-left: 20px;
	margin-top: 7px;
	margin-bottom: 7px;	
	color: darkgray;
}
#myPageMenu {
	width: 200px;
	height: 1080px;
	border-right: 2px solid black;
	display: inline-block;
	float: left;
	margin-right:10px;
	margin-top: 10px;
}
#table_conntents {
	margin-left: 203px;
	width: 82%;
	height: 100%;
}
#freeBoard {
	margin-top: 30px;
	width: 46%;
	height: 45%;
	float: left;
}
.menuStatus>.status2 {
	display: flex;
	width: 920px;
	height: 54px;
	background-color: lightgray;
	padding-left: 25px;
    padding-top: 18px;
}
.container>.contents>.menuStatus {
	width: 920px;
	display: inline-block;
	margin-left: 10px;
	border-bottom: 1px solid #000;
	margin-bottom: 10px;
}
.status2>p:nth-of-type(2) {
	padding-left: 10px;
    color: #f00;
    font-weight: bold;
}
#myPageMenu>dl>dd>a {
	color: darkgray;
	text-decoration: none;
	cursor: pointer;
}

#myPageMenu>dl>dd>#selectMenu {
	font-size: 1em;
	font-weight: bold;
	color: black;
	text-decoration: underline;
}

#myPageMenu>dl>dd>a:hover {
	font-size: 1em;
	font-weight: bold;
	color: black;
	text-decoration: underline;
}
.container>.contents>#myPageMenu {
	width: 200px;
	height: 1080px;
	border-right: 2px solid black;
	display: inline-block;
	float: left;
	margin-right:10px;
	margin-top: 10px;
}
#QNABoard {
	margin-top: 30px;
	margin-left: 20px;
	width: 46%;
	height: 45%;
	float: left;
}
#freeBoardTable th {
	border-bottom: 3px solid rgb(160, 115, 66);
}
#freeBoardTable th > h4{
	margin-top: 18px;
	margin-bottom: 0px;
	font-weight: bold;
	float: left;
}
#freeBoardTable {
	margin-left: 15px;
	width: 100%;
}
#freeBoardTable td {
	height: 5px;
	padding: 10px;
	
}
#freeBoardTable th  p{
	margin-top: 18px;
	margin-bottom: 0px;
	margin-left: 410px;
}
#boardCount_div {
	width: 100%;
	margin-top: 20px;
}
.boardCount {
	
	height: 20px;
	float: left;
}
#table {
	width: 95.5%;
	margin-left: 22px;
	
}
#table th {
	text-align: center;
	background: #f5efe7;
	height: 30px;
	border-top: 2px solid;
	border-bottom: 1px solid;
}
#table th:nth-child(2) {
	width: 500px;
}
#table {
	width: 95.5%;
	margin-left: 22px;
}
#table th:nth-child(2) {
	width: 500px;
}
#table td {
	text-align: center;
	height: 40px;
	border: 1px solid;
}
.pagingArea {
	text-align: center;
}
#table input[type='text'] {
	float: left;
	margin-left: 10px;
	width: 98%;
	border: none;
}
input[type="text"]:focus {
	outline: none;
}
#boardkinds {
	float: left;
	margin-left: 10px;
}
#table td:nth-child(1) {
	width: 250px;
	background: #F5EFE7;
}
#textArea {
	width: 100%;
	height: 400px;
	resize: none;
	border: none;
}
#textArea:focus {
	outline: none;
}
</style>
<title>LauXion</title>
<link rel="shortcut icon" href="<%= request.getContextPath() %>/img/favicon.ico" type="image/x-icon"/>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>
	<% if(loginMember != null) { %>
		<div class="container">
		<div class="contents">
		<div id="myPageMenu">
			<h3 id="h3" align="center">게시판 작성</h3>
			<dl id="menu">
				<dt>§ &nbsp;LAUXION</dt>
				<dd id="free">▶   자유게시판</dd>
				<dd id="question">▶   문의게시판</dd>
				<dd id="review">▶   리뷰게시판</dd>
				<dd id="FAQ">▶   FAQ게시판</dd>
			</dl>
		</div>
		<div class="menuStatus">
			<div class="status1">
				<h3>&nbsp;&nbsp;<&nbsp;게시판 작성&nbsp;>&nbsp;</h3>
			</div>  <!-- status1 end -->
			<div class="status2">
				<p>게시판을 작성하는 곳입니다..</p>
			</div>  <!-- status2 end -->
		</div>  <!-- menuStatus end -->
		<div id="table_conntents">
			<div id="boardCount_div">
				<form action="<%=request.getContextPath() %>/BoardAllInsert.bo" method="get" onsubmit="return ok()">
					<table id="table">
					<tr>
						<td>제목</td>
						<td>
							<input type="text" placeholder="제목 입력 란" name="title">
							<input type="hidden" value="<%= loginMember.getMemberNo() %>" name="memberNo">
						</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" value="<%=loginMember.getMemberName()%>" name="writer" readonly></td>
					</tr>
					<tr>
						<td>게시판 종류</td>
						<td><select id="boardkinds" name="boardKinds">
								<option value="BT1">자유게시판</option>
								<option value="BT2">문의게시판</option>
							</select>
						</td>
					</tr>
					<tr><td colspan="2">내용</td></tr>
					<tr>
						<td colspan="2">
							<textarea id="textArea" rows="" cols="" placeholder="내용 입력 란" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button id="back">뒤로가기</button><button id="submit">작성하기</button>
						</td>
					</tr>
				</table>
				</form>
			</div>
			<div>
			</div>
		</div>
	</div>
	</div>
	<% } %>
	<%@ include file="../common/footer.jsp" %>
	<script>
		var nn = false;
		$("#submit").click(function(){
			nn = true;
		})
		$("#back").click(function(){
			window.history.back();
		})
			function ok(){
				return nn;
			}
	</script>
</body>
</html>