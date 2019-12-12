<%--
/**
 * <pre>
 * @Author      : Kewon
 * @CreateDate  : 2019. 12. 8. 오후 5:34:51
 * @ModifyDate  : 2019. 12. 8. 오후 5:34:51
 * @fileName    : paymentBefore
 * @Description : 결제 api들어가기 전에 보여지는 페이지
 * </pre>
 */
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LauXion</title>
<style>
.container {
	margin: 0 auto;
	padding-bottom: 10px;
}

.contents>h1 {
	text-align: center;
	font-size: 36px;
}

#orderInfo {
	display: grid;
}

.contents>div>p {
	border-bottom: 1px solid #a07342;
	font-size: 24px;
    font-weight: bold;
}

#write {
	margin-left: 7%;
    margin-top: 4%;
}

#write>div {
	padding-bottom: 2%;
	display: flex;
}

#infoCheck {
	margin-left: 7px;
    margin-top: 8px;
}

#write>div:nth-of-type(3) {
	display: flex;
}

#write>div>p {
	font-size: 20px;
}

#write>div:nth-of-type(2n-1)>p {
	margin-left: 5.65%;
}

#write input {
	border: none;
	box-shadow: 0px 0px 5px 0px rgba(33,31,34,0.45);
	background: #fff;
	width: 276px;
	font-size: 20px;
	margin-left: 12px;
}

#write input[type=checkbox] {
	width: 13px;
}

#address {
	display: grid;
	margin-left: 4px;
}

#address>input {
	margin-bottom: 21.203px;
}

#write>div:nth-of-type(3)>button {
	margin-left: 25px;
    height: 43px;
    width: 101px;
    font-size: 20px;
    background: #211f22;
    border: 1px solid #a07342;
    color: #a07342;
    border-radius: 3px;
}

#goodsInfo>img {
	width: 200px;
	height: 200px;
}

#goodsContents {
	display: flex;
	margin: 4% 0 3% 5%;
}

#goodsTitle {
	display: grid;
	padding-bottom: 2%;
}

#goodsTitle:nth-of-type(1) {
	width: 16%;
}

#goodsTitle>input, #goodsTitle>label {
	font-size: 20px;
}

#goodsTitle>label {
	text-align: right;
}

#goodsTitle>input {
	margin-left: 3%;
	height: 30px;
	border: none;
	box-shadow: 0px 0px 5px 0px rgba(33,31,34,0.45);
	background: none;
	margin-bottom: 20px;
}

#buyInfo>table {
	margin-top: 4%;
	position: relative;
	left: 50%;
    transform: translateX(-50%);
    text-align: center;
    border-spacing: 50px;
}

#buyInfo label, #buyInfo input {
	font-size: 20px;
}

#buyInfo label {
	padding-bottom: 14px;
}

#buyInfo>table input, #endPrice>input {
	margin-left: 3%;
	height: 30px;
	border: none;
	box-shadow: 0px 0px 5px 0px rgba(33,31,34,0.45);
	background: none;
	margin-bottom: 20px;
}

#buyInfo>table>tbody>tr>td:nth-of-type(1) {
	text-align: right;
}

#endPrice {
	position: relative;
	left: 33.8%;
	width: 486px;
    border-top: 1px solid #000;
    padding-top: 17px;
}

#endPrice>input {
	margin-left: 1%;
	vertical-align: bottom;
}

#end {
    position: relative;
    text-align: center;
    left: 7%;
}

#payment {
	position: relative;
    left: 55%;
    transform: translateX(-50%);
    text-align: center;
    width: 32%;
    padding: 6px;
    margin-top: 3%;
    margin-bottom: 12%;
    background: #211f22;
    color: #a07342;
    border: 1px solid #a07342;
    border-radius: 5px;
}

</style>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>
	<div class="container">
	<div class="contents">
		<h1>결제 확인</h1>
		
		<div id="orderInfo">
			<p>수취인 정보</p>
			<div id="write">
				<div>
					<p>이름 : </p>
					<input type="text" name="name" id="name" disabled>
					<div id="infoCheck">
						<input type="checkbox" id="before" checked>
						<label for="before">기존의 정보로 배송</label>
					</div>
				</div>
				<div>
					<p>휴대폰번호 : </p>
					<input type="tel" name="phone" id="phone" disabled>
				</div>
				<div>
					<p>주소 : </p>
					<div id="address">
						<input type="text" name="addr" id="addr">
						<input type="text" name="addr" id="addr">
						<input type="text" name="addr" id="addr">
					</div>
					<button>검색</button>
				</div>
			</div>
		</div> <!-- orderInfo -->
		
		<div id="goodsInfo">
			<p>상품 정보</p>
			
			<div id="goodsContents">
				<img src="<%= request.getContextPath() %>/img/bag1.jpg">
				<div id="goodsTitle">
					<label>상품 명 : </label>
					<label>브랜드 명 : </label>
					<label>모델 명 : </label>
				</div>
				
				<div id="goodsTitle">
					<input type="text" disabled>
					<input type="text" disabled>
					<input type="text" disabled>
				</div>
			</div>
		</div> <!-- goodsInfo -->
		
		<div id="buyInfo">
			<p>결제 정보</p>
			<table>
				<tr>
					<td><label>낙찰가 : </label></td>
					<td><input type="text" disabled></td>
				</tr>
				
				<tr>
					<td><label>낙찰 수수료 : </label></td>
					<td><input type="text" disabled></td>
				</tr>
			</table>
			<div id="endPrice">
				<label>총 결제 금액 : </label>
				<input type="text" disabled>
			</div>
		</div> <!-- buyInfo End -->
		
		<div id="end">
			<input type="checkbox" id="agree">
			<label for="agree">주문하는 상품 및 주문정보, 결제방식을 모두 확인하였으며 이에 동의합니다 (필수)</label>
		</div>
		<button id="payment">결제하기</button>
		</div> <!-- contents End -->
	</div> <!-- container End -->
	<%@ include file="../common/footer.jsp" %>
	
	<script type="text/javascript">
		
		// if(before.checked == false) {
		// 	name.value="";
		// }
		$(function() {
			var IMP = window.IMP; // 생략가능
			IMP.init('imp39236513'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트', // 감정결제 : MT1, 낙찰결제 : MT3
			    amount : 100,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456',
			    m_redirect_url : 'http://localhost:8043/lp/views/myPage/buy/winningBid.jsp'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        const impId = '고유ID : ' + rsp.imp_uid;
			        const merId = '상점 거래ID : ' + rsp.merchant_uid;
			        const amount = '결제 금액 : ' + rsp.paid_amount;
			        const applyNum = '카드 승인번호 : ' + rsp.apply_num;
			        const method = '결제 수단 : ' + rsp.pay_method;
			        const status = '상태 : ' + rsp.status;
			        
			        console.log(impId);
			        console.log(merId);
			        console.log(amount);
			        console.log(applyNum);
			        console.log(method);
			        console.log(status);
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			});
		});

	</script>
</body>
</html>	