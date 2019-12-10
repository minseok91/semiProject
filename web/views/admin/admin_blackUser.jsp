<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.kh.lp.admin.member.model.vo.*"%>
<%
	ArrayList<Member> blackList = (ArrayList<Member>)request.getAttribute("blackList");
	pageInfo pi = (pageInfo)request.getAttribute("pi");
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
	html body {
	margin: 0;
	padding: 0;
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
#table  th {
	border-top: 1px solid;
	background: #EAEAEA;
	color: black;
	border-top: 2px solid #CCCCCC;
}
#table  th, td {
	border-bottom: 1px solid #CCCCCC;
	text-align: center;
	padding-top: 5px;
}
#nextPage {
	width: 100%;
	height: 15%;
} 
#searchBox {
	margin-top: 1px;
	width: 130px;
	height: 25px;
	float: right;
	border: none;
	box-shadow: 2px 2px 6px 1px gray;
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
				<p>블랙 회원<h3><%= blackList.size() %>명</h3>
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
						<th>설정</th>
					</tr>
					 <% for(int i=0; i<blackList.size(); i++) {%>
						<tr>
							<td><%= blackList.get(i).getRnum()%></td>
							<td><%= blackList.get(i).getMember_id()%></td>
							<td><%= blackList.get(i).getMember_name()%></td>
							<td><%= blackList.get(i).getMember_phone()%></td>
							<td><%= blackList.get(i).getMember_address()%></td>
							<td><%= blackList.get(i).getMember_email() %></td>
							<td>
								<button class="withdraw" value="<%= blackList.get(i).getMember_id()%>">탈퇴</button>
								<button class="release" value="<%= blackList.get(i).getMember_id()%>">해제</button>
							</td>
						</tr>
					<% } %>
					
				</table>
			</div>
			<div id="nextPage">
				<div id="nextPageBox" align="center">
					<button onclick="location.href='<%=request.getContextPath()%>/userInfo.me?currentPage=1'"><<</button>
					<% for(int p=1; p<=MaxPage; p++) { %>
						<button onclick="location.href='<%=request.getContextPath()%>/userInfo.me?currentPage=<%=p%>'"><%= p %></button>
					<% } %>
					<button onclick="location.href='<%=request.getContextPath()%>/userInfo.me?currentPage=<%=MaxPage%>'">>></button>
				</div>
			</div>
		</div>
	</div>
	<script>
	/* $(function(){
		$(".withdraw").click(function(){
			console.log(this)
			var id = $(this).parent().parent().children().eq(1).text();
			console.log(id)
		})
		
		$("tr").click(function(){
			var id = $(this).children().eq(1).text();
			console.log(id)
			
		})
		
		$(".release").click(function(){
			var id = $(this).parent().parent().children().eq(1).text();
			console.log(id)
			
		})
	}) */
	
	$("td").click(function(e) {
			var userId = e.target.parentElement.children[1].innerHTML;
				if(e.target.innerHTML == '탈퇴'){
					var userId = e.target.attributes.value.value;
					location.href="<%=request.getContextPath()%>/userWithdraw.me?userId="+userId;
					console.log(e.target.innerHTML);
				} else if(e.target.innerHTML == '해제'){
					var userId = e.target.attributes.value.value;
					location.href="<%=request.getContextPath()%>/userRelease.me?userId="+userId;
					console.log(e.target.innerHTML);
				} else {
					console.log(e.target.parentElement.children[1].innerHTML);
					  location.href="<%=request.getContextPath()%>/userInfoDetail.me?userId="+userId
				}
			})
		<%-- $(".withdraw").click(function(e) {
			
		})
		$(".release").click(function(e) {
			
		}) --%>
	</script>
</body>
</html>