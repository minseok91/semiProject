<%--
/**
 * <pre>
 * @Author      : minseok kim
 * @CreateDate  : Dec 5, 2019 2:39:13 PM
 * @ModifyDate  : Dec 5, 2019 2:39:13 PM
 * @fileName    : itemAuc.jsp
 * @Description : 상품(경매관련)
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.lp.shipment.model.vo.*, com.kh.lp.common.*" %>
 <% ArrayList<Shipment> list = (ArrayList<Shipment>) request.getAttribute("list"); 
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
<meta content="text/html;">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/itemAuc.css">
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
							<!-- <th>판매자ID</th> -->
							<th>경매상태</th>
							<th>상세보기</th>
						</tr>
					</thead>
					<tbody id="tableBody">
					 	<% for(Shipment sm : list){ %>
					<tr>
						<td><%= sm.getMemberShipmentId() %></td>
						<td><%= sm.getMemberShipmentItem() %></td>
						<td><%= sm.getMemberNo() %></td>
						<td><%= sm.getMemberShipmentApp() %></td>
						<td><%= sm.getMemberShipmentType() %></td>
						<td>
							<button class="insertDel">배송정보입력</button>
							<button class="update">배송정보수정</button>
						</td>
					</tr>
					<% } %> 
					</tbody>
				</table>  <!-- tableBoardArea end -->
			</div>  <!-- boardArea end -->
			</div>
			<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/selectAll.sm?currentPage=1'"><<</button>
		<% if(currentPage <= 1){ %>
			<button disabled> < </button>
		<% } else { %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectAll.sm?currentPage=<%=currentPage-1%>'"><</button>
		<% } %>
		
		
		<% for(int p = startPage ; p <= endPage; p++){ 
				if(p == currentPage){
		%>
				<button disabled><%=p %></button>
				<% } else { %>
					<button onclick="location.href='<%=request.getContextPath()%>/selectAll.sm?currentPage=<%=p%>'"><%=p %></button>
				<% } %>
			
		<% } %>
		
		<% if(currentPage >= maxPage){ %>
			<button disabled> > </button>
		<% } else { %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectAll.sm?currentPage=<%=currentPage + 1 %>'"> > </button>
		<% } %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectAll.sm?currentPage=<%=maxPage%>'">>></button>
		</div>  <!--  pagingArea End game -->
		</div>
	</div>
		<!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">	 입력</span></b></span></p>
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
		
		$(".ready").click(function(){
			var aucId = $(this).parent().parent().children().eq(0).text()
			console.log(aucId);
			location.href="<%=request.getContextPath()%>/selectOne.au?appId=" + aucId + "&status=1";
		})
		
		$(".noAct").click(function(){
			var aucId = $(this).parent().parent().children().eq(0).text()
			location.href="<%=request.getContextPath()%>/selectOne.au?appId=" + aucId + "&status=2";
		})
		
		$(".start").click(function(){
			var aucId = $(this).parent().parent().children().eq(0).text()
			location.href="<%=request.getContextPath()%>/selectOne.au?appId=" + aucId+ "&status=3";
		})
		
		$(".win").click(function(){
			var aucId = $(this).parent().parent().children().eq(0).text()
			location.href="<%=request.getContextPath()%>/selectOne.au?appId=" + aucId + "&status=4";
		})
		
		$(".noBid").click(function(){
			var aucId = $(this).parent().parent().children().eq(0).text()
			location.href="<%=request.getContextPath()%>/selectOne.au?appId=" + aucId + "&status=5";
		})
		
		$(".payed").click(function(){
			var aucId = $(this).parent().parent().children().eq(0).text()
			location.href="<%=request.getContextPath()%>/selectOne.au?appId=" + "이거안만드러졌네ㅎ" + "&status=6";
		})
		
		$(".noPayed").click(function(){
			var aucId = $(this).parent().parent().children().eq(0).text()
			location.href="<%=request.getContextPath()%>/selectOne.au?appId=" + aucId	 + "&status=7";
		})
		
		
		
	})
	
	</script>
</body>
</html>