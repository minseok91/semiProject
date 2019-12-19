<%--
/**
 * <pre>
 * @Author      : Kewon
 * @CreateDate  : 2019. 12. 10. 오후 4:08:12
 * @ModifyDate  : 2019. 12. 10. 오후 4:08:12
 * @fileName    : freeBoard
 * @Description : 자유게시판
 * </pre>
 */
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
 dt {
	font-size: 1.5em;
	font-family: 'Nanum Myeongjo', serif;
	margin-top: 50px;
	margin-bottom: 10px;
 }
 dd {
	font-size: 15px;
	margin-left: 20px;
	margin-top: 7px;
	margin-bottom: 7px;	
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
	height: 135%;
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
	border-bottom: 1px solid rgb(160, 115, 66);
	height: 5px;
	padding: 10px;
	
}
#freeBoardTable th  p{
	margin-top: 18px;
	margin-bottom: 0px;
	margin-left: 410px;
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
			<h3 id="h3" align="center">게시판</h3>
			<dl>
				<dt>§ &nbsp;LAUXION</dt>
				<dd>▶   자유게시판</dd>
				<dd>▶   문의게시판</dd>
				<dd>▶   리뷰게시판</dd>
				<dd>▶   FAQ게시판</dd>
			</dl>
		</div>
		<div class="menuStatus">
			<div class="status1">
				<h3>&nbsp;&nbsp;<&nbsp;럭션 게시판 &nbsp;>&nbsp;</h3>
			</div>  <!-- status1 end -->
			<div class="status2">
				<p>게시판입니다.</p>
			</div>  <!-- status2 end -->
		</div>  <!-- menuStatus end -->
		<div id="table_conntents">
			<div id="freeBoard">
				<table id="freeBoardTable">
					<tr>
						<th><h4>자유게시판</h4><p>more></p></th>
					</tr>
					<tr>
						<td>연습용 제목입니다.</td>
					</tr>
					<tr>
						<td>연습용 제목입니다.</td>
					</tr>
					<tr>
						<td>연습용 제목입니다.</td>
					</tr>
					<tr>
						<td>연습용 제목입니다.</td>
					</tr>
					<tr>
						<td>연습용 제목입니다.</td>
					</tr>
				</table>
			</div>
			<div id="QNABoard">
			<table id="freeBoardTable">
					<tr>
						<th><h4>문의게시판</h4><p>more></p></th>
					</tr>
					<tr>
						<td>연습용 제목입니다.</td>
					</tr>
					<tr>
						<td>연습용 제목입니다.</td>
					</tr>
					<tr>
						<td>연습용 제목입니다.</td>
					</tr>
					<tr>
						<td>연습용 제목입니다.</td>
					</tr>
					<tr>
						<td>연습용 제목입니다.</td>
					</tr>
				</table>
			</div>
			<div id="freeBoard">
			<table id="freeBoardTable">
					<tr>
						<th><h4>리뷰게시판</h4><p>more></p></th>
					</tr>
					<tr>
						<td>연습용 제목입니다.</td>
					</tr>
					<tr>
						<td>연습용 제목입니다.</td>
					</tr>
					<tr>
						<td>연습용 제목입니다.</td>
					</tr>
					<tr>
						<td>연습용 제목입니다.</td>
					</tr>
					<tr>
						<td>연습용 제목입니다.</td>
					</tr>
				</table>
			</div>
			<div id="QNABoard">
			<table id="freeBoardTable">
					<tr>
						<th><h4>FAQ게시판</h4><p>more></p></th>
					</tr>
					<tr>
						<td>연습용 제목입니다.</td>
					</tr>
					<tr>
						<td>연습용 제목입니다.</td>
					</tr>
					<tr>
						<td>연습용 제목입니다.</td>
					</tr>
					<tr>
						<td>연습용 제목입니다.</td>
					</tr>
					<tr>
						<td>연습용 제목입니다.</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="pagingArea">
		</div>
		</div>
	</div>
	<% } %>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>