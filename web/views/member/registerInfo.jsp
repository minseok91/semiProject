<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>LauXion</title>
<style type="text/css">
	* {
    	padding: 0;
    	margin: 0;
    	vertical-align: middle;
    	white-space: nowrap;
    	font-family: 'Nanum Myeongjo', serif;
	}

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
		font-family: sans-serif;
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

	#userPhone1 {
		width: 75px;
	/* Chrome에서만 적용되는 select text-align: center */
		text-align-last: center;
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
    <section>
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
                        <input type="text" name="memberId" id="userId" size="26">
                        <input type="button" id="idCheck" value="중복확인"/>
                        <input type="hidden" id="resultCheck" value="false" />
                        <div id="result">중복확인 버튼을 눌러주세요.</div>
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
                        <input type="text" name="memberEmail1" id="userEmail" size="10"> @
                        <select name="memberEmail2">
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="hanmail.net">hanmail.net</option>
                            <option value="nate.com">nate.com</option>
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
            <div class="end">
                <input type="reset" value="취소">
                <input type="submit" id="registerBtn" value="가입하기">
            </div>
            
        </form>
    </section>
    <br><br><br><br>
    <%@ include file="../common/footer.jsp" %>
    <script>
    	$("#idCheck").click(function(){
    		var id = $("#userId").val();
    		if(id === ""){
    			alert("아이디를 입력해주세요!");
    		} else {
    			$.ajax({
        			url: "<%= request.getContextPath() %>/idCheck.me",
        			type: "post",
        			data: {
        				id:id
        			},
        			success: function(data){
        				//console.log("ajax 테스트 성공");
        				if(data === "true"){
        					$("#result").text("사용 가능한 아이디입니다.").css({"color":"green"});
        					$("#resultCheck").val("true");
        					console.log($("#resultCheck").val());
        				} else if(data === "false"){
        					$("#result").text("사용 할 수 없는 아이디입니다.").css({"color":"red"});
        					$("#resultCheck").val("false");
        					console.log($("#resultCheck").val());
        				}else{
        					$("#result").text("다시 시도해주세요").css({"color":"red"});
        					$("#resultCheck").val("false");
        					console.log($("#resultCheck").val());
        				}
        				
        			},
        			error: function(data){
        				console.log("ajax 테스트 실패");
        			}
        		});
    		}
    	});
    	
    	function checkAll(){
    		var memberName = $("#userName").val();
    		if(memberName === ""){
    			alert("이름을 확인해주세요!");
    			return false;
    		} else {
    			var check = $("#resultCheck").val();
    			if(check === "false"){
    				alert("아이디를 확인해주세요");
    				return false;
    			} else {
    				var pwd1 = $("#userPwd").val();
    				var pwd2 = $("#pwdCheck").val();
    				if(pwd1 === "" || pwd2 === ""){
    					alert("비밀번호를 입력해주세요");
    					return false;
    				} else if(pwd1 !== pwd2){
    					alert("비밀번호를 확인해주세요");
    					return false;
    				} else {
    					$("#form1").attr("action","<%= request.getContextPath() %>/insertMember.me");
    				}
    			}
    		}
    	}
    </script>
</body>
</html>