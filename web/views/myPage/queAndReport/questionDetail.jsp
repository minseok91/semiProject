<%--
/**
 * <pre>
 * @Author      : 오수민
 * @CreateDate  : 2019. 12. 18.
 * @ModifyDate  : 2019. 12. 18.7
 * @fileName    : questionList
 * @Description : 문의 내역 상세보기창
 * </pre>
 */
--%>


<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.lp.admin.qnaAndReport.model.vo.*, java.util.*, com.kh.lp.common.*"%>
<%
	QNA questionDetail = (QNA)request.getAttribute("questionDetail");
%>
 


<!DOCTYPE html>
<html>
<head>
<style>
.container {
	margin: 0 auto;
	padding-bottom: 10px;
}

.contents {
	height: 650px;
	width: inherit;
	margin-top: 30px;
}

#myPageMenu {
	width: 200px;
	height: 1080px;
	border-right: 2px solid black;
	display: inline-block;
	float: left;
	margin-right: 10px;
	margin-top: 10px;
}

#myPageMenu>dl>dt {
	font-size: 1.5em;
	font-family: 'Nanum Myeongjo', serif;
	margin-top: 50px;
	margin-bottom: 10px;
}

#myPageMenu>dl>dd {
	font-size: 15px;
	margin-left: 20px;
	margin-top: 7px;
	margin-bottom: 7px;
}

#h3 {
	font-family: 'Nanum Myeongjo', serif;
	background-color: #211f22;
	padding-top: 7px;
	padding-bottom: 7px;
	color: #a07342;
	margin-top: 0px;
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

.menuStatus {
	width: 920px;
	display: inline-block;
	margin-left: 10px;
	border-bottom: 1px solid #000;
	margin-bottom: 10px;
}

.menuStatus>.status2 {
	display: flex;
	width: 920px;
	height: 54px;
	background-color: lightgray;
	padding-left: 25px;
	padding-top: 18px;
}

.status2>p:nth-of-type(2) {
	padding-left: 10px;
	color: #f00;
	font-weight: bold;
}

.contentArea {
	text-align: center;
	position: absolute;
	width: 72%;
	margin-top: 75px;
	left: 28%;
}

/* 1920px 전용(작업용) */
@media ( min-width : 1919px) {
	.contentArea {
		left: 32%;
		width: 59%;
	}
}

.contentArea>table>tbody>tr>th, .contentArea>table>tbody>tr>td {
	width: auto;
	border-bottom: 1px solid #d9d9d9;
	padding: 5px;
	font-size: 15px;
	text-align: center;
}

.contentArea>table>tbody>tr>td>img {
	width: 100px;
	height: 100px;
}

.contentArea>table>tbody>tr>th {
	background: #f5efe7;
	border-top: 1px solid #3e2d1a;
}

#queNoti {
	border: 1px solid black;
	width: 700px;
	background: #f9faf1;
	margin-left: 210px;
}

