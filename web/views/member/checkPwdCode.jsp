<%--
/**
 * <pre>
 * @Author      : gurwns
 * @CreateDate  : 2019. 12. 6. 오후 6:16:19
 * @ModifyDate  : 2019. 12. 6. 오후 6:16:19
 * @fileName    : checkPwdCode.jsp
 * @Description : 패스워드 이메일 체크코드 페이지
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
		padding: 6px 0px 0;
	}
	.contents{
		height:650px;
		width:inherit;
	}
	#emailCheckArea{
		border-top:1px solid #211f22;
		border-bottom:1px solid #211f22;
		height:300px;
		width:inherit;
		display:inline-block;
	}
	#checkTableArea{
		border-collapse: separate;
    	border-spacing: 0 25px;
	}
	td:nth-child(3){
		width: 100px;
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
			<div id="emailCheckArea">
			<br /><h4 align="center">입력하신 이메일로 인증번호를 보냈습니다.</h4><br /><br />
				<table id="checkTableArea" align="center"><!--  border="1"> -->
				<tr>
					<td><label for="">인증번호 : </label></td>
					<td><input type="text" id="code" name="code"/></td>
					<td align="right"><button class="btn" type="button" id="checkBtn">인증하기</button></td>
				</tr>
			</table>
			</div>  <!-- emailCheckArea end -->
		</div>  <!-- contents end -->
	</div>  <!-- container end -->
	<%@ include file="../common/footer.jsp" %>
	<script>
		$("#checkBtn").click(function(){
			var memberId = "<%= request.getParameter("memberId") %>";
			var memberName = "<%= request.getParameter("memberName") %>";
			var memberEmail = "<%= request.getParameter("memberEmail") %>";
			console.log(memberId);
			$.ajax({
				url: "<%= request.getContextPath() %>/checkPwdCode.me",
				type: "post",
				data: {
					code: $("#code").val(),
					memberId: memberId,
					memberName: memberName,
					memberEmail: memberEmail
				},
				success: function(data){
					if(data === "true"){
						location.href="<%= request.getContextPath() %>/views/member/updatePassword.jsp?memberId=" 
							+ memberId + "&memberName=" + memberName + "&memberEmail=" + memberEmail;
					} else {
						alert("인증번호를 다시 입력해주세요");
					}
				},
				error: function(data){
					console.log("실패");
				}
			});
		});
	</script>
</body>
</html>