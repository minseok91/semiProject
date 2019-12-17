<%--
/**
 * <pre>
 * @Author      : apple
 * @CreateDate  : Dec 4, 2019 9:19:35 PM
 * @ModifyDate  : Dec 4, 2019 9:19:35 PM
 * @fileName    : appRequest
 * @Description : 감정신청목록
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.lp.item.model.vo.*, com.kh.lp.common.*" %>
 <% ArrayList<Item> list = (ArrayList<Item>) request.getAttribute("list"); 
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int startPage = pi.getStartPage();
	int endPage = pi.getMaxPage();
	int currentPage = pi.getCurrentPage();
	int listCount = pi.getListCount();
	int limit = pi.getLimit();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta content="text/html;">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/admin_appRequest.css">
 <style>
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
 	#acpContent{
 		/* display:hidden; */
 	}
 	#rejContent{
 		display:none;
 	}
</style>
</head>
<body>
<%@ include file="../common/headerPage.jsp" %>
	<div id="container">
		<div id="container_Box">
			<div>
				<div>
					<table id="search_Box">
						<tr>
							<td>아이디 검색</td>
							<td>
								<input type="text" id="idSearch">
								<button id="idSearchBtn">검색</button>
							</td>
						</tr>
					</table>
				</div>
				<div>
					<table id="search_Box">
							<tr>
								<td>검색판명 선택</td>
								<td>
								<select>
									<option> -- 선택 -- </option>
									<option> 자유 게시판 </option>
									<option> 건의 게시판 </option>
									<option> 리뷰 게시판 </option>
								</select>
								</td>
							</tr>
						</table>
				</div>
			</div>
			<div>
			<div id="NoticeNumber">
				<p>총 게시판 수 :</p><h4>4명</h4>
			</div>
				<table id="table">
				<!-- 리스트번호,상품번호,상품종류,회원아이디.신청받은날짜.배송받은날짜,처리기한 -->
					<tr>
						<th>No.</th>
						<th>상품ID</th>
						<th>상품종류</th>
						<th>판매자ID</th>
						<th>신청받은날짜</th>
						<th>배송받은날짜</th>
						<th>처리기한</th>
					</tr>
					<% int k = 1;
					for(Item i :list) { %>
					<tr>
						<td><%= k %></td>
						<td><%= i.getItemId() %></td>
						<td><%= i.getItemType().equals("W")?"시계" :"가방" %></td>
						<td><%= i.getItemMemberNo() %></td>
						<td><%= i.getItemAppDate() %></td>
						<td>받은 날짜 불러오기</td>
						<td>받은 날짜 + 7일</td>
						<td>
							<button class="insertApp">정보입력</button>
						</td>
					</tr>
			<% k++; } %>
					
				</table>
			</div>
			<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/selectAll.it?currentPage=1'"><<</button>
		<% if(currentPage <= 1){ %>
			<button disabled> < </button>
		<% } else { %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectAll.it?currentPage=<%=currentPage-1%>'"><</button>
		<% } %>
		
		
		<% for(int p = startPage ; p <= endPage; p++){ 
				if(p == currentPage){
		%>
				<button disabled><%=p %></button>
				<% } else { %>
					<button onclick="location.href='<%=request.getContextPath()%>/selectAll.it?currentPage=<%=p%>'"><%=p %></button>
				<% } %>
			
		<% } %>
		
		<% if(currentPage >= maxPage){ %>
			<button disabled> > </button>
		<% } else { %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectAll.it?currentPage=<%=currentPage + 1 %>'"> > </button>
		<% } %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectAll.it?currentPage=<%=maxPage%>'">>></button>
		</div>  <!--  pagingArea End game -->
			<!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">감정정보 입력</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;">
                <form action="<%=request.getContextPath() %>/insert.app" method="post" encType="multipart/form-data">
					<input type="radio" name="isGen" id="accept" value="Y" checked>
					<label for="accept">진품</label>
					<input type="radio" name="isGen" id="reject" value="N">
					<label for="reject">가품</label>
					<div id="acpContent">
						여기는 진품일 시에 넣는 공간
						<!--이건 시퀀스 GEN_ID NUMBER PRIMARY KEY, -->
    					<!--이건 생성된거를  APP_RESULT_NO NUMBER, -->
    					<!--브랜드  BRAND VARCHAR2(50), -->
    					<!--모델네임 MODEL_NAME VARCHAR2(50), -->
    					<!-- 가격 APP_PRICE NUMBER -->
    					<input type="text" name="brand" placeholder="브랜드">
    					<input type="text" name="model" placeholder="모델명">
    					<input type="text" name="price" placeholder="가격">
						<input type="text" id="acpName" value="">
						<label>진품입니까?</label>
						<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this ,2)">
						<img width="120" height="100" id="contentImg1">
						
						<textarea name="comment" cols="40" rows="5"></textarea> 
						<input type="submit" value="입력하기">
					</div>
					<div id="rejContent">
					여기는 가품일 시에 넣는 공간
					<br>
						<label>제품ID</label>
						<input type="text" id="rejName" name="rejName" value="">
						<br>
						<label>가품입니까?</label>
						<textarea name="comment2" cols="40" rows="5"></textarea> 
						<br>
						<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this ,1)">
						<img width="120" height="100" id="titleImg">
						<input type="submit" value="입력하기">
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


			
		</div>
	</div>
	<script>
	$(function(){
		$("tr").click(function(){
			var h1 = $(this);
			var pr = $(this).children().eq(1).text();
			console.log("pr : " + pr);
			console.log("h1" + h1);
			location.href="<%=request.getContextPath() %>/selectOne.it?itemId=" + pr;
		})
		
		
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
		
		$("#insertGen").click(function(){
			location.href="<%=request.getContextPath()%>/insert.app";
		})
		
		$("#insertFake").click(function(){
			location.href="<%=request.getContextPath()%>/insert.app";
		})
	})
	
	function loadImg(value ,num){
		if(value.files && value.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				switch(num){
				case 1 : $("#titleImg").attr("src", e.target.result); break;
				case 2 : $("#contentImg1").attr("src", e.target.result); break;
				case 3 : $("#contentImg2").attr("src", e.target.result); break;
				case 4 : $("#contentImg3").attr("src", e.target.result); break;
				
				}
			}
			reader.readAsDataURL(value.files[0]);
		}
	}
	
	function close_pop(flag) {
	      $('#myModal').hide();
	 };	
		
	</script>
	
</body>
</html>