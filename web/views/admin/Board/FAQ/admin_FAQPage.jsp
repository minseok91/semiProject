<%--
/**
 * <pre>
 * @Author      : 안동환
 * @CreateDate  : 2019. 12. 15. 오후 5:56:50
 * @ModifyDate  : 2019. 12. 15. 오후 5:56:50
 * @fileName    : 관리자 FAQ페이지
 * @Description :
 * </pre>
 */
--%>
<%@  page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.lp.admin.board.model.vo.*
	, com.kh.lp.common.*"%>
<% 
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list"); 
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int startPage = pi.getStartPage();
	int endPage = pi.getMaxPage();
	int currentPage = pi.getCurrentPage();
	int listCount = pi.getListCount();
	int limit = pi.getLimit();
	int maxPage = pi.getMaxPage(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<link rel="icon" type="image/png" sizes="32x32" href="<%= request.getContextPath() %>/views/admin/image/loginimg(2).png">
<title>FAQ</title>
<style>
html, body {
	padding: 0;
	margin: 0;
	width: 100%;
	height: 100%;
}

.container {
	width: 1080px;
	margin-left: auto;
	margin-right: auto;
}

.contents {
	width: 100%;
	height: 650px;
	margin-top: 10%;
	border: 1px solid;
	border-radius: 10px;
}

.contents>div:first-child {
	width: 94%;
	height: 53px;
	margin: 0 auto;
}

.contents>div:first-child>div {
	width: 100%;
	height: 50px;
}

#table {
	width: 100%;
	border-collapse: collapse;
}

#table th {
	border-top: 1px solid;
	background: #E2CEB8;
	color: #211f22;
	font-size: 1.2em;
	height: 32px;
	border-top: 1px solid #211f22;
	border-bottom: 1px solid #211f22;
}

#table tr th, #table tr td {
	border-bottom: 1px solid #CCCCCC;
	text-align: center;
	padding-top: 5px;
}

#search_Box {
	width: 300px;
	height: 100%;
	border: none;
	margin-top: 10px;
}

#search_Box tr td:nth-of-type(1) {
	width: 150px;
	text-align: right;
}

.contents>div>p, h3 {
	margin: 0;
	float: left;
}

.contents>div>p {
	padding-top: 1px;
}

.contents>div:nth-child(2) {
	width: 95%;
	height: 73.5%;
	margin-left: auto;
	margin-right: auto;
	margin-top: -14px;
}

#nextPage {
	width: 80%;
	height: 100%;
	margin-left: auto;
	margin-right: auto;
}

#nextPageBox {
	width: 80%;
	height: 100%;
	margin-left: auto;
	margin-right: auto;
}

#updateBtn {
	border: none;
	background: rgb(160, 115, 66);
	color: #e2ceb8;
	margin-bottom: 7px;
}

#deleteBtn {
	border: none;
	background: red;
	color: #e2ceb8;
	margin-bottom: 7px;
}

#search_Box td:nth-of-type(2) select {
	margin-left: 8px;
	width: 80px;
	height: 30px;
	border-radius: 5px;
}

#idSearch {
	font-family: sans-serif;
    font-size: 15px;
    width: 150px;
    border: none;
	box-shadow: 0px 0px 5px 0px rgba(33,31,34,0.45);
}

#idSearchBtn {
	border:1px solid #a07342;
		background:#211f22;
		color:#e2ceb8;
		height:24px;
		border-radius:4px;
		font-size:16px;
		font-weight: bold;
}

#NoticeNumber>p {
	width: 101px;
	margin-bottom: 0px;
	margin-top: 17px;
	float: left;
}

