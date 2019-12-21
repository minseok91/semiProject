<%@ page import="com.kh.lp.bidding.model.vo.Bid"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.kh.lp.common.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Bid> list = (ArrayList<Bid>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.container {
	      width: 1080px;
	      margin: 0 auto;
	      padding: 6px 0px 0;
	}
	.contents{
	      height:650px;
	      width:inherit;
	}
	
	.head {
	    position: relative;
	    width: 900px;
	    left: 50%;
	    transform: translateX(-50%);
	    border-bottom: 1px solid #3e2d1a;
	    padding-bottom: 7px;
	    margin-top: 50px;
	}
	
	.head>span {
	    font-family: 'Nanum Myeongjo', serif;
	    font-size: 15px;
	    font-weight: bold;
	    margin-right: 1%; 
	    color: #3e2d1a;
	}
	
	.title {
	   font-weight: bold;
	}
	
	form {
	   display: inline;
	   margin: 0;
	   padding: 0;
	}
	
	.search {
	   margin-left: 28.5%;
	   border-left: 5px solid #3e2d1a;
	   margin-right: 1%;
	   padding-left: 0.5%;
	   font-size: 13px;
	}
	
	select {
	   border: none;
	   box-shadow: 0px 0px 5px 0px rgba(33,31,34,0.45);
	   font-weight: normal;
	   width: 130px;
	   padding: 3px
	}
	
	select, option {
	   color: #a6a6a6;
	}
	
	#content {
	   border: none;
	   box-shadow: 0px 0px 5px 0px rgba(33,31,34,0.45);
	   font-weight: normal;
	   margin-left: 1%;
	   padding: 3px;
	}
	
	input[type=submit] {
	   	width: 54px;
	    background: #211f24;
	    color: #cca071;
	    border: 1px solid #a07342;
	    margin-left: 1%;
	    font-weight: normal;
	}
	
	.list {
	   position: relative;   
	   left: 50%;
	   transform: translateX(-50%);
	   text-align: center;
	}
	
	.list>table {
	   border-collapse: separate;
	   border-spacing: 40px;
	   position: relative;
	   left: 13%;
	}
	
	td {
	   width: 120px;
	   box-shadow: 0px 0px 8px 0px rgba(33,31,34,0.45);
	   
	}
	
	#img {
	   width: 100px;
	   margin-left: auto;
	   margin-right: auto;
	}
	
	#img>img {
	   width: 100px;
	   height: 100px;
	}
	
	.price {
	   margin-top: 8px;
	   background-color: rgba(33, 31, 34, 0.863);
	   font-size: 11px;
	    text-align: center;
	    background-color: #211f22;
	    background-color: rgba(33, 31, 34, 0.863);
	    color: #fff;
	    width: 100px;
	}
	
	td>.content, .time {
	   font-size: 12px;
	}
	
	td>.content {
	   position: relative;
	   text-align: left;
	   white-space: pre-wrap;
	   left: 2%;
	}
	
	.time {
	   background: #a07342;
	   border-radius: 5px;
	   color: #fff;
	   margin: 0 5px 5px 5px;
	}
	
	.pagingArea {
	   position: relative;
	    top: 5%;
	    text-align: center;
	    width: auto;
	}
	
	.pagingArea button {
	   border: none;
	   padding: 0;
	   background: none;
	   margin: 0 3px;
	}
	   
</style>
<title>LauXion</title>
<link rel="shortcut icon" href="<%= request.getContextPath() %>/img/favicon.ico" type="image/x-icon"/>
</head>
<body>
   <%@ include file="../common/header.jsp" %>
   <%@ include file="../common/nav.jsp" %>
   <div class="container">
      <div class="contents">
	      <div class="head">
	         <span class="title">< 경매 진행중인 가방 상품 ></span> <span class="search">검색</span>
	         <span class="content">
	            <form action="" method="get">
	               <select name="keyword" id="keyword">
	                  <option value="brand">브랜드명</option>
	                  <option value="content">모델명</option>
	               </select> 
	               
	               <input type="search" name="content" id="content" placeholder="브랜드명">
	               <input type="submit" value="검색">
	            </form>
	         </span>
	      </div>  <!-- head end -->
	      
	      <div class="list">
			<table>
			<% int j=0; %>
        	<% for(int i=0; i<list.size() / 5 + 1; i++) { %> <!-- 리스트 전체 / 5 + 1 -->

            <tr>
               <% for(; j<list.size(); j++) { %>
               <% if(j != (i+1)*5) { %>
				<td>
					<div id="img">
                  		<div class="price"><%= list.get(j).getBidPrice() %></div>
                    	<img src="<%= request.getContextPath() %>/img/appraisal/<%= list.get(j).getBidAttachment() %>" alt="" >
                  	</div>
                  	<% if(list.get(j).getBidBrand().length() + list.get(j).getBidModel().length() < 10 ) { %>
                 		<span class="content"><%= list.get(j).getBidBrand() + "<br>" + list.get(j).getBidModel() %></span>
                 	<% } else { %>
                 		<span class="content"><%= list.get(j).getBidBrand() + " " + list.get(j).getBidModel() %></span>
                 	<% } %>
                 	
                 	<div class="time"><%= list.get(j).getBidAuctionStartTime() %></div>
                 	<div hidden><%= list.get(j).getBidAuctionId() %></div>
                 	<div hidden><%= list.get(j).getBidAttachment() %></div>
              	</td>
              	<% } else break; %>
               <% } %>
               </tr>
              <% } %>
	         </table>
	      </div> <!-- list End -->
      </div> <!-- contents End -->
   </div> <!-- container End -->
	<%@ include file="../common/footer.jsp" %>
   
   <script type="text/javascript">
		$(function() {
			$('td').css('cursor', 'pointer').click(function() {
				<% if(loginMember == null) { %>
					alert('로그인을 해야 상세정보을 열람하실 수 있습니다.');
					location.href="<%= request.getContextPath() %>/views/member/login.jsp";
				<% } else { %>
					const auctionId = $(this).children().eq(3).text();
					const img = $(this).children().eq(4).text();
					
					location.href="<%= request.getContextPath() %>/watchDetail.wa?img="+img+"&auctionId="+auctionId;
				<% } %>
				
			});
		})
	</script>

</body>
</html>