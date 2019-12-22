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
    pageEncoding="UTF-8" import="java.util.*, com.kh.lp.appraisal.model.vo.*, com.kh.lp.common.*" %>
 <% ArrayList<AppCom> list = (ArrayList<AppCom>) request.getAttribute("list"); 
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
        table {
		border-collapse: collapse;
    	text-align: center;
	}
	
	input{
		font-family: sans-serif;
    	font-size: 15px;
    	width: 150px;
    	border: none;
    	box-shadow: 0px 0px 5px 0px rgba(33,31,34,0.45);
	}
	
	.container {
		width: 1080px;
		margin: 0 auto;
		padding: 6px 0px 0;
	}
	.contents{
		height:660px;
		width:inherit;
		margin-top: 5%;
		border: 1px solid;
		border-radius: 10px; 
	}
	
	#headArea {
		width: inherit;
	}
	
	 #headBoardArea {
		display: inline-block;
		float: left;
	}
	
	 #headSearchArea {
		display: inline-block;
		float: right;
	}
	#tableSearchArea {
		height: 48px;
		margin-right: 37px;
	}
	#tableSelectArea {
		height: 48px;
		margin-left: 37px;
	}
	
	#selectBoard {
		height: 21px;
	}
	
	.container>.contents>#boardArea {
		width: inherit;
	}
	.container>.contents>#boardArea>#tableBoardArea {
		width: 1000px;
		height: 500px;
		border-top: 1px solid #211f22;
 		border-bottom: 1px solid #211f22;
	}
	
	#tableBoardArea>#tableHead>tr>th {
		background: #e2ceb8;
		color: #211f22;
		font-size: 1.2em;
		height: 32px;
		border-top: 1px solid #211f22;
 		border-bottom: 1px solid #211f22;
	}
	#tableBoardArea>#tableBody>tr>td {
 		border-top: 1px solid #CCCCCC;
 		border-bottom: 1px solid #CCCCCC;
 	}
 	
	.btn{
		border:1px solid white;
		background:white;
		color:black;
		height:23px;
		border-radius:5px;
		font-size:17px;
		cursor: pointer;
	}
	.btn2 {
		border:1px solid #a07342;
		background:#211f22;
		color:#e2ceb8;
		height:24px;
		border-radius:4px;
		font-size:16px;
		font-weight: bold;
		cursor: pointer;
	}
</style>
</head>
<body>
<%@ include file="../common/headerPage.jsp" %>
	<div class="container">
		<div class="contents">
			<div id="headArea">
			<br /><br />
				<div id="headSearchArea" align="left">
					<table id="tableSearchArea">
						<tr>
							<td>아이디 검색 &nbsp;:&nbsp;</td>
							<td>
								<input type="text" id="idSearch">
								&nbsp;
								<button id="idSearchBtn" class="btn2">검색</button>
							</td>
						</tr>
					</table>  <!-- tableSearchArea end -->
				</div>  <!-- headSearchArea end -->
				<div id="headBoardArea" align="right">
					<table id="tableSelectArea">
						<tr>
							<td>검색판명 선택</td>
							<td>
								<select id="selectBoard">
									<option> -- 선택 -- </option>
									<option> 자유 게시판 </option>
									<option> 건의 게시판 </option>
									<option> 리뷰 게시판 </option>
								</select>
							</td>
						</tr>
					</table>  <!-- selectArea end -->
				</div>  <!-- headBoardArea end -->
			</div>  <!-- headArea end -->
			<div id="boardArea" align="center">
				<table id="tableBoardArea">
				<!-- 리스트번호,상품번호,상품종류,회원아이디.신청받은날짜.배송받은날짜,처리기한 -->
					<thead id="tableHead">
						<tr>
							<th>No.</th>
							<th>브랜드 / 모델명</th>
							<th>상품종류</th>
							<th>판매자ID</th>
							<th>감정완료날짜</th>
							<th>감정결과</th>
						</tr>
					</thead>
					<tbody id="tableBody">
						<% for(AppCom ac :list) { %>
					<tr>
						<td><%= ac.getItemId() %></td>
						<td><%= ac.getBrand() %> / <%=ac.getModel() %></td>
						<td><%= ac.getItemType().equals("W")?"시계" :"가방" %></td>
						<td><%= ac.getMemberId() %></td>
						<td><%= ac.getItemAppDate() %></td>
						<td><%= ac.getAppResult().equals("AR1")?"진품":"가품"%></td>
					</tr>
						<% } %>
					</tbody>
				</table>  <!-- tableBoardArea end -->
			</div>  <!-- boardArea end -->
	<%-- <div id="container">
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
						<th>감정완료날짜</th>
						<th>감정결과</th>
					</tr>
					<% int k = 1;
					for(AppCom ac :list) { %>
					<tr>
						<td><%= k %></td>
						<td><%= ac.getItemId() %></td>
						<td><%= ac.getItemType().equals("W")?"시계" :"가방" %></td>
						<td><%= ac.getItemMemberNo() %></td>
						<td><%= ac.getItemAppDate() %></td>
						<td><%= ac.getAppResult().equals("AR1")?"진품":"가품"%></td>
					</tr>
			<% k++; } %>
					
				</table>
			</div> --%>
			<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/selectAll.app?currentPage=1'"><<</button>
		<% if(currentPage <= 1){ %>
			<button disabled> < </button>
		<% } else { %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectAll.app?currentPage=<%=currentPage-1%>'"><</button>
		<% } %>
		
		
		<% for(int p = startPage ; p <= endPage; p++){ 
				if(p == currentPage){
		%>
				<button disabled><%=p %></button>
				<% } else { %>
					<button onclick="location.href='<%=request.getContextPath()%>/selectAll.app?currentPage=<%=p%>'"><%=p %></button>
				<% } %>
			
		<% } %>
		
		<% if(currentPage >= maxPage){ %>
			<button disabled> > </button>
		<% } else { %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectAll.app?currentPage=<%=currentPage + 1 %>'"> > </button>
		<% } %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectAll.app?currentPage=<%=maxPage%>'">>></button>
		</div>  <!--  pagingArea End game -->
			<!-- The Modal -->
    <div id="myModal" class="modal">
 
     <%--  <!-- Modal content -->
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
 
    </div> --%>
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