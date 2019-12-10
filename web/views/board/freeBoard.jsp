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
	height: 650px;
}

#tableArea>table {
	border: 1px solid red;
	text-align: center;
    width: 1080px;
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    top: 59%;
}

.title {
    text-align: center;
}

.title:nth-of-type(1) {
	width: 7%;
}

.title:nth-of-type(2) {
	width: 60%;
}

#tableArea>table td {
	border: 1px solid blue;
	padding: 20px 0px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>
	<div class="container">
		<div class="contents">
			<div id="tableArea">
				<table>
					<tr>
						<th class="title">게시물번호</th>
						<th class="title">제목</th>
						<th class="title">작성자</th>
						<th class="title">작성일자</th>
						<th class="title">조회수</th>
					</tr>
					<tr>
						<td>000000</td>
						<td>ppppppppppppppppppp</td>
						<td>ppppppppppppppppppp</td>
						<td>2019-12-10</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>abc</td>
						<td>asdasd</td>
						<td>20191210</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>abc</td>
						<td>asdasd</td>
						<td>20191210</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>abc</td>
						<td>asdasd</td>
						<td>20191210</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>abc</td>
						<td>asdasd</td>
						<td>20191210</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>abc</td>
						<td>asdasd</td>
						<td>20191210</td>
						<td>0</td>
					</tr>
				</table>
			</div> <!-- tableArea End -->
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>