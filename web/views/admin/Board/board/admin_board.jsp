<%--
/**
 * <pre>
 * @Author      : 안동환
 * @CreateDate  : 2019. 12. 15. 오후 5:56:50
 * @ModifyDate  : 2019. 12. 15. 오후 5:56:50
 * @fileName    : 관리자 게사판페이지
 * @Description :
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.lp.admin.board.model.vo.*
	, com.kh.lp.common.*"%>
<%  ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list"); 
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
<title>게시판 관리</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="<%= request.getContextPath() %>/views/admin/image/loginimg(2).png">
</head>
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
	width: 90px;
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
	margin-top: 1px;
	width: 130px;
	height: 25px;
	border: none;
	box-shadow: 2px 2px 6px 1px gray;
}

#idSearchBtn {
	width: 65px;
	height: 31px;
	margin-left: 2%;
	float: right;
	background: rgb(33, 31, 34);
	border: 2px solid rgb(160, 115, 66);
	color: rgb(160, 115, 66);
	margin-top: 2px;
}

#NoticeNumber>p {
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
.btn {
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
				<table id="search_Box">
					<tr>
						<td><select id="boardType" name="boardType">
								<option value="NO">-- 선택 --</option>
								<option value="BT1">자유 게시판</option>
								<option value="BT2">건의 게시판</option>
								<option value="BT3">리뷰 게시판</option>
						</select></td>
						<td><input type="text" id="idSearch"></td>
						<td>
							<button id="idSearchBtn">검색</button>
						</td>
					</tr>
				</table>
			</div>
			<div>
				<div id="NoticeNumber">
					<p>총 게시판 글 :</p>
					<h4><%= listCount %>건
					</h4>
				</div>
				<table id="table">
					<tr>
						<th>No.</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>수정일</th>
						<th>게시판종류</th>
						<th>조회수</th>
						<th>기능</th>
					</tr>
					<% for(int i=0; i<list.size(); i++) { %>
					<tr>
						<td><%= list.get(i).getBoardId() %> <input type="hidden"
							value="<%= list.get(i).getBoardId()%>"> <input
							type="hidden" value="<%= list.get(i).getBoardMemberName()%>">
						</td>
						<td><%= list.get(i).getBoardTitle() %></td>
						<td><%= list.get(i).getBoardMemberName() %></td>
						<td><%= list.get(i).getBoardDate() %></td>
						<td><%= list.get(i).getBoardModifyDate() %></td>
						<% switch(list.get(i).getBoardType()) { 
						case "BT1" : %><td>자유게시판</td>
						<%
						; break;
						case "BT2" : %><td>문의게시판</td>
						<%
						; break;
						case "BT3" : %><td>리뷰게시판</td>
						<%
						; break;
						}%>
						<td><%= list.get(i).getBoardCount() %></td>
						<td>
							<button id="deleteBtn">삭제</button>
						</td>
					</tr>
					<% } %>

				</table>

			</div>
			<button id="insertBoard">글쓰기</button>
			<div id="nextPage">
				<div id="nextPageBox" align="center">
					<button class="btn" onclick="location.href='<%=request.getContextPath()%>/selectAll.bo?currentPage=1'"><<</button>
					<% if(currentPage <= 1){ %>
					<button class="btn" disabled><</button>
					<% } else { %>
					<button class="btn" onclick="location.href='<%=request.getContextPath()%>/selectAll.bo?currentPage=<%=currentPage-1%>'"><</button>
					<% } %>
					<% for(int p = startPage ; p <= endPage; p++){ 
						if(p == currentPage) {
						%>
					<button class="btn" onclick="location.href='<%=request.getContextPath()%>/selectAll.bo?currentPage=<%=p%>'" style="font-weight: bold;"><%=p %></button>
						<% } else { %>
					<button class="btn" onclick="location.href='<%=request.getContextPath()%>/selectAll.bo?currentPage=<%=p%>'"><%=p %></button>
						<% } %>
					<% } %>
					<% if(currentPage >= maxPage){ %>
					<button class="btn" disabled>></button>
					<% } else { %>
					<button class="btn" onclick="location.href='<%=request.getContextPath()%>/selectAll.bo?currentPage=<%=currentPage + 1 %>'">
						></button>
					<% } %>
					<button class="btn" onclick="location.href='<%=request.getContextPath()%>/selectAll.bo?currentPage=<%=maxPage%>'">>></button>
				</div>
			</div>

			<!--  pagingArea End game -->
		</div>
	</div>
	<script>
	$("#table  td").click(function(e) {
				var MemberName = e.target.parentNode.parentNode.children[0].children[1].value;
				var boardId = e.target.parentNode.parentNode.children[0].children[0].value;
			if(e.target.innerHTML == '수정'){
				 location.href="<%=request.getContextPath()%>/selectOne.bo?boardId="+boardId+"&MemberName="+MemberName
			} else if(e.target.innerHTML == '삭제'){
				location.href="<%=request.getContextPath()%>/deleteBoard.bo?boardId="+boardId+"&type=a"
			} else {
				var memberName = e.target.parentNode.children[0].children[1].value;
				var boardId = e.target.parentNode.children[0].children[0].value;
			    location.href="<%=request.getContextPath()%>/boardDetial.bo?boardId="+boardId+"&MemberName="+memberName;
			}
		})
		$("#insertBoard").click(function(){
			location.href="views/admin/Board/board/insertNotice.jsp";
		})
		
		$(function(){
			var type;
			var datatype;
			$("#boardType").click(function(e){
				if($("#boardType")[0].value != "NO"){
					$.ajax({
						url : "BoardSelectType.bo",
						data : {
							type : e.target.value,
						},
						type : "GET",
						success:function(data) {
							$tableBody = $("#table tbody");
							$Number = $("#NoticeNumber h4");
							
							$Number.html('');
							$tableBody.html('');
							
							var $trh = $("<tr>");
							var $Th = $("<th>No.</th><th>제목</th><th>작성자</th><th>작성일</th><th>수정일</th><th>게시판종류</th><th>조회수</th><th>기능</th>");
							$trh.append($Th);
							$tableBody.append($trh);
							$Number.append(data[1].listCount+"건");
							
							console.log()
							if(data[0].length > 0){
							datatype = data[0][0].BoardType;
							}
							
							
							switch(datatype){
							case 'BT1' : type = '자유 게시판'; break;
							case 'BT2' : type = '건의 게시판'; break;
							case 'BT3' : type = '리뷰 게시판'; break;
							}
							for(var i=0; i<data[0].length; i++){
								var $tr = $("<tr>");
								var $noTd = $("<td>"+data[0][i].Rnum+"<input type='hidden' value='"+data[0][i].BoardId+"'><input type='hidden' value='"+data[0][i].MemberName+"'></td><td>"+data[0][i].BoardTitle+"</td><td>"+data[0][i].MemberName+"</td><td>"+data[0][i].BoardDate+"</td><td>"+data[0][i].BoardModifyDate+"</td><td>"+type+"</td><td>"+data[0][i].BoardCount+"</td><td><button id='deleteBtn'>삭제</button></td>");
								
								$tr.append($noTd);
								$tableBody.append($tr);
							}
							$nextPageBox = $("#nextPageBox");
							$nextPageBox.html('');
							
							$PagingBtnMin = $('<button class="btn" value="1"><</button>');
						    $PagingBtnMax = $('<button class="btn" value="'+data[1].maxPage+'">>');
						    $nextPageBox.append($PagingBtnMin);	
						    for(var i=1; i<=data[1].maxPage; i++) {
								
								var $btn = $('<button class="btn" value="'+i+'">'+i+'</button>');
								
								$nextPageBox.append($btn);
							}
							$nextPageBox.append($PagingBtnMax);
							$("#table td").click(function(e){
								var MemberName = e.target.parentNode.parentNode.children[0].children[1].value;
								var boardId = e.target.parentNode.parentNode.children[0].children[0].value;
								console.log(e.target.innerHTML);
								if(e.target.innerHTML == "수정"){
									location.href="<%=request.getContextPath()%>/selectOne.bo?boardId="+boardId+"&MemberName="+MemberName
								} else if(e.target.innerHTML == "삭제") {
									location.href="<%=request.getContextPath()%>/deleteBoard.bo?boardId="+boardId+"&type=a"
								} else {
									var boardId= e.target.parentNode.children[0].children[0].value;
									var MemberName = e.target.parentNode.children[0].children[1].value;
									location.href="<%=request.getContextPath()%>/boardDetial.bo?boardId="+boardId+"&MemberName="+MemberName;
									
								}
								
								
							})
							
							$(".btn").click(function(e){
								
								$.ajax({
									url:  "BoardSelectType.bo" ,
									data : {
										type : datatype,
										currentPage : e.target.value
									},
									type : "GET",
									success:function(data) {
										$tableBody = $("#table tbody");
										$Number = $("#NoticeNumber h4");
										
										$Number.html('');
										$tableBody.html('');
										
										var $trh = $("<tr>");
										var $Th = $("<th>No.</th><th>제목</th><th>작성자</th><th>작성일</th><th>수정일</th><th>게시판종류</th><th>조회수</th><th>기능</th>");
										$trh.append($Th);
										$tableBody.append($trh);
										$Number.append(data[1].listCount+"건");
										
										datatype = data[0][0].BoardType;
										
										
										switch(datatype){
										case 'BT1' : type = '자유 게시판'; break;
										case 'BT2' : type = '건의 게시판'; break;
										case 'BT3' : type = '리뷰 게시판'; break;
										}
										for(var i=0; i<data[0].length; i++){
											var $tr = $("<tr>");
											var $noTd = $("<td>"+data[0][i].Rnum+"<input type='hidden' value='"+data[0][i].BoardId+"'><input type='hidden' value='"+data[0][i].MemberName+"'></td><td>"+data[0][i].BoardTitle+"</td><td>"+data[0][i].MemberName+"</td><td>"+data[0][i].BoardDate+"</td><td>"+data[0][i].BoardModifyDate+"</td><td>"+type+"</td><td>"+data[0][i].BoardCount+"</td><td><button id='deleteBtn'>삭제</button></td>");
											
											$tr.append($noTd);
											$tableBody.append($tr);
										}
										$("#table td").click(function(e){
											var MemberName = e.target.parentNode.parentNode.children[0].children[1].value;
											var boardId = e.target.parentNode.parentNode.children[0].children[0].value;
											console.log(e.target.innerHTML);
											if(e.target.innerHTML == "수정"){
												location.href="<%=request.getContextPath()%>/selectOne.bo?boardId="+boardId+"&MemberName="+MemberName
											} else if(e.target.innerHTML == "삭제") {
												location.href="<%=request.getContextPath()%>/deleteBoard.bo?boardId="+boardId+"&type=a&pageaddress=null";
											} else {
												var boardId= e.target.parentNode.children[0].children[0].value;
												var MemberName = e.target.parentNode.children[0].children[1].value;
												location.href="<%=request.getContextPath()%>/boardDetial.bo?boardId="+ boardId+ "&MemberName="+ MemberName;

											}
										})
										$("#table td ,button").mouseover(function(e) {
											$("td").css({"cursor" : "pointer"})
											$("button").css({"cursor" : "pointer"})
										})
									}
								})
							})
						}
					})
				}
			})
		})
		$("#table td ,button").mouseover(function(e) {
			$("td").css({
				"cursor" : "pointer"
			})
			$("button").css({
				"cursor" : "pointer"
			})
		})
	</script>
</body>
</html>