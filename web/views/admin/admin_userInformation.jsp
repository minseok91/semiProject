<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.kh.lp.member.model.vo.*
    , com.kh.lp.common.PageInfo"
    %>
<%
	ArrayList<Member> userList = (ArrayList<Member>)request.getAttribute("list");
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
.contents > div:first-child {
	width: 96%;
	height: 25px;
	padding: 20px;

}
.contents > div > p, h3 {
	width: 80px;
	margin: 0;
	float: left;
	
}
.contents > div > p {
	padding-top: 1px;
}
.contents > div:nth-child(2) {
	width: 95%;
	height: 73.5%;
	margin-top: 30px;
	margin-left: auto;
	margin-right: auto;
}
#table {
	width: 100%;	
	border-collapse: collapse;
}
#table th {
	border-top: 1px solid;
	background: #EAEAEA;
	color: black;
	border-top: 2px solid #CCCCCC;
}
#table th, td {
	border-bottom: 1px solid #CCCCCC;
	text-align: center;
	padding-top: 5px;
}
#nextPage {
	width: 100%;
	height: 15%;
} 
#sarchBoxBtn {
	width: 65px;
	height: 31px;
	margin-left: 2%;
	float: right;
	background: rgb(33, 31, 34);
	border: 2px solid rgb(160, 115, 66);
	color: rgb(160, 115, 66);
}
#searchBox {
	margin-top: 1px;
	width: 130px;
	height: 25px;
	border: none;
	box-shadow: 2px 2px 6px 1px gray;
	float: right;
}
#nextPageBox {
	width: 80%;
	height: 100%;
	margin-left: auto;
	margin-right: auto;
}

</style>
<body>
	<%@ include file="headerPage.jsp" %>
	<div id="container" class="container">
		<div id="contents" class="contents">
			<div>
				<p>전체 회원<h3><%= request.getAttribute("listCount") %>명</h3>
				<button id="sarchBoxBtn">검색</button>
				<input type="text" id="searchBox">
			</div>
			<div>
				<table id="table">
					<tr>
						<th>No.</th>
						<th>아이디</th>
						<th>이름</th>
						<th>휴대폰번호</th>
						<th>주소</th>
						<th>이메일</th>
					</tr>
					<% for(int i=0; i<userList.size(); i++) {%>
						<tr>
							<td><%= userList.get(i).getMemberNo()%></td>
							<td><%= userList.get(i).getMemberId()%></td>
							<td><%= userList.get(i).getMemberName()%></td>
							<td><%= userList.get(i).getMemberPhone()%></td>
							<td style="width: 394px"><%= userList.get(i).getMemberAddress()%></td>
							<td><%= userList.get(i).getMemberEmail() %></td>
						</tr>
					<% } %>
				</table>
			</div>
			<div id="nextPage">
				<div id="nextPageBox" align="center">
					<button onclick="location.href='<%=request.getContextPath()%>/userInfo.me?currentPage=1'"><<</button>
					<% for(int p=1; p<=endPage; p++) { %>
						<button onclick="location.href='<%=request.getContextPath()%>/userInfo.me?currentPage=<%=p%>'"><%= p %></button>
					<% } %>
					<button onclick="location.href='<%=request.getContextPath()%>/userInfo.me?currentPage=<%=endPage%>'">>></button>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(function(){
		
		$("td").click(function(e) {
			var userId = e.target.parentElement.children[1].innerHTML;
			console.log(userId)
		    location.href="<%=request.getContextPath()%>/userInfoDetail.me?userId="+userId;
		})
	});
	</script>
</body>
</html>