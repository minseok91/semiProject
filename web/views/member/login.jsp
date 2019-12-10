<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LauXion</title>
<link rel="shortcut icon" href="<%= request.getContextPath() %>/img/favicon.ico" type="image/x-icon"/>
<style>
.container {
	margin: 0 auto;
	padding-bottom: 10px;
}

.contents{
	height:650px;
	width:inherit;
}

#house {
	position: relative;
	text-align: center;
    top: 50%;
    transform: translateY(-50%);
}

#house>h3 {
	text-align: left;
    border-bottom: 1px solid black;
    margin-left: 2%;
    padding-bottom: 6px;
}

#loginAndResearch {
	display: flex;
	margin: 51px 0;
}

#login {
	position: relative;
	left: 13%;
	width: 317px;
	margin-top: 2%;
}

#login>form {
	width: 317px;
}

#login table {
	border-collapse: separate;
    border-spacing: 10px 18px;
}

table input {
	border: none;
	box-shadow: 0px 0px 5px 0px rgba(33,31,34,0.45);
	padding: 3px;
	font-size: 17px;
	margin-left: 7px;
}

#login>form>table td {
	text-align: right;
}

input[type=submit] {
	position: absolute;
    left: 100%;
    top: 12%;
    height: 64%;
    width: 80px;
    color: #a07342;
    border: 1px solid #a07342;
    background-color: #211f24;
    border-radius: 3px;
}

#research {
	position: relative;
    left: 27%;
    margin-top: 7px;
    text-align: left;
    border-left: 3px solid #d9e2de;
    width: 47%;
    padding-left: 8%;
}

#research>div {
	margin-bottom: 18px;
}

#research button {
	margin-left: 29px;
	padding: 4px 13px;
	color: #a07342;
    border: 1px solid #a07342;
    background-color: #211f24;
    border-radius: 3px;
}

#research>div:nth-of-type(2)>button {
	margin-left: 34px;
}

#research>div:nth-of-type(3)>button {
	margin-left: 62px;
}

#underLine {
	position: relative;
    width: 99%;
    border-top: 1px solid #000;
    left: 2%;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>
	
	<div class="container">
		<div class="contents">
			<div id="house">
			<h3>회원 로그인</h3>
				<div id="loginAndResearch">
				<div id="login">
					<form action="<%=request.getContextPath()%>/login.me" method="post">
						<table>
							<tr>
								<td><label>아이디</label></td>
								<td><input type="text" name="memberId"></td>
							</tr>
							<tr>
								<td><label>비밀번호</label></td>
								<td><input type="password" name="memberPwd"></td>
							</tr>
						</table>
						
						<input type="submit" value="로그인">
					</form>
				</div> <!-- loginEnd -->

				<div id="research">
					<div>
						<label>회원 아이디를 잊으셨나요?</label>
						<button onclick="fintId()">아이디 찾기</button>
					</div>
					<div>
						<label>비밀번호를 잊으셨나요?</label>
						<button onclick="findPassword">비밀번호 찾기</button>
					</div>
					<div>
						<label>아직 회원이 아니신가요?</label>
						<button onclick="register">회원가입</button>
					</div>
				</div>  <!-- research End -->
				</div>  <!-- loginAndResearch End -->
				<div id="underLine"></div>
			</div>  <!-- house End -->
		</div>  <!-- contents End -->
	</div>  <!-- container End -->
	
	<script>
		function findId(){
			location.href="<%= request.getContextPath()%>/views/member/findId.jsp";
		};
		function findPassword(){
			location.href="<%= request.getContextPath() %>/views/member/findPwd.jsp";
		};
		function register(){
			location.href="<%= request.getContextPath()%>/views/member/registerAgreement.jsp";
		};
	</script>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>