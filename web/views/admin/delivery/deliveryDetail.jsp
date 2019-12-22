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
 <% ArrayList<ShipmentHistory> list = (ArrayList<ShipmentHistory>) request.getAttribute("list"); 
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
		margin-left: auto;
		margin-right: auto;
		margin-top: 10%;
		padding: 6px 0px 0;
	}
	.contents{
		height:660px;
		width:inherit;
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
						<!-- <td>검색판명 선택</td>
						<td>
							<select id="selectBoard">
								<option> -- 선택 -- </option>
								<option> 자유 게시판 </option>
								<option> 건의 게시판 </option>
								<option> 리뷰 게시판 </option>
							</select>
						</td> -->
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
							<th>판매자ID</th>
							<th>배송상태</th>
							<th>운송장번호</th>
						</tr>
					</thead>
					<tbody id="tableBody">
						 <% for(ShipmentHistory sh : list) { %>
						<tr>
							<td><%=sh.getShipmentHistoryId() %></td>
							<td><%=sh.getShipmentHistoryDate() %></td>
							<td><%=sh.getShipmentHistoryType() %></td>
							<td></td>
							<td><%=sh.getWaybill() %></td>
						</tr>
						<% } %>
						 <tr>
							<td>1</td>
							<td>pr001</td>
							<td>adh5677</td>
							<td>배송전<br>(목록에추간된시간)</td>
							<td id="del">
								<div id="delNum">354952299354</div><br>
								<select id="delName">
									<option value="kr.cjlogistics">CJ대한통운</option>
									<option value="kr.epost">우체국 택배</option>
									<option value="kr.lotte">롯데택배</option>
								</select>
								<button class="detail">배송정보</button>
							</td>
						</tr>
						 <tr>
							<td>2</td>
							<td>pr002</td>
							<td>kingminseok</td>
							<td>배송중<br>(시작시간)</td>
							<td id="del"><div id="delNum">6892110658249</div><br>
								<select id="delName">
									<option value="kr.cjlogistics">CJ대한통운</option>
									<option value="kr.epost">우체국 택배</option>
									<option value="kr.lotte">롯데택배</option>
								</select>
								<button class="detail">배송정보</button>
							</td>
						</tr>
						 <tr>
							<td>3</td>
							<td>pr003</td>
							<td>관리자</td>
							<td>배송완료<br>(완료된시간)</td>
							<td id="del"><div id="delNum">232192872730</div><br>
								<select id="delName">
									<option value="kr.cjlogistics">CJ대한통운</option>
									<option value="kr.epost">우체국 택배</option>
									<option value="kr.lotte">롯데택배</option>
								</select>
								<button class="detail">배송정보</button>
							</td>
						</tr>
					</tbody>
				</table>  <!-- tableBoardArea end -->
			</div>  <!-- boardArea end -->
			</div>
			<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/selectAll.sh?currentPage=1'"><<</button>
		<% if(currentPage <= 1){ %>
			<button disabled> < </button>
		<% } else { %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectAll.sh?currentPage=<%=currentPage-1%>'"><</button>
		<% } %>
		
		
		<% for(int p = startPage ; p <= endPage; p++){ 
				if(p == currentPage){
		%>
				<button disabled><%=p %></button>
				<% } else { %>
					<button onclick="location.href='<%=request.getContextPath()%>/selectAll.sh?currentPage=<%=p%>'"><%=p %></button>
				<% } %>
			
		<% } %>
		
		<% if(currentPage >= maxPage){ %>
			<button disabled> > </button>
		<% } else { %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectAll.sh?currentPage=<%=currentPage + 1 %>'"> > </button>
		<% } %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectAll.sh?currentPage=<%=maxPage%>'">>></button>
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
	$(function(){
		var $tableTr = $("#tableBoardArea tr");
		
		$.each($tableTr, function(index, val){
			var $delTd = val.children[3];
			/* ajax로 데이터 가져오는 부분 */
			$.ajax({
				url:"https://apis.tracker.delivery/carriers/" + "kr.cjlogistics" + "/tracks/" + 354952299354,
				type:"get",
				success:function(data){
					var stateInfo = data.state.text;
					
					var div2 = document.createElement( 'div' );
					
					div2.innerHTML = stateInfo;
					
					if(index !== 0 ){
						$delTd.append(div2);
					}
				},
				error:function(error, status){
					console.log("서버 전송 실패 !");
				}
			})
		})
	})
	
	function close_pop(flag) {
	      $('#myModal').hide();
	 };	
	
	
	$(function(){
		$(".insertDel").click(function(){
			$('#myModal').show();
			var pr = $(this).parent().parent('tr').children().eq(1).text();
			$("#delPName").val(pr);
			$("#rejName").val(pr);
			console.log("pr : "  + pr );
			/* var url = "FAQList.jsp";
            var name = "popup test";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option); */
		})	
	})
	
	$(".detail").click(function(){
		var delNum = $(this).parent().parent().children().eq(4).children().eq(0).html();
		console.log(delNum);
		var delName = $(this).parent().parent().children().eq(4).children().eq(2).val();
		console.log(delName);
		window.open("https://tracker.delivery/#/"+ delName + "/" + delNum, "배송정보", "width=600, height=400, left=100, top=50");
	})
	
	</script>
</body>
</html>