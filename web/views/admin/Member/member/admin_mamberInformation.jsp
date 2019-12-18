<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.kh.lp.admin.member.model.vo.*
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
	<style>
		input{
			font-family: sans-serif;
	    	font-size: 15px;
	    	width: 150px;
	    	border: none;
	    	box-shadow: 0px 0px 5px 0px rgba(33,31,34,0.45);
		}
		
		table {
			border-collapse: collapse;
	    	text-align: center;
		}
		
		.container {
			width: 1080px;
			margin-left: auto;
			margin-right: auto;
			
		}
		.contents {
			width: 100%;
			margin-top: 5%;
			border: 1px solid;
			border-radius: 10px; 
			
		}
		
		.btn {
			border:1px solid #a07342;
			background:#211f22;
			color:#e2ceb8;
			height:24px;
			border-radius:4px;
			font-size:16px;
			font-weight: bold;
			cursor: pointer;
		}
		
		.btn2 {
			border:1px solid white;
			background:white;
			color:black;
			height:23px;
			border-radius:5px;
			font-size:17px;
			cursor: pointer;
		}
		#memberCountArea {
			width: inherit;
			margin-left: auto;
			margin-right: auto;
		}
		#countArea {
			display: inline-block;
			float: left;
			height: 48px;
		}
		
		#searchArea {
			display: inline-block;
			float: right;
			height: 48px;
		}
		
		#tableCountArea {
			height: 48px;
			margin-left: 37px;
		}
		
		#tableSearchArea {
			height: 48px;
			margin-right: 37px;
		}
		
		#memberArea {
			width: 1000px;
			margin-left: auto;
			margin-right: auto;
		}
		
		#tableArea {
			width: 1000px;
			height: 500px;
			border-collapse: collapse;
			text-align: center;
		}
		#tableArea>#tableHeadArea>tr>th {
			background: #e2ceb8;
			color: #211f22;
			font-size: 1.2em;
			height: 32px;
			border-top: 1px solid #211f22;
	 		border-bottom: 1px solid #211f22;
		}
		
		#tableArea>#tableBodyArea>tr>td {
			border-top: 1px solid #CCCCCC;
 			border-bottom: 1px solid #CCCCCC;
		}
		
		#pagingArea {
			width: 100%;
			height: 15%;
			margin-bottom: 20px;
			margin-top: 70px;
		} 

		#pagingAreaBox {
			width: 80%;
			height: 100%;
			margin-left: auto;
			margin-right: auto;
		}
	</style>
</head>

<body>
	<%@ include file="../../common/headerPage.jsp" %>
	<div id="container" class="container">
		<div id="contents" class="contents">
			<div id="memberCountArea">
			<br /><br />
				<div id="countArea">
					<table id="tableCountArea">
						<tr>
							<td><label for="">전체 회원</label></td>
							<td><h3><%= request.getAttribute("listCount") %>명</h3></td>
						</tr>
					</table>  <!-- tableCountArea end -->
				</div>  <!-- countArea end -->
				<div id="searchArea" align="right">
					<table id="tableSearchArea">
						<tr>
							<td><input type="text" id="searchBox"></td>
							<td>&nbsp;&nbsp;&nbsp;</td>
							<td><button class="btn" id="searchBoxBtn">검색</button></td>
						</tr>
					</table>  <!-- tableSearchArea end -->
				</div>  <!-- searchArea end -->
			</div>  <!-- memberCountArea end -->
			<div id="memberArea" align="center">
				<table id="tableArea">
					<thead id="tableHeadArea">
						<tr>
							<th>No.</th>
							<th>아이디</th>
							<th>이름</th>
							<th>휴대폰번호</th>
							<th>주소</th>
							<th>이메일</th>
						</tr>
					</thead>
					<tbody id="tableBodyArea">
						<% for(int i=0; i<userList.size(); i++) {%>
							<tr>
								<td><%= userList.get(i).getRowNum()%></td>
								<td><%= userList.get(i).getMemberId()%></td>
								<td><%= userList.get(i).getMemberName()%></td>
								<td><%= userList.get(i).getMemberPhone()%></td>
								<td style="width: 394px"><%= userList.get(i).getMemberAddress()%></td>
								<td><%= userList.get(i).getMemberEmail() %></td>
							</tr>
						<% } %>
					</tbody>	
				</table>  <!-- tableArea end -->
			</div>  <!-- memberArea end -->
			<div id="pagingArea">
				<div id="pagingAreaBox" align="center">
					<button class="btn2" onclick="location.href='<%=request.getContextPath()%>/memberInfo.me?currentPage=1'"><<</button>
					<% for(int p=1; p<=MaxPage; p++) { %>
						<button class="btn2" onclick="location.href='<%=request.getContextPath()%>/memberInfo.me?currentPage=<%=p%>'"><%= p %></button>
					<% } %>
					<button class="btn2" onclick="location.href='<%=request.getContextPath()%>/memberInfo.me?currentPage=<%=MaxPage%>'">>></button>
				</div>  <!-- pagingAreaBox end -->
			</div>  <!-- pagingArea end -->
		</div>  <!-- contents end -->
	</div>  <!-- container end -->
	
	<script>
	$(function(){
		$("tr").css({"cursor":"pointer"}).click(function(e) {
			var userId = e.target.parentElement.children[1].innerHTML;
			console.log(userId);
		    location.href="<%=request.getContextPath()%>/memberInfoDetail.me?userId="+userId;
		})
	});
	</script>
</body>
</html>