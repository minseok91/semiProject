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
    pageEncoding="UTF-8" import="com.kh.lp.item.model.vo.* "%>
<% Item item = (Item) request.getAttribute("item");
String[] brandModel = item.getItemBrandModel().split(",");
 String brand = brandModel[0];
 String model = brandModel[1];
 int itemId = item.getItemId();
		 
%>
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
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        #rejContent{
 		display:none;
 	}
 	.center{
 		text-align:center;
 	}
 	.bagDetail{
 		display:none;
 	}
</style>
</head>
<body>
	<section>
		<div id="container">
			<!-- 사진, 상품명, 입찰가, 등록칸 -->
			<span id="part1">
				<span class="imgBox">

					<div class="title">사진
						<img src="<%= request.getContextPath() %>/img/watch1.jpg" alt="" >
					</div>
				</span> <!-- imgBox End -->
				<span class="contents">
					<div id="head">
						<label>여기는 상품명, <%= brand %>, <%=model %> (<%=itemId%>)</label><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label>판매자 ID : <%= item.getItemMemberNo() %> </label>
						<button id="appDoc">감정정보입력</button>
					</div>
					<table>
						<tr>
							<td>구입시기 : <%=item.getItemPurDate() %> </td>
							<td></td>
						</tr>
						<tr>
							<td>감정신청접수일 : <%=item.getItemAppDate() %></td>
							<td></td>
						</tr>
						<tr>
							<td>보증서유뮤 : <%=item.getItemWarrantyYn() %></td>
							<td></td>
						</tr>
						<tr>
							<td>배송받은일시 : (배송정보는 아직 안가져옴)</td>
							<td></td>
						</tr>
						<tr>
							<td>처리기한 : (배송정보는 아직 안가져옴 + 7일)</td>
							<td></td>
						</tr>
					</table>
					<div id="biddingUsers">
							<div><감정상품특이사항><button id="detail">상세보기</button></div>
							
							<textarea>
								<%=item.getItemDetail() %>
							</textarea>
						</div>
				</span> <!-- contents End -->
			</span> <!-- part1 End -->

			<!-- 상품 상세정보(from 관리자), 상품정보 테이블형태 -->
			<div id="part2">
				<div id="detailContent">
					<label>상품 상세</label>
					<pre>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Doloremque obcaecati at ut aliquid, dolor, quasi nemo ipsa porro pariatur possimus maiores omnis sunt eaque odio sequi fuga sint? Assumenda voluptatem voluptates voluptate vero impedit esse totam voluptatibus, illum incidunt accusantium excepturi placeat nisi error et. Aperiam praesentium nobis quasi!</pre>
				</div>
				
				
			</div> <!-- part2 End -->
		</div> <!-- container End -->
	</section>
	<!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">감정정보 입력</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;">
                <form action="<%=request.getContextPath()%>/insert.app" method="post" encType="multipart/form-data">
                   <div class="center">
					<input type="radio" name="isGen" id="accept" value="Y" checked>
					<label for="accept">진품</label>
					<input type="radio" name="isGen" id="reject" value="N">
					<label for="reject">가품</label>
				   </div>
				   <input type="hidden" value="<%=itemId%>" name="itemId">
				   <input type="hidden" value="<%=item.getItemMemberNo()%>" name="memberNo">
					<div id="acpContent">
						여기는 진품일 시에 넣는 공간
						<!--이건 시퀀스 GEN_ID NUMBER PRIMARY KEY, -->
    					<!--이건 생성된거를  APP_RESULT_NO NUMBER, -->
    					<!--브랜드  BRAND VARCHAR2(50), -->
    					<!--모델네임 MODEL_NAME VARCHAR2(50), -->
    					<!-- 가격 APP_PRICE NUMBER -->
    					<div id="goods">
					<label>상품 정보</label>
					<table>
						<tr>
							<td>상품ID</td>
							<td><input type="text" id="acpName" value="<%=itemId%>"></td>
						</tr>
						<tr>
							<td>브랜드</td>
							<td><input type="text" name="brand" placeholder="브랜드"></td>
						</tr>
						<tr>
							<td>모델명</td>
							<td><input type="text" name="model" value="<%=model %>" placeholder="모델명"></td>
						</tr>
						<tr>
							<td>감정가</td>
							<td><input type="text" name="price" placeholder="가격"></td>
						</tr>
						<tr>
							<td>상태</td>
							<td><!-- <input type="text" name="status" placeholder="상태"> -->
								<select name="status" id="status">
									<option value="S">S</option>
									<option value="A+">A+</option>
									<option value="A">A</option>
									<option value="B+">B+</option>
									<option value="B">B</option>
								</select>
							</td>
						</tr>
					</table>
					<textarea name="comment" cols="40" rows="5"></textarea> 
				</div>
    					<%-- <br>
    					<상품ID>
						<input type="text" id="acpName" value="<%=itemId%>">
						<br>
    					<label>브랜드</label>
    					<input type="text" name="brand" placeholder="브랜드">
    					<br>
    					<label>모델명</label>
    					<input type="text" name="model" placeholder="모델명">
    					<br>
    					<label>가격</label>
    					<input type="text" name="price" placeholder="가격">
    					<br>
    					<label>상태</label>
    					<input type="text" name="status" placeholder="상태">
    					<br> --%>
    					
    					<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this ,1)">
						<input type="file" id="thumbnailImg2" name="thumbnailImg2" onchange="loadImg(this ,2)">
						<input type="file" id="thumbnailImg3" name="thumbnailImg3" onchange="loadImg(this ,3)">
						<input type="file" id="thumbnailImg4" name="thumbnailImg4" onchange="loadImg(this ,4)">
						<input type="file" id="thumbnailImg5" name="thumbnailImg5" onchange="loadImg(this ,5)">
						<img width="120" height="100" id="titleImg">
						<img width="120" height="100" id="contentImg1">
						<img width="120" height="100" id="contentImg2">
						<img width="120" height="100" id="contentImg3">
						<img width="120" height="100" id="contentImg4">
						
						
						<div id="c-type">
						
						<input type="radio" id="watch" name="type" value="W">
						<label for="watch">시계</label>
						<input type="radio" id="bag" name="type" value="B">
						<label for="bag">가방</label>
						</div>
				<div id="watchDetail" class="watchDetail">
					<label>상품 정보 상세</label>
					<table>
						<tr>
							<td>보증서 유무</td>
							<td><input type="text" name="guaranteeYn" id="guaranteeYn" ></td>
						</tr>
						<tr>
							<td>오리지널 박스 유무</td>
							<td><input type="text" name="boxYn" id="boxYn" ></td>
						</tr>
						<tr>
							<td>재질</td>
							<td><input type="text" name="matertial" id="matertial" ></td>
						</tr>
						<tr>
							<td>무브먼트 종류</td>
							<td><input type="text" name="movement" id="movement" ></td>
						</tr>
						<tr>
							<td>크로노그래프</td>
							<td><input type="text" name="chronograph" id="chronograph" ></td>
						</tr>
					</table>
				</div>
				<div id="bagDetail" class="bagDetail">
					<label>상품 정보 상세</label>
					<table>
						<tr>
							<td>끈 높이</td>
							<td><input type="text" name="strap" id="strap" ></td>
						</tr>
						<tr>
							<td>사이즈</td>
							<td><input type="text" name="size" id="size" ></td>
						</tr>
						<tr>
							<td>성별</td>
							<td><input type="radio" name="gender" id="Male" value="M"><label for="Male">남</label></td>
							<td><input type="radio" name="gender" id="FeMale" value="F"><label for="FeMale">여</label></td>
						</tr>
					</table>
				</div>
						<!-- <button id="insertGen">확인하기</button> -->
						<input type="submit" id="insertGen" value="입력하기">
					</div>
					<div id="rejContent">
					여기는 가품일 시에 넣는 공간
					<br>
						<label>제품ID</label>
						<input type="text" id="rejName" name="rejName" value="<%=itemId%>">
						<br>
						<label>가품입니까?</label>
						<textarea name="comment2" cols="40" rows="5"></textarea> 
						<br>
						<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this ,1)">
						<input type="file" id="thumbnailImg2" name="thumbnailImg2" onchange="loadImg(this ,2)">
						<input type="file" id="thumbnailImg3" name="thumbnailImg3" onchange="loadImg(this ,3)">
						<input type="file" id="thumbnailImg4" name="thumbnailImg4" onchange="loadImg(this ,4)">
						<input type="file" id="thumbnailImg5" name="thumbnailImg5" onchange="loadImg(this ,5)">
						<img width="120" height="100" id="titleImg">
						<img width="120" height="100" id="contentImg1">
						<img width="120" height="100" id="contentImg2">
						<img width="120" height="100" id="contentImg3">
						<img width="120" height="100" id="contentImg4">
						<!-- <input type="submit" value="입력하기"> -->
						
						<input type="submit" id="insertGen" value="입력하기">
					</div>
				</form>
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
	 
	 
	 
	 function close_pop2(flag) {
	      $('#myModal2').hide();
	 };	
	
	 function loadImg(value ,num){
		if(value.files && value.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				switch(num){
				case 1 : $("#titleImg").attr("src", e.target.result); break;
				case 2 : $("#contentImg1").attr("src", e.target.result); break;
				case 3 : $("#contentImg2").attr("src", e.target.result); break;
				case 4 : $("#contentImg3").attr("src", e.target.result); break;
				case 5 : $("#contentImg4").attr("src", e.target.result); break;
				}
			}
			reader.readAsDataURL(value.files[0]);
		}
	}
	
	$(function(){
		$(".insertApp").click(function(){
			$('#myModal').show();
			var pr = $(this).parent().parent('tr').children().eq(1).text();
			$("#acpName").val(pr);
			$("#rejName").val(pr);
			console.log("pr : "  + pr );
			/* var url = "FAQList.jsp";
            var name = "popup test";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option); */
		})
		
		$("#accept").click(function(){
			
			$("#acpContent").show();
			$("#rejContent").hide();
		})
		
		$("#reject").click(function(){
			
			$("#rejContent").show();
			$("#acpContent").hide();
		})
		
		$("#bag").click(function(){
			
			$("#bagDetail").show();
			$("#watchDetail").hide();
		})
		
		$("#watch").click(function(){
			
			$("#watchDetail").show();
			$("#bagDetail").hide();
		})
		
		$("#appDoc").click(function(){
			$('#myModal').show();
			
			/* var url = "FAQList.jsp";
            var name = "popup test";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option); */
		})
		
		$("#detail").click(function(){
			$('#myModal2').show();
		})
		
		$("#insertGen").click(function(){
			var files = [];
			var file = $("input[type=file]");
			var imges = $("img");
			
			/* for(var i = 1; i < imges.length; i++){
				if(imges[i].src === ''){
					console.log("몇개 나오나요 ? " + i);
				} else{
					console.log("이건 안나온 수 : " + i);
				}
			} */
			
			for(var i = 0; i < file.length; i++){
				  if(file[i].value === ''){
						console.log(file[i].value);
						file[i].remove(); 
				      
				   }
					
				}
			
			<%-- location.href="<%=request.getContextPath()%>/insert.app" --%>
			
			console.log(file.length);
			
			
		})
	})
	
	</script>
</body>
</html>