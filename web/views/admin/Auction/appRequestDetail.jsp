<%--
/**
 * <pre>
 * @Author      : minseok
 * @CreateDate  : Dec 5, 2019 4:15:10 PM
 * @ModifyDate  : Dec 5, 2019 4:15:10 PM
 * @fileName    : AucResultFail.jsp
 * @Description : 경매결과낙찰
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.lp.item.model.vo.*, com.kh.lp.common.*"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>LauXion</title>
	<style>
		.container {
			width: 1080px;
			margin-left: auto;
			margin-right: auto;
			
		}
		.contents {
			width: 100%;
			height: 730px;
			margin-top: 5%;
			border: 1px solid;
			border-radius: 10px; 
			
		}
		.contentsArea {
			margin-left: 20px;
			margin-right: 20px;
		}
		#part1Area {
			width:inherit;
			height: 365px;
		}
		#part1Area>#part1ImgArea {
			display: inline-block;
			height: inherit;
			width: 360px;
			float: left;
			border-top: 3px double black;
			border-right: 3px double #CCCCCC;
			border-left: 1px solid #CCCCCC;
			border-bottom: 3px double black;
		}
		#part1Area>#part1ImgArea>#tableImgArea {
			height: inherit;
			width: inherit;
		}
		#part1Area>#part1ImgArea>#tableImgArea>#tableImgBodyArea>tr>td>img {
			height: 284px;
			width: 350px;
		}
		#part1Area>#part1InfoArea {
			display: inline-block;
			height: inherit;
			width: 664px;
			border-top: 3px double black;
			border-left: 3px double #CCCCCC;
			border-right: 1px solid #CCCCCC;
			border-bottom: 3px double black;
			float: left;
		}
		#part2Area {
			width:inherit;
			height: 365px;
		}
		
		#part1 {
			display: flex;
			margin-bottom: 50px;
		}
		
		.title>img {
			border: 1px solid #d9d9d9;
			width: 330px;
			height: 330px;
			margin-left: 10px;
		}
		
		#wish {
			position: absolute;
			font-size: 3rem;
			border: none;
			color: yellow;
			padding: 0;
			font-weight: lighter;
			transform: translateX(0%);
			margin-left: 10px;
		}
		
		#biddingList {
			position: absolute;
			font-family: 'Nanum Myeongjo', serif;
			color: #cca071;
			background: #211f24;
			border: 1px solid #a07342;
			margin-left: 270px;
			padding: 3px 7px;
			border-radius: 2px;
		}
		
		#detailImg>table {
			margin-top: 20px;
			border-collapse: separate;
			border-spacing: 10px;
		}
		
		#detailImg>table>tbody>tr>td>img {
			border: 1px solid #d9d9d9;
			width: 75px;
			height: 75px;
		}
		
		#contents {
			width: 100%;
			display: inline;
			margin-left: 75px;
		}
		
		#contents>#head {
			border-bottom: 1px solid #3e2d1a;
		}
		
		#contents>#head>label {
			font-family: 'Nanum Myeongjo', serif;
			font-size: 20px;
			margin: 0;
		}
		
		/* 최고입찰가와 입찰가 입력 컨테이너를 묶음 */
		#set {
			display: flex;
		}
		
		#price {
			margin-top: 50px;
			display: grid;
		}
		
		#price>label:nth-of-type(1) {
			font-size: 20px;
			color: #3e2d1a;
			border-left: 5px solid #3e2d1a;
			margin-top: 50px;
			padding-left: 10px;
		}
		
		#price>label:nth-of-type(2) {
			font-size: 3.5rem;
			font-weight: 100;
		}
		
		#biddingUsers {
			position: relative;
			margin-top: 59px;
		}
		
		#biddingUsers>table>tbody>tr>th {
			background: #f2f2f2;
		}
		
		#biddingUsers>table>tbody>tr>th:nth-of-type(1) {
			width: 150px;
		}
		
		#biddingUsers>table>tbody>tr>th:nth-of-type(2) {
			width: 200px;
		}
		
		#biddingUsers>table>tbody>tr>th:nth-of-type(3) {
			width: 100px;
		}
		
		#biddingUsers>table>tbody>tr>th, #biddingUsers>table>tbody>tr>td {
			border: 1px solid #d9d9d9;
			padding: 5px;
			font-size: 15px;
			text-align: center;
		}
		
		#biddingApply {
			margin-top: 100px;
			margin-left: 68px;
		}
		
		#biddingApply>form>label {
			font-size: 20px;
			color: #3e2d1a;
			border-left: 5px solid #3e2d1a;
			padding-left: 10px;
		}
		
		#biddingApply>form>input[type="text"] {
			font-size: 2rem;
			font-weight: 100;
			border: none;
			box-shadow: 0px 0px 5px 0px rgba(33, 31, 34, 0.45);
			padding: 3px;
			padding-right: 7px;
			margin: 7px;
			text-align: right;
		}
		
		#biddingApply>form>input[type="submit"] {
			font-size: 2rem;
			color: #cca071;
			background: #211f24;
			border: 1px solid #a07342;
			padding: 3px;
			width: 75px;
			border-radius: 3px;
		}
		
		#biddingApply>label {
			font-size: 1.7rem;
			margin-left: 7px;
			color: #ff0000;
		}
		
		#part2 {
			display: flex;
			margin: 50px 0;
			margin-left: -94px;
			padding-bottom: 50px;
			justify-content: center;
			border-bottom: 1px solid #3e2d1a;
		}
		
		#part2 label {
			font-size: 20px;
			color: #3e2d1a;
			border-left: 5px solid #3e2d1a;
			padding-left: 10px;
			margin-bottom: 10px;
		}
		
		#detailContent>pre {
			text-align: left;
			white-space: pre-wrap;
			width: 342px;
			background: none;
		}
		
		.goods {
			margin-left: 90px;
		}
		
		.goods>table>tbody>tr>td {
			border: 1px solid #d9d9d9;
			padding: 10px;
		}
		
		.goods>table>tbody>tr>td:nth-of-type(1) {
			background: #f2f2f2;
		}
		
		#aucResult {
			color: brown;
		}
		
		#dealResult {
			color: green;
		}
		/* The Modal (background) */
		.modal {
			display: none; /* Hidden by default */
			position: fixed; /* Stay in place */
			z-index: 1; /* Sit on top */
			left: 0;
			top: 0;
			width: 100%; /* Full width */
			height: 100%; /* Full height */
			overflow: auto; /* Enable scroll if needed */
			background-color: rgb(0, 0, 0); /* Fallback color */
			background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
		}
		
		/* Modal Content/Box */
		.modal-content {
			background-color: #fefefe;
			margin: 15% auto; /* 15% from the top and centered */
			padding: 20px;
			border: 1px solid #888;
			width: 50%; /* Could be more or less, depending on screen size */
		}
		
		#rejContent {
			display: none;
		}
		
		.center {
			text-align: center;
		}
		
		.bagDetail {
			display: none;
		}
	</style>
