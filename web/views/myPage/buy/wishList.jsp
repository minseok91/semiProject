<%--
/**
 * <pre>
 * @Author      : 양승현
 * @CreateDate  : 2019. 12. 5. 오후 12:49:25
 * @ModifyDate  : 2019. 12. 5. 오후 12:49:25
 * @fileName    : wishList
 * @Description : 마이페이지의 위시리스트
 * </pre>
 */
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
/* 	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage(); */
%>
<!DOCTYPE html>
<html>
<head>
<title>LauXion</title>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.container {
	margin: 0 auto;
	padding-bottom: 10px;
}

.contents{
		height:650px;
		width:inherit;
		margin-top: 30px;
	}

#myPageMenu {
	width: 200px;
	height: 1080px;
	border-right: 2px solid black;
	display: inline-block;
	float: left;
	margin-right:10px;
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

#deleteAndSearch {
	display: flex;
	padding-bottom: 9px;
	padding-top: 68px;
}

#deleteAndSearch button, #deleteAndSearch input[type="submit"] {
	font-family: 'Nanum Myeongjo', serif;
	font-size: 15px;
	padding: 5px;
	color: #cca071;
	background: #211f24;
	border: 1px solid #a07342;
	border-radius: 3px;
	height: 34px;
}

#deleteAndSearch>form {
	position: relative;
	left: 58%;
}

#deleteAndSearch>form>input[type="search"] {
	font-size: 15px;
	padding: 2px 6px;
	width: 208px;
	margin-right: 18px;
	height: 32px;
	border: none;
	box-shadow: 0px 0px 8px 0px rgba(33, 31, 34, 0.45);
}

.menuStatus>.status1>h3 {
	margin-top: 10px;
}

.menuStatus>.status2 {
	width: 920px;
	height: 54px;
	background-color: lightgray;
	vertical-align: middle;
}

.menuStatus>.status2>p {
	padding-top: 16px;
	padding-left: 30px;
	font-size: 17px;
}

.contentArea {
	width: 920px;
	height: 970px;
	display: inline-block;
	margin-left: 10px;
}

.contentArea>#check {
	position: relative;
	left: 3%;
	top: 2%;
}

.list {
	position: relative;
	width: 800px;
	left: 50%;
	transform: translateX(-50%);
	text-align: center;
}

.list>table {
	border-collapse: separate;
	border-spacing: 65px;
	margin-top: 14px;
}

.list td {
	width: 120px;
	box-shadow: 0px 0px 8px 0px rgba(33, 31, 34, 0.45);
}

#img {
	width: 100px;
	margin-left: auto;
	margin-right: auto;
}

#img>img {
	width: 100px;
	height: 100px;
}

.price {
	margin-top: -16px;
	background-color: rgba(33, 31, 34, 0.863);
	font-size: 11px;
    text-align: center;
    background-color: #211f22;
    background-color: rgba(33, 31, 34, 0.863);
    color: #fff;
    width: 100px;
}

td>.content, .time {
	font-size: 12px;
}

td>.content {
	position: relative;
	text-align: left;
	white-space: pre-wrap;
	left: 2%;
}

.time {
	background: #a07342;
	border-radius: 5px;
	color: #fff;
	margin: 0 5px 5px 5px;
}

.wish {
	position: relative;
	left: -59%;
}

.pagingArea {
	position: relative;
    left: -6%;
    top: 5%;
    text-align: center;
    width: auto;
}

.pagingArea button {
	border: none;
	padding: 0;
	background: none;
	margin: 0 3px;
}

</style>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico" type="image/x-icon"/>
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
				<dd><a id=selectMenu value="buy/wishList">▶   위시리스트</a></dd>
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
				<dd><a value="../../qnaList.qr">▶  문의 내역</a></dd>
				<dd><a value="queAndReport/reportList">▶  신고 내역</a></dd>
				
				<dt>§  회원정보</dt>
				<dd><a value="memberChange/userInfoChange">▶  회원정보 변경</a></dd>
				<dd><a value="memberChange/userDelete">▶  회원 탈퇴</a></dd>
				
			</dl>
		</div>  <!-- myPageMenu end -->
		<div class="menuStatus">
			<div class="status1">
				<h3>&nbsp;&nbsp;<&nbsp;위시리스트 &nbsp;>&nbsp;</h3>
			</div>  <!-- status1 end -->
			<div class="status2">
				<p>회원님께서 찜하신 상품 리스트를 볼 수 있는 공간입니다.</p>
			</div>  <!-- status2 end -->
			<div id="deleteAndSearch">
				<button id="wishDelete">위시리스트 삭제</button>
				
				<select id="viewOptions" name="viewOptions">
					<option value="viewAll" >전체</option>
					<option value="viewWatches">시계</option>
					<option value="viewBags">가방</option>
				</select>
				
				
				<form action="" method="get">
					<input type="search" name="modelName">
					<input type="submit" value="검색">
				</form>
				
				
				
				
			</div>
		</div>  <!-- menuStatus end -->
		<div class="contentArea">
			<div id="check">			
				<label for="checkAll">전체 선택</label>
				<input type="checkbox" id="checkAll" name="checkAll">
			</div>
			<div class="list">
			<table>
			<% for(int i=0; i<3; i++) { %> <!-- 리스트 전체 / 4 + 1 -->
				<tr>
				<% for(int j=0; j<4; j++) { %> <!-- 4 고정 -->
					<td>
						<input type="hidden" value=""> <!-- value에 해당상품번호 이식 -->
						<input type="checkbox" class="wish">
						<div id="img">
                        	<div class="price">￦720,000</div>
                        	<img src="<%= request.getContextPath() %>/img/watch1.jpg" alt="" >
                        </div>
                        <span class="content">Omega Speedmaster Black Dial</span>
                        <div class="time">3 days 13 : 42</div>
					</td>
				<% } %>
				</tr>
				<% } %>
			</table>
		</div> <!-- watchList End -->
		
		</div>  <!-- contentArea end -->
		</div> <!-- contents End -->
	</div>  <!-- container end -->
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
				location.href='<%= request.getContextPath() %>/views/myPage/'+values+'.jsp';
			})
			
			// 전체체크
			$('#checkAll').click(function() {
				let chkAll = $(this).is(':checked');
				
				if(chkAll) $('.wish').prop('checked', true);
				else $('.wish').prop('checked', false);
			});
			
			// 체크한항목 제거
			$('#wishDelete').click(function () {
				
			})
		});
		
		
		$("#viewOptions").change(function() {
			var selected = $(this).val();
			var loginMemberNo = <%= loginMember.getMemberNo() %>
			$.ajax({
				url:"<%= request.getContextPath() %>/wishList.wi",
				type:"get",
				data: {
					selected:selected,
					loginMemberNo:loginMemberNo
				},
				success:function(data) {
					
				},
				error:function() {
					console.log("실패");
				}
			});
		});
		
		
	</script>
</body>
</html>









































