<%@ page language="java" 
    pageEncoding="UTF-8"
    import="com.kh.lp.member.model.vo.*"%>
<%
	Member loginMember = (Member) session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	html, body {
		padding: 0;
		margin: 0;
		width: 100%;
	}
	#header {
		background: rgb(33, 31, 34);
		position: relative;
		width: 100%;
		height: 110px;
	}
	#header_box {
		margin-left: auto;
		margin-right: auto;
		background: rgb(33, 31, 34);
		position: relative;
		width: 1080px;
		height: 100%;
	}
	#bottom {
		position: relative;
		width: 100%;
	}
	#header_box > ul {
		list-style: none;
		margin-bottom: 0;
		margin-top: 0;
		margin-left: auto;
		margin-right: auto;
		padding: 0;
		width: 791px;
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
		position: absolute;
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
	#appraisal > li:hover {
		color: white;
	}
	#notice {
		margin-bottom: 0;
		margin-top: 0;
		list-style: none;
	}
	#notice > li{
		float: left;
		display: none;
		color: #e2ceb8;
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
		color: #e2ceb8;
		padding-top: 30px;
		padding-right: 40px;
	}
	#shipment {
		margin-bottom: 0;
		margin-top: 0;
		list-style: none;
	}
	#shipment > li{
		float: left;
		display: none;
		color: #e2ceb8;
		padding-top: 30px;
		padding-right: 40px;
	}
	#shipment > li:hover{
		color: white;
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
	color: white;
	}
	#notice > li:hover {
	color: white;
	/* text-decoration: underline; */
	}
	#header_box > ul > li > a {
		color: #e2ceb8;
	}
	#notice, #usermit, #appraisal , #shipment {
		width: fit-content;
		margin: 0 auto;
	}
	#usermit > li:hover {
	color: white;
	}
</style>
</head>
	<div id="header">
		<div id="header_box">
			<ul>
				<li id="mainPage" class="cursor">메인 화면</li>
				<li id="memberInfo">회원 정보</li>
				<li id="goods_li">상품 관리</li>
				<li id="auctionManagement">경매 관리</li>
				<li id="shipManagement">배송 관리</li>
				<li id="">매출 관리</li>
				<li id="boardManagement">게시판 관리</li>
				<li id="inquiryAndReport">문의 및 신고</li>
			</ul>
		</div>  <!-- header_box end -->
	</div>  <!-- header end -->
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
			<ul id="shipment">
				<li id="shipment_yet" class="cursor">운송장 정보 입력</li>
				<li id="shipment_list" class="cursor">배송 목록</li>
			</ul>
		</div>  <!-- bottom_box end -->
	</div>  <!-- bottom end -->
	
	<script>
	$(function(){
		$(document).mouseover(function(e){
			//		console.log(e.target.innerText);
			if( e.target.innerText == "회원 정보" || e.target.innerText == "게시판 관리" || e.target.innerText == "상품 관리" || e.target.innerText == "배송 관리"){
				if(e.target.innerText == "회원 정보"){
					$("#usermit > li").show(0);
					$("#notice > li").hide(0);
					$("#appraisal > li").hide(0);
					$("#shipment > li").hide(0);
					
				} else if(e.target.innerText == "게시판 관리") {
					$("#usermit > li").hide(0);
					$("#notice > li").show(0);
					$("#appraisal > li").hide(0);
					$("#shipment > li").hide(0);
				} else if(e.target.innerText == "상품 관리"){
					$("#usermit > li").hide(0);
					$("#notice > li").hide(0);
					$("#appraisal > li").show(0);
					$("#shipment > li").hide(0);
				} else if(e.target.innerText == "배송 관리"){
					$("#usermit > li").hide(0);
					$("#notice > li").hide(0);
					$("#appraisal > li").hide(0);
					$("#shipment > li").show(0);
				}
				$("#bottom").stop().animate({height:'70'},150);
				$("#bottom_div").stop().animate({height:'70'},150);
			} else if(e.target.localName == "body"){
				$("#bottom").stop().animate({height:'5'},150);
				$("#bottom_div").stop().animate({height:'5'},150);
				$("#notice >li").delay(100).hide(0);
				$("#usermit >li").delay(100).hide(0);
				$("#appraisal >li").delay(100).hide(0);
				$("#shipment > li").delay(100).hide(0);
			}
		});
	});
	
	$("#mainPage").click(function(){
		location.href="<%= request.getContextPath()%>/select.ma";
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
	$("#appraisal_com").click(function(){
		location.href="<%= request.getContextPath()%>/selectAll.app";
	})
	$("#inquiryAndReport").click(function(){
		location.href="<%= request.getContextPath()%>/QNASelect.qr";
	})
	$("#goods_li").click(function(){
		location.href="<%= request.getContextPath()%>/selectAll.it";
	})
	$("#userInfo").click(function(){
		location.href="<%= request.getContextPath()%>/memberInfo.me";
	})
	$("#blackList").click(function(){
		location.href="<%=request.getContextPath()%>/blackList.me";
	})
	$("#auctionManagement").click(function(){
		location.href="<%=request.getContextPath()%>/selectAll.au";
	})
	$("#memberInfo").click(function(){
		location.href="<%= request.getContextPath()%>/memberInfo.me";
	})
	$("#shipment_yet").click(function(){
		location.href="<%=request.getContextPath()%>/selectAll.sm";
	})
	$("#shipManagement").click(function() {
		location.href="<%=request.getContextPath()%>/selectAll.sm";
	})
	$("#shipment_list").click(function(){
		location.href="<%=request.getContextPath()%>/selectAll.sh";
	})
	$("#boardManagement").click(function() {
		location.href="<%= request.getContextPath()%>/selectAll.bo";
	})
 	$("li").mouseover(function(){
		$("li").css('cursor','pointer');
	});
	</script>
</html>