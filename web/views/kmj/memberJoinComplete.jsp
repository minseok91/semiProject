<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--
/**
 * <pre>
 * @Author      : ${김민주}
 * @CreateDate  : ${12.04} ${7:00}
 * @ModifyDate  : ${date} ${time}
 * @fileName    : memberJoinComplete.jsp
 * @Description : 회원가입이 완료된 후 나타나는 페이지
 * </pre>
 */
--%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		font-family:'Nanum Myeongjo', serif;
	}
	#line1{
		width:1125px;
		border:solid 0.5px black;
		margin-top:80px;
	}
	#line2{
		width:1125px;
		border:solid 0.35px black;
		margin-bottom:80px;
	}
	#join{
		position:absolute;
		left:100px;
		top:200px;
		font-weight:bold;
	}
	#agreement{
		position:absolute;
		left:920px;
		top:200px;
		font-weight:bold;
	}
	#next{
		position:absolute;
		left:1000px;
		top:200px;
		font-weight:bold;
		color:#a07342;
	}
	#infoinsert{
		position:absolute;
		left:1030px;
		top:200px;
		font-weight:bold;
	}
	#next2{
		position:absolute;
		left:1110px;
		top:200px;
		font-weight:bold;
		color:#a07342;
	}
	#JoinComplete{
		position:absolute;
		left:1140px;
		top:200px;
		font-weight:bold;
	}
	#memberJoinComplete{
		font-weight:bold;
		width:1300px;
		height:100px;
		text-align:center;
		padding-top:20px;
	}
	#loginBtn{
		position:absolute;
		left:550px;
		top:300px;
		background:#211f22;
		border-radius:8px;
		color:#a07342;
	}
	#homeBtn{
		position:absolute;
		left:610px;
		top:300px;
		border-radius:8px;
	}
</style>
</head>
<body>
	<%@include file="/views/common/header.jsp" %>
	<%@include file="/views/common/nav.jsp" %>
	<h5 id="join">회원가입</h5>
	<h5 id="agreement">약관동의 </h5>
	<h5 id="next">></h5>
	<h5 id="infoinsert">정보입력</h5>
	<h5 id="next2">></h5>
	<h5 id="JoinComplete">가입완료</h5>
	<hr id="line1">
	<div id="memberJoinComplete">
		럭션 회원가입 신청이 정상적으로 처리되었습니다.<br><br><br>
		<button id="loginBtn">로그인</button><button id="homeBtn">홈으로 가기</button>
	</div>
	<hr id="line2">
	
	<%@include file="/views/common/footer.jsp" %>
</body>
</html>