<%--
/**
 * <pre>
 * @Author      : 안동환
 * @CreateDate  : 2019. 12. 4. 오후 7:54:07
 * @ModifyDate  : 2019. 12. 4. 오후 7:54:07
 * @fileName    : admin_userDetailPage
 * @Description :
 * </pre>
 */
--%>
<%@page import="lombok.extern.log4j.Log4j2"%>
<%@page import="com.kh.lp.admin.report.model.vo.Report"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.lp.member.model.vo.*, java.util.*"%>
<%
	//회원정보, 구매이력갯수, 신고이력 갯수 담아서 가져오는 ArrayList
	ArrayList<Object> list = (ArrayList<Object>)request.getAttribute("list");
	//회원 정보 꺼내온 것
	Member MemberList = (Member)list.get(0);
	// 구매 이력 갯수 조회
	int purchaseCount = Integer.parseInt(list.get(1).toString());
	//회원 신고이력갯수 꺼내온 것 
	int ReportCount = Integer.parseInt(list.get(2).toString());
	//일반회원조회, 블랙회원 조회 구별
	int userInfo = Integer.parseInt((String)request.getAttribute("userInfo"));
	//판매 이력 갯수 조회
	int salesCount = Integer.parseInt(list.get(3).toString());
	System.out.println(list);
%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="32x32"
	href="image/loginimg(2).png">
<meta content="text/html;">
<title>회원정보 관리 상세</title>
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

.contents {
	width: 100%;
	height: 650px;
	margin-top: 10%;
}

.infoBox {
	width: 90%;
	height: 100%;
	margin: 0 auto;
}

#infoTable {
	margin-top: 56px;
	margin-left: 38%;
	width: 45%;
	border-collapse: collapse;
}

#infoTable  td {
	height: 60px;
	width: 100px;
}

td:nth-of-type(1) {
	font-weight: bold;
	color: #404040;
}

td:nth-of-type(2) {
	color: #000000;
}

#infoBox>h3 {
	text-align: center;
}

#buttonBox {
	margin-top: 30px;
	width: 73.03px;
	margin-left: auto;
	margin-right: auto;
}

#buttonBox button {
	background: rgb(33, 31, 34);
	border: 1px solid rgb(33, 31, 34);
	color: rgb(160, 115, 66);
}
#blackListHistory {
	margin-left: 191px;
}
#textarea {
	width: 428px;
	height: 150px;
	resize: none;
}
#changeTypeBtn {
	text-align: center;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
	<%@ include file="../../common/headerPage.jsp"%>
	<div id="container" class="container">
		<div id="contents" class="contents">
			<div class="infoBox">
				<h3 align="center"><%=MemberList.getMemberName()%>님의 회원정보</h3>
				<table id="infoTable">
					<tr>
						<td>아이디</td>
						<td><%=MemberList.getMemberId()%></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><%=MemberList.getMemberName()%></td>
					</tr>
					<tr>
						<td>번호</td>
						<td><%=MemberList.getMemberPhone()%></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><%=MemberList.getMemberAddress()%></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><%=MemberList.getMemberEmail()%></td>
					</tr>
					<% if( userInfo == 1){ %>
						<tr>
						<td>판매상품이력</td>
						<td id="salesHistory"><%= salesCount %>건</td>
					</tr>
					<tr>
						<td>구매상품이력</td>
						<td id="purchaseHistory"><%=purchaseCount%>건</td>
					</tr>
					<tr>
						<td>신고 이력</td>
						 <td id="reportHistory"><%= ReportCount %>건</td>
					</tr>
					<%} else {%>
						<tr>
							<td>상세 정보 입력</td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea id="textarea" name="textarea"></textarea>
							</td>
						</tr>
						<tr>
							<td id="changeTypeBtn" colspan="2">
							<button class="withdraw">탈퇴</button>
								<button class="release">해제</button>
							</td>
						</tr>
					<% } %>
					
					
				</table>
				
				<div id="buttonBox">
					<button id="back">뒤로 가기</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$("#salesHistory").click(function(){
			/* 판매이력servlet으로 가는 코드 */
			location.href = "<%=request.getContextPath()%>/userSalesHistory.me?userId=<%=MemberList.getMemberId()%>";
		}).mouseover(function(){
			$("#salesHistory").css({'cursor':'pointer'})
		})
		$("#purchaseHistory").click(function(){
			/* 구매이력servlet으로 가는 코드 */
			<%-- location.href = "<%=request.getContextPath()%>/userpurchaseHistory.me?userId=<%=MemberList.getMemberId()%>"; --%>
		}).mouseover(function(){
			$("#purchaseHistory").css({'cursor':'pointer'})
		})
		$("#buttonBox > button").click(function(){
			window.history.back();
		}).mouseover(function(){
			$("#buttonBox > button").css({'cursor':'pointer'})
		})
		//유저 신고 이력
		$("#reportHistory").click(function() {
			location.href = "<%= request.getContextPath()%>/userReport.me?userId=<%=MemberList.getMemberId()%>";
		})
		$("#back").click(function() {
			window.history.back();
		});
		$("button").click(function(e){
			var text = $("#textarea").val();
			console.log(text);
			 if(e.target.innerHTML == '탈퇴') {
				location.href="<%=request.getContextPath()%>/memberTypeUpdate.me?userid=<%=MemberList.getMemberId()%>&MemberNo=<%=MemberList.getMemberNo()%>&type=MS3&text="+text;
			} else if(e.target.innerHTML == '해제'){
				location.href="<%=request.getContextPath()%>/memberTypeUpdate.me?userid=<%=MemberList.getMemberId()%>&MemberNo=<%=MemberList.getMemberNo()%>&type=MS1&text="+text;
			} 
		})
	</script>
</body>
</html>