#NoticeNumber>h4 {
	margin-bottom: 0px;
	margin-top: 17px;
	float: left;
}
#boardType {
	height: 32px;
}
#insertBoard {
	float: right;
	margin-right: 31px;
}
#nextPageBox button {
	background: none;
	border: none;
	border: 1px solid white;
	background: white;
	color: black;
	height: 23px;
	border-radius: 5px;
	font-size: 17px;
}
</style>
<body>
	<%@ include file="../../common/headerPage.jsp"%>
	<div id="container" class="container">
		<div id="contents" class="contents">
			<div>
				<table id="search_Box" style="float: right;">
					<tr>
						<td>
							 <input type="text" id="idSearch" style="margin-left: 87px;">
						</td>
						<td>
							<button id="idSearchBtn">검색</button>
							</td>
					</tr>
				</table>
			</div>
			<div>
				<div id="NoticeNumber">
					 <p>총 게시판 글 :</p><h4><%= listCount %> 개</h4>
				</div>
				<table id="table">
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th style="width: 200px;">제목</th>
						<th>작성일</th>
						<th>수정일</th>
						<th>게시판 종류</th>
						<th>조회수</th>
					</tr>
					<% for(int i=0; i<list.size(); i++) { %>
					<tr>
						<td><%= list.get(i).getBoardId	() %>
							<input type="hidden" value="<%= list.get(i).getBoardId()%>">
							<input type="hidden" value="<%= list.get(i).getBoardMemberName()%>">
						</td>
						<td><%= list.get(i).getBoardMemberName() %></td>
						<td style="width: 560px"><%= list.get(i).getBoardTitle() %></td>
						<td><%= list.get(i).getBoardDate() %></td>
						<td><%= list.get(i).getBoardModifyDate() %></td>
						<% switch(list.get(i).getBoardType()) { 
						case "BT4" : %><td>FAQ게시판</td><%
						; break;
						}%>
						<td><%= list.get(i).getBoardCount() %></td>
					</tr>
			<% } %>

				</table>

			</div>
			<button id="insertBoard">글쓰기</button>
			<div id="nextPage">
				<div id="nextPageBox" align="center">
					<button onclick="location.href='<%=request.getContextPath()%>/selectFAQ.bo?currentPage=1'"><<</button>
					<% if(currentPage <= 1){ %>
						<button disabled> < </button>
					<% } else { %>
						<button onclick="location.href='<%=request.getContextPath()%>/selectFAQ.bo?currentPage=<%=currentPage-1%>'"><</button>
					<% } %>
					
					
					<% for(int p = startPage ; p <= endPage; p++){ 
						if(p == currentPage) {
					%>			
						<button class="btn" onclick="location.href='<%=request.getContextPath()%>/selectFAQ.bo?currentPage=<%=p%>'" style="font-weight: bold;"><%=p %></button>	
						<% } else { %>
						<button class="btn" onclick="location.href='<%=request.getContextPath()%>/selectFAQ.bo?currentPage=<%=p%>'"><%=p %></button>	
						<% } %>
						
					<% } %>					
					<% if(currentPage >= maxPage){ %>
						<button disabled> > </button>
					<% } else { %>
						<button class="btn" onclick="location.href='<%=request.getContextPath()%>/selectFAQ.bo?currentPage=<%=currentPage + 1 %>'"> > </button>
					<% } %>
						<button class="btn" onclick="location.href='<%=request.getContextPath()%>/selectFAQ.bo?currentPage=<%=maxPage%>'">>></button>
				</div>
			</div>
			 
			<!--  pagingArea End game -->
		</div>
	</div>
	<script>
	$("td").click(function(e) {
				var memberName = e.target.parentNode.children[0].children[1].value;
				var boardId = e.target.parentNode.children[0].children[0].value;
			    location.href="<%=request.getContextPath()%>/boardFAQDetail.bo?boardId="+boardId+"&MemberName="+memberName;
		})
		$("#insertBoard").click(function(){
			location.href="<%=request.getContextPath()%>/views/admin/Board/FAQ/admin_InsertFAQPage.jsp";
		})
			$("#table td ,button").mouseover(function(e) {
			$("td").css({"cursor":"pointer"})
			$("button").css({"cursor":"pointer"})
		})
	</script>
</body>
</html>