<%--
/**
 * <pre>
 * @Author      : 안동환
 * @CreateDate  : 2019. 12. 5. 오후 12:53:56
 * @ModifyDate  : 2019. 12. 5. 오후 12:53:56
 * @fileName    : 문의 및 신고 페이지
 * @Description :
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.kh.lp.admin.qnaAndReport.model.vo.*
    , java.util.*, com.kh.lp.common.*"
    %>
 <%
 	ArrayList<QNA> list = (ArrayList<QNA>)request.getAttribute("list");
 PageInfo pi = (PageInfo)request.getAttribute("pi");
	int startPage = pi.getStartPage();
	int currentPage = pi.getCurrentPage();
	int endPage = pi.getEndPage();
	int limit = pi.getLimit();
	int ListCount = pi.getListCount();
	int MaxPage = pi.getMaxPage();
 %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<title>Insert title here</title>
<link rel="icon" type="image/png" sizes="32x32" href="image/loginimg(2).png">
</head>
<meta content="text/html;">
<style>
html, body {
	padding: 0;
	margin: 0;
	width: 100%;
	height: 100%;
}
#container {
	width: 1080px;
	margin-left: auto;
	margin-right: auto;
}
#container_Box {
	width: 100%;
	height: 650px;
	margin-top: 10%;
	border: 1px solid;
	border-radius: 10px; 
	
}
#container_Box > div:first-child {
	width: 94%;
	height: 45px;
	margin: 0 auto;

}
#container_Box > div:first-child > div {
	width: 100%;
	height: 50px;

}
#table {
	width: 100%;	
	border-collapse: collapse;
}
#table tr th {
	border-top: 1px solid;
	background: #EAEAEA;
	color: black;
	border-top: 2px solid #CCCCCC;
}
#table tr th,#table tr td {
	border-bottom: 1px solid #CCCCCC;
	text-align: center;
	padding-top: 5px;
} 
#search_Box {
	width: 300px;
	height: 100%;
	border: none;
	margin-top: 10px;
	float: right;
	
}
#search_Box tr td:nth-of-type(1) {
	width: 150px;
	margin-right: 0px; 
	text-align: center;
}

#container_Box > div > p, h3 {
	
	margin: 0;
	float: left;
	
}
#container_Box > div > p {
	padding-top: 1px;
}
#container_Box > div:nth-child(2) {
	width: 95%;
	height: 73.5%;
	margin-left: auto;
	margin-right: auto;
	margin-top: -14px;
}

#nextPage {
	width: 100%;
	height: 15%;
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
	color : #e2ceb8;
	margin-bottom: 7px;
}
#deleteBtn {
	border: none;
	background: red;
	color : #e2ceb8;
	margin-bottom: 7px;
}

#search_Box td:nth-of-type(2) select{
	margin-left: 8px;
	width: 100px;
	height: 30px;
	border-radius: 5px; 
	text-align: center;
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
#NoticeNumber > p {
	width: 101px;
	margin-bottom: 0px;
	margin-top: 17px;
	float: left;
}

#NoticeNumber > h4 {
	margin-bottom: 0px;
	margin-top: 17px;
	float: left;
}
#boardType {
	width: 70px;
	height: 30px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>회원정보 관리 상세</title>
</head>
<body>
	<%@ include file="../common/headerPage.jsp" %>
	<div id="container">
		<div id="container_Box">
				<div>
				<table id="search_Box">
					<tr>
						<td><select id="boardType" name="boardType">
								<option value="BT1" >문의</option>
								<option value="BT2">신고</option>
						</select>
						</td>
						<td>
							 <input type="text" id="idSearch">
						</td>
						<td>
							<button id="idSearchBtn">검색</button>
							</td>
					</tr>
				</table>
			</div>
			<div>
			<div id="NoticeNumber">
				<p>총 게시판 수 :</p><h4><%= ListCount %>명</h4>
			</div>
				<table id="table">
					<tr>
						<th>번호</th>
						<th>회원 아이디</th>
						<th>문의제목</th>
						<th>작성일</th>
						<th>상태</th>
					</tr>
					<% for(QNA q : list) { %>
						<tr>
							<td><%= q.getRowNum() %>
								<input type="hidden" value="<%=q.getQnaId()%>">
							</td>
							<td><%= q.getQnaMemberId() %></td>
							<td><%= q.getQnaTitle() %></td>
							<td><%= q.getQnaDate() %></td>
							<td>
								<% switch(q.getQnaStatus()) { 
								case "QHT1" : %>문의 접수<% 
								;break;
								case "QHT2" : %>문의 확인<%
								;break;
								case "QHT3" : %>문의 답변<%
								}
								%>
							</td>
						</tr>
					<% } %>
					
				</table>
			</div>
			<div id="nextPage">
				<div id="nextPageBox" align="center">
					<button onclick="location.href='<%=request.getContextPath()%>/QNASelect.qr?currentPage=1'"><<</button>
								<% if(currentPage <= 1){ %>
						<button disabled> < </button>
					<% } else { %>
						<button onclick="location.href='<%=request.getContextPath()%>/QNASelect.qr?currentPage=<%=currentPage-1%>'"><</button>
					<% } %>
					<% for(int p=startPage; p<=endPage; p++) { %>
						<button onclick="location.href='<%=request.getContextPath()%>/QNASelect.qr?currentPage=<%=p%>'"><%= p %></button>
					<% } %>
								<% if(currentPage >= MaxPage){ %>
						<button disabled> > </button>
					<% } else { %>
						<button onclick="location.href='<%=request.getContextPath()%>/QNASelect.qr?currentPage=<%=currentPage + 1 %>'"> > </button>
					<% } %>
					<button onclick="location.href='<%=request.getContextPath()%>/QNASelect.qr?currentPage=<%=endPage%>'">>></button>
				</div>
			</div>
		</div>
	</div>
	<script>
	count = 0;
	$(function(){
	
		$("#boardType").click(function(e) {
	
			$.ajax({
				url : "typeSelect.tr",
				data : {type : e.target.value,
						StartPage : <%=pi.getStartPage()%>,
						endPage : <%=pi.getEndPage()%>,
						limit : <%=pi.getLimit()%>,
						ListCount : <%=pi.getListCount()%>,
						MaxPage : <%=pi.getMaxPage()%>,
						currentPage : <%=pi.getCurrentPage()%>
				},
				type : "GET",
				success:function(data) {
					$tableBody = $("#table tbody");
					$Number = $("#NoticeNumber h4");
					
					$Number.html('');
					$tableBody.html('');
						
						var $trh = $("<tr>");
						var $Th = $("<th>번호</th><th>회원 아이디</th><th>문의제목</th><th>작성일</th><th>상태</th>");
						$trh.append($Th);
						$tableBody.append($trh);
						$Number.append(data.length+"명");
						
						var type;
						for(var i=0; i<data.length; i++){
						var datatype = data[i].boardStatus;
						var $tr = $("<tr>");
						if(datatype == 'QHT1'){
							type = '문의 접수';
						} else if(datatype == 'QHT2') {
							type = '문의 확인';
						} else if(datatype == 'QHT3') {
							type = '문의 답변';
						} else if(datatype == 'RT1') {
							type = '게시판';
						} else {
							type = '답글';
						}
						
						var $noTd = $("<td>"+data[i].Rnum+"<input type='hidden' value="+data[i].boardId+"><input type='hidden' value="+data[i].boardStatus+"></td><td>"+data[i].MemberName+"</td><td>"+data[i].boardTitle+"</td><td>"+data[i].boardDate+"</td><td>"+type+"</td>")
						
						$tr.append($noTd);
						$tableBody.append($tr);
					}
						var boardId = "";
						var boardStatus = "";
						$("#table td").click(function(e){
							 boardId = e.target.parentNode.children[0].children[0].value;
							 boardStatus = e.target.parentNode.children[0].children[1].value;
							location.href="<%=request.getContextPath()%>/QNAandReportDetail.qr?qnaId="+boardId+"&type="+boardStatus;
							console.log(e);
						});
						
				}, error:function(error, status) {
					console.log("전송 실패!");
				}
			})
				
			});
		if(count == 0){
			$("#table td").click(function(e){
				 boardId = e.target.parentNode.children[0].children[0].value;
				location.href="<%=request.getContextPath()%>/QNAandReportDetail.qr?qnaId="+boardId;
				console.log(boardId);
			});
		}
	})
	
	
	</script>
	<script>
	
	</script>
</body>
</html>