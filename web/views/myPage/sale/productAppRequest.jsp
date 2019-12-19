<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
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
	#myPageMenu{
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
	#h3{
		font-family: 'Nanum Myeongjo', serif;
		background-color: #211f22;
		padding-top: 7px;
		padding-bottom: 7px;
		color: #a07342;
		margin-top: 0px;
	}
	
	#myPageMenu>dl>dd>a{
		color: darkgray;
		text-decoration: none;
		cursor: pointer;
	}
	#myPageMenu>dl>dd>#selectMenu{
		font-size: 1em;
		font-weight: bold;
		color: black;
		text-decoration: underline;
	}
	#myPageMenu>dl>dd>a:hover{
		font-size: 1em;
		font-weight: bold;
		color: black;
		text-decoration: underline;
	}
	.menuStatus{
		width: 920px;
		height: 110px;
		display: inline-block;
		margin-left: 10px;
		margin-bottom: 10px;
	}
	.menuStatus>.status1>h3{
		margin-top:10px;
	}
	.menuStatus>.status2{
		width: 920px;
		height: 54px;
		background-color: lightgray;
		vertical-align: middle;

	}
	.menuStatus>.status2>p{
		padding-top: 16px;
		padding-left: 30px;
		font-size: 17px;
	}
	.contentArea{
		width: 920px;
		height: 970px;
		border: 1px solid black;
		display: inline-block;
		margin-left: 10px;
		
	}
	li{
		list-style:none;
		float:right;
	}
	li div{
		display:inline-block;
	}
</style>
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
				<dd><a value="buy/wishList">▶   위시리스트</a></dd>
				<dd><a value="../../biddingList.bi">▶   입찰리스트</a></dd>
				<dd><a value="buy/winningBid">▶   낙찰리스트</a></dd>
				
				<dt>§  판매정보</dt>
				<dd><a value="sale/productAppRequest" id="selectMenu">▶  상품감정 신청</a></dd>
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
				<h3>&nbsp;&nbsp;<&nbsp;상품감정 신청 &nbsp;>&nbsp;</h3>
			</div>  <!-- status1 end -->
			<div class="status2">
				<p>감정하고 싶은 상품을 등록해주세요.</p>
			</div>  <!-- status2 end -->
		</div>  <!-- menuStatus end -->
		<div class="contentArea">
		<h2>상품 등록 방법</h2>
		<ul class="flowList-col2">
			<li>
				<div class="txtAtg vrea">
					<p class="stepArea"><img src="../../img/step01.png" width="60" height="60" alt="STEP01"></p>
					
					<p class="titArea">출품 예정인 상품을 촬영합니다.</p>
					<p class="exArea">출품하고 싶으신 시계의 사진을 찍어주세요. 앞면, 뒷면 등등 여러 각도에서 사진을 찍어 주세요</p>
				</div>
				<div class="imgArea"><img src="../../img/quick_pca2_ph1.jpg" width="350" height="350" alt="출품 예정인 상품을 촬영합니다."></div>
			</li>
			<li>
				<div class="txtArea">
					<p class="stepArea"><img src="../../img/step02.png" width="60" height="60" alt="STEP02"></p>
					<p class="titArea">상품 이미지 업로드</p>
					<p class="exArea">
					상품 이미지 업로드 페이지에서 [이미지 파일 선택]을 눌러 이미지를 업로드 해주세요. 메인 사진은 시계의 정면 사진으로 설정해주세요. [START] 버튼을 누르면 업로드가 시작됩니다. <!--					
Upload images from <strong class="txtocher">SELECT FILE</strong> on the upload product images page. Please select an image that clearly shows the watch face as the main image. Upload will begin when you click the <strong class="txtocher">START</strong> button.
-->
					</p>
					<p class="btnArea"><a href="/ko/buyerfile/quick_itemadd_v2/" class="btn btn-contens">상품 이미지 업로드</a></p>
				</div>
				<div class="imgArea"><img src="/image/tp2/users-guide/sell/en/sell_watches_640.jpg" width="350" height="350" class="bLine" alt="Upload product images"></div>
			</li>
			<li>
				<div class="txtArea">
					<p class="stepArea"><img src="../../img/step03.png" width="60" height="60" alt="STEP03"></p>
					<p class="titArea">시계와 부속품의 정보를 등록해주세요.</p>
					<p class="exArea">
					 [상품 정보 입력하기]를 클릭해 제품 정보를 입력해주세요.<br>
					<!-- Click on <strong class="txtocher">ADD PRODUCT INFORMATION</strong> to add product information. <br> -->		
					우선 업로드된 이미지에서  메인 이미지를 선택해주세요.<br>
					다음으로, 브랜드, 경매 시작 가격, 제품 가격을 설정해주세요. 정보 등록은 정말 간단합니다.					</p>
				</div>
				<div class="imgArea"><img src="/image/tp2/users-guide/sell/en/sell_my_luxury_watch_640.jpg" width="350" height="350" class="bLine" alt=" [상품 정보 입력하기]를 클릭해 제품 정보를 입력해주세요."></div>
			</li>
			<li>
				<div class="txtArea">
					<p class="stepArea"><img src="../../img/step04.png" width="60" height="60" alt="STEP04"></p>
					<p class="titArea">미리 보기</p>
					<p class="exArea">
					[저장]을 클릭 후, 미리보기를 확인하여 틀린 정보나 잘못된 정보가 없는지 마지막으로 확인해 주세요.					등록된 정보가 확실한지 다시 한번 더 확인해주세요.					</p>
				</div>
				<div class="imgArea"><img src="/image/tp2/users-guide/sell/en/confirm_preview_640.jpg" width="350" height="350" class="bLine" alt="미리 보기"></div>
			</li>
			<li>
				<div class="txtArea">
					<p class="stepArea"><img src="../../img/step05.png" width="60" height="60" alt="STEP05"></p>
					<p class="titArea">판매개시를 하면 출품작업은 완료됩니다.</p>
					<p class="exArea">
					[판매 시작]을 클릭해 고객님의 상품 출품 등록을 완료해주세요. 출품이 완료되면 경매가 시작됩니다. 경매가 끝날 때까지 기다려주세요.					</p>

					<p class="btnArea"><a href="productRegist.jsp" class="btn btn-contens">판매 시작</a></p>
				</div>
				<div class="imgArea"><img src="/image/tp2/users-guide/sell/en/start_selling_640.jpg" width="350" height="350" class="bLine" alt="판매개시를 하면 출품작업은 완료됩니다."></div>
			
			</li>
		</ul>
		
		
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
		});
	</script>
</body>
</html>