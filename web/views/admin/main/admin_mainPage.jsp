<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<link rel="icon" type="image/png" sizes="32x32" href="image/loginimg(2).png">
</head>
<title>Insert title here</title>
	<style>
		.container {
			 width: 1080px; 
		}
		
		.contents{
			margin-top: 100px;
			width: 1080px;
			height: 650px;
			margin-left: auto;
			margin-right: auto;
		}
		
		#table {
			margin-left: auto;
			margin-right: auto;
			width: 100%;
			height: 80%;
		}
		.contents> div {
			color: rgb(33, 31, 34);
		}
		#table td {
			width: 25%;
		} 
		#table tr:nth-child(1)  {
			height: 0;
		}
		
		#sales {
			width: 100%;
			height: 100%;
			border: 1px solid rgb(160, 115, 66);
			border-radius: 5px; 
		}
		
		#mission {
			width: 100%;
			height: 100%;
			border: 1px solid rgb(160, 115, 66);
			border-radius: 5px; 
		}
		
		#question {
			width: 100%;
			height: 100%;
			border: 1px solid rgb(160, 115, 66);
			border-radius: 5px; 
		}
		#mission > div {
			width: 100%;
			height: 25px;
		}
		#mission > div:nth-child(2) {
			padding-top: 10px;
			width: 100%;
			height: 90%;
		}
		#mission > div:nth-child(2) > ul {
			padding-left: 0px;
			list-style: none;
		}
		#mission > div:nth-child(2) > ul > li {
			padding-top: 5px;
			padding-left: 10px;
		}
		 ol > li {
			padding-top: 5px;
		}
		#question > div {
			width: 100%;
			height: 25px;
		}
		#question > div > ul > li > button {
			background: red;
			color: #e2ceb8;
			border: none;
			border-radius: 5px; 
			float: right;
			margin-right: 50px;
		}
		
		#bbs {
			width: 100%;
			height: 100%;
			border: 1px solid rgb(160, 115, 66);
			border-radius: 5px; 
		}
		ul>li{
		list-style:none;
		}
	</style>
</head>
<body>
	 
		<%@include file="../common/headerPage.jsp"%>
		<% if((loginMember.getMemberNo()) == 1) { %> 
			<div id="container" class="container">
				<div id="contents" class="contents">
					<div>
						<h2>관리자 메인 화면</h2>
					</div>
					<table id="table">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
						<tr>
							<td colspan="3">
							<div id="sales">
								<%@ include file="../common/my.jsp" %>
							</div>
		
							</td>
							<td colspan="1"> 
							<div id="mission">
									<div>
									&nbsp;&nbsp;&nbsp;<label>감정 대기 물품</label>
									</div>
									<div>
										 <ul>
											<li><label for="checkBox1">블랙리스트 확인하기</label></li>
											<li><label for="checkBox2">경매 물품 확인하기</label></li>
											<li><label for="checkBox3">경매 상황 확인하기</label></li>
										</ul> 
									&nbsp;&nbsp;&nbsp;<label> 경매 진행중 상품</label>	
										<ul>
											<li><label for="checkBox1">블랙리스트 확인하기</label></li>
											<li><label for="checkBox2">경매 물품 확인하기</label></li>
											<li><label for="checkBox3">경매 상황 확인하기</label></li>
										</ul> 
									</div>
									
								</div>
						   </td>
						</tr>
						<tr>
							<td colspan="2">
								<div id="question">
								<div>
									 &nbsp;&nbsp;&nbsp;<label>신고 및 문의 </label>
									<ul>
										<li><label>명품 감정 믿을 수 있는건가요?</label><button>삭제</button></li>
										<li><label>명품 감정 믿을 수 있는건가요?</label><button>삭제</button></li>
										<li><label>오늘 날씨 알려줘</label><button>삭제</button></li>
									</ul>
								</div>
								</div>
							</td>
							<td colspan="2">
								<div id="bbs">
									&nbsp;&nbsp;&nbsp;<label>게시판 관리</label>
									<ol>
										<li>오늘 아침에 치킨을 먹었어요</li>
										<li>수원왕갈비통닭 레시피 알려주세요!!</li>
										<li>오늘 집에가다가 500원 주웠어요</li>
									</ol>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
	 <% } else { %>
	 		<h3 align="center">로그인이 안되어있습니다.</h3>
	 		<h4 align="center"><a href="<%= request.getContextPath()%>/views/admin/main/admin_login.jsp">로그인 하러 가기</a></h4>
	 		
	 <% } %>
</body>
</html>