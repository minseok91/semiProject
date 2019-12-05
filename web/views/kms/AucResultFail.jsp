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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	
	.contents>#head>label {
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
	#aucResult{
		color:brown;
	}
	#dealResult{
		color:green;
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
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
</style>
</head>
<body>
	<section>
		<div id="container">
			<!-- 사진, 상품명, 입찰가, 등록칸 -->
			<span id="part1">
				<span class="imgBox">
					<div class="title">
						<a id="wish" href="#">재경매</a>
						<img src="<%= request.getContextPath() %>/img/watch1.jpg" alt="" >
					</div>
					<div id="detailImg">
						<table>
						<!-- 사진 갯수에 따라서 조율가능 -->
							<tr>
								<td>
									<img src="<%= request.getContextPath() %>/img/watch1.jpg" alt="" >
								</td>
								<td>
									<img src="<%= request.getContextPath() %>/img/watch1.jpg" alt="" >
								</td>
								<td>
									<img src="<%= request.getContextPath() %>/img/watch1.jpg" alt="" >
								</td>
								<td>
									<img src="<%= request.getContextPath() %>/img/watch1.jpg" alt="" >
								</td>
							</tr>
							<tr>
								<td>
									<img src="<%= request.getContextPath() %>/img/watch1.jpg" alt="" >
								</td>
								<td>
									<img src="<%= request.getContextPath() %>/img/watch1.jpg" alt="" >
								</td>
								<td>
									<img src="<%= request.getContextPath() %>/img/watch1.jpg" alt="" >
								</td>
								<td>
									<img src="<%= request.getContextPath() %>/img/watch1.jpg" alt="" >
								</td>
							</tr>
						</table>
					</div> <!-- detailImg End -->
				</span> <!-- imgBox End -->
				<span class="contents">
					<div id="head">
						<label>구찌 GG마몽 미니 토트겸 숄더백 (442622)</label><br>
						<label>재경매까지 남은시간 : 20:00:14</label>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label>판매자ID</label>
						<button id="appDoc">보증서보기</button>
					</div>
					
					<div id="biddingUsers">
							<table>
								<tr>
									<th>입찰자</th>
									<th>입찰 금액</th>
									<th>입찰 시간</th>
								</tr>
								<tr>
									<td>yang****</td>
									<td>1,600,000원</td>
									<td>20분 전</td>
								</tr>
								<tr>
									<td>mins***</td>
									<td>1,520,000원</td>
									<td>1시간 전</td>
								</tr>
								<tr>
									<td>gurw**</td>
									<td>1,400,000원</td>
									<td>3시간 전</td>
								</tr>
								<tr>
									<td>gurw**</td>
									<td>1,400,000원</td>
									<td>3시간 전</td>
								</tr>
								<tr>
									<td>gurw**</td>
									<td>1,400,000원</td>
									<td>3시간 전</td>
								</tr>
								<tr>
									<td>gurw**</td>
									<td>1,400,000원</td>
									<td>3시간 전</td>
								</tr>
								<tr>
									<td>gurw**</td>
									<td>1,400,000원</td>
									<td>3시간 전</td>
								</tr>
								<tr>
									<td>gurw**</td>
									<td>1,400,000원</td>
									<td>3시간 전</td>
								</tr>
							</table>
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
	<!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">감정서보기</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;">
					<div id="deliNum">
						<label>상품ID</label>
						<input type="text" id="delPName" value="">
						<br>
						<label>운송장번호</label>
						<input type="text" >
						<button >입력하기</button>
					</div>
				</p>
                <p><br /></p>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;" >
                     닫기
                </span>
            </div>
      </div>
 
    </div>
        <!--End Modal-->
	<script>
	function close_pop(flag) {
	      $('#myModal').hide();
	 };	
	
	
	$(function(){
		$("#appDoc").click(function(){
			$('#myModal').show();
			
			/* var url = "FAQList.jsp";
            var name = "popup test";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option); */
		})	
	})
	
	</script>
</body>
</html>