</head>
<body>
	<%@ include file="../common/headerPage.jsp" %>
	<div class="container">
		<div class="contents">
			<div class="contentsArea">
				<!-- 사진, 상품명, 입찰가, 등록칸 -->
				<div id="part1Area">
					<div id="part1ImgArea">
						<table id="tableImgArea">
							<tbody id="tableImgBodyArea">
								<tr>
									<td><h3 align="center">감정 신청한 상품의 사진</h3></td>
								</tr>
								<tr>
									<td><img src="<%= request.getContextPath() %>/img/userItemPic/2019121720423183607.png" alt="" /></td>
								</tr>
							</tbody>  <!-- tableImgBodyArea end -->
						</table>  <!-- tableImgArea end -->
					</div>  <!-- part1ImgArea end -->
					<div id="part1InfoArea">
						<table id="tableInfoArea" border="1">
							<tbody id=tableInfoBodyArea>
								<tr>
									<td>상품명 : </td>
									<td>상품명이 들어가는 공간입니다.</td>
								</tr>
								<tr>
									<td>판매자 : </td>
									<td>판매자 아이디 또는 이름이 들어가는 공간입니다.</td>
								</tr>
								<tr>
									<td>구입 시기 :</td>
									<td>구입 시기가 들어가는 공간입니다.</td>
								</tr>
								<tr>
									<td>감정 신청 접수일 : </td>
									<td>감정 신청 접수일이 들어가는 공간입니다.</td>
								</tr>
								<tr>
									<td>보증서 유무 : </td>
									<td>보증서의 유무가 들어가는 공간입니다.</td>
								</tr>
								<tr>
									<td>배송 받은 날짜 : </td>
									<td>배송 받은 날짜가 들어가는 공간입니다.</td>
								</tr>
								<tr>
									<td>처리 기한 : </td>
									<td>감정신청 처리기한이 들어가는 공간입니다.</td>
								</tr>
							</tbody>
						</table>  <!-- tableInfoArea end -->
					</div>  <!-- part1InfoArea end -->
				</div>  <!-- part1Area end -->
				<div id="part2Area">
				
				</div>  <!-- part2Area end -->
			</div>
		</div>  <!-- contents end -->
	</div> <!-- container End -->
	
	
	<!--  -->
	
	
	
	
	
	
</body>
</html>