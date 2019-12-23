<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.kh.lp.member.model.vo.*,
    		com.kh.lp.common.PageInfo"%>
<%
	ArrayList<Member> blackList = (ArrayList<Member>)request.getAttribute("blackList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int startPage = pi.getStartPage();
	int currentPage = pi.getCurrentPage();
	int endPage = pi.getEndPage();
	int limit = pi.getLimit();
	int ListCount = pi.getListCount();
	int MaxPage = pi.getMaxPage();
	System.out.println("JSP : "+pi);
%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<title>블랙회원 조회</title>
<link rel="icon" type="image/png" sizes="32x32" href="<%= request.getContextPath() %>/views/admin/image/loginimg(2).png">
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
	margin-top: 10%;
	border: 1px solid;
	border-radius: 10px; 
	margin-bottom: 50px;
	
}
.contents > div:first-child {
	width: 96%;
	height: 25px;
	padding: 20px;

}
.contents > div > p, h3 {
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
	background: #E2CEB8;
	color: #211f22;
	font-size: 1.2em;
	height: 32px;
	border-top: 1px solid #211f22;
	border-bottom: 1px solid #211f22;
}
#table  th, td {
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
#searchBox {
	margin-top: 1px;
	font-family: sans-serif;
	font-size: 15px;
	width: 150px;
	border: none;
	box-shadow: 0px 0px 5px 0px rgba(33,31,34,0.45);
	float: right;
}
#sarchBoxBtn {
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

</style>
<link rel="icon" type="image/png" sizes="32x32" href="<%= request.getContextPath() %>/views/admin/image/loginimg(2).png">
<body>
	<%@ include file="../../common/headerPage.jsp" %>
		<div id="container" class="container">
		<div id="contents" class="contents">
			<div>
				<p>블랙 회원<h3><%= request.getAttribute("listCount") %>명</h3>
				<button id="sarchBoxBtn">검색</button>
				<input type="text" id="searchBox">
			</div>
			<div>
				<table id="table">
					<tr>
						<th>회원번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>휴대폰번호</th>
						<th>주소</th>
						<th>이메일</th>
						<!-- <th>설정</th> -->
					</tr>
					 <% for(int i=0; i<blackList.size(); i++) {%>
						<tr>
							<td><%= blackList.get(i).getMemberNo()%></td>
							<td><%= blackList.get(i).getMemberId()%></td>
							<td><%= blackList.get(i).getMemberName()%></td>
							<td><%= blackList.get(i).getMemberPhone()%></td>
							<td style="width: 394px"><%= blackList.get(i).getMemberAddress()%></td>
							<td><%= blackList.get(i).getMemberEmail() %></td>
							<%-- <td>
								<button class="withdraw" value="<%= blackList.get(i).getMemberId()%>">탈퇴</button>
								<button class="release" value="<%= blackList.get(i).getMemberId()%>">해제</button>
							</td> --%>
						</tr>
					<% } %>
					
				</table>
			</div>
			<div id="nextPage">
				<div id="nextPageBox" align="center">
					<button  onclick="location.href='<%=request.getContextPath()%>/blackList.me?currentPage=1'"><<</button>
					<% if(currentPage <= 1){ %>
						<button  disabled> < </button>
					<% } else { %>
						<button  onclick="location.href='<%=request.getContextPath()%>/blackList.me?currentPage=<%=currentPage-1%>'"><</button>
					<% } %>
					<% for(int p= startPage; p<=endPage; p++) { 
						if(p == currentPage) { %>
						<button class="btn" onclick="location.href='<%=request.getContextPath()%>/blackList.me?currentPage=<%=p%>'" style="font-weight: bold;"><%= p %></button>
						<% } else { %>
						<button class="btn" onclick="location.href='<%=request.getContextPath()%>/blackList.me?currentPage=<%=p%>'"><%= p %></button>
						<% } %>
					<% } %>
					<% if(currentPage >= MaxPage){ %>
						<button  disabled> > </button>
					<% } else { %>
						<button  onclick="location.href='<%=request.getContextPath()%>/blackList.me?currentPage=<%=currentPage + 1 %>'"> > </button>
					<% } %>
					<button  onclick="location.href='<%=request.getContextPath()%>/blackList.me?currentPage=<%=endPage%>'">>></button>
				</div>
			</div>
		</div>
	</div>
	<script>
	$("td").click(function(e) {
			var userId = (e.target.parentElement.children[0].innerHTML);
					console.log(e.target.parentElement.children[0].innerHTML);
					  location.href="<%=request.getContextPath()%>/blackDetail.me?memberNo="+userId
			})
	$("#table td ,button").mouseover(function(e) {
			$("td").css({"cursor":"pointer"})
			$("button").css({"cursor":"pointer"})
		})
	</script>
</body>
</html>