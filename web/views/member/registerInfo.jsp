<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LauXion</title>
<!-- favicon불러오는 링크 -->
<link rel="shortcut icon" href="<%= request.getContextPath() %>/img/favicon.ico" type="image/x-icon"/>
<style>
	* {
   		padding: 0;
    	margin: 0;
    	vertical-align: middle;
    	white-space: nowrap;
    	font-family: 'Nanum Myeongjo', serif;
	}

/*   ȸ������ �κ�    */

	#Register {
    	position: relative;
    	left: 50%;
    	transform: translateX(-50%);
    	font-weight: 600; 
    	width: 72.5%;
    	margin-top: 50px;
    	padding-left: 1%;
    	padding-bottom: 0.3%;
    	border-bottom: 1px solid #3e2d1a;
	}

	#Register, #Register>#road, #Register>#arrow {
    	color: rgba(32, 45, 26, .45);
    	font-family: 'Nanum Myeongjo', serif;
    	font-size: 17px;
	}

	#Register>#road {
    	margin-left: 55%;
	}

	#Register>#road>.arrow {
    	padding: 0px 28px;
	}

	#Register, .road:nth-of-type(3), .arrow     {
    	color: #3e2d1a;
	}

/* ���� �Է� */
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

	#idCheck {
		background: #a07342;
		border-radius: 5px;
		margin-left: 7px;
		font-size: 13px;
		padding: 7px;
		color: #211f22;
	}

	td>select {
		font-family: sans-serif;
    	font-size: 15px;
    	padding: 5px;
    	width: 125px;
    	height: 40px;
	}

	option {
		font-family: sans-serif;
	}

	.gender {
		margin-left: 20px;
	}

	#male {
		margin-right: 50px;
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

	input[type=submit] {
    	color: #a07342;
    	border: 1px solid #a07342;
    	background-color: #211f24;
	}

	input[type=reset] {
    	border: 1px solid #a07342;
    	background-color: #d9d9d9;
	}

	@media(min-width: 1600px) {
    	#Register {
        	width: 70%;
    	}

    	#Register>#road {
        	margin-left: 61.7%;
    	}

    	#Register>#road>.arrow {
        	padding: 0px 28px;
    	}
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>
    <section class="container">
        <div id="Register">
            회원가입 
            <span id="road">
                <span class="road">
                    약관동의
                </span>
                <span class="arrow">
                    >
                </span>
                <span class="road">
                    정보입력
                </span>
                <span class="arrow">
                    >
                </span>
                <span class="road">
                    가입완료
                </span>
            </span> 
        </div>

        <form action="<%= request.getContextPath() %>/insertMember.me" method="post" onsubmit="return checkAll()">
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
                        <input type="text" name="memberId" id="userId" size="26">
                        <input type="button" id="idCheck" value="중복확인">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>비밀번호</label>
                    </td>
                    <td>
                        <input type="password" name="memberPwd" id="userPwd" size="26">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>비밀번호 확인</label>
                    </td>
                    <td>
                        <input type="password" id="pwdCheck" size="26">
                    </td>
                </tr>
                <tr>
                	<td><label>성별</label></td>
                	<td>
                		<span class="gender">
                            <label for="male">남성</label>
                            <input type="radio" name="memberGender" id="male" value="M">

                            <label for="female">여성</label>
                            <input type="radio" name="memberGender" id="female" value="F">
                        </span>
                	</td>
                </tr>
                <tr>
                    <td>
                        <label>휴대폰번호</label>
                    </td>
                    <td>
                        <input type="tel" name="memberPhone1" id="userPhone1" size="3" maxlength="3"> -
                        <input type="tel" name="memberPhone2" id="userPhone2" size="5" maxlength="4"> -
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
                        <input type="text" name="memberEmail1" id="userEmail" size="10"> @
                        <select name="memberEmail2">
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>이메일 인증번호</label>
                    </td>
                    <td>
                        <input type="text" name="" id="emailCerti" size="26">
                    </td>
                </tr>
            </table>
            <div class="end" align="center">
             	<input type="submit" value="가입하기">	
                <input type="reset" value="취소">
            </div>
        </form>
    </section>
    <br><br><br><br>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>