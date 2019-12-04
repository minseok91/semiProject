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

	.title {
		border: 1px solid blue;
		padding: 50px;
	}

	#title {
		border: 1px solid #f00;
		width: 250px;
		height: 250px;
	}
	
	.fas fa-heart {
		font-size: 20px;
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>
	<section>
		<div id="container">
			<!-- 사진, 상품명, 입찰가, 등록칸 -->
			<div id="part1">
				<span class="imgBox">
					<div class="title">
					♡
						<img src="../../img/bag1.jpg" alt="이미지가 없습니다." id="title">
					</div>
				</span>
				<span class="contents">
				
				</span>
			</div> <!-- part1 End -->

			<!-- 상품 상세정보(from 관리자), 상품정보 테이블형태 -->
			<div id="part2">
			
			</div> <!-- part2 End -->
		</div> <!-- container End -->
	</section>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>