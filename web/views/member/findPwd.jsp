<%--
/**
 * <pre>
 * @Author      : gurwns
 * @CreateDate  : 2019. 12. 6. 오전 4:23:22
 * @ModifyDate  : 2019. 12. 6. 오전 4:23:22
 * @fileName    : findPwd.jsp
 * @Description : 비밀번호 찾기 페이지
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LauXion</title>
<!-- favicon불러오는 링크 -->
<link rel="shortcut icon" href="<%= request.getContextPath() %>/img/favicon.ico" type="image/x-icon"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	.container {
		width: 1080px;
		margin: 0 auto;
		paading: 6px 0px 0;
	}
	.contents{
		height:650px;
		width:inherit;
	}
	#findPwdArea{
		border-top:1px solid #211f22;
		border-bottom:1px solid #211f22;
		height:400px;
		width:inherit;
		display:inline-block;
	}
	#findTableArea{
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
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>
	<div class="container">
		<div class="contents">
			<br /><br /><br /><br />
			<h3 style="float:left; margin-left:10px;">비밀번호 찾기</h3>
			<div id="findPwdArea">
				<br /><h4 align="center">가입하신 회원의 아이디와 이름 그리고 이메일 주소를 입력해주세요</h4><br /><br />
				<table id="findTableArea" align="center"><!--  border="1"> -->
					<tr>
						<td><label for="">아이디 : </label></td>
						<td><input type="text" id="memberId"/></td>
					</tr>
					<tr>
						<td><label for="">이름 : </label></td>
						<td><input type="text" id="memberName"/></td>
					</tr>
					<tr>
						<td><label for="">이메일 : </label></td>
						<td><input type="email" id="memberEmail"/></td>
					</tr>
				</table>
			</div>  <!-- findPwdArea end -->
			<div id="btnArea" align="right">
				<br />
				<button type="button" class="btn" onclick="findPwd()">찾기</button>
				<button type="button" class="btn" onclick="findId()">아이디 찾기</button>
				<button type="button" class="btn" onclick="goHome()">메인으로 돌아가기</button>
			</div>  <!-- btnArea end -->
		</div>  <!-- contents end -->
	</div>  <!-- container end -->
	<%@ include file="../common/footer.jsp" %>
	<script>
		function findPwd(){
			var memberId = $("#memberId").val();
			var memberName = $("#memberName").val();
			var memberEmail = $("#memberEmail").val();
			console.log(memberId);
			console.log(memberName);
			console.log(memberEmail);
			if(memberId === "") {
				alert("아이디를 입력해주세요");
			} else {
				if(memberName === "") {
					alert("이름을 입력해주세요");
				} else {
					if(memberEmail === "") {
						alert("이메일을 입력해주세요");
					} else {
						$.ajax({
							url: "<%= request.getContextPath() %>/findPwd.me",
							type: "post",
							data: {
								memberId: memberId,
								memberName: memberName,
								memberEmail: memberEmail
							},
							success: function(data){
								if(data === "false"){
									alert("입력하신 회원의 정보가 존재하지 않습니다.");
								} else {
									location.href="<%= request.getContextPath() %>/views/member/checkPwdCode.jsp?memberId=" 
											+ memberId + "&memberName=" + memberName + "&memberEmail=" + memberEmail;
								}
							},
							error: function(data){
								console.log("ajax실패");
							}
						});
					}
				}
			}
		};
		function findId(){
			location.href="<%= request.getContextPath() %>/views/member/findId.jsp";
		};
		function goHome(){
			location.href="<%= request.getContextPath() %>/index.jsp";
		};
	</script>
</body>
</html>