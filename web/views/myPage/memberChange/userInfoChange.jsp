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

.container>#myPageMenu {
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

#h3 {
	font-family: 'Nanum Myeongjo', serif;
	background-color: #211f22;
	padding-top: 7px;
	padding-bottom: 7px;
	color: #a07342;
	margin-top: 0px;
}

.container>#myPageMenu>dl>dd>a {
	color: darkgray;
	text-decoration: none;
}

.container>#myPageMenu>dl>dd>#selectMenu {
	font-size: 1em;
	font-weight: bold;
	color: black;
	text-decoration: underline;
}

.container>#myPageMenu>dl>dd>a:hover {
	font-size: 1em;
	font-weight: bold;
	color: black;
	text-decoration: underline;
}

.container>.menuStatus {
	width: 920px;
	display: inline-block;
	margin-left: 10px;
	border-bottom: 1px solid #000;
}

.container>.menuStatus>.status2 {
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

.contentArea {
	position: relative;
	width: auto;
	margin-top: 75px;
	left: 2%;
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
	<div class="container">
		<div id="myPageMenu">
			<h3 id="h3" align="center">마이페이지</h3>
			<dl>
				<dt>§  구매정보</dt>
				<dd><a href="">▶   위시리스트</a></dd>
				<dd><a href="" id=selectMenu>▶   입찰리스트</a></dd>
				<dd><a href="">▶   낙찰리스트</a></dd>
				
				<dt>§  판매정보</dt>
				<dd><a href="">▶  상품감정 신청</a></dd>
				<dd><a href="">▶  등록상품 관리</a></dd>
				<dd><a href="">▶  경매 진행 상품 관리</a></dd>
				<dd><a href="">▶  경매 마감 상품 관리</a></dd>
				
				<dt>§  결제/배송조회</dt>
				<dd><a href="">▶  결제 내역</a></dd>
				<dd><a href="">▶  감정 상품 배송 조회</a></dd>
				<dd><a href="">▶  구매 상품 배송 조회</a></dd>
				
				<dt>§  메세지</dt>
				<dd><a href="">▶  전체 메세지</a></dd>
				<dd><a href="">▶  받은 메세지</a></dd>
				<dd><a href="">▶  보낸 메세지</a></dd>
				
				<dt>§  문의 및 신고</dt>
				<dd><a href="">▶  문의 내역</a></dd>
				<dd><a href="">▶  신고 내역</a></dd>
				
				<dt>§  회원정보</dt>
				<dd><a href="">▶  회원정보 변경</a></dd>
				<dd><a href="">▶  회원 탈퇴</a></dd>
				
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
			<div id="inputpassowrd">
				<p>본인 확인을 위해 비밀번호를 입력해주세요</p><br>
				<label>비밀번호</label><input type="text"><button>확인</button>
			</div>
		</div> <!-- menuStatus End -->
	</div> <!-- container End -->
 <%@ include file="../../common/footer.jsp" %>
</body>
</html>