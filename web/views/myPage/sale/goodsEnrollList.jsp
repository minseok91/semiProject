<%--
/**
 * <pre>
 * @Author      : Kewon
 * @CreateDate  : 2019. 12. 6. 오후 7:29:37
 * @ModifyDate  : 2019. 12. 6. 오후 7:29:37
 * @fileName    : goodsEnrollList
 * @Description : 등록된 상품 관리 리스트
 * </pre>
 */
--%>

<%@page import="com.kh.lp.common.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
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

.container>.contents>#myPageMenu {
	width: 200px;
	height: 1080px;
	border-right: 2px solid black;
	display: inline-block;
	float: left;
	margin-right:10px;
	margin-top: 10px;
}

.container>.contents>#myPageMenu>dl>dt {
	font-size: 1.5em;
	font-family: 'Nanum Myeongjo', serif;
	margin-top: 50px;
	margin-bottom: 10px;
}

.container>.contents>#myPageMenu>dl>dd {
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

.container>.contents>#contentArea>#tableArea{
	width: 920px;
	border-collapse: separate;
    border-spacing: 0 25px;
	
}

.container>.contents>#myPageMenu>dl>dd>a {
	color: darkgray;
	text-decoration: none;
	cursor: pointer;
}

.container>.contents>#myPageMenu>dl>dd>#selectMenu {
	font-size: 1em;
	font-weight: bold;
	color: black;
	text-decoration: underline;
}

.container>.contents>#myPageMenu>dl>dd>a:hover {
	font-size: 1em;
	font-weight: bold;
	color: black;
	text-decoration: underline;
}

.container>.contents>.menuStatus {
	width: 920px;
	display: inline-block;
	margin-left: 10px;
	border-bottom: 1px solid #000;
	margin-bottom: 10px;
}

.container>.contents>.menuStatus>.status2 {
	width: 920px;
	height: 54px;
	background-color: lightgray;
	padding-left: 25px;
    padding-top: 3px;
}

.status2>p:nth-of-type(2) {
    color: #f00;
    font-weight: bold;
}

.contentArea {
    text-align: center;
    position: absolute;
    width: auto;
    height: 700px;
    margin-top: 75px;
    left: 28%; 
}

/* 1920px 전용(작업용) */
@media(min-width: 1919px) {
	.contentArea {
		left: 32%;
		width: 59%;
	}
}

.contentArea>table>thead>tr>th, .contentArea>table>tbody>tr>td {
	width: 152px;
	border-bottom: 1px solid #d9d9d9;
	padding: 15px;
	font-size: 15px;
	text-align: center;
}
.container>.contents>#contentArea>#tableArea> {
	width: 200px;
}
td>a>img {
	width: 100px;
	height: 100px;
}

.contentArea>table>thead>tr>th  {
	background: #f5efe7;
	border-top: 1px solid #3e2d1a;
}
.btn {
	border:1px solid #a07342;
	background:#211f22;
	color:#e2ceb8;
	height:26px;
	border-radius:5px;
}
.modalContainer {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
        /* Modal Content/Box */
.modalContents {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 30%; /* Could be more or less, depending on screen size */                          
}

#modalTableArea{
		border-collapse: separate;
    	border-spacing: 0 25px;
	}
	
	td>input{
		font-family: sans-serif;
		padding: 5px;
    	font-size: 14px;
    	width: 300px;
    	border: none;
    	box-shadow: 0px 0px 5px 0px rgba(33,31,34,0.45);
	}
	td>select{
		font-family: sans-serif;
		padding: 5px;
    	font-size: 14px;
    	width: 60px;
    	border: none;
    	box-shadow: 0px 0px 5px 0px rgba(33,31,34,0.45);
	}
	label{
		margin: 5px;
    	font-family: sans-serif;
    	font-size: 15px;
    	margin-right: 25px;
    	float: right;
	}
	.resLink {
		cursor: pointer;
		color: black;
		text-decoration: none;
	}
	.resLink:hover{
		cursor: pointer;
		color: black;
		text-decoration: none;
	}
