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
	
	#picArea{
		width:29%;
		border:1px solid black;
		height:300px;
		display:inline-block;
		float:left;
		text-align:center;
	}
	
	#infoArea{
		width:70%;
		border:1px solid black;
		height:300px;
		display:inline-block;
		float:left;
	}
	#regist{
	
	}
	.itemPic{
		display:inline-block;
		width:200px;
		height:200px;
		border:1px solid black;
		margin-left:20px;
		margin-bottom:10px;
	}
	
	#watchBrand, #bagBrand {
		width:100px;
	}
	
	#bagBrand {
		display:none;
	}
	
	
	.titles, .inputs {
		border: 1px solid red;
	}
	
	
	
	
</style>
</head>
<body>
	<%@ include file="../../common/header.jsp" %>
	<%@ include file="../../common/nav.jsp" %>
	<%-- <% if(loginMember != null) { %> --%>
	<div class="container">
	<div class="contents">
		<div id="myPageMenu">
			<h3 id="h3" align="center">마이페이지</h3>
			<dl>
				<dt>§  구매정보</dt>
				<dd><a value="buy/wishList">▶   위시리스트</a></dd>
				<dd><a value="buy/biddingList">▶   입찰리스트</a></dd>
				<dd><a value="buy/winningBid">▶   낙찰리스트</a></dd>
				
				<dt>§  판매정보</dt>
				<dd><a value="sale/productAppRequest" id="selectMenu">▶  상품감정 신청</a></dd>
				<dd><a value="sale/goodsEnrollList">▶  등록상품 관리</a></dd>
				<dd><a value="sale/auctionList">▶  경매 진행 상품 관리</a></dd>
				<dd><a value="sale/auctionDeadline">▶  경매 마감 상품 관리</a></dd>
				
				<dt>§  결제/배송조회</dt>
				<dd><a value="delivery/paymentList">▶  결제 내역</a></dd>
				<dd><a value="delivery/apprDeli">▶  감정 상품 배송 조회</a></dd>
				<dd><a value="delivery/sellDeli">▶  구매 상품 배송 조회</a></dd>
				
				<dt>§  문의 및 신고</dt>
				<dd><a value="queAndReport/questionList">▶  문의 내역</a></dd>
				<dd><a value="queAndReport/reportList">▶  신고 내역</a></dd>
				
				<dt>§  회원정보</dt>
				<dd><a value="memberChange/userInfoChange">▶  회원정보 변경</a></dd>
				<dd><a value="memberChange/userDelete">▶  회원 탈퇴</a></dd>
				
			</dl>
		</div>  <!-- myPageMenu end -->
		<div class="menuStatus">
			<div class="status1">
				<h3>&nbsp;&nbsp;<&nbsp;상품등록 &nbsp;>&nbsp;</h3>
			</div>  <!-- status1 end -->
			<div class="status2">
				<p>상품을 등록하는 공간입니다.</p>
			</div>  <!-- status2 end -->
		</div>  <!-- menuStatus end -->
		<div class="contentArea">
			<div id="picArea">
			<p>※상품 사진은 상품 식별이 가능하도록 찍어주세요.</p>
				<div class="itemPic"  ></div>
				<img src="../../img/step01.png">
				<input type="file" value="사진업로드">
				
			</div>
			<div id="infoArea">
			<div class="titles">
			<label>종류</label>
			</div>
			<div class="inputs">
			<select id="type" onchange="watchBag();">
				<option value="W" selected>시계</option>
				<option value="B">가방</option>
			</select>
			</div>
			
			<div class="titles">
			<label>브랜드</label>
			</div>			
			<div class="inputs">
			<select name="watchBrand" id="watchBrand" class="brandSelect" >
			
				<option value="ROLEX">ROLEX</option>
										
				
			</select>
			<select name="bagBrand" id="bagBrand" class="brandSelect" >
				
				<option value="HERMES">HERMES</option>
			
			</select>
			</div>
			
			
			
			
			<div class="titles">
				<label>모델명</label>
			</div>
			<div class="inputs">
				<input type="text">
			</div>
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
				</select>
				<label>년</label>&nbsp;
				<select name="purMonth" id="purMonth" class="purDate">
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
				</select>
				<label>월</label>				
				</div>
			
				<div class="titles">
				<label>보증서 유무</label>
				</div>
				<div class="inputs">
				<select name="warrYN" id="warrYN" class="warranty">
					<option value="Y">유</option>
					<option value="N" selected>무</option>
				</select>
				<br>
				<p>&nbsp;&nbsp;※보증서 '유'에 체크하셨다면 상품 배송 시 보증서를 함께 배송해주세요.</p>
				</div>
				
			<div class="titles">
			<label>상세설명</label>
			</div>
			<div class="inputs">
			<textarea style="width: inherit; height:50px; resize:none;" ></textarea>
			</div>
			</div>
			<button id="regist" align="center">등록하기</button>




						
		</div>  <!-- contentArea end -->
		</div> <!-- contents End -->
	</div>  <!-- container end -->
	<%-- <% } else {
		request.setAttribute("msg", "잘못된 경로로 접근했습니다.");
		request.getRequestDispatcher("../../common/errorPage.jsp").forward(request, response);
	   } %> --%>
	<%@ include file="../../common/footer.jsp" %>

	<script>
	
		$(function() {
			$('a').click(function() {
				let values=$(this).attr('value');
				location.href='<%= request.getContextPath() %>/views/myPage/'+values+'.jsp';
			}).css('cursor', 'pointer');
		});
		
		
		
		function watchBag(){
						
			if($("#type").val() === 'W'){
				$('#bagBrand').hide();
				$('#watchBrand').show();
			}else {
				$('#watchBrand').hide();
				$('#bagBrand').show();
			}
			
		};
		
		

	</script>
</body>
</html>











































