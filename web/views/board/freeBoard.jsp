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
			<ul>
				<li>자유게시판</li>
				<li>문의게시판</li>
				<li>리뷰게시판</li>
				<li>FAQ게시판</li>
			</ul>
				<table>
				<tr>
					<th class="title">게시물 번호</th>
					<th class="title">제목</th>
					<th class="title">작성자</th>
					<th class="title">작성일</th>
					<th class="title">조회수</th>
				</tr>
				<tr>
					<td>1</td>
					<td>구찌 GG마몽 미니 토트겸 숄더백 (442622)</td>
					<td>1,600,000</td>
					<td id="check">낙찰 실패</td>
					<td>0</td>
				</tr>
				<tr>
					<td>2</td>
					<td>구찌 GG마몽 미니 토트겸 숄더백 (442622)</td>
					<td>1,600,000</td>
					<td id="check">낙찰 성공</td>
					<td>0</td>
				</tr>
				<tr>
					<td>3</td>
					<td>구찌 GG마몽 미니 토트겸 숄더백 (442622)</td>
					<td>1,600,000</td>
					<td id="check">차순위 낙찰</td>
					<td>0</td>
				</tr>
				<tr>
					<td>3</td>
					<td>구찌 GG마몽 미니 토트겸 숄더백 (442622)</td>
					<td>1,600,000</td>
					<td id="check">차순위 낙찰</td>
					<td>0</td>
				</tr>
				<tr>
					<td>3</td>
					<td>구찌 GG마몽 미니 토트겸 숄더백 (442622)</td>
					<td>1,600,000</td>
					<td id="check">차순위 낙찰</td>
					<td>0</td>
				</tr>
				<tr>
					<td>3</td>
					<td>구찌 GG마몽 미니 토트겸 숄더백 (442622)</td>
					<td>1,600,000</td>
					<td id="check">차순위 낙찰</td>
					<td>0</td>
				</tr>
				<tr>
					<td>3</td>
					<td>구찌 GG마몽 미니 토트겸 숄더백 (442622)</td>
					<td>1,600,000</td>
					<td id="check">차순위 낙찰</td>
					<td>0</td>
				</tr>
				<tr>
					<td>3</td>
					<td>구찌 GG마몽 미니 토트겸 숄더백 (442622)</td>
					<td>1,600,000</td>
					<td id="check">차순위 낙찰</td>
					<td>0</td>
				</tr>
				<tr>
					<td>3</td>
					<td>구찌 GG마몽 미니 토트겸 숄더백 (442622)</td>
					<td>1,600,000</td>
					<td id="check">차순위 낙찰</td>
					<td>0</td>
				</tr>
				<tr>
					<td>3</td>
					<td>구찌 GG마몽 미니 토트겸 숄더백 (442622)</td>
					<td>1,600,000</td>
					<td id="check">차순위 낙찰</td>
					<td>0</td>
				</tr>
			</table>
			</div> <!-- tableArea End -->
		<div class="pagingArea">
			<button><<처음</button>
			<button><이전</button>
			<button>1</button>
			<button>2</button>
			<button>3</button>
			<button>4</button>
			<button>5</button>
			<button>6</button>
			<button>7</button>
			<button>8</button>
			<button>9</button>
			<button>10</button>
			<button>다음></button>
			<button>마지막>></button>
		</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>