<%--
/**
 * <pre>
 * @Author      : 안동환
 * @CreateDate  : 2019. 12. 10. 오후 8:54:18
 * @ModifyDate  : 2019. 12. 10. 오후 8:54:18
 * @fileName    : 신고 이력 상세 페이지
 * @Description :
 * </pre>
 */
--%>
<%@page import="com.kh.lp.common.PageInfo,java.util.ArrayList
,com.kh.lp.admin.report.model.vo.*"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	 ArrayList<Report> reportList = (ArrayList<Report>)request.getAttribute("reportList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int endPage = pi.getEndPage();
	int limit = pi.getLimit();
	int listCount = pi.getListCount();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<title>신고 이력 페이지</title>
<style>
	html, body {
	padding: 0;
	margin: 0;
	width: 100%;
	height: 100%;
}
.container {
	width: 1080px;
	margin-left: auto;
	margin-right: auto;
	
}
.contents{
	width: 100%;
	height: 650px;
	margin-top: 10%;
	border: 1px solid;
	border-radius: 10px; 
	
}
.contents> div:first-child {
	width: 96%;
	height: 25px;
	padding: 20px;

}
.contents> div > p, h3 {
	width: 120px;
	margin: 0;
	float: left;
	
}
.contents> div > p {
	padding-top: 1px;
}
.contents> div:nth-child(2) {
	width: 95%;
	height: 73.5%;
	margin-top: 30px;
	margin-left: auto;
	margin-right: auto;
}
#table {
	width: 100%;	
	border-collapse: collapse;
}
th {
	border-top: 1px solid;
	background: #EAEAEA;
	color: black;
	border-top: 2px solid #CCCCCC;
}
th, td {
	border-bottom: 1px solid #CCCCCC;
	text-align: center;
	padding-top: 5px;
}
#nextPage {
	width: 100%;
	height: 15%;
} 
#sarchBoxBtn {
	width: 65px;
	height: 31px;
	margin-left: 2%;
	float: right;
	background: rgb(33, 31, 34);
	border: 2px solid rgb(160, 115, 66);
	color: rgb(160, 115, 66);
}
#searchBox {
	margin-top: 1px;
	width: 130px;
	height: 25px;
	border: none;
	box-shadow: 2px 2px 6px 1px gray;
	float: right;
}
#nextPageBox {
	width: 80%;
	height: 100%;
	margin-left: auto;
	margin-right: auto;
}
#tdColor {
	background: #EAEAEA;
}
</style>
</head>
<body>
	<%@ include file="../../main/headerPage.jsp" %>
	<%@ include file="admin_reportModal.jsp" %>
	<div id="container" class="container">
		<div id="contents" class="contents">
			<div>
				 <p>신고 이력<h3><%= reportList.size() %>건</h3>
				<button id="sarchBoxBtn">검색</button>
				<input type="text" id="searchBox">
			</div>
			<div>
				<table id="table">
					<tr>
						<th>No.</th>
						<th>신고회원</th>
						<th>피신고회원</th>
						<th>신고일시</th>
						<th>신고대상</th>
						<th>신고유형구분</th>
					</tr>
					 <% for(int p=0; p<reportList.size(); p++) { %> 
						<tr>
							<input type="hidden" id="reportId" value="<%=reportList.get(p).getReport_id()%>">
						 	<td><%= reportList.get(p).getRnum()%></td>
							<td><%= reportList.get(p).getReporting_member_no()%></td>
							<td><%= reportList.get(p).getReported_member_no()%></td>
							<td><%= reportList.get(p).getReport_date()%></td>
							<%
								switch(reportList.get(p).getReport_type()) {
								case "BT1" : %> <td>자유게시판</td> <%
								; break;
								case "BT2" :%> <td>문의게시판</td> <%
								; break;
								case "BT3" :%> <td>리뷰게시판</td> <% 
								; break;
								case "BT4" :%> <td>FAQ게시판</td> <% 
								; break;							
								}
							%>
							
							<%
								System.out.println(reportList.get(p).getReport_subject());
								switch(reportList.get(p).getReport_subject()){
								case "RT1" : %> <td>자유게시판</td> <%
								; break;
								case "RT2" :%> <td>문의게시판</td> <%
								; break;
								default :%> <td>오류</td> <% 
								; break;
								}
							%>
						</tr>
					 <% } %>
					
				</table>
			</div>
			<div id="nextPage">
				 <div id="nextPageBox"align="center">
					<button onclick="location.href='<%=request.getContextPath()%>/userReport.me?currentPage=1&userId=<%=request.getParameter("userId")%>'"><<</button>
						<% for(int b=1; b<= maxPage; b++) { %>
							<button onclick="location.href='<%=request.getContextPath()%>/userReport.me?currentPage=<%= b%>&userId=<%=request.getParameter("userId")%>'"><%= b %></button>
						<% } %>
					<button onclick="location.href='<%=request.getContextPath()%>/userReport.me?currentPage=<%= maxPage%>&userId=<%=request.getParameter("userId")%>'">>></button>
				</div> 
			</div>
		</div>
	</div>
	<script>
		$("td").click(function(e){
			var a = e.target.parentNode.children;
			console.log(e.target.parentNode.children[0].value)
			 $(".myModal").show(); 
			 $.ajax({
				url:"userReportDetail.me",
				data: {reportId : e.target.parentNode.children[0].value},
				type:"GET",
				success:function(data) {
					$tableBody = $('#modalTable tbody');
					
					var reportType;
					if(data.report_type=="RT1"){
						reportType = '게시물';
					} else {
						reportType = '댓글';
					}
					var reportSubject;
					if(data.report_subject==1){
						reportSubject = '자유게시판';
					} else if(data.report_subject==2){
						reportSubject = '문의게시판';
					} else if(data.report_subject==3) {
						reportSubject = '리뷰게시판';
					} else {
						reportSubject = 'FAQ게시판';
					}
					var report = data;
					console.log(data);
					var $tr = $("<tr>");
					var $reporting = $("<tr><td id='tdColor'>신고자 회원 </td><td>"+data.reporting_member_no+"</td><td id='tdColor'>피신고 회원</td><td>"+data.reported_member_no+"</td>");
					var $reporDate = $("<tr><td id='tdColor'>신고 일시 </td><td>"+data.report_date+"</td><td id='tdColor'>신고 대상</td><td>"+reportSubject+"</td>");
					var $reporType = $("<tr><td id='tdColor'>신고 유형 구분 </td><td>"+reportType+"</td><td><td>");
					var $reporContent = $("<tr><td colspan='4'><textarea rows='30' cols='115' style='resize: none' readonly>"+data.reported_content+"</textarea></td>");
					$tableBody.append($reporting);
					$tableBody.append($reporDate);
					$tableBody.append($reporType);
					$tableBody.append($reporContent);
				},
				error:function(error, status) {
					console.log("서버 전송 실패");
				}
			}) 
		})
		$("#close").click(function(){
			$("#myModal").hide();
			$tabletr = $('#modalTable tr');
			$tabletr.remove();
	})
	</script>
</body>
</html>