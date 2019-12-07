<%--
/**
 * <pre>
 * @Author      : gurwns
 * @CreateDate  : 2019. 11. 30. 오후 3:43:30
 * @ModifyDate  : 2019. 11. 30. 오후 3:43:30
 * @fileName    : registerInfo.jsp
 * @Description : 회원가입 정보 입력 페이지
 * </pre>
 */
--%>
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

	#idCheck, #emailSend, #emailCheck {
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
                        <select name="memberEmail2" id="userEmail2">
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="hanmail.net">hanmail.net</option>
                            <option value="nate.com">nate.com</option>
                        </select>
                        <input type="button" id="emailSend" value="인증번호 전송"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>이메일 인증번호</label>
                    </td>
                    <td>
                        <input type="text" name="" id="emailCerti" size="26">
                        <input type="hidden" id="emailCheckResult" value="false"/>
                        <input type="button" id="emailCheck" value="확인"/>
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
    		let regId = /^[a-z]+[a-z0-9]{5,19}$/g; // ID 정규식
    		if(id === ""){
    			alert("아이디를 입력해주세요!");
    		} else if(!regId.test($("input[name=memberId]").val())) {
                alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
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
        					$("#userId").attr("readonly", true);
        					$("#idCheck").val("확인완료").attr("disabled", true).css({"background":"lightgray", "color":"black"});
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
    		
    		// 정규식
    		let regId = /^[a-z]+[a-z0-9]{5,19}$/g;	 					// ID
    		let regName  = /^[가-힣]{2,4}$/; 			 					// 이름
    		let regPwd = /^[A-Za-z0-9]{6,12}$/; 	 					// 비밀번호
    		let regPhone1 = /^[0-9]{3}$/; 		 					// 핸드폰번호 첫번째 -> 3글자도 존재
    		let regPhone2 = /^[0-9]{4}$/;   		 					// 핸드폰번호 두번째 -> 반드시 4글자
    		let regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

    		
    		// 바로가입하기 누를 시 걸림
            
    		
            var memberName = $("#userName").val();
    		if(memberName === "" || !regName.test(memberName)){
    			alert("이름을 확인해주세요!");
    			return false;
    		} else {
    			var check = $("#resultCheck").val();
    			var memberId = $("#userId").val();
    			if(!regId.test(memberId) || check === "false"){
    				alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
    				return false;
    			} else {
    				var pwd1 = $("#userPwd").val();
    				var pwd2 = $("#pwdCheck").val();
    				if(!regPwd.test(pwd1) || pwd1 === "" || pwd2 === ""){
    					alert("비밀번호를 입력해주세요");
    					return false;
    				} else if(pwd1 !== pwd2){
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
    							var emailCheck = $("#emailCheckResult").val();
    							if(emailCheck === "false") {
    								alert("이메일을 확인해주시고 인증까지 해주세요");
    								return false;
    							} else {
    								$("#form1").attr("action","<%= request.getContextPath() %>/insertMember.me");
    							}
    						}
    					}
    				}
    			}
    		}
    	}
    	
    	$("#emailSend").click(function(){
    		var memberEmail1 = $("#userEmail").val();
    		var memberEmail2 = $("#userEmail2").val();
    		var memberEmail = memberEmail1 + "@" + memberEmail2;
    		var memberId = $("#userId").val();
    		var idCheck = $("#resultCheck").val();
    		let regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    		
    		if(memberEmail1 === ""){
    			alert("이메일을 입력하세요");
    			return false;
    		} else if(memberId === "" || idCheck === "false"){
    			alert("아이디를 입력하세요");
    			return false;
    		} else if(!regEmail.test(memberEmail)) {
    			console.log(!regEmail.test(memberEmail));
    			console.log(memberEmail);
    			alert("올바른 형식의 이메일을 작성해주세요");
    		} else {
    			$.ajax({
    				url: "<%= request.getContextPath() %>/sendEmail.me",
    				type: "post",
    				data: {
    					memberId: memberId,
    					memberEmail1: memberEmail1,
    					memberEmail2: memberEmail2
    				},
    				success: function(data){
    					if(data === "true"){
    						alert("이메일을 보냈습니다.");
    						$("#userEmail").attr("disabled", true);
    						$("#userEmail2").attr("disabled", true);
    						$("#emailSend").val("전송완료").attr("disabled", true).css({"background":"lightgray", "color":"black"});
    					}else if(data === "false"){
    						alert("이메일을 못보냈습니다.");
    					} else {
    						alert("에러가 발생했습니다.");
    					}
    				},
    				error: function(data){
    					console.log("ajax 실패");
    				}
    			});
    		}
    	});
    	
    	$("#emailCheck").click(function(){
    		var code = $("#emailCerti").val();
    		var memberId = $("#userId").val();
    		$.ajax({
    			url: "<%= request.getContextPath() %>/checkEmailCode.me",
    			type: "post",
    			data: {
    				id: memberId,
    				code: code
    			},
    			success: function(data){
    				if(data === "true"){
    					$("#emailCerti").attr("disabled", true);
    					$("#emailCheck").val("인증완료").attr("disabled", true).css({"background":"lightgray", "color":"black"});
    					$("#emailCheckResult").val("true");
    				} else if(data === "false"){
    					alert("다시 확인하세요");
    				} else {
    					alert("알 수 없는 오류가 발생했습니다.");
    				}
    			},
    			error: function(data){
    				console.log(data);
    			}
    		});
    	});
    </script>
</body>
</html>