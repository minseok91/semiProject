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
	margin: 4% 7%;
}

#write>table {
	border-collapse: separate;
	border-spacing: 21px 5px;
	width: 540px;
	font-size: 16px;
}

#write>table input[type=text]

#infoCheck {
	margin-left: 7px;
    margin-top: 8px;
}

#goodsContents>img {
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

#buyInfo>table input, #endPrice>input, #write>table input {
	margin-left: 3%;
	height: 30px;
	border: none;
	box-shadow: 0px 0px 5px 0px rgba(33,31,34,0.45);
	background: none;
	margin-bottom: 20px;
}

#basicAddress {
	box-shadow: white;
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
	margin-left: -7%;
	vertical-align: bottom;
	text-align: left;
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%
		String[] addr = loginMember.getMemberAddress().split("/");
		String num = (String) request.getAttribute("num");
		String image = (String) request.getAttribute("image");
		String price = (String) request.getAttribute("price");
	%>
	<%@ include file="../common/nav.jsp" %>
	<% if(loginMember != null) { %>
	<div class="container">
	<div class="contents">
		<h1>결제 확인</h1>
		
		<div id="orderInfo">
			<p>수취인 정보</p>
			<div id="write">
			<table>
				<tr>
					<td>
						<p>이름 : </p>
					</td>
					<td>
						<input type="text" name="name" id="name" value="<%= loginMember.getMemberName() %>" disabled>
					</td>
				</tr>
				<tr>
					<td>
						<p>휴대폰번호 : </p>
					</td>
					<td>
						<input type="text" name="phone" id="phone" value="<%= loginMember.getMemberPhone() %>" disabled>
					</td>
				</tr>
				<tr>
					<td>
						<p>우편번호 : </p>
					</td>
					<td>
						<input type="text" name="memberZoneCode" id="userAddr1" size="8" value="<%= addr[0] %>" readonly placeholder="우편번호">
						<button id="addrBtn" onclick="daumPostCode()">주소 찾기</button>
						<input type="checkbox" id="basicAddress">
						<label for="basicAddress">기존의 주소로 배송</label>
					</td>
				</tr>
				<tr>
					<td>
						<p>기본주소 : </p>
					</td>
					<td>
						<input type="text" name="memberAddress1" id="userAddr2" size="30" value="<%= addr[1] %>" readonly placeholder="기본주소">
					</td>
				</tr>
				<tr>
					<td>
						<p>상세주소 : </p>
					</td>
					<td>
						<input type="text" name="memberAddress2" id="userAddr3" size="30" value="<%= addr[2] %>" placeholder="상세주소">
					</td>
				</tr>
			</table>
			</div>
		</div> <!-- orderInfo -->
		
		<div id="goodsInfo">
			<p>상품 정보</p>
			
			<div id="goodsContents">
				<img>
				<div id="goodsTitle">
					<label>경매 번호 : </label>
					<label>브랜드 명 : </label>
					<label>모델 명 : </label>
				</div>
				
				<div id="goodsTitle">
					<input type="text" id="aucNum" value="<%= num %>" disabled> <!-- AUCTION_ID -->
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
					<td><input type="text" id="win" value="<%= price %>" disabled></td>
				</tr>
				
				<tr>
					<td><label>낙찰 수수료 : </label></td>
					<td><input type="text" id="fees" disabled></td>
				</tr>
			</table>
			<div id="endPrice">
				<label>총 결제 금액 : </label>
				<input type="text" id="end" name="end" readonly>
			</div>
		</div> <!-- buyInfo End -->
		
		<div id="end">
			<input type="checkbox" id="agree">
			<label for="agree">주문하는 상품 및 주문정보, 결제방식을 모두 확인하였으며 이에 동의합니다 (필수)</label>
		</div>
		<button id="payment">결제하기</button>
		</div> <!-- contents End -->
	</div> <!-- container End -->
	
	<script type="text/javascript">
		$(function() {
			const win = Number($('#win').val());
			const end = win*1.15;
		
			$('#fees').val(win*0.15);
			$('#end').val(end);
			
			$('#basicAddress').attr('checked', 'true');

			var IMP = window.IMP; // 생략가능
			IMP.init('imp39236513'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			
			const img="<%= request.getContextPath() %>/img/appraisal/";
			const fullImage = img+"<%= image %>";
			
			$('#goodsContents>img').attr('src', fullImage);
			
		// 결제 버튼 누를 시 진행 동의안했으면 동의하게 함
		$('#payment').click(function() {
			if(document.getElementById('agree').checked) {
				IMP.request_pay({
					pg : 'inicis', // version 1.1.0부터 지원.
					pay_method : 'card',
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : 'MT3'+document.getElementById('aucNum').innerHTML, // 감정결제 : MT1, 낙찰결제 : MT3
					amount : end,
					buyer_email : '<%=loginMember.getMemberEmail()%>',
					buyer_name : '<%=loginMember.getMemberName()%>',
					buyer_tel : '<%=loginMember.getMemberPhone()%>',
					buyer_addr : $('#userAddr2').val(),
					buyer_postcode : $('#userAddr1').val(),
				}, function(rsp) {
					if ( rsp.success ) {
						var msg = '결제가 완료되었습니다.';
						const impId = rsp.imp_uid; // 고유ID
						const merId = rsp.merchant_uid; //상점 거래ID
						const amount = rsp.paid_amount; //결제 금액
						const applyNum = rsp.apply_num; //카드 승인번호
						const method = rsp.pay_method; //결제 수단
						const status = rsp.status; // 상태
						
						const URL = "<%=request.getContextPath()%>/test.t?impId="+ impId + "&merId="+merId+"&amount="+amount+"&status="+status;
						
						location.href=URL;
					} else {
						alert('결제가 취소되었습니다.');
					}
				});
			} else {
				alert('동의약관에 체크해주세요.');
			}
		});
			
		$('#basicAddress').click(function() {
			const chk = $(this).is(':checked');
			console.log(chk);
			
			if(chk) {
				$('userAddr1').val("<%= addr[0] %>");
				$('userAddr2').val("<%= addr[1] %>");
				$('userAddr3').val("<%= addr[2] %>");
			} else {
				$('userAddr1').val(' ');
				$('userAddr2').val(' ');
				$('userAddr3').val(' ');
			}
		}); 
	});

		function daumPostCode() {
			new daum.Postcode({
				oncomplete : function(data) {
					//팝업에서 검색 결과 눌렀을 때 실행할 코드

					var fullRoadAddr = data.roadAddress; //도로명 주소 변수
					var extraRoadAddr = ''; //도로명 조합형 주소 변수

					//법정동명이 있을 경우 추가(법정리 제외)
					//법정동의 경우 마지막 문자가 "동/로/가로 끝남"
					if (data.bname !== '' && /[동/로/가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					//건물명이 있고 공동주택일 경우
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.build);
					}
					//도로명, 지번 조합형 주소일 경우
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					//도로명, 지번 주소의 유무에 따라 해당 조합형 주소 추가
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}
					$("#userAddr1").val(data.zonecode);
					$("#userAddr2").val(fullRoadAddr);
					document.getElementById("userAddr3").focus();
				}
			}).open();
		};
		
		
	</script>
	<% } %>
		<%@ include file="../common/footer.jsp" %>
</body>
</html>	