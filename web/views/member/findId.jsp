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
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<style>
	#main{
		text-align:center;
		height:500px;
		width: 1080px;
		margin-left: auto;
		margin-right: auto;
		margin-top:100px;
		margin-bottom: 100px;
	}
	#contents{
		height:500px;
		width:700px;
		display:inline-block;
	}
	#main>#contents>#findIdArea{
		border-top:1px solid #211f22;
		border-bottom:1px solid #211f22;
		height:300px;
		width:700px;
		display:inline-block;
		
	}
	#main>#contents>#findIdArea>#form1{
		margin-top: 30px;
	}
	

	#main>#contents>#findIdArea>#form1>#table1{
		font-size:14px;
		width:500px;
		border-collapse: separate;
    	border-spacing: 0 10px;
	}
	
	#main>#contents>#findIdArea>#form1>#table1>tbody>tr>td:first-child {
		text-align:left;
		padding-right:10px;
	}
	#main>#contents>#form1>#table1>tbody>tr>td:nth-child(2) {
		text-align:left;
		padding-right:10px;
	}
	
	#main>#contents>#line{
		opacity:0.1;
		margin-top:10px;
		margin-bottom:30px;
		float:left;
		height:170px;
 		border:1px solid black; 
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
		height:32px;
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
			<h3 style="float:left; margin-left:10px;">아이디 찾기</h3>
			<div id="findIdArea" align="center">
					<div id="form1">
					<br /><h4 align="center">가입하신 회원의 이름과 이메일 주소를 입력해주세요</h4><br /><br />
					<table id="table1" ><!--  border="1"> -->
						<tr>
							<td><label for="">이름 : </label></td>
							<td><input type="text" id="memberName"/></td>
						</tr>
						<tr>
							<td><label for="">이메일 : </label></td>
							<td><input type="email" id="memberEmail"/></td>
						</tr>
					</table>
					</div>
				<div id="line"></div>  <!-- line end -->
			</div>  <!-- findIdArea end -->
			
			<div>
			<br />
				<input type="button" value="찾기" class="btn find" onclick="findId()"/>
			</div>
		</div>  <!-- contents end -->
	</div>  <!-- main end -->
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
	</script>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>