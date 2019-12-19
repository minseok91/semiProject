<%--
/**
 * <pre>
 * @Author      : minseok kim
 * @CreateDate  : Dec 5, 2019 11:19:07 AM
 * @ModifyDate  : Dec 5, 2019 11:19:07 AM
 * @fileName    : deliveryList.jsp
 * @Description : 	배송리스트
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.lp.shipment.model.vo.*, com.kh.lp.common.*" %>
 <% ArrayList<Shipment> list = (ArrayList<Shipment>) request.getAttribute("list"); 
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	System.out.println("list : " + list);
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
<link rel="stylesheet" type="text/css" href="css/deliveryList.css">
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
 	.update{
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
					<tr>
						<th>No.</th>
						<th>상품ID</th>
						<th>판매자ID</th>
						<th>판매자주소</th>
						<th>배송사유</th>
						<th>배송정보입력</th>
					</tr>
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
					 <!-- <tr>
						<td>1</td>
						<td>pr001</td>
						<td>adh5677</td>
						<td>경기도성남시수정구</td>
						<td>가품배송</td>
						<td>
							<button class="insertDel">배송정보입력</button>
							<button class="update">배송정보수정</button>
						</td>
					</tr>
					 <tr>
						<td>2</td>
						<td>pr002</td>
						<td>kingminseok</td>
						<td>경기도성남시분당구</td>
						<td>유찰배송</td>
						<td>
							<button class="insertDel">배송정보입력</button>
							<button class="update">배송정보수정</button>
						</td>
					</tr>
					 <tr>
						<td>3</td>
						<td>pr003</td>
						<td>관리자</td>
						<td>서울시동작구</td>
						<td>낙찰상품배송</td>
						<td>
							<button class="insertDel">배송정보입력</button>
							<button class="update">배송정보수정</button>
						</td>
					</tr> -->
					
				</table>
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
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">배송정보 입력</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;">
                <form action="<%=request.getContextPath() %>/insertWayBill.sm" method="post" >
					<div id="deliNum">
						<label>상품ID</label>
						<input type="text" id="delPName" name="memberShipmentId" >
						
						<br>
						<label>운송장번호</label>
						<input type="number" name="waybill" >
						<button id="insert">입력하기</button>
					</div>
				</p>
				</form>
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
		$(".insertDel").click(function(){
			$('#myModal').show();
			var pr = $(this).parent().parent('tr').children().eq(0).text();
			$("#delPName").val(pr);
			$("#rejName").val(pr);
			console.log("pr : "  + pr );
			/* var url = "FAQList.jsp";
            var name = "popup test";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option); */
		})	
		
		$("#insert").click(function(){
			//var pr = $(this).parent().parent('tr').children().eq(1).text();
			var i = 3;
			for(var i = 0; i < $("tr").length; i++){
			var changeBtn = $("tr:nth-child("+i +")").children().eq(1).text();
				if(changeBtn ===  $("#delPName").val()){
					var get = $("tr:nth-child("+i +")").children().last().children().eq(0).hide();
					var getBtn = $("tr:nth-child("+i +")").children().last().children('button').eq(1).show();
				}
			}
			$("#rejName").val();
			$("#delPName").val();
			
			$('#myModal').hide();
		})
	})
	
	</script>
</body>
</html>