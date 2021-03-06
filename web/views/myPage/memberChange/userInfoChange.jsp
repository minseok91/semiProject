<%--
/**
 * <pre>
 * @Author      : 안동환
 * @CreateDate  : 2019. 12. 6. 오후 9:31:31
 * @ModifyDate  : 2019. 12. 6. 오후 9:31:31
 * @fileName    : 회원정보 변경 비밀번호 입력 창
 * @Description :
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
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
.contentArea {
	width: 920px;
	height: 650px;
	display: inline-block;
	margin-left: 10px;
	border-bottom: 1px solid #000;
}
.contentArea>form>table {
    	border-collapse: separate;
    	border-spacing: 0 25px;
	}
td>input{
		font-family: sans-serif;
		padding: 5px;
    	font-size: 20px;
    	width: 300px;
    	border: none;
    	box-shadow: 0px 0px 5px 0px rgba(33,31,34,0.45);
	}
.status2 p {
	font-size: 17px;
}
	label{
		margin: 5px;
    	font-family: sans-serif;
    	font-size: 15px;
    	margin-right: 25px;
    	float: right;
	}
	.btn{
		border:1px solid #a07342;
		background:#211f22;
		color:#e2ceb8;
		height:32px;
		border-radius:5px;
		font-size:11px;
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
.contentArea>table>tbody>tr>th  {
	background: #f5efe7;
	border-top: 1px solid #3e2d1a;
}
#inputpassword {
	width: 300px;
	height: 300px;
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
				<dd><a value="delivery/sellDeli">▶  경매 상품 배송 조회</a></dd>
				
				<dt>§  문의 및 신고</dt>
				<dd><a value="../../qnaList.qr">▶  문의 내역</a></dd>
				<dd><a value="queAndReport/reportList">▶  신고 내역</a></dd>
				
				<dt>§  회원정보</dt>
				<dd><a id=selectMenu value="memberChange/userInfoChange">▶  회원정보 변경</a></dd>
				<dd><a value="memberChange/userDelete">▶  회원 탈퇴</a></dd>
				
			</dl>
		</div>  <!-- myPageMenu end -->
		<div class="menuStatus">
			<div class="status1">
				<h3>&nbsp;&nbsp;<&nbsp;회원정보 변경 &nbsp;>&nbsp;</h3>
			</div>  <!-- status1 end -->
			<div class="status2">
				<p>회원님의 정보를 열람 및 변경할 수 있는 공간입니다.</p>
			</div>  <!-- status2 end -->
		</div>  <!-- menuStatus end -->
		<div class="contentArea">
		<br /><br /><br /><br />
			<form action="" method="post" id="form1" onsubmit="return passwordCheck()">
				<h2 align="center">본인 확인을 위해 비밀번호를 입력해주세요</h2><br />
				<br /><br /><br /><br />
				<table align="center">
					<tr>
						<td><label for="">비밀번호 : </label></td>
						<td><input type="password" id="memberPwd" name="memberPwd" /></td>
						<td style="width: 80px;" align="right"><button class="btn" type="submit">확인</button></td>
					</tr>
				</table>
				<input type="hidden" name="memberNo" value="<%= loginMember.getMemberNo() %>" />
			</form>
		</div> <!-- contentArea End -->
		</div> <!-- contents End -->
	</div> <!-- container End -->
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
	
	function passwordCheck(){
		var memberPwd = $("#memberPwd").val();
		if(memberPwd === ""){
			alert("비밀번호를 입력해주세요");
		} else {
			$("#form1").attr("action", "<%= request.getContextPath() %>/passwordCheck.me?num=1");
		}
	}
</script>
</body>
</html>