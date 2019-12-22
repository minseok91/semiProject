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
<title>회원 정보 조회</title>
<link rel="icon" type="image/png" sizes="32x32" href="<%= request.getContextPath() %>/views/admin/image/loginimg(2).png">
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
	margin-bottom: 50px;
	
}
.contents {
	width: 100%;
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
	background: #E2CEB8;
	color: #211f22;
	font-size: 1.2em;
	height: 32px;
	border-top: 1px solid #211f22;
	border-bottom: 1px solid #211f22;
}
#table th, td {
	border-bottom: 1px solid #CCCCCC;
	text-align: center;
	padding-top: 5px;
}
#table td {
	height: 50px;
}
#nextPage {
	width: 100%;
	height: 15%;
	margin-bottom: 20px;
	margin-top: 70px;
} 
#searchBoxBtn {
	height: 24px;
	margin-left: 2%;
	float: right;
	background: rgb(33, 31, 34);
	border: 1px solid #a07342;
	color: #e2ceb8;
	border-radius: 4px;
	font-size: 16px;
	font-weight: bold;
}
#searchBox {
	margin-top: 1px;
	font-family: sans-serif;
	font-size: 15px;
	width: 150px;
	border: none;
	box-shadow: 0px 0px 5px 0px rgba(33,31,34,0.45);
	float: right;
}
#nextPageBox {
	width: 80%;
	height: 100%;
	margin-left: auto;
	margin-right: auto;
}
#nextPageBox button {
	background: none;
	border: none;
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
	<%@ include file="../../common/headerPage.jsp" %>
	<div id="container" class="container">
		<div id="contents" class="contents">
			<div>
				<p>전체 회원<h3><%= request.getAttribute("listCount") %>명</h3>
				<button id="searchBoxBtn">검색</button>
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
					<button class="btn" onclick="location.href='<%=request.getContextPath()%>/memberInfo.me?currentPage=1'"><<</button>
					<% if(currentPage <= 1){ %>
						<button  disabled> < </button>
					<% } else { %>
						<button class="btn" onclick="location.href='<%=request.getContextPath()%>/memberInfo.me?currentPage=<%=currentPage-1%>'"><</button>
					<% } %>
					<% for(int p=1; p<=MaxPage; p++) { 
						if(p == currentPage) {
					%>
					<button class="btn"  onclick="location.href='<%=request.getContextPath()%>/memberInfo.me?currentPage=<%=p%>'" style="font-weight: bold;"><%= p %></button>
					<% } else { %>
					<button class="btn"  onclick="location.href='<%=request.getContextPath()%>/memberInfo.me?currentPage=<%=p%>'"><%= p %></button>
					<% } %>
						
					<% } %>
					<% if(currentPage >= MaxPage){ %>
						<button  disabled> > </button>
					<% } else { %>
						<button class="btn" onclick="location.href='<%=request.getContextPath()%>/memberInfo.me?currentPage=<%=currentPage + 1 %>'"> > </button>
					<% } %>
					<button class="btn" onclick="location.href='<%=request.getContextPath()%>/memberInfo.me?currentPage=<%=MaxPage%>'">>></button>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(function(){
		
		$("td").click(function(e) {
			var memberId = e.target.parentElement.children[1].innerHTML;
			var memberNo = e.target.parentElement.children[0].innerHTML;
			console.log(memberNo)
		       location.href="<%=request.getContextPath()%>/memberInfoDetail.me?memberId="+memberId+"&memberNo="+memberNo; 
		})
		$("#table td ,button").mouseover(function(e) {
			$("td").css({"cursor":"pointer"})
			$("button").css({"cursor":"pointer"})
		})
	});
	</script>
</body>
</html>