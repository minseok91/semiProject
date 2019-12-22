<%--
/**
 * <pre>
 * @Author      : 안동환
 * @CreateDate  : 2019. 12. 6. 오전 10:37:27
 * @ModifyDate  : 2019. 12. 6. 오전 10:37:27
 * @fileName    : 경매 미실행 상세 페이지 
 * @Description :
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.lp.auction.model.vo.*,com.kh.lp.common.*, com.kh.lp.appraisal.model.vo.*" %>
    
<% HashMap<String,Object> list = (HashMap<String,Object>) request.getAttribute("list"); 
ArrayList<Attachment> atList = (ArrayList<Attachment>) list.get("attach");
System.out.println("atList : " + atList );
Auction au = (Auction) list.get("auction");
AR1 ar1 = (AR1) list.get("ar1");
System.out.println("ar1 : " + ar1 );
Watch w = (Watch) list.get("w");
System.out.println("w : " + w );
Bag b = (Bag) list.get("b");
System.out.println("b : " + b );
ArrayList<BiddingHistory> bhList  = (ArrayList<BiddingHistory>) list.get("bhList");
System.out.println("bhList : " + bhList );
String memberId = (String) list.get("memberId");
System.out.println("memberId : " + memberId );
%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<title>경매 미실행 상세</title>
<style>
	html, body {
		margin: 0;
		padding: 0;
	}
	#container {
		width: 1080px;
		margin: 75px auto;
	}
	.contents {
		height:650px;
		width:inherit;
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
	.goods label {
		font-size: 20px;
    	color: #3e2d1a;
    	border-left: 5px solid #3e2d1a;
    	padding-left: 10px;
    	margin-bottom: 10px;
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
        #closeBtn {
      		width: 100px;	
      		margin: 0 auto;
        }
      	#closeBtn_div {
      		padding-top: 40px;
      		width: 100px;
      		margin: 0 auto;
      	}
      	#infoBox_table  td{
			padding: 15px;
      	}
      	
</style>
</head>
<body>
<%@ include file="../common/headerPage.jsp" %>

	<!-- 배송정보 모달 -->
	<%@ include file="admin_autionNotRunning_Modal.jsp" %>
	<!-- 보증서 모달 -->
	<%@ include file="admin_autionNotRunning_Modal2.jsp" %>
	<section>
		<div id="container">
			<div class="contents">
				<!-- 사진, 상품명, 입찰가, 등록칸 -->
			<span id="part1">
				<span class="imgBox">
					<div class="title">
						<label id="wish" href="#"><%if(au.getAuctionCount() == 0){ %> 
							경매 준비
							
						<% } else if(au.getAuctionCount() == 1) {%>
						경매중
						<% } else if(au.getAuctionCount() == 2) {%>
						재경매
						<% } %>
						</label>
						<img id="titleImg" src="<%= request.getContextPath() %>/img/appraisal/<%=atList.get(0).getAttachmentRename() %>" alt="" >
					</div>
					<div id="detailImg">
						<table>
						<!-- 사진 갯수에 따라서 조율가능 -->
							<tr>
							<% for(int i = 1 ; i < atList.size(); i++){ %>
								<td>
									<img src="<%= request.getContextPath() %>/img/appraisal/<%=atList.get(i).getAttachmentRename() %>" alt="" >
								</td>
							<% } %>
						</table>
					</div> <!-- detailImg End -->
				</span> <!-- imgBox End -->
				<span class="contents">
					<div id="head">
						<label><%=ar1.getAr1Brand() %> <%=ar1.getAr1Model() %>(감정번호 : <%=ar1.getAr1Id() %>)</label><br>
						<label id="aucResult">미실행 사유 : 시간초과</label>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label>판매자ID : <%=memberId %></label>
						<button id="appDoc">감정서 보기</button>
					</div>
					<div style="width: 638px; height: 100px;">
						<button id="deliveryCondition">배송상태 보기</button>
				</div>
				</span> <!-- contents End -->
				
			</span> <!-- part1 End -->

			<!-- 상품 상세정보(from 관리자), 상품정보 테이블형태 -->
			<div class="goods">
						<label>상품 정보</label>
						<table >
							<tr>
								<td>브랜드</td>
								<td><%=ar1.getAr1Brand() %></td>
							</tr>
							<tr>
								<td>모델명</td>
								<td><%=ar1.getAr1Model() %></td>
</tr>
							<tr>
								<td>감정가</td>
								<td><%=ar1.getAr1Price() %></td>
							</tr>
							<tr>
								<td>등급</td>
								<td><%= ar1.getAr1Condition() %></td>
							</tr>
						</table>
					</div>
					<% if(ar1.getAr1BagDetail() > 0){ %>
					<div id="bagDetail" class="goods">
						<label>상품 정보 상세</label>
							<table>
								<tr>
									<td>끈 높이</td>
									<td><%=b.getBagStrap() %></td>
								</tr>
								<tr>
									<td>사이즈</td>
									<td><%=b.getBagSize() %></td>
								</tr>
								<tr>
									<td>성별</td>
									<td><%=b.getGender() %></td>
								</tr>
							</table>
					</div>
					<% } else{%>
					<div id="watchDetail" class="goods">
						<label>상품 정보 상세</label>
						<table>
							<tr>
								<td>보증서 유무</td>
								<td><%=w.getWatchGuaranteeYn().equals("Y")?"유":"무" %></td>
							</tr>
							<tr>
								<td>오리지널 박스 유무</td>
								<td><%= w.getWatchBoxYn().equals("Y")?"유":"무" %></td>
							</tr>
							<tr>
								<td>재질</td>
								<td><%=w.getWatchMaterial() %></td>
							</tr>
							<tr>
								<td>무브먼트 종류</td>
								<td><%=w.getWatchMovement() %></td>
							</tr>
							<tr>
								<td>크로노그래프</td>
								<td><%=w.getWatchChronograph() %></td>
							</tr>
						</table>
					</div>
				<% } %>
				</div>
			</div> <!-- part2 End -->
			</div>
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
	 $("#deliveryCondition").click(function(){
		 $("#myModal").show();
	 })
	 $("#closeBtn").click(function(){
		 $("#myModal").hide();
	 })
	
	$(function(){
		const title = $('#titleImg').attr('src');
		$('td img').mouseover(function() {
			$('#titleImg').attr('src', $(this).attr('src'));
		}).mouseout(function() {
			$('#titleImg').attr('src', title);
		});
		
		$("#appDoc").click(function(){
			$('#myModal2').show();
			
		})	
	})
	
	</script>
</body>
</html>