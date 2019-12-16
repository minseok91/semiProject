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
    import = "com.kh.lp.admin.qnaAndReport.model.vo.*"
    %>
 <%
 	ArrayList<QNA> list = (ArrayList<QNA>)request.getAttribute("list");
 %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<title>Insert title here</title>
</head><link rel="icon" type="image/png" sizes="32x32" href="image/loginimg(2).png">
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
#search_Box tr td {
}

#container_Box > div > p, h3 {
	width: 90px;
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
	width: 83px;
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
	width: 34px;
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
	<%@ include file="headerPage.jsp" %>
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
				<p>총 게시판 수 :</p><h4>4명</h4>
			</div>
				<table id="table">
					<tr>
						<th>번호</th>
						<th>카테고리</th>
						<th>신고제목</th>
						<th>글쓴이</th>
						<th>게시물ID</th>
						<th>기능</th>
					</tr>
					 <tr>
						<td>1</td>
						<td>신고게시판</td>
						<td>게시판 도배</td>
						<td>킹민석</td>
						<td>NT1234</td>
						<td>
							<button id="updateBtn">수정</button>
							<button id="deleteBtn">삭제</button>
						</td>
					</tr>
					 <tr>
						<td>2</td>
						<td>문의게시판</td>
						<td>악성광고</td>
						<td>안동환</td>
						<td>NT1235</td>
						<td>
							<button id="updateBtn">수정</button>
							<button id="deleteBtn">삭제</button>
						</td>
					</tr>
					 <tr>
						<td>3</td>
						<td>신고게시판</td>
						<td>그냥 심심</td>
						<td>안동</td>
						<td>NT1237</td>
						<td>
							<button id="updateBtn">수정</button>
							<button id="deleteBtn">삭제</button>
						</td>
					</tr>
					
				</table>
			</div>
			<div id="nextPage">
				<div id="nextPageBox">
					<button><</button>
					<button>o</button>
					<button>></button>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(document).click(function(e) {
		if(e.target.tagName == "TD"){
			location.href = "admin_noticeDetailPage.jsp"
		}
	})
	</script>
</body>
</html>