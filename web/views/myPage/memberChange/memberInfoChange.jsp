<%--
/**
 * <pre>
 * @Author      : Kewon
 * @CreateDate  : 2019. 12. 7. 오후 9:36:51
 * @ModifyDate  : 2019. 12. 7. 오후 9:36:51
 * @fileName    : memberInfoChange
 * @Description : 마이페이지에서 비밀번호입력 후 본격적으로 정보를 변경하는 페이지
 * </pre>
 */
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>LauXion</title>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	.container {
		margin: 0 auto;
		padding-bottom: 10px;
	}
	.container>#myPageMenu{
		width: 210px;
		height: 1080px;
		border-right: 2px solid black;
		display: inline-block;
		float: left;
	}
	.container>#myPageMenu>dl>dt {
		font-size: 1.5em;
		font-family: 'Nanum Myeongjo', serif;
		margin-top: 50px;
		margin-bottom: 10px;
	}
	.container>#myPageMenu>dl>dd {
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
	
	.container>#myPageMenu>dl>dd>a{
		color: darkgray;
		text-decoration: none;
	}
	.container>#myPageMenu>dl>dd>#selectMenu{
		font-size: 1em;
		font-weight: bold;
		color: black;
		text-decoration: underline;
	}
	.container>#myPageMenu>dl>dd>a:hover{
		font-size: 1em;
		font-weight: bold;
		color: black;
		text-decoration: underline;
	}
	.container>.menuStatus{
		width: 920px;
		height: 110px;
		display: inline-block;
		margin-left: 10px;
	}
	.container>.menuStatus>.status1>h3{
		margin-top:10px;
	}
	.container>.menuStatus>.status2{
		width: 920px;
		height: 54px;
		background-color: lightgray;
		vertical-align: middle;
	}
	.container>.menuStatus>.status2>p{
		padding-top: 16px;
		padding-left: 30px;
		font-size: 17px;
	}
	.container>.contentArea{
		width: 920px;
		height: 970px;
		display: inline-block;
		margin-left: 10px;
		
	}
	
	/* --------------------------- */
	
	form>table {
    	position: relative;
    	left: 50%;
    	transform: translateX(-50%);
    	border-collapse: separate;
    	border-spacing: 0 25px;
    	border-bottom: 1px solid #3e2d1a;
    	padding: 30px 19%;
	}
	td>input, select {
    	border: none;
    	box-shadow: 0px 0px 5px 0px rgba(33,31,34,0.45);
	}
	label {
    	margin: 5px;
    	font-family: sans-serif;
    	font-size: 15px;
    	margin-right: 25px;
	}
	td>input {
		font-family: sans-serif;
		padding: 5px;
    	font-size: 14px;
	}
	td>select {
		font-family: sans-serif;
   		font-size: 15px;
    	padding: 5px;
    	width: 125px;
    	height: 30px;
	}
	#userPhone1 {
		width: 75px;
	/* Chrome에서만 적용되는 select text-align: center */
		text-align-last: center;
	}
	option {
		font-family: sans-serif;
	}
	.end {
    	position: relative;
    	margin-bottom: 50px;
    	float: right;
    	left: -13.4%;
	}
	.end>input {
    	border-radius: 3px;
    	font-size: 15px;
    	width: 110px;
    	padding: 8px 0;
    	margin: 20px 10px;
	}
	input[type=submit], input[type=button] {
    	color: #a07342;
    	border: 1px solid #a07342;
    	background-color: #211f24;
	}
	
