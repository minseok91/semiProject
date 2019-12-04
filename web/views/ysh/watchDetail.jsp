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
		display: inline;
		margin-left: 75px;
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
    	margin-left: 22%;
		font-family: 'Nanum Myeongjo', serif;
		font-size: 15px;
		font-weight: lighter;
		text-align: center;
		color: #cca071;
		background: #211f24;
		border: 1px solid #a07342;
		padding: 3px 7px;
		width: 21%;
	}
	
	#biddingUsers, #seller {
		display: none;
	}
	
	@media(#head>label:nth-of-type(2):hover) {
		#seller {
			display: block;
		}
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
	
	#biddingApply {
		margin-top: 110px;
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
		box-shadow: 0px 0px 5px 0px rgba(33,31,34,0.45);
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
	
	#goods {
		margin-left: 90px;
	}

	#goods>table>tbody>tr>td {
		border: 1px solid #d9d9d9;
		padding: 10px;
	}
	
	#goods>table>tbody>tr>td:nth-of-type(1) {
		background: #f2f2f2;
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
						<!-- 사진 갯수에 따라서 조율가능 -->
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
						<label>판매자</label>
					</div>
					<div id="price">
						<label>현재 가격</label>
						<label>￦1,600,000</label>
					</div>
					<div id="biddingUsers">
						<table>
							<tr>
								<th>입찰자</th>
								<th>입찰 금액</th>
							</tr>
							<tr>
							
							</tr>
							<tr>
							
							</tr>
						</table>
					</div>
					
					<div id="seller">
						<table>
							<tr>
								<th>판매자ID</th>
								<th>판매자가 올렸던 물품</th>
							</tr>
							<tr>
							
							</tr>
							<tr>
							
							</tr>
						</table>
					</div>
					<div id="biddingApply">
						<form action="" post="get">
							<label>입찰 단위 : ￦ 80,000</label><br>
							<input type="text" name="bidding" size="25" placeholder="1,680,000원 이상 작성하세요.">
							<input type="submit" value="입찰">
						</form>
						<label>※경매 수수료 : 낙찰가의 15%</label>
					</div>
				</span> <!-- contents End -->
			</span> <!-- part1 End -->

			<!-- 상품 상세정보(from 관리자), 상품정보 테이블형태 -->
			<div id="part2">
				<div id="detailContent">
					<label>상품 상세</label>
					<pre>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Doloremque obcaecati at ut aliquid, dolor, quasi nemo ipsa porro pariatur possimus maiores omnis sunt eaque odio sequi fuga sint? Assumenda voluptatem voluptates voluptate vero impedit esse totam voluptatibus, illum incidunt accusantium excepturi placeat nisi error et. Aperiam praesentium nobis quasi!</pre>
				</div>
				
				<div id="goods">
					<label>상품 정보</label>
					<table>
						<tr>
							<td>보증서 유무</td>
							<td>Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis.</td>
						</tr>
						<tr>
							<td>시리얼 넘버</td>
							<td>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Sit.</td>
						</tr>
						<tr>
							<td>오리지널 박스 유무</td>
							<td>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Sit.</td>
						</tr>
						<tr>
							<td>케이스 크기</td>
							<td>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Sit.</td>
						</tr>
						<tr>
							<td>재질</td>
							<td>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Sit.</td>
						</tr>
						<tr>
							<td>무브먼트 종류</td>
							<td>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Sit.</td>
						</tr>
					</table>
				</div>
			</div> <!-- part2 End -->
		</div> <!-- container End -->
	</section>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>