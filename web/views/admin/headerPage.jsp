<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<style>
	#header {
		background: rgb(33, 31, 34);
		width: 100%;
		height: 70px;
	}
	#header_box {
		margin-left: auto;
		margin-right: auto;
		background: rgb(33, 31, 34);
		width: 1080px;
		height: 100%;
		position: relative;
	}
	#bottom {
		position: absolute;
		width: 100%;
	}
	#header_box > ul {
		list-style: none;
		margin-bottom: 0;
		margin-top: 0;
		margin-left: auto;
		margin-right: auto;
		padding: 0;
		width: 800px;
		height: 70px;
	}
	#header_box > ul > li{
		float: left;
		padding-top: 40px;
		text-align: center;
		padding-left:2%;
		padding-right:1%;
		color: #e2ceb8;
	}
	#bottom {
		width: 100%;
		height: 5px;
		background: rgb(160, 115, 66);
	}
	#bottom_box {
		width: 1080px;
		height: 100%;
		background: rgb(160, 115, 66);
	}
	#usermit {
		margin-bottom: 0;
		margin-top: 0;
		list-style: none;
		
	}
	#usermit > li {
		float: left;
		display: none;
		color: #e2ceb8;
		padding-top: 30px;
		padding-right: 40px;
	}
	#notice {
		margin-bottom: 0;
		margin-top: 0;
		list-style: none;
	}
	#notice > li{
		float: left;
		display: none;
		color: rgb(33, 31, 34);
		padding-top: 30px;
		padding-right: 40px;
	}
	#appraisal {
		margin-bottom: 0;
		margin-top: 0;
		list-style: none;
	}
	#appraisal > li{
		float: left;
		display: none;
		color: rgb(33, 31, 34);
		padding-top: 30px;
		padding-right: 40px;
	}
	#header_box > ul > li > a {
		text-decoration: none;
		color: rgb(33, 31, 34);
	}
	
	#bottom_box > ul > li > a {
		text-decoration: none;
		color: rgb(33, 31, 34);
	}
	#usermit > li > a:hover {
	color: #e2ceb8;
	text-decoration: underline;
	}
	#notice > li:hover {
	color: #e2ceb8;
	text-decoration: underline;
	}
	#header_box > ul > li > a {
		color: #e2ceb8;
	}
	#notice, #usermit, #appraisal{
		width: 301px;
		margin: 0 auto;
	}
</style>
<body>
	<div id="header">
		<div id="header_box">
			<ul>
				<li id="mainPage" class="cursor">메인 화면</li>
				<li class="cursor">회사 관리</li>
				<li>회원 정보</li>
				<li id="goods_li">상품 관리</li>
				<li>경매 관리</li>
				<li id="">매출 관리</li>
				<li>게시판 관리</li>
				<li id="inquiryAndReport">문의 및 신고</li>
			</ul>
		</div>
	</div>
	<div id="bottom">
		<div id="bottom_box">
			<ul id="usermit">
				<li id="userInfo" class="cursor">회원정보 관리</li>
				<li id="blackList" class="cursor">블랙리스트</li>
			</ul>
			<ul id="notice">
				<li id="notice_li" class="cursor">게시판 관리</li>
				<li id="FAQ" class="cursor">FAQ</li>
			</ul>
			<ul id="appraisal">
				<li id="appraisal_req" class="cursor">감정 신청 물품</li>
				<li id="appraisal_com" class="cursor">감정 완료 물품</li>
			</ul>
		</div>
	</div>
	<script>
	$(function(){
		$(document).mouseover(function(e){
			//		console.log(e.target.innerText);
			if( e.target.innerText == "회원 정보" || e.target.innerText == "게시판 관리" || e.target.innerText == "상품 관리"){
				if(e.target.innerText == "회원 정보"){
					$("#usermit > li").show(0);
					$("#notice > li").hide(0);
					$("#appraisal > li").hide(0);
					
				} else if(e.target.innerText == "게시판 관리") {
					$("#usermit > li").hide(0);
					$("#notice > li").show(0);
					$("#appraisal > li").hide(0);
				} else if(e.target.innerText == "상품 관리"){
					$("#usermit > li").hide(0);
					$("#notice > li").hide(0);
					$("#appraisal > li").show(0);
				}
				$("#bottom").stop().animate({height:'70'},150);
				$("#bottom_div").stop().animate({height:'70'},150);
			} else if(e.target.localName == "body"){
				$("#bottom").stop().animate({height:'5'},150);
				$("#bottom_div").stop().animate({height:'5'},150);
				$("#notice >li").delay(100).hide(0);
				$("#usermit >li").delay(100).hide(0);
				$("#appraisal >li").delay(100).hide(0);
			}
		});
	});
	
	$("#mainPage").click(function(){
		location.href="<%= request.getContextPath()%>/views/admin/admin_mainPage.jsp";
	})
	$("#notice_li").click(function(){
		location.href="<%= request.getContextPath()%>/selectAll.bo";
	})
	$("#FAQ").click(function(){
		location.href="<%= request.getContextPath()%>/selectFAQ.bo";
	})
	$("#appraisal_req").click(function(){
		location.href="<%= request.getContextPath()%>/selectAll.it";
	})
	
	$("#inquiryAndReport").click(function(){
		location.href="<%= request.getContextPath()%>/views/admin/admin_inquiryAndReport.jsp";
	})
	$("#goods_li").click(function(){
		location.href="<%= request.getContextPath()%>/views/admin/admin_appraisalProducts.jsp";
	})
	$("#userInfo").click(function(){
		location.href="<%= request.getContextPath()%>/memberInfo.me";
	})
	$("#blackList").click(function(){
		location.href="<%=request.getContextPath()%>/blackList.me";
	})
 	$(".cursor").mouseover(function(){
		$(".cursor").css('cursor','pointer');
	});
	</script>
	
</body>
</html>