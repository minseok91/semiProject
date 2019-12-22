<%--
/**
 * <pre>
 * @Author      : 안동환
 * @CreateDate  : 2019. 12. 20. 오전 11:05:31
 * @ModifyDate  : 2019. 12. 20. 오전 11:05:31
 * @fileName    : 게시판 상세페이지
 * @Description :
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, com.kh.lp.admin.reply.model.vo.*"
    %>
<%
	HashMap<String, Object> list = (HashMap<String, Object>)request.getAttribute("list");
	ArrayList<Reply> Reply = (ArrayList<Reply>)request.getAttribute("Reply");
	String type = list.get("BoardType").toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<title>게시판 상세페이지</title>
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
	height: 300px;
	resize: none;
	border: none;
}
#textArea:focus {
	outline: none;
}
#comment_top {
	border-bottom: none;
	background: white;
}

#comment_bottom {
	border-top: none;
	text-align: right;
	background: white;
}

#comment_btn {
	width: 75px;
	height: 48px;
	background: rgb(33, 31, 34);
	border: 1px solid rgb(33, 31, 34);
	color: rgb(160, 115, 66);
	margin: 4px;
}

#comment_div {
	margin: 0 auto;
	height: 300px;
	background: white;
	overflow: scroll;
}

#comment_text {
	width: 799px;
	float: left;
	border: 1px solid;
	height: 45px;
	margin-left: 10px;
	resize: none;
	margin: 4px;
}

#comment {
	width: 99%;
	height: 60px;
	margin-top: 28px;
	text-align: left;
}

#comment div:nth-child(1) {
	float: left;
}

#comment div:nth-child(2) {
	padding-left: 136px;
}

#comment div:nth-child(3) {
	margin-top: 27px;
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
				<form action="<%=request.getContextPath() %>/updateBoard.bo" method="post" onsubmit="return ok()">
					<table id="table">
					<tr>
						<td>제목</td>
						
						<td>
							<input type="hidden" value="<%=list.get("BoardId")%>" name="boardId">
							<input type="text" value="<%=list.get("BoardTitle") %>" name="title" readonly>
						</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" value="<% if(Integer.parseInt(list.get("BoardMemberNo").toString()) == 1) { %>관리자
														<% } else { %><%=list.get("BoardMemberName")%><% } %>
						" name="writer" readonly></td>
					</tr>
					<tr>
						<td>게시판 종류</td>
						 <td><input type="text" value="<% switch(list.get("BoardType").toString()) { 
														case "BT1" : %>자유 게시판<%
														;break;
														case "BT2" : %>문의 게시판<%
														;break;
														case "BT3" : %>리뷰 게시판<%
														;break;
														case "BT4" : %>FAQ 게시판<%
														;break;
														}
														%>" readonly name="category">
						</td>
					</tr>
					<tr><td colspan="2">내용</td></tr>
					<tr>
						<td colspan="2">
							<textarea id="textArea" rows="" cols="" name="content" readonly><%=list.get("BoardContent") %></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						 	댓글
						</td>
					</tr>
					<tr>
							<td colspan="2" id="comment_top">
								<div id="comment_div">
									<% for(int i=0; i<Reply.size(); i++)  {
										if(Reply.get(i).getReplyStatus().equals("Y")){
									%>
									<div id="comment">
										<div>
											작성자 :
											<%= Reply.get(i).getReplyMemberName() %></div>
										<div>
											작성일 :
											<%= Reply.get(i).getReplyDate() %>
										</div>
										<div><%= Reply.get(i).getReplyContent() %></div>
										<hr>
									</div>
									<% } else { %>
									<div id="comment">
										삭제된 댓글입니다.
										<hr>
									</div>
									<%} 
									} %>
								</div>
							</td>
						</tr>
						<% if(!list.get("BoardType").toString().equals("BT4") && !list.get("BoardType").toString().equals("BT2")) { %>
						<tr>
							<td colspan="2" id="comment_bottom"><textarea rows=""
									cols="" id="comment_text"></textarea>
								<% if(!loginMember.getMemberStatus().equals("MS2")) { %>
									<button id="comment_btn">작성하기</button>
								<% } %>
								</td>
						</tr>
						<% } %>
					
							<% if(Integer.parseInt(list.get("BoardMemberNo").toString()) == loginMember.getMemberNo()) { %>
								<tr>
									<td colspan="2">
										<button id="update">수정</button>
										<button id="delete">삭제</button>
									</td>
								</tr>
							<% } %>
						
				</table>
				</form>
			</div>
			<div>
			</div>
		</div>
	</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
	<script>
	var boardtpye = '<%=list.get("BoardType").toString()%>';
	var boardId = '<%=list.get("BoardId").toString()%>';
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
		
		 $(function(){
			$("#comment_btn").click(function(){
					var comment = $("#comment_text")[0].value;
					console.log(comment);
					
				 $.ajax({
					url: "insertReply.re",
					data : { boardId : '<%= list.get("BoardId") %>',
							 memberId : <%= loginMember.getMemberNo()%>,	
							 comment : comment,
							 user : 'member'
					},
					type : "GET",
					success:function(data) {
					console.log(data);	
					 $comment_div = $("#comment_div");
					 $comment_text = $("#comment_text");
						var date = data.replyDate;
						var $comment = $("<div id='comment'>")
						var $div1 = $("<div>작성자 : "+data.replyMemberName+"</div>");
						var $div2 = $("<div>작성일 : "+data.replyDate+"</div>");
						var $div3 = $("<div>"+data.replyContent+"</div>")
						$comment.append($div1);
						$comment.append($div2);
						$comment.append($div3);
						$comment.append("<hr>");
						$comment_div.append($comment);
						
						$comment_text.val('');
					}, error:function(error, status) {
						
					}
				})
				setTimeout(function(){
					console.log("실행");
					$('#comment_div').scrollTop($(document).height());
				},800);
			})
			$('#comment_div').scrollTop($(document).height());
			
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
					/* console.log(e.target); */
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
		var count = 0;
		$("#update").click(function(){
			
			if(count == 0){
				 $("input[name='title']").attr("readonly",false);
				 alert("수정 할 수 있습니다.");
				 $("#textArea").attr("readonly",false);
				
			} else {
				var update_confirm = confirm("수정 완료하시겠습니까?");
				if(update_confirm == true){
					nn = true;
				} else {
					alert("취소하였습니다.");
				}
			}
			console.log(count);
			 count = +1;
		});
		$("#delete").click(function(){
			var delete_confirm = confirm("정말 삭제하시겠습니까?");
			if(delete_confirm == true){
				location.href = '<%=request.getContextPath()%>/deleteBoard.bo?pageaddress='+boardtpye+'&boardId='+boardId;
			} else {
				alert("취소하셨습니다.");
			}
			
		});
	
	</script>
</body>
</html>