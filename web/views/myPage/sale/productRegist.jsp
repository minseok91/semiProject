<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	height: 110px;
	display: inline-block;
	margin-left: 10px;
	margin-bottom: 10px;
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

#picArea {
	width: 270px;
	height: 300px;
	display: inline-block;
	float: left;
	text-align: center;
}

#infoArea {
	position: relative;
    left: 11%;
	display: inline-block;
	float: left;
}

.itemPic {
	display: inline-block;
	width: 280px;
	height: 280px;
	margin-left: 20px;
	margin-bottom: 10px;
	border: 1px solid #555;
}

#titleImg {
	width: 280px;
	height: 280px;
}

#watchBrand, #bagBrand {
	width: 100px;
}

.titles, .inputs {
	display: inline-block;
}

.titles {
	width: 100px;
	text-align: left;
	height: 30px;
}

.inputs {
	position: relative;
    display: inline-flex;
    width: 530px;
    padding-left: 5px;
    height: 30px;
    left: 105px;
}

.row {
	margin-top: 25px;
}

.row6 {
	margin-top: 400px;
	padding-bottom: 40px;
	border-bottom: 1px solid #000;
}

#detailLabel, #detailText {
	height: 65px;
}

#detailLabel {
	height: 30px;
}

#regist {
	float: right;
}
</style>
</head>
<body>
	<%@ include file="../../common/header.jsp"%>
	<%@ include file="../../common/nav.jsp"%>
	<%-- <% if(loginMember != null) { %> --%>
	<div class="container">
		<div id="myPageMenu">
			<h3 id="h3" align="center">마이페이지</h3>
			<dl>
				<dt>§ 구매정보</dt>
				<dd>
					<a value="../../wishList.wi">▶ 위시리스트</a>
				</dd>
				<dd>
					<a value="../../biddingList.bi">▶ 입찰리스트</a>
				</dd>
				<dd>
					<a value="buy/winningBid">▶ 낙찰리스트</a>
				</dd>

				<dt>§ 판매정보</dt>
				<dd>
					<a value="sale/productAppRequest" id="selectMenu">▶ 상품감정 신청</a>
				</dd>
				<dd>
					<a value="sale/goodsEnrollList">▶ 등록상품 관리</a>
				</dd>
				<dd>
					<a value="sale/auctionList">▶ 경매 진행 상품 관리</a>
				</dd>
				<dd>
					<a value="../../closedMemberAuctionList.au">▶ 경매 마감 상품 관리</a>
				</dd>

				<dt>§ 결제/배송조회</dt>
				<dd>
					<a value="delivery/paymentList">▶ 결제 내역</a>
				</dd>
				<dd>
					<a value="delivery/apprDeli">▶ 감정 상품 배송 조회</a>
				</dd>
				<dd>
					<a value="delivery/sellDeli">▶ 경매 상품 배송 조회</a>
				</dd>

				<dt>§ 문의 및 신고</dt>
				<dd>
					<a value="../../qnaList.qr">▶ 문의 내역</a>
				</dd>
				<dd>
					<a value="queAndReport/reportList">▶ 신고 내역</a>
				</dd>

				<dt>§ 회원정보</dt>
				<dd>
					<a value="memberChange/userInfoChange">▶ 회원정보 변경</a>
				</dd>
				<dd>
					<a value="memberChange/userDelete">▶ 회원 탈퇴</a>
				</dd>

			</dl>
		</div>
		<!-- myPageMenu end -->
		<div class="menuStatus">
			<div class="status1">
				<h3>&nbsp;&nbsp;<&nbsp;상품등록 &nbsp;>&nbsp;</h3>
			</div>
			<!-- status1 end -->
			<div class="status2">
				<p>상품을 등록하는 공간입니다.</p>
			</div>
			<!-- status2 end -->
		</div>
		<!-- menuStatus end -->

		<form action="<%=request.getContextPath()%>/itemRegister.it"
			method="post" encType="multipart/form-data">
			<div class="contentArea">
				<div id="picArea">
					<p>
						※상품 사진은 상품 식별이<br> 가능하도록 찍어주세요.
					</p>
					<div class="itemPic">
						<img id="titleImg">
					</div>

					<input type="file" name="itemPic" onchange="loadImg(this ,1)">

				</div>
				<div id="infoArea">
					<div class="row">
						<div class="titles">
							<label>종류</label>
						</div>
						<div class="inputs">
							<div id="watch">
								<input type="radio" id="watchChk" name="type" checked> <label
									for="watchChk">시계</label>
							</div>
							<div id="bag" style="margin-left: 109px;">
								<input type="radio" id="bagChk" name="type"> <label
									for="bagChk">가방</label>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="titles">
							<label>브랜드</label>
						</div>
						<div class="inputs">
							<input name="watchBrand" id="watchBrand" class="brandSelect">

							<input name="bagBrand" id="bagBrand" class="brandSelect" hidden>
						</div>
					</div>



					<div class="row">
						<div class="titles">
							<label>모델명</label>
						</div>
						<div class="inputs">
							<input name="model" type="text">
						</div>
					</div>

					<div class="row">
						<div class="titles">
							<label>구매시기</label>
						</div>
						<div class="inputs">
							<select name="purYear" id="purYear" class="purDate">
								<option value="2000년">2000</option>
								<option value="2001년">2001</option>
								<option value="2002년">2002</option>
								<option value="2003년">2003</option>
								<option value="2004년">2004</option>
								<option value="2005년">2005</option>
								<option value="2006년">2006</option>
								<option value="2007년">2007</option>
								<option value="2008년">2008</option>
								<option value="2009년">2009</option>
								<option value="2010년">2010</option>
								<option value="2011년">2011</option>
								<option value="2012년">2012</option>
								<option value="2013년">2013</option>
								<option value="2014년">2014</option>
								<option value="2015년">2015</option>
								<option value="2016년">2016</option>
								<option value="2017년">2017</option>
								<option value="2018년" selected>2018</option>
								<option value="2019년">2019</option>
							</select> <label>년</label>&nbsp; <select name="purMonth" id="purMonth"
								class="purDate">
								<option value="1월">1</option>
								<option value="2월">2</option>
								<option value="3월">3</option>
								<option value="4월">4</option>
								<option value="5월">5</option>
								<option value="6월">6</option>
								<option value="7월">7</option>
								<option value="8월">8</option>
								<option value="9월">9</option>
								<option value="10월">10</option>
								<option value="11월">11</option>
								<option value="12월">12</option>
							</select> <label>월</label>
						</div>
					</div>
					<div class="row">
						<div class="titles">
							<label>보증서 유무</label>
						</div>
						<div class="inputs">
							<div id="watch">
								<input type="radio" id="exist" name="type" checked> <label
									for="exist">유</label>
							</div>
							<div id="bag" style="margin-left: 109px;">
								<input type="radio" id="none" name="type"> <label
									for="none">무</label>
							</div>
						</div>
							<p style="margin-left: 17%;">※보증서 '유'에 체크하셨다면 상품 배송 시 보증서를 함께 배송해주세요.</p>
					</div>
				</div>
				<div class="row6">
						<div class="titles" id="detailLabel"
							style="vertical-align: middle; line-height: 0px;">
							<label>상세설명</label>
						</div>
						<div class="inputs" id="detailText">
							<textarea name="itemDetail"
								style="width: 500px; height: 65px; resize: none;"></textarea>
						</div>
				</div>
				<button id="regist">등록하기</button>
			</div>
			<!-- contentArea end -->
		</form>
	</div>
	<!-- container end -->
	<%-- <% } else {
		request.setAttribute("msg", "잘못된 경로로 접근했습니다.");
		request.getRequestDispatcher("../../common/errorPage.jsp").forward(request, response);
	   } %> --%>

	<script>
		function loadImg(value, num) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					switch (num) {
					case 1:
						$("#titleImg").attr("src", e.target.result);
						break;
					case 2:
						$("#contentImg1").attr("src", e.target.result);
						break;
					case 3:
						$("#contentImg2").attr("src", e.target.result);
						break;
					case 4:
						$("#contentImg3").attr("src", e.target.result);
						break;
					case 5:
						$("#contentImg4").attr("src", e.target.result);
						break;
					}
				};
				reader.readAsDataURL(value.files[0]);
			}
		};

		$(function() {
			$('a').click(function() {
				let values = $(this).attr('value');
				console.log(values);
				location.href = '<%= request.getContextPath() %>/views/myPage/'+values+'.jsp';
			})
			
			$('#bagChk').click(function() {
				$('#watchBrand').attr('hidden', true);
				$('#bagBrand').attr('hidden', false);
			});
			
			$('#watchChk').click(function() {
				$('#watchBrand').attr('hidden', false);
				$('#bagBrand').attr('hidden', true);
			});
		});
		
	</script>
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>