<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.lp.item.model.vo.*, com.kh.lp.appraisal.model.vo.*, com.kh.lp.admin.qnaAndReport.model.vo.*, com.kh.lp.admin.board.model.vo.*" %>
<% HashMap<String,Object> hmap = (HashMap<String,Object>) request.getAttribute("hmap"); 
System.out.println("hmap :" + hmap);
ArrayList<Item> itList = (ArrayList<Item>) hmap.get("item") ;
ArrayList<AR1> auList = (ArrayList<AR1>) hmap.get("auction") ;
ArrayList<QNA> qnaList = (ArrayList<QNA>) hmap.get("qna") ;
ArrayList<Board> boList = (ArrayList<Board>) hmap.get("board") ;
int itCount = (int) hmap.get("itemC");
int auCount = (int) hmap.get("auctionC");
int qnaCount = (int) hmap.get("qnaC");
int boCount = (int) hmap.get("boardC");
System.out.println("itList :" + itList);
System.out.println("auList :" + auList);
System.out.println("qnaList :" + qnaList);
System.out.println("boList :" + boList);

System.out.println("itCount :" + itCount);
System.out.println("auCount :" + auCount);
System.out.println("qnaCount :" + qnaCount);
System.out.println("boCount :" + boCount);

%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
		/* ul>li{
		list-style:none;
		} */
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
									&nbsp;&nbsp;&nbsp;<label>감정 대기 물품</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label id="moreIt">more</label>
											<ol>
											<%for(Item it : itList) { %>
												<li><%=it.getItemBrandModel() %></li>		
											<% } %> 
											</ol>
									</div>
									<br>
									<br>
									<br>
									<br>
									<br>
									<br>
									<br>
									<div>
									&nbsp;&nbsp;&nbsp;<label> 경매 진행중 상품</label>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label id="moreAu">more</label>
										<ol>
											<%for(AR1 au : auList) { %>
												<li><%=au.getAr1Brand() %> <%=au.getAr1Model() %></li>		
											<% } %> 
										</ol>
									</div>
									
								</div>
						   </td>
						</tr>
						<tr>
							<td colspan="2">
								<div id="question">
								<div>
									 &nbsp;&nbsp;&nbsp;<label>신고 및 문의 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label id="moreQNA">more</label>
									<ol>
										<!-- <li><label>명품 감정 믿을 수 있는건가요?</label><button>삭제</button></li>
										<li><label>명품 감정 믿을 수 있는건가요?</label><button>삭제</button></li>
										<li><label>오늘 날씨 알려줘</label><button>삭제</button></li> -->
										<% for(QNA qna : qnaList) {%>
											<li><%=qna.getQnaTitle() %></li>
										<%} %>
									</ol>
								</div>
								</div>
							</td>
							<td colspan="2">
								<div id="bbs">
									&nbsp;&nbsp;&nbsp;<label>게시판 관리</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label id="moreBo">more</label>
									<ol>
										<!-- <li>오늘 아침에 치킨을 먹었어요</li>
										<li>수원왕갈비통닭 레시피 알려주세요!!</li>
										<li>오늘 집에가다가 500원 주웠어요</li> -->
										<% for(Board bo : boList) {%>
											<li><%=bo.getBoardTitle()%></li>
										<%} %>
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
	 <script>
	 	$(function(){
	 		$("#moreIt").mouseover(function(){
	 			$("#moreIt").css('cursor','pointer');
	 		});
	 		
	 		$("#moreAu").mouseover(function(){
	 			$("#moreAu").css('cursor','pointer');
	 		});
	 		
	 		$("#moreQNA").mouseover(function(){
	 			$("#moreQNA").css('cursor','pointer');
	 		});
	 		
	 		$("#moreBo").mouseover(function(){
	 			$("#moreBo").css('cursor','pointer');
	 		});
	 		$("#moreIt").click(function(){
	 			location.href="<%= request.getContextPath()%>/selectAll.it";
	 		})
	 		
	 		$("#moreAu").click(function(){
	 			location.href="<%=request.getContextPath()%>/selectAll.au";
	 		})
	 		
	 		$("#moreQNA").click(function(){
	 			location.href="<%= request.getContextPath()%>/QNASelect.qr";
	 		})
	 		
	 		$("#moreBo").click(function(){
	 			location.href="<%= request.getContextPath()%>/selectAll.bo";
	 		})
	 	})
	 </script>
</body>
</html>