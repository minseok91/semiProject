<%--
/**
 * <pre>
 * @Author      : gurwns
 * @CreateDate  : 2019. 12. 9. 오후 7:04:06
 * @ModifyDate  : 2019. 12. 9. 오후 7:04:06
 * @fileName    : 비밀번호 변경 페이지
 * @Description :
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
	#updateArea{
		border-top:1px solid #211f22;
		border-bottom:1px solid #211f22;
		height:400px;
		width:inherit;
		display:inline-block;
	}
	#updateTableArea{
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
		<form class="contents" method="post" action="" onsubmit="return updatePwd()">
		<br /><br /><br /><br />
		<h3 style="float:left; margin-left:10px;">비밀번호 변경</h3>
			<div id="updateArea">
				<br /><h4 align="center">새로운 비밀번호를 입력해주세요</h4><br /><br />
				<input type="hidden" value="<%= request.getParameter("memberId") %>" name="memberId"/>
				<input type="hidden" value="<%= request.getParameter("memberName") %>" name="memberName"/>
				<input type="hidden" value="<%= request.getParameter("memberEmail") %>" name="memberEmail"/>
				<table id="updateTableArea" align="center">
					<tr>
						<td><label for="">새 비밀번호 : </label></td>
						<td><input type="password" name="memberPwd" id="newPwd1"/></td>
					</tr>
					<tr>
						<td><label for="">비밀번호 확인 : </label></td>
						<td><input type="password" name="memberPwd2" id="newPwd2"/></td>
					</tr>
				</table>
			</div>  <!-- updateArea end -->
			<div id="btnArea" align="right">
			<br />
				<button class="btn" id="updateBtn">변경하기</button>
			</div>  <!-- btnArea end -->
		</form>  <!-- contents end -->
	</div>  <!-- container end -->
	<%@ include file="../common/footer.jsp" %>
	<script>
		
		
		function updatePwd(){
			var pwd1 = $("#newPwd1").val();
			var pwd2 = $("#newPwd2").val();
			let regPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,12}$/;  // 비밀번호 정규화
			
			console.log(pwd1);
			console.log(pwd2);
			if(!regPwd.test(pwd1)){
				console.log(regPwd.test(pwd1));
				console.log(pwd1);
				alert("비밀번호를 확인하세요");
				return false;
			} else {
				if(pwd1 !== pwd2){
					alert("비밀번호를 같게 입력하세요");
					return false;
				} else {
					$(".contents").attr("action", "<%= request.getContextPath()%>/updatePwd.me");
				}
			}
		}
	</script>
</body>
</html>