<%--
/**
 * <pre>
 * @Author      : gurwns
 * @CreateDate  : 2019. 12. 05. 오후 9:43:30
 * @ModifyDate  : 2019. 12. 06. 오전 3:43:26
 * @fileName    : findId.jsp
 * @Description : 아이디 찾기 페이지
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

</head>
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
	#findArea{
		border-top:1px solid #211f22;
		border-bottom:1px solid #211f22;
		height:300px;
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
	.login{
		width:70px;
		height:50px;
		border-radius:5px;
		font-size:11px;
	}
</style>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>
	<div class="container">
		<div class="contents">
		<br /><br /><br /><br />
			<h3 style="float:left; margin-left:10px;">아이디 찾기</h3>
			<div id="findArea">
				<br /><h4 align="center">가입하신 회원의 이름과 이메일 주소를 입력해주세요</h4><br /><br />
				<table id="findTableArea" align="center"><!--  border="1"> -->
					<tr>
						<td><label for="">이름 : </label></td>
						<td><input type="text" id="memberName"/></td>
					</tr>
					<tr>
						<td><label for="">이메일 : </label></td>
						<td><input type="email" id="memberEmail"/></td>
					</tr>
				</table>
			</div>  <!-- findArea end -->
			<div id="btnArea" align="right">
				<br />
				<button type="button" class="btn" onclick="findId()">아이디 찾기</button>
				<button type="button" class="btn" onclick="goHome()">메인으로 돌아가기</button>
			</div>  <!-- btnArea end -->
		</div>  <!-- contents end -->
	</div>  <!-- container end -->
	<script>
		function findId(){
			var memberName = $("#memberName").val();
			var memberEmail = $("#memberEmail").val();
			if(memberName === "" || memberEmail === ""){
				alert("아이디 또는 이메일을 입력해주세요");
			} else {
				$.ajax({
					url: "<%= request.getContextPath() %>/findId.me",
					type: "post",
					data: {
						memberName: memberName,
						memberEmail: memberEmail
					},
					success: function(data){
						if(data === "false") {
							alert("입력하신 정보의 회원이 존재하지 않습니다.");
						} else {
							console.log(data);
							location.href="<%= request.getContextPath() %>/views/member/findIdResult.jsp?memberId=" + data;
						}
					},
					error: function(data){
						console.log("ajax실패");
					}
				});
			}
		};
		
		function goHome(){
			location.href="<%= request.getContextPath() %>/index.jsp";
		};
	</script>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>