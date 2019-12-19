<%--
/**
 * <pre>
 * @Author      : Kewon
 * @CreateDate  : 2019. 12. 10. 오후 4:08:12
 * @ModifyDate  : 2019. 12. 10. 오후 4:08:12
 * @fileName    : freeBoard
 * @Description : 자유게시판
 * </pre>
 */
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.container {
	width: 1080px;
	margin: 0 auto;
	paading: 6px 0px 0;
}

.contents {
	width: inherit;
}

#tableArea>ul {
	font-size: 16px;
    display: flex;
    list-style: none;
    position: relative;
    left: 45%;
    width: 49%;
}

#tableArea li {
	background: #211f22;
	padding: 8px 16px;
	margin: 2px;
	color: #94703a;
	cursor: pointer;
}

#tableArea>table {
	position: relative;
    left: 50%;
    transform: translateX(-50%);
    width: 80%;
	margin-top: 6%;
}

#tableArea>table>tbody>tr>th, #tableArea>table>tbody>tr>td {
	width: auto;
	border-bottom: 1px solid #d9d9d9;
	padding: 15px;
	font-size: 15px;
	text-align: center;
}

#tableArea>table>tbody>tr>th  {
	background: #f5efe7;
	border-top: 1px solid #3e2d1a;
}

.pagingArea {
	position: relative;
    text-align: center;
    width: auto;
    margin: 7% 0 15% 0;
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
			<div id="tableArea">
			
				<table>
				<tr>
					<th class="title">게시물 번호</th>
					<th class="title">제목</th>
					<th class="title">작성자</th>
					<th class="title">작성일</th>
					<th class="title">조회수</th>
				</tr>
				
			</table>
			</div> <!-- tableArea End -->
		<div class="pagingArea">
			
		</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>