</style>
<meta charset="UTF-8">
<title>LauXion</title>
</head>
<body onload="selectTable()">
	<%@ include file="../../common/header.jsp" %>
	<%@ include file="../../common/nav.jsp" %>
	<% if(loginMember != null) { %>
	<div class="container">
		<div class="contents">
			<div id="myPageMenu">
				<h3 id="h3" align="center">마이페이지</h3>
				<dl>
					<dt>§  구매정보</dt>
					<dd><a value="buy/wishList">▶   위시리스트</a></dd>
					<dd><a value="../../biddingList.bi">▶   입찰리스트</a></dd>
					<dd><a value="buy/winningBid">▶   낙찰리스트</a></dd>
					
					<dt>§  판매정보</dt>
					<dd><a value="sale/productAppRequest">▶  상품감정 신청</a></dd>
					<dd><a value="sale/goodsEnrollList" id="selectMenu">▶  등록상품 관리</a></dd>
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
					<h3>&nbsp;&nbsp;<&nbsp;등록상품 관리 &nbsp;>&nbsp;</h3>
				</div>  <!-- status1 end -->
				<div class="status2">
					<p>진품 보증 및 상품 감정이 완료되어 경매 진행이 가능한 상품 리스트 및 감정 결과를 볼 수 있는 공간입니다.</p>
					<p>감정 완료 시점으로부터 7일 이내에 경매가 진행되지 않은 상품은 자동 반송 처리됩니다.</p>
				</div>  <!-- status2 end -->
			</div>  <!-- menuStatus end -->
			<div class="contentArea" style="overflow:scroll">
				<table id="tableArea" border="1">
					<thead id="tableHeadArea">
						<tr>
							<th>상품번호</th>
							<th>상품사진</th>
							<th>브랜드/모델명</th>
							<th>감정가</th>
							<th>경매 진행</th>
							<th>남은 시간</th>
						</tr>
					</thead>
					<tbody id="tableBodyArea"></tbody>
				</table>
			</div> <!-- menuStatus End -->
		</div> <!-- contents End -->
	</div> <!-- container End -->
	
	<!-- modal -->
	<div id="modal1" class="modalContainer">
		<div class="modalContents">
			<div id="contentsArea">
				<h2 align="center">경매 시작 전 정보 입력</h2>
				<form id="modalForm" action="" method="post" onsubmit="return doAuction()">
					<table id="modalTableArea" align="center">
						<tr>
							<td><label for="">경매 상품</label></td>
							<td><input id="itemName" type="text" value="" readonly/></td>
						</tr>
						<tr>
							<td><label for="">감정가</label></td>
							<td><input id="itemPrice" type="text" value="" readonly/></td>
						</tr>
						<tr>
							<td><label for="">경매 시작가</label></td>
							<td><input id="itemStartPrice" type="text" name="itemStartPrice" placeholder="감정가의 90%까지만 입력이 가능합니다."/></td>
						</tr>
						<tr>
							<td><label for="">경매기간</label></td>
							<td>
								<select name="auctionDay" id="">
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
								</select>
							</td>
						</tr>
				</table>
				<input type="hidden" id="itemId" name="itemId" value=""/>
				<input type="hidden" id="memberNo" name="memberNo" value="<%= loginMember.getMemberNo() %>"/>
				<div id="modalBtnArea" align="center">
				<br />
					<button class="btn" id="modalStartBtn" type="submit" style="padding-top: 3px;">시작하기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn" id="modalEndBtn" type="reset" style="padding-top: 3px;">취소하기</button>
				</div>  <!-- modalBtnArea end -->
			</form>
			</div>  <!-- contentsArea end -->
			
		</div>  <!-- modalContents end -->
	</div>  <!-- modalContainer end -->
	
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
		});
		
		
		
		function selectTable(){
			$.ajax({
				url: "<%= request.getContextPath() %>/selectItemResult.app",
				type: "post",
				data: {
					memberNo: <%= loginMember.getMemberNo() %>
				},
				success: function(data){
					console.log(data);
					var arr = data.split("#");			//객체별로 스플릿
					for(i in arr) {
						temp = "";
						var arr2 = arr[i].split("::");		//0: 아이템번호, 1: 사진이름, 2: 브랜드, 3: 감정가, 4: 감정여부,  5: 경매카운트
						for(j in arr2) {
							if(j == 1) {	//사진 여부
								if(arr2[j] != "null"){
									temp += "<td><a class='resLink'><img src='<%= request.getContextPath() %>/img/appraisal/" + arr2[j] + "'></a></td>";
								}else {
									temp += "<td><a class='resLink'><img src='<%= request.getContextPath() %>/img/appraisal/noImage.png'></a></td>";
								}
							} else if(j == 3) {		//감정가
								if(arr2[j] != 0) {
									temp += "<td><a class='resLink'>" + numberFormat(arr2[j]) + "원</a></td>";
								} else {
									temp += "<td><a class='resLink'></a></td>";
								}
							} else if(j == 4) {
								if(arr2[j] == "진품1" || arr2[j] == "진품2") {
									temp += "<td>경매<br>진행 중</td>";
								} else if(arr2[j] == "진품0") {
									temp += "<td><button class='btn' id='startBtn' onclick='startAuction(this)' style='padding-top: 3px;'>경매시작</button><br><br><button class='btn' onclick='endAuction()' style='padding-top: 3px;'>경매취소</button></td>";
								} else if(arr2[j] == "가품0") {
									temp += "<td>가품<br><br><button class='btn' id='deliveryBtn' onclick='doDelivery(this)' style='padding-top: 3px;'>운송장확인</button></td>";
								} else {
									temp += "<td>감정 중</td>";
								}
							} else if(j == 5) {
								
							} else {
								temp += "<td><a class='resLink'>" + arr2[j] + "</a></td>";
							}
							
						}
						temp += "<td name='time" + i + "'>00 : 00 : 00</td>";
						$("#tableArea > #tableBodyArea:last").append("<tr>" + temp + "</tr>");
					}
				},
				error: function(data){
					console.log("테스트 실패");
				}
			});
		};
		
		function startAuction(value){
			var tr = $(value).parent().parent();
			var td = $(tr).children();
			$("#itemId").val(td.eq(0).text());
			$("#itemName").val(td.eq(2).text());
			$("#itemPrice").val(td.eq(3).text());
			$("#modal1").show();
		};
		
		$("#startBtn").click(function(){
			console.log("test");
		});
		
		function endAuction(){
			console.log("경매를 취소합니다.");
		};
		
		$("#modalEndBtn").click(function(){
			$("#modal1").hide();
		});
		
		function doAuction(){
			var itemPrice = $("#itemPrice").val();
			var itemStartPrice = $("#itemStartPrice").val();
			alert(itemPrice);
			alert(itemStartPrice);
			if(itemStartPrice > (itemPrice * 0.9)) {
				alert("경매 시작가가 감정가의 90%보다 높습니다.");
				return false;
			} else if(itemStartPrice == "") {
				alert("경매 시작가를 입력해주세요");
				return false;
			} else{
				$("#modalForm").attr("action", "<%= request.getContextPath() %>/startAuction.au");
			}
		}
		
		function numberFormat(inputNumber) {
			   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		
	</script>
</body>
</html>