.textArea {
	background: #f6f6f6;
}
</style>
<meta charset="UTF-8">
<title>LauXion</title>
</head>
<body>
	<%@ include file="../../common/header.jsp" %>
	<%@ include file="../../common/nav.jsp" %>
	<% if(loginMember != null) { %>
	<div class="container">
	<div class="contents">
		<div id="myPageMenu">
			<h3 id="h3" align="center">마이페이지</h3>
			<dl>
				<dt>§  구매정보</dt>
				<dd><a value="../../wishList.wi">▶   위시리스트</a></dd>
				<dd><a value="../../biddingList.bi">▶   입찰리스트</a></dd>
				<dd><a value="buy/winningBid">▶   낙찰리스트</a></dd>
				
				<dt>§  판매정보</dt>
				<dd><a value="sale/productAppRequest">▶  상품감정 신청</a></dd>
				<dd><a value="sale/goodsEnrollList">▶  등록상품 관리</a></dd>
				<dd><a value="sale/auctionList">▶  경매 진행 상품 관리</a></dd>
				<dd><a value="../../closedMemberAuctionList.au">▶  경매 마감 상품 관리</a></dd>
				
				<dt>§  결제/배송조회</dt>
				<dd><a value="delivery/paymentList">▶  결제 내역</a></dd>
				<dd><a value="delivery/apprDeli">▶  감정 상품 배송 조회</a></dd>
				<dd><a value="delivery/sellDeli">▶  구매 상품 배송 조회</a></dd>
				
				<dt>§  문의 및 신고</dt>
				<dd><a value="../../qnaList.qr" id="selectMenu">▶  문의 내역</a></dd>
				<dd><a value="queAndReport/reportList">▶  신고 내역</a></dd>
				
				<dt>§  회원정보</dt>
				<dd><a value="queAndReport/questionList">▶  회원정보 변경</a></dd>
				<dd><a value="memberChange/userDelete">▶  회원 탈퇴</a></dd>
				
			</dl>
		</div>  <!-- myPageMenu end -->
		
		
		
		<div class="menuStatus">
			<div class="status1">
				<h3>&nbsp;&nbsp;<&nbsp;문의 내역 &nbsp;>&nbsp;</h3>
			</div>  <!-- status1 end -->
			<div class="status2">
				<p>회원님께서 저희 사이트에 문의하신 내역과 그에 대한 답변을 확인할 수 있는 공간입니다.</p>
			</div>  <!-- status2 end -->
		</div>  <!-- menuStatus end -->
			<div class="contentArea">
			
			
			
			<table cellspacing="0" cellpadding="0" class="tb_sosmail mgt15">
					<colgroup>
						<col width="85">
					</colgroup>
					<tbody>
						<tr>
							<th class="con">제목</th>
							<td class="con">
								<text class="border_popep textArea" style="width: 560px; height: 20px;" name="qnaTitle" disabled>
									<%=questionDetail.getQnaTitle() %>
								</text>
							
							</td>
						</tr>
						
						<tr>
							<th class="con">문의작성일시</th>
							<td class="con">
								<text class="border_popep textArea" style="width: 560px; height: 20px;" name="qnaDate" disabled>
									<%=questionDetail.getQnaDate() %>
								</text>
							</td>
						</tr>

						<tr>
							<th class="con">문의내용</th>
							<td class="con">
								<textarea rows="10" cols="120" class="textArea" style="resize:none;" name="qnaContent" disabled>
									<%=questionDetail.getQnaContent() %>
								</textarea>
							
							</td>
						</tr>
						
						<tr>
							<th class="con">문의답변일시</th>
							<td class="con">
							<text class="border_popep textArea" style="width: 560px; height: 20px;" name="qnaReplyDate" disabled>
								
								<%if(questionDetail.getQnaReply()==null) { 
										switch(questionDetail.getQnaStatus()) {
										case "QHT1" : %>문의 접수<%; break;
										case "QHT2" : %>문의 확인<%; break;
										}%>									
	
									<%}else { %>
									<%=questionDetail.getQnaReplyDate() %>
									<%;} %>
							</text>
							</td>
						</tr>
						
						<tr>
							<th class="con">문의답변</th>
							<td class="con">
								<textarea rows="10" cols="120" class="textArea" style="resize:none;" name="qnaReply" disabled>
									
									<%if(questionDetail.getQnaReply()==null) {%>
										
									<%}else {%>
										<%=questionDetail.getQnaReply() %>
									<%} %>
									
								</textarea>
							
							</td>
						</tr>
						
					</tbody>
				</table>
			
				<button><a href="qnaList.qr.jsp">목록으로 돌아가기</a></button>
			
			
			</div>
			<!-- contentArea End -->

		</div> <!-- contents End -->
	</div><!-- container End -->
	<% } else {
		request.setAttribute("msg", "잘못된 경로로 접근했습니다.");
		request.getRequestDispatcher("../../common/errorPage.jsp").forward(request, response);
	   } %>
	<%@ include file="../../common/footer.jsp" %>

	<script>
		$(function() {
			$('a').click(function() {
				let values=$(this).attr('value');
				console.log(values);
				console.log('이거 '+'<%= request.getContextPath() %>/views/myPage/'+values+'.jsp');
				location.href='<%= request.getContextPath() %>/views/myPage/'+values+'.jsp';
			})
		});
	</script>
</body>
</html>




















