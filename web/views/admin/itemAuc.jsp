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
    pageEncoding="UTF-8" import="java.util.*, com.kh.lp.auction.model.vo.*, com.kh.lp.common.*" %>
 <% ArrayList<Auction> list = (ArrayList<Auction>) request.getAttribute("list"); 
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
									<option> 경매전  </option>
									<option> 경매중  </option>
									<option> 경매 완료 </option>
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
			
			통합한다면?
상품id, 판매자id 등 상품과 판매자에 대한 정보를 보여주고
해당 상품을 클릭할 시 상품에 따른 상태에 맞는 정보들을 보여준다.

				<table id="table">
					<!-- <tr>
						<th>No.</th>
						<th>상품ID</th>
						<th>판매자ID</th>
						<th>정보들</th>
						<th>목록보기</th>
						<th>내용보기</th>
						<th>글쓰기</th>
						<th>상태</th>
						<th>상세보기</th>
					</tr> -->
					<tr>
						<th>No.</th>
						<th>판매자ID</th>
						<th>경매기간</th>
						<th>시작가</th>
						<th>시작시간</th>
						<th>회차</th>
						<th>경매ID</th>
						<th>상태</th>
						<th>상세보기</th>
					</tr>
					<% 
					for(Auction au :list) { %>
					<tr>
						<td><%= au.getAuctionId() %></td>
						<td><%= au.getMemberNo() %></td>
						<td><%= au.getAuPeriod() %></td>
						<td><%= au.getAuStartPrice() %></td>
						<td><%= au.getAuStartTime() %></td>
						<td><%= au.getCount() %></td>
						<td><%= au.getAuAppId() %></td>
						<td>
							<button class="insertApp">정보입력</button>
						</td>
					</tr>
					<% } %>
					 <tr>
						<td>1</td>
						<td>pr001</td>
						<td>adh5677</td>
						<td>무슨무슨</td>
						<td>전체</td>
						<td>전체</td>
						<td>전체</td>
						<td>경매준비</td>
						<td>
							<button class="detail">상세보기</button>
						</td>
					</tr>
					 <tr>
						<td>2</td>
						<td>커뮤니티</td>
						<td>kingminseok</td>
						<td>건의게시판</td>
						<td>관리자</td>
						<td>관리자</td>
						<td>사용자</td>
						<td>경매포기</td>
						<td>
							<button class="detail">상세보기</button>
						</td>
					</tr>
					 <tr>
						<td>3</td>
						<td>커뮤니티</td>
						<td>관리자</td>
						<td>공지</td>
						<td>전체</td>
						<td>전체</td>
						<td>관리자</td>
						<td>경매중</td>
						<td>
							<button id="bidding" class="detail">상세보기</button>
						</td>
					</tr>
					 <tr>
						<td>3</td>
						<td>커뮤니티</td>
						<td>관리자</td>
						<td>공지</td>
						<td>전체</td>
						<td>전체</td>
						<td>관리자</td>
						<td>경매완료(낙찰)</td>
						<td>
							<button id="resultSuccess" class="detail">상세보기</button>
						</td>
					</tr>
					 <tr>
						<td>3</td>
						<td>커뮤니티</td>
						<td>관리자</td>
						<td>공지</td>
						<td>전체</td>
						<td>전체</td>
						<td>관리자</td>
						<td>경매완료(유찰)</td>
						<td>
							<button id="resultFail" class="detail">상세보기</button>
						</td>
					</tr>
					 <tr>
						<td>3</td>
						<td>커뮤니티</td>
						<td>관리자</td>
						<td>공지</td>
						<td>전체</td>
						<td>전체</td>
						<td>관리자</td>
						<td>경매완료(재경매유찰)</td>
						<td>
							<button id="allResult" class="detail">상세보기</button>
						</td>
					</tr>
				</table>
			</div>
			<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/selectAll.au?currentPage=1'"><<</button>
		<% if(currentPage <= 1){ %>
			<button disabled> < </button>
		<% } else { %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectAll.au?currentPage=<%=currentPage-1%>'"><</button>
		<% } %>
		
		
		<% for(int p = startPage ; p <= endPage; p++){ 
				if(p == currentPage){
		%>
				<button disabled><%=p %></button>
				<% } else { %>
					<button onclick="location.href='<%=request.getContextPath()%>/selectAll.au?currentPage=<%=p%>'"><%=p %></button>
				<% } %>
			
		<% } %>
		
		<% if(currentPage >= maxPage){ %>
			<button disabled> > </button>
		<% } else { %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectAll.au?currentPage=<%=currentPage + 1 %>'"> > </button>
		<% } %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectAll.au?currentPage=<%=maxPage%>'">>></button>
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
		$(".detail").click(function(){
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
		
		
		$("#bidding").click(function(){
			location.href="<%=request.getContextPath()%>/views/kms/AucBidding.jsp";
		})
		
		$("#resultSuccess").click(function(){
			location.href="<%=request.getContextPath()%>/views/kms/AucResultSuccess.jsp";
		})
		
		$("#resultFail").click(function(){
			location.href="<%=request.getContextPath()%>/views/kms/AucResultFail.jsp";
		})
		
		$("#allResult").click(function(){
			location.href="<%=request.getContextPath()%>/views/kms/AucAllResult.jsp";
		})
	})
	
	</script>
</body>
</html>