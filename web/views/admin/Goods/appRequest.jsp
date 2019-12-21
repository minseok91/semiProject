<%--
/**
 * <pre>
 * @Author      : apple
 * @CreateDate  : Dec 4, 2019 9:19:35 PM
 * @ModifyDate  : 2019-12-18 윤혁준
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
<title>LauXion</title>
<!-- favicon불러오는 링크 -->
<link rel="shortcut icon" href="<%= request.getContextPath() %>/img/favicon.ico" type="image/x-icon"/>
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
							<th>상품ID</th>
							<th>상품종류</th>
							<th>판매자ID</th>
							<th>신청받은날짜</th>
							<th>배송받은날짜</th>
							<th>처리기한</th>
							<th>정보입력</th>
						</tr>
					</thead>
					<tbody id="tableBody">
						<% 
						for(Item i :list) { %>
							<tr>
								<td><%= i.getItemId() %></td>
								<td><%= i.getItemId() %></td>
								<td><%= i.getItemType().equals("W")?"시계" :"가방" %></td>
								<td><%= i.getMemberId() %></td>
								<td><%= i.getItemAppDate() %></td>
								<td>받은 날짜 불러오기</td>
								<td>받은 날짜 + 7일</td>
								<td>
									<button class="insertApp btn2">정보입력</button>
								</td>
							</tr>
						<% } %>
					</tbody>
				</table>  <!-- tableBoardArea end -->
			</div>  <!-- boardArea end -->
			<br />
			<div class="pagingArea" align="center">
				<button class="btn" onclick="location.href='<%= request.getContextPath() %>/selectAll.it?currentPage=1'"><<</button>
				<% if(currentPage <= 1){ %>
					<button class="btn" style="font-weight: bold; cursor: default;" disabled> < </button>
				<% } else { %>
					<button class="btn" onclick="location.href='<%= request.getContextPath() %>/selectAll.it?currentPage=<%=currentPage-1%>'"><</button>
				<% } %>
			
			
				<% for(int p = startPage ; p <= endPage; p++){ 
					if(p == currentPage){
				%>
						<button class="btn" style="font-weight: bold; cursor: default;" disabled><%= p %></button>
					<% } else { %>
						<button class="btn" onclick="location.href='<%=request.getContextPath()%>/selectAll.it?currentPage=<%=p%>'"><%=p %></button>
					<% } %>
				
				<% } %>
			
				<% if(currentPage >= maxPage){ %>
					<button class="btn" style="font-weight: bold; cursor: default;" disabled> > </button>
				<% } else { %>
					<button class="btn" onclick="location.href='<%=request.getContextPath()%>/selectAll.it?currentPage=<%=currentPage + 1 %>'"> > </button>
				<% } %>
				<button class="btn" onclick="location.href='<%=request.getContextPath()%>/selectAll.it?currentPage=<%=maxPage%>'">>></button>
			</div>  <!--  pagingArea end -->
		</div>  <!-- contents end -->
	</div>  <!-- container end -->
	
	<script>
	$(function(){
		$("tr").click(function(){
			var h1 = $(this);
			var pr = $(this).children().eq(1).text();
			console.log("pr : " + pr);
			console.log("h1" + h1);
			location.href="<%=request.getContextPath() %>/selectOne.it?itemId=" + pr;
		});
		
		
		$(".insertApp").click(function(){
			$('#myModal').show();
			var pr = $(this).parent().parent('tr').children().eq(1).text();
			$("#acpName").val(pr);
			$("#rejName").val(pr);
			console.log("pr : "  + pr );
		});
		
		$(".takeItem").click(function(){
			$.ajax({
				url: "",
				type: "",
				data: {},
				success: function(data){
					
				},
				error: function(data){
					
				}
			});
		});
		
		$(".arriveItem").click(function(){
			$.ajax({
				url: "",
				type: "",
				data: {},
				success: function(data){
					
				},
				error: function(data){
					
				}
			});
		});
		
		$("#accept").click(function(){
			
			$("#acpContent").show();
			$("#rejContent").hide();
		});
		
		$("#reject").click(function(){
			
			$("#rejContent").show();
			$("#acpContent").hide();
		});
		
		$("#insertGen").click(function(){
			location.href="<%=request.getContextPath()%>/insert.app";
		});
		
		$("#insertFake").click(function(){
			location.href="<%=request.getContextPath()%>/insert.app";
		});
	});
	
	function loadImg(value, num){
		if(value.files && value.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				switch(num){
				case 1 : $("#titleImg").attr("src", e.target.result); break;
				case 2 : $("#contentImg1").attr("src", e.target.result); break;
				case 3 : $("#contentImg2").attr("src", e.target.result); break;
				case 4 : $("#contentImg3").attr("src", e.target.result); break;
				
				}
			};
			reader.readAsDataURL(value.files[0]);
		}
	};
	
	function close_pop(flag) {
	      $('#myModal').hide();
	 };	
		
	</script>
</body>
</html>