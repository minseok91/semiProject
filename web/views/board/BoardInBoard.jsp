<%--
/**
 * <pre>
 * @Author      : 안동환
 * @CreateDate  : 2019. 12. 10. 오후 4:08:12
 * @ModifyDate  : 2019. 12. 10. 오후 4:08:12
 * @fileName    : freeBoard
 * @Description : 자유게시판
 * </pre>
 */
--%>

<%@page import="com.kh.lp.common.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%
	ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String type = request.getParameter("type");
	int currentPage = pi.getCurrentPage();
	int endPage = pi.getEndPage();
	int limit = pi.getLimit();
	int listCount = pi.getListCount();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
%>
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
	border-bottom: 1px solid rgb(160, 115, 66);
	height: 5px;
	padding: 10px;
	
}

#boardCount_div {
	width: 100%;
	margin-left: 40px;
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
#table td {
	text-align: center;
	border-bottom: 1px solid;
	height: 40px;
}
.pagingArea {
	text-align: center;
}
 #table p {
	width: fit-content;
	margin: 0 auto;
}
 #search {
	float: right;
	margin-right: 10px;
	margin-bottom: 10px;
}
#search:nth-child(1) {
	margin-right: 21px;
}
</style>
<title>LauXion</title>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>
		<div class="container">
		<div class="contents">
		<div id="myPageMenu">
			<h3 id="h3" align="center">자유게시판</h3>
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
				<h3>&nbsp;&nbsp;<&nbsp;
				<% switch(type) {
				case "BT1" :%>자유게시판<%
				;break;
				case "BT2" :%>문의게시판<%
				;break;
				case "BT3" :%>리뷰게시판<%
				;break;
				case "BT4" :%>FAQ게시판<% 
				;break;
				}%> &nbsp;>&nbsp;</h3>
			</div>  <!-- status1 end -->
			<div class="status2">
				<p><% if(type.equals("BT1")) { %>
						자유롭게 쓰는 자유 게시판입니다.
					<% } else if(type.equals("BT2")) { %>
						 관리자에게 문의 하는 문의 게시판입니다.
					<% } else if(type.equals("BT3")) { %>
						 구매자가 구매한 상품을 리뷰하는 게시판입니다.
					<% } else { %>
						회원님들이 많이 물어보는 FAQ 게시판입니다.
					<% } %>
				</p>
			</div>  <!-- status2 end -->
		</div>  <!-- menuStatus end -->
		<div id="table_conntents">
			<div id="boardCount_div">
				<p><span>총 </span><strong> <%= listCount %> </strong><span> 건</span></p>
			</div>
			<div>
			<div>
			    <button id="search" class="searchBtn">검색</button>
				<input type="text" id="search" name="searchBox">
				
			</div>
				<table id="table">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<% for(int i=0; i<list.size(); i++) { %>
						<tr>
							<td>
								<p><%= list.get(i).get("BoardId") %></p>
							</td>
							<td>
								<p><%= list.get(i).get("BoardTitle") %></p>
							</td>
							<td>
							<p>
								<% if(Integer.parseInt(list.get(i).get("BoardMemberNo").toString()) == 1) { %>
									관리자
								<% } else { %>
								<%= list.get(i).get("BoardMemberName") %>
								<% } %>
							</p>
							</td>
							<td>
							<p>
								<%= list.get(i).get("BoardDate") %>
							</p>
							</td>
							<td>
							<p>
								<%= list.get(i).get("BoardCount") %>
							</p>
							</td>
						</tr>
					<% } %>
				</table>
			</div>
		</div>
		<div class="pagingArea">
		<% if(!(type.equals("BT3") || type.equals("BT4"))) { %>
		<button id="insertBoard" style="float: right;">게시판 작성</button>
		<% } %>
		<button onclick="location.href='<%=request.getContextPath()%>/BoardSelect.bo?currentPage=1&type=BT1'"><<</button>
		<% if(currentPage == 1){ %>
			<button disabled><</button>
		<% } else { %>
			<button onclick="location.href='<%=request.getContextPath()%>/BoardSelect.bo?currentPage=<%= currentPage - 1 %>&type=BT1'"><</button>
		<% } %>
			<% for(int i=startPage; i<=endPage; i++) { %>
				<button onclick="location.href='<%=request.getContextPath()%>/BoardSelect.bo?currentPage=<%= i %>&type=BT1'"><%= i %></button>
			<% } %>
		<% if(currentPage >= maxPage){ %>
			<button disabled>></button>
		<% } else { %>
			<button onclick="location.href='<%=request.getContextPath()%>/BoardSelect.bo?currentPage=<%= currentPage + 1 %>&type=BT1'">></button>
		<% } %>
		<button onclick="location.href='<%=request.getContextPath()%>/BoardSelect.bo?currentPage=<%= maxPage %>&type=BT1'">>></button>
		</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
	<script>
	var boardtpye = '<%=type%>'
		$("#table  p").click(function(e){
			var boardId = e.target.parentNode.parentNode.children[0].innerText;
			console.log(e.target.parentNode.parentNode.children[0].innerText);
			location.href = "<%=request.getContextPath()%>/BoardSelectOne2?boardId="+boardId;
		})
		$("#menu dd").mouseover(function(e) {
			e.target.style.color = "black";
			$("dd").css({"cursor":"pointer"});
		})
		$("#menu dd").mouseout(function(e) {
			if(boardtpye == 'BT1'){
				if(e.target.innerHTML == '▶   자유게시판'){
					e.target.style.color = "black";
				} else {
					e.target.style.color = "darkgray";
				}
			} else if(boardtpye == 'BT2') {
				if(e.target.innerHTML == '▶   문의게시판'){
					e.target.style.color = "black";
				} else {
					e.target.style.color = "darkgray";
				}
			} else if(boardtpye == 'BT3') {
				console.log(e.target.innerHTML);
				if(e.target.innerHTML == '▶   리뷰게시판'){
					e.target.style.color = "black";
				} else {
					e.target.style.color = "darkgray";
				}
			} else {
				if(e.target.innerHTML == '▶   FAQ게시판'){
					e.target.style.color = "black";
				} else {
					e.target.style.color = "darkgray";
				}
			}
		})
		$(function(){
			console.log(boardtpye);
			if(boardtpye == 'BT1'){
				$("#free")[0].style.color='black';
			} else if(boardtpye == 'BT2') {
				$("#question")[0].style.color='black';
			} else if(boardtpye == 'BT3') {
				$("#review")[0].style.color='black';
			} else {
				$("#FAQ")[0].style.color='black';
			}
		})
		if(boardtpye != 'BT1'){
			$("#free").click(function(e){
				location.href="<%= request.getContextPath()%>/BoardSelect.bo?type=BT1";
			})
		}
		if(boardtpye != 'BT2'){
			$("#question").click(function(e){
				location.href="<%= request.getContextPath()%>/BoardSelect.bo?type=BT2";
			})
		}
		if(boardtpye != 'BT3'){
			$("#review").click(function(e){
				location.href="<%= request.getContextPath()%>/BoardSelect.bo?type=BT3";
			})
		}
		if(boardtpye != 'BT4'){
			$("#FAQ").click(function(e){
				location.href="<%= request.getContextPath()%>/BoardSelect.bo?type=BT4";
			})
		}
		 $("#insertBoard").click(function(){
			console.log();
			 if('<%=loginMember%>' == 'null'){
				alert("로그인해야 이용할 수 있습니다."/* +login */); 
			} else {
				location.href="<%=request.getContextPath()%>/views/board/BoardInsert.jsp";
			}
		}) 
		$("#table  td").mouseover(function(e) {
			$("p").css({"cursor":"pointer"});
		})
		$(".searchBtn").click(function() {
			 console.log($("input[name='searchBox']")[0].value);
			 var 
			 $.ajax({
				 url: "",
				 data : {
					 
				 }
				 
			 })
		 })
		
	</script>
</body>
</html>