</style>
</head>
<body>
	<%@ include file="../../common/header.jsp" %>
	<%@ include file="../../common/nav.jsp" %>
	<div class="container">
		<div id="myPageMenu">
			<h3 id="h3" align="center">마이페이지</h3>
			<dl>
				<dt>§  구매정보</dt>
				<dd><a value="buy/wishList">▶   위시리스트</a></dd>
				<dd><a value="buy/biddingList">▶   입찰리스트</a></dd>
				<dd><a value="buy/winningBid">▶   낙찰리스트</a></dd>
				
				<dt>§  판매정보</dt>
				<dd><a value="sale/productAppRequest">▶  상품감정 신청</a></dd>
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
				<dd><a value="memberChange/userInfoChange" id="selectMenu">▶  회원정보 변경</a></dd>
				<dd><a value="memberChange/userDelete">▶  회원 탈퇴</a></dd>
				
			</dl>
		</div>  <!-- myPageMenu end -->
		<div class="menuStatus">
			<div class="status1">
				<h3>&nbsp;&nbsp;<&nbsp;위시리스트 &nbsp;>&nbsp;</h3>
			</div>  <!-- status1 end -->
			<div class="status2">
				<p>회원님의 정보를 수정하는 공간입니다. 비밀번호 공백이면 변경되지 않습니다.</p>
			</div>  <!-- status2 end -->
		</div>  <!-- menuStatus end -->
		<div class="contentArea">
		<form action="" id="form1" method="post" onsubmit="return checkAll()">
            <table>
                <tr>
                    <td>
                        <label>이름</label>
                    </td>
                    <td>
                        <input type="text" name="memberName" id="userName" size="30" value="<%= loginMember.getMemberName() %>">
                        <input type="hidden" name="memberNo" value="<%= loginMember.getMemberNo() %>">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>아이디</label>
                    </td>
                    <td>
                        <input type="text" name="memberId" id="userId" size="30" value="<%= loginMember.getMemberId() %>" readonly>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>비밀번호</label>
                    </td>
                    <td style="text-align: center;">
                        <input type="password" name="memberPwd" id="userPwd" size="30">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>비밀번호 확인</label>
                    </td>
                    <td style="text-align: center;">
                        <input type="password" name="memberPwd2" id="userPwd2" size="30">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>휴대폰번호</label>
                    </td>
                    <td>
                    <%
                    	String[] srr = loginMember.getMemberPhone().split("-");
                    	
                    %>
                        <select name="memberPhone1" id="userPhone1">
                            <option id="010" value="010">010</option>
                            <option id="011" value="011">011</option>
                            <option id="016" value="016">016</option>
                            <option id="019" value="019">019</option>
                        </select> - 
                        <input type="tel" name="memberPhone2" id="userPhone2" size="5" maxlength="4" value="<%= srr[1] %>"> - 
                        <input type="tel" name="memberPhone3" id="userPhone3" size="5" maxlength="4" value="<%= srr[2] %>">
                    </td>
                </tr>
                <tr>
                <%
                	String[] addr = loginMember.getMemberAddress().split("/");
                %>
                    <td>
                        <label>우편번호</label>
                    </td>
                    <td>
                        <input type="text" name="memberZoneCode" id="userAddr1" size="8" value="<%= addr[0] %>" readonly placeholder="우편번호">
                        &nbsp;&nbsp;
                        <input type="button" id="addrBtn" onclick="daumPostCode()" value="주소 찾기"/>
                    </td>
                </tr>
                <tr>
                	<td><label for="">기본주소</label></td>
                	<td><input type="text" name="memberAddress1" id="userAddr2" size="30" value="<%= addr[1] %>" readonly placeholder="기본주소"></td>
                </tr>
                <tr>
                	<td><label for="">상세주소</label></td>
                	<td><input type="text" name="memberAddress2" id="userAddr3" size="30" value="<%= addr[2] %>" placeholder="상세주소"></td>
                </tr>
                <tr>
                    <td>
                        <label>이메일</label>
                    </td>
                    <td>
                        <input type="text" name="memberEmail1" id="userEmail" size="30" value="<%= loginMember.getMemberEmail() %>" readonly> 
                </tr>
            </table>
            <div class="end">
                <input type="submit" id="registerBtn" value="수정하기">
            </div>
            
        </form>
		</div>  <!-- contentArea end -->
	</div>  <!-- container end -->
	<%@ include file="../../common/footer.jsp" %>

	<script>
		$(function() {
			$('a').click(function() {
				let values=$(this).attr('value');
				console.log(values);
				location.href='<%= request.getContextPath() %>/views/myPage/'+values+'.jsp';
			})
			
			var phone1 = "<%= srr[0] %>";
			if(phone1 === "010"){
				$("#010").prop("selected", true);
			} else if(phone1 === "011"){
				$("#011").prop("selected", true);
			} else if(phone1 === "016"){
				$("#016").prop("selected", true);
			} else if(phone1 === "019"){
				$("#019").prop("selected", true);
			}
		});
		
		function checkAll(){   		
    		// 정규식
    		let regName  = /^[가-힣]{2,4}$/; 			 												// 이름
    		let regPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,12}$/; 	 	// 비밀번호
    		let regPhone1 = /^[0-9]{3}$/; 		 													// 핸드폰번호 첫번째 -> 3글자도 존재
    		let regPhone2 = /^[0-9]{4}$/;   		 												// 핸드폰번호 두번째 -> 반드시 4글자
            var memberName = $("#userName").val();
    		if(memberName === "" || !regName.test(memberName)){
    			alert("이름을 확인해주세요!");
    			return false;
    		} else {
    			var pwd1 = $("#userPwd").val();
				var pwd2 = $("#userPwd2").val();
				console.log(pwd1);
				console.log(pwd2);
    			if(!regPwd.test(pwd1) && pwd1 !== "" && pwd2 !== ""){
					alert("숫자, 영문자, 특수문자를 1개이상 포함해서 6~12글자로 작성해야합니다.");
					return false;
				} else if(pwd1 != pwd2){
					alert("비밀번호를 확인해주세요");
					return false;
				} else {
					var phone1 = $("#userPhone1").val();
					var phone2 = $("#userPhone2").val();
					var phone3 = $("#userPhone3").val();
					
					if(!regPhone1.test(phone1) || !regPhone2.test(phone2) || !regPhone2.test(phone3) || phone1 === "" || phone2 === "" || phone3 === ""){
						alert("휴대폰 번호를 확인해주세요");
						return false;
					} else {
						var address = $("#userAddr").val();
						if(address === ""){
							alert("주소를 확인해주세요");
							return false;
						} else {
							if($("#userPwd").val() === ""){
								alert("비밀번호 공백입니다.");
								$("#form1").attr("action", "<%= request.getContextPath() %>/updateMemberNP.me");
							} else{
								alert("비밀번호 공백이 아닙니다.");
								$("#form1").attr("action", "<%= request.getContextPath() %>/updateMember.me");
							}
						}
					}
				}
    		}
    	}
		function daumPostCode(){
    		new daum.Postcode({
    	        oncomplete: function(data) {
					//팝업에서 검색 결과 눌렀을 때 실행할 코드
    				
    				var fullRoadAddr = data.roadAddress; //도로명 주소 변수
    				var extraRoadAddr = '';				 //도로명 조합형 주소 변수
    				
    				//법정동명이 있을 경우 추가(법정리 제외)
    				//법정동의 경우 마지막 문자가 "동/로/가로 끝남"
    				if(data.bname !== '' && /[동/로/가]$/g.test(data.bname)){
    					extraRoadAddr += data.bname;
    				}
    				//건물명이 있고 공동주택일 경우
    				if(data.buildingName !== '' && data.apartment === 'Y'){
    					extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.build);
    				}
    				//도로명, 지번 조합형 주소일 경우
    				if(extraRoadAddr !== ''){
    					extraRoadAddr = ' (' + extraRoadAddr + ')';
    				}
    				//도로명, 지번 주소의 유무에 따라 해당 조합형 주소 추가
    				if(fullRoadAddr !== ''){
    					fullRoadAddr += extraRoadAddr;
    				}
    				$("#userAddr1").val(data.zonecode);
    				$("#userAddr2").val(fullRoadAddr);
    				$("#userAddr3").val("").focus();
    				
    	        }
    	    }).open();
    	};
	</script>
</body>
</html>