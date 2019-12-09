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
<title></title>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
    	font-size: 20px;
	}

	td>select {
		font-family: sans-serif;
   		font-size: 15px;
    	padding: 5px;
    	width: 125px;
    	height: 40px;
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
				<dd><a id=selectMenu value="buy/wishList">▶   위시리스트</a></dd>
				<dd><a value="buy/biddingList">▶   입찰리스트</a></dd>
				<dd><a value="buy/winningList">▶   낙찰리스트</a></dd>
				
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
				<p>회원님께서 찜하신 상품 리스트를 볼 수 있는 공간입니다.</p>
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
                        <input type="text" name="memberName" id="userName" size="26">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>아이디</label>
                    </td>
                    <td>
                        <input type="text" name="memberId" id="userId" size="26" disabled>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>비밀번호</label>
                    </td>
                    <td style="text-align: center;">
                        <input type="button" name="memberPwd" id="userPwd" size="26" value="비밀번호 변경">
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <label>휴대폰번호</label>
                    </td>
                    <td>
                        <select name="memberPhone1" id="userPhone1">
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="016">016</option>
                            <option value="019">019</option>
                        </select>-
                        <input type="tel" name="memberPhone2" id="userPhone2" size="5" maxlength="4">-
                        <input type="tel" name="memberPhone3" id="userPhone3" size="5" maxlength="4">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>주소</label>
                    </td>
                    <td>
                        <input type="text" name="memberAddress" id="userAddr" size="26">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>이메일</label>
                    </td>
                    <td>
                        <input type="text" name="memberEmail1" id="userEmail" size="26" disabled> 
                </tr>
            </table>
            <div class="end">
                <input type="submit" id="registerBtn" value="가입하기">
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
		});
	</script>
</body>
</html>