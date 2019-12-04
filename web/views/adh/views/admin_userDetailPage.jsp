<%--
/**
 * <pre>
 * @Author      : 안동환
 * @CreateDate  : 2019. 12. 4. 오후 7:54:07
 * @ModifyDate  : 2019. 12. 4. 오후 7:54:07
 * @fileName    : admin_userDetailPage
 * @Description :
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="32x32" href="image/loginimg(2).png">
<link rel="stylesheet" type="text/css" href="css/admin_userDetailPage.css">
<meta content="text/html;">
<style>
	html, body {
	padding: 0;
	margin: 0;
	width: 100%;
	height: 100%;
}
#container {
	width: 1080px;
	height: 800px;
	margin-left: auto;
	margin-right: auto;
}
#container_Box {
	width: 100%;
	height: 90%;
	margin-top: 10%;
	
}
#infoBox {
	width: 90%;
	height: 100%;
	margin: 0 auto;
}
#infoTable {
	margin-top: 56px;
	margin-left: 38%;	
	width: 45%;
	border-collapse: collapse;
}
#infoTable  td{
	height: 60px;
}
td:nth-of-type(1) {
	font-weight: bold;
	color: #404040;
}
td:nth-of-type(2) {
	color: #000000;
}
#infoBox > h3{
	text-align: center;
}
#buttonBox {
	margin-top: 30px;
	width: 73.03px;
	margin-left: auto;
	margin-right: auto;
}
#buttonBox button {
	background: rgb(33, 31, 34);
	border: 1px solid rgb(33, 31, 34);
	color: rgb(160, 115, 66);
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>회원정보 관리 상세</title>
</head>
<body>
	<%@ include file="headerPage.jsp" %>
	<div id="container">
		<div id="container_Box">
			<div id="infoBox">
			<h3>김민석님의 회원정보</h3>
				<table id="infoTable">
					<tr>
						<td>아이디</td>
						<td>kms1234</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>김민석</td>
					</tr>
					<tr>
						<td>번호</td>
						<td>010-5959-1919</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>경기도 성남시 어딘가</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>kms1234@naver.com</td>
					</tr>
					<tr>
						<td>판매상품이력</td>
						<td id="salesHistory">3건</td>
					</tr>
					<tr>
						<td>구매상품이력</td>
						<td id="purchaseHistory">3건</td>
					</tr>
				</table>
				<div id="buttonBox">
						<button>뒤로 가기</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$("#salesHistory").click(function(){
			location.href = "admin_mainPage.jsp";
		})
		$("#purchaseHistory").click(function(){
			location.href = "admin_mainPage.jsp";
		})
		$("#buttonBox > button").click(function(){
			location.href = "admin_userInformation.jsp"
		})
	</script>
</body>
</html>