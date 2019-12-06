<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<style>
	#main{
		text-align:center;
		height:250px;
		width: 1080px;
		margin-left: auto;
		margin-right: auto;
		margin-top:100px;
		margin-bottom: 100px;
	}
	#contents{
		height:250px;
		width:700px;
		display:inline-block;
	}
	#main>#contents>#loginbox{
		border-top:1px solid #211f22;
		border-bottom:1px solid #211f22;
		height:200px;
		width:700px;
		display:inline-block;
		
	}
	#main>#contents>#loginbox>#login{
		float:left;
		height:200px;
		width:50%;
		display:inline-block;
		text-align:center;
		padding-top: 60px;
	}
	#main>#contents>#loginbox>#find{
		float:right;
		height:200px;
		width:49%;
		display:inline-block;
		text-align:center;
		padding-top: 60px;
	}
	#main>#contents>#loginbox>#table1{
		font-size:13px;
		padding:15px;	
		width:320px;
		display:inline-block;
		padding-top:66px;
		padding-left:28px;
	}
	
	#main>#contents>#loginbox>#table1>tbody>tr>td:first-child {
		text-align:left;
		padding-right:10px;
	}
	#main>#contents>#table1>tbody>tr>td:nth-child(2) {
		text-align:left;
		padding-right:10px;
	}
	#main>#contents>#table1>tbody>tr>td {
	}
	#main>#contents>#table2{
	font-size:13px;
		padding:13px;	
		margin:10%;
		width:290px;
		margin-left:28px;
				margin-top:40px;
	}
	#main>#contents>#table2 > * {
		margin:10px;
	}
	#main>#contents>#table2>tbody>tr>td:first-child {
		text-align:left;
		margin-right:10px;
	}
	
	#main>#contents>#line{
		opacity:0.1;
		margin-top:10px;
		margin-bottom:30px;
		float:left;
		height:170px;
 		border:1px solid black; 
	}
	
	#btn_login{
		width:5px;
		height:5px;
	}
	.btn {
		border:1px solid #a07342;
		background:#211f22;
		color:#e2ceb8;
	}
	.login{
		width:70px;
		height:50px;
		border-radius:5px;
		font-size:11px;
	}
	.find{
		width:115px;
		height:25px;
		border-radius:5px;
		float:right;
		font-size:11px;
	}
</style>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>
	<div id="main">
		<div id="contents">
			<h5 style="float:left; margin-left:10px;">회원 로그인</h5>
			<div id="loginbox">
				<div id="login">
					<form action="<%= request.getContextPath() %>/login.me" method="post">
					<table id="table1" border="1"><!--  border="1"> -->
						<tr> 
							<td id="head">아이디</td>
							<td><input type="text" name="memberId"></td>
							<td rowspan="2" ><button class="btn login" type="submit">로그인</button></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="memberPwd"></td>
						</tr>
					</table>
					</form>
				</div>  <!-- login end -->
				<div id="line"></div>  <!-- line end -->
				<div id="find">
					<table id="table2"> 
						<tr> 
							<td>회원   아이디를   잊으셨나요?</td>
							<td></td>
							<td><button class="btn find" onclick="findId()">아이디 찾기</button></td>
						</tr>
						<tr>
							<td>비밀번호를  잊으셨나요?</td>
							<td></td>
							<td><button class="btn find">비밀번호 찾기</button></td>
						</tr>
						<tr>
							<td>아직  회원이  아니신가요?</td>
							<td></td>
							<td><button class="btn find" onclick="register()">회원가입</button></td>
						</tr>
					</table>
				</div>  <!-- find end -->
			</div>  <!-- loginbox end -->
		</div>  <!-- contents end -->
	</div>  <!-- main end -->
	<script>
		function findId(){
			location.href="<%= request.getContextPath()%>/views/member/findId.jsp";
		};
		function findPassword(){};
		function register(){
			location.href="<%= request.getContextPath()%>/views/member/registerAgreement.jsp";
		};
	</script>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>