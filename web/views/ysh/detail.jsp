<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LauXion</title>
<style>
	#container {
		width: 1080px;
		margin: 75px auto;
		border: 1px solid black;
	}
	
	#part1 {
		display: flex;
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
		color: #c20808;
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
	
	.contents {
		width: 100%;
	}
	
	.contents>#head {
		border-bottom: 1px solid #3e2d1a;
	}
	
	.contents>#head>label:nth-of-type(1) {
		font-family: 'Nanum Myeongjo', serif;
		font-size: 20px;
		margin: 0;
	}
	
	.contents>#head>label:nth-of-type(2) {
		margin-bottom: 0;
    	margin-left: 249px;
		font-family: 'Nanum Myeongjo', serif;
		font-size: 15px;
		font-weight: lighter;
		color: #cca071;
		background: #211f24;
		border: 1px solid #a07342;
		padding: 3px 7px;
	}
	
	#price>label:nth-of-type(1) {
		color: #3e2d1a;
		border-left: 5px solid #3e2d1a;
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>
	<section>
		<div id="container">
			<!-- 사진, 상품명, 입찰가, 등록칸 -->
			<span id="part1">
				<span class="imgBox">
					<div class="title">
						<a id="wish" href="#">♡</a>
						<a id="biddingList">입찰내역</a>
						<img src="../../img/bag1.jpg" alt="이미지가 없습니다.">
					</div>
					<div id="detailImg">
						<table>
							<tr>
								<td>
									<img alt="" src="../../img/bag1.jpg">
								</td>
								<td>
									<img alt="" src="../../img/bag1.jpg">
								</td>
								<td>
									<img alt="" src="../../img/bag1.jpg">
								</td>
								<td>
									<img alt="" src="../../img/bag1.jpg">
								</td>
							</tr>
							<tr>
								<td>
									<img alt="" src="../../img/bag1.jpg">
								</td>
								<td>
									<img alt="" src="../../img/bag1.jpg">
								</td>
								<td>
									<img alt="" src="../../img/bag1.jpg">
								</td>
								<td>
									<img alt="" src="../../img/bag1.jpg">
								</td>
							</tr>
						</table>
					</div> <!-- detailImg End -->
				</span> <!-- imgBox End -->
				<span class="contents">
					<div id="head">
						<label>구찌 GG마몽 미니 토트겸 숄더백 (442622)</label>
						<label>판매자 아이디</label>
					</div>
					
					<div id="price">
						<label>현재 가격</label>
					</div>
				</span> <!-- contents End -->
			</span> <!-- part1 End -->

			<!-- 상품 상세정보(from 관리자), 상품정보 테이블형태 -->
			<div id="part2">
			
			</div> <!-- part2 End -->
		</div> <!-- container End -->
	</section>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>