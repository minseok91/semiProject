<%--
/**
 * <pre>
 * @Author      : minseok
 * @CreateDate  : Dec 5, 2019 4:15:10 PM
 * @ModifyDate  : Dec 5, 2019 4:15:10 PM
 * @fileName    : appRequestDetail.jsp
 * @Description : 감정 상세 정보
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.lp.item.model.vo.*, com.kh.lp.common.*"%>
<% 
   Item item = (Item) request.getAttribute("item");
   String[] brandModel = item.getItemBrandModel().split("/");
    String brand = brandModel[0];
    String model = brandModel[1];
    int itemId = item.getItemId();
    System.out.println(itemId);
   Attachment at = (Attachment) request.getAttribute("at");
%>
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
		.btn{
			border:1px solid #a07342;
			background:#211f22;
			color:#e2ceb8;
			height:36px;
			border-radius:5px;
			font-size:20px;
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
			border-bottom: 1px solid black;
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
			border-bottom: 1px solid black;
			float: left;
		}
		#part1Area>#part1InfoArea>#tableInfoArea {
			width: inherit;
			height: inherit;
			border-collapse: collapse;
		}
		#part1Area>#part1InfoArea>#tableInfoArea>#tableInfoBodyArea>tr>td {
			border-bottom: 1px solid black;
		}
		
		#part2Area {
			width:inherit;
			height: 365px;
		}
		
		#part2DetailArea {
			display: inline-block;
			height: 300px;
			width: 666px;
			border-top: 1px solid black;
			border-left: 1px solid #CCCCCC;
			border-right: 1px solid #CCCCCC;
			border-bottom: 1px solid #CCCCCC;
			float: left;
		}
		
		#tableDetailArea, #tableDescriptionArea {
			width: inherit;
			height: 355px;
		}
		
		#part2DescriptionArea {
			display: inline-block;
			height: 300px;
			width: 362px;
			border-left: 1px solid #CCCCCC;
			border-right: 1px solid #CCCCCC;
			border-bottom: 1px solid #CCCCCC;
			float: left;
		}
		#btnArea {
			display: inline-block;
			height: 355px;
			width: 331px;
			border-left: 1px solid #CCCCCC;
			border-right: 1px solid #CCCCCC;
			float: left;
		}
		#tableBtnArea {
			margin: auto;
			margin-top: 140px;
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
		.imgArea {
			width: 650px;
			height: 750px;
		}
		#detailForType{
			 display:inline-block; 
			/* text-align:center; */
		}
		#detailForGoods{
			 display:inline-block; 
			/* text-align:center; */
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
									<td><img src="<%= request.getContextPath() %>/img/userItemPic/<%= at.getAttachmentRename() %>" alt="" /></td>
								</tr>
							</tbody>  <!-- tableImgBodyArea end -->
						</table>  <!-- tableImgArea end -->
					</div>  <!-- part1ImgArea end -->
					<div id="part1InfoArea">
						<table id="tableInfoArea">
							<tbody id=tableInfoBodyArea>
								<tr>
									<td>상품명</td>
									<td><%=brand%>, <%=model%> (<%=itemId%>)</td>
								</tr>
								<tr>
									<td>판매자</td>
									<td><%= item.getMemberId() %></td>
								</tr>
								<tr>
									<td>구입 시기</td>
									<td><%=item.getItemPurDate() %></td>
								</tr>
								<tr>
									<td>감정 신청 접수일</td>
									<td><%=item.getItemAppDate() %></td>
								</tr>
								<tr>
									<td>보증서 유무</td>
									<td><%=item.getItemWarrantyYn().equals("Y")?"유":"무" %></td>
								</tr>
								<tr>
									<td>배송 받은 날짜</td>
									<td>배송 받은 날짜가 들어가는 공간입니다.</td>
								</tr>
								<tr>
									<td>처리 기한</td>
									<td>감정신청 처리기한이 들어가는 공간입니다.</td>
								</tr>
							</tbody>
						</table>  <!-- tableInfoArea end -->
					</div>  <!-- part1InfoArea end -->
				</div>  <!-- part1Area end -->
				<div id="part2Area">
					<div id="part2DescriptionArea">
						<table id="tableDescriptionArea">
							<tbody id="tableDescriptionBodyArea">
								<tr style="height: 30px;">
									<td style="height: 40px;"><h3 align="center">제품 특이 사항</h3></td>
								</tr>
								<tr>
									<td><textarea name="description" id="description" cols="48" rows="12" readonly><%= item.getItemDetail() %></textarea></td>
								</tr>
							</tbody>  <!-- tableDescriptionBodyArea end -->
						</table>  <!-- tableDescriptionArea end -->
					</div>  <!-- par2DescriptionArea end -->
					<div id="part2DetailArea">
						<table id="tableDetailArea">
							<tbody id="tableDetailBodyArea">
								<tr style="height: 30px;">
									<td><h3 align="center">상품 상세</h3></td>
								</tr>
								<tr>
									<td><textarea name="detail" id="detail" cols="91" rows="12" readonly></textarea></td>
								</tr>
							</tbody>  <!-- tableDetailBodyArea end -->
						</table>  <!-- tableDetailArea end -->
					</div>  <!-- part2DetailArea end -->
					<div class="btnArea" align="center">
						<br /><br />
						<button class="btn insertApp">감정정보 입력</button>
					</div>  <!-- btnArea end -->
				</div>  <!-- part2Area end -->
			</div>  <!-- contentsArea end -->
		</div>  <!-- contents end -->
	</div> <!-- container End -->
	
	
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
                  <!-- 여기는 진품일 시에 넣는 공간 -->
                  
             <div id="goods">
	             <div id="detailForGoods">
	               <label>상품 정보</label>
	               <table>
	                  <tr>
	                     <td>상품ID</td>
	                     <td><input type="text" id="acpName" value="2" placeholder="상품ID"></td>
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
	             </div>
               <!-- table end -->
               <div id="detailForType">
               		<input type="radio" id="watch" name="type" value="W" checked>
                	<label for="watch">시계</label>
                  	<input type="radio" id="bag" name="type" value="B">
                  	<label for="bag">가방</label>
		            <div id="watchDetail" class="watchDetail">
		               <label>상품 정보 상세</label>
		               <table>
		                  <tr>
		                     <td>보증서 유무</td>
		                     <td>
		                     	<!-- <input type="text" name="guaranteeYn" id="guaranteeYn" > -->
		                     	<select name="guaranteeYn" id="guaranteeYn">
		                               <option value="Y">Y</option>
		                               <option value="N">N</option>
		                        </select>
		                     </td>
		                  </tr>
		                  <tr>
		                     <td>오리지널 박스 유무</td>
		                     <td>
		                     <!-- <input type="text" name="boxYn" id="boxYn" > -->
		                     	<select name="boxYn" id="boxYn">
		                               <option value="Y">Y</option>
		                               <option value="N">N</option>
		                        </select>
		                     </td>
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
            </div>
               <textarea name="comment" cols="80" rows="5">귀하께서 의뢰하신 감정 결과 해당 상품이 진품임을 보증합니다.</textarea> 
            </div>     
            <div id="fileArea">             
                   <input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this ,1)">
                  <input type="file" id="thumbnailImg2" name="thumbnailImg2" onchange="loadImg(this ,2)">
                  <input type="file" id="thumbnailImg3" name="thumbnailImg3" onchange="loadImg(this ,3)">
                  <input type="file" id="thumbnailImg4" name="thumbnailImg4" onchange="loadImg(this ,4)">
                  <input type="file" id="thumbnailImg5" name="thumbnailImg5" onchange="loadImg(this ,5)">
                   <input type="file" id="thumbnailImg6" name="thumbnailImg6" onchange="loadImg(this ,6)">
            </div>
                  <img width="120" height="100" id="titleImg">
                  <img width="120" height="100" id="contentImg1">
                  <img width="120" height="100" id="contentImg2">
                  <img width="120" height="100" id="contentImg3">
                  <img width="120" height="100" id="contentImg4">
                  <div>감정서 사진</div>
                  <img width="120" height="100" id="contentImg5">
                  <div id="c-type">
                  
                  
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
                  <textarea name="comment2" cols="40" rows="5">귀하께서 의뢰하신 감정 결과 해당 상품은 위조품으로 판명되었습니다.</textarea> 
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
               case 6 : $("#contentImg5").attr("src", e.target.result); break;
               }
            };
            reader.readAsDataURL(value.files[0]);
         }
      };
      
      $(function(){
    	  /*사진 가리는 부분  */
    	  $("#fileArea").hide(); //숨기는 부분
    	  /*사진 이미지 클릭시 업로드 창 띄우는 부분  */
  		$("#titleImg").click(function(){ //클릭될 때
  			$("#thumbnailImg1").click(); //실행되는 이벤트
  		})
  		$("#contentImg1").click(function(){
  			$("#thumbnailImg2").click();
  		})
  		$("#contentImg2").click(function(){
  			$("#thumbnailImg3").click();
  		})
  		$("#contentImg3").click(function(){
  			$("#thumbnailImg4").click();
  		})
  		$("#contentImg4").click(function(){
  			$("#thumbnailImg5").click();
  		})
  		$("#contentImg5").click(function(){
  			$("#thumbnailImg6").click();
  		})
    	  
    	  
         $(".insertApp").click(function(){
            $('#myModal').show();
            /* var pr = $(this).parent().parent('tr').children().eq(1).text(); */
            $("#acpName").val(<%=itemId%>);
            $("#rejName").val(pr);
            console.log("pr : "  + pr );
         });
         
         $("#accept").click(function(){
            
            $("#acpContent").show();
            $("#rejContent").hide();
         });
         
         $("#reject").click(function(){
            
            $("#rejContent").show();
            $("#acpContent").hide();
         });
         
         $("#bag").click(function(){
            
            $("#bagDetail").show();
            $("#watchDetail").hide();
         });
         
         $("#watch").click(function(){
            
            $("#watchDetail").show();
            $("#bagDetail").hide();
         });
         
         $("#appDoc").click(function(){
            $('#myModal').show();
         });
         
         $("#detail").click(function(){
            $('#myModal2').show();
         });
         
         $("#insertGen").click(function(){
            var files = [];
            var file = $("input[type=file]");
            var imges = $("img");
            
            for(var i = 0; i < file.length; i++){
               if(file[i].value === ''){
                  console.log(file[i].value);
                  file[i].remove(); 
               };
            }
            console.log(file.length);
         });
      });
   </script>
</body>
</html>