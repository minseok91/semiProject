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
    width: inherit;
    position: relative;
    left: 50%;
    transform: translateX(-50%);
	margin-top: 16%;
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
	padding: 3px 0px;
}

.pagingArea {
	position: relative;
    top: 5%;
    text-align: center;
    width: auto;
    left: 50%;
    transform: translateX(-50%);
}

.pagingArea button {
	border: none;
	padding: 0;
	background: none;
	margin: 0 3px;
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
						<td style="border: 1px solid green; cursor: pointer;"><a>ppppppppppppppppppp</a></td>
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
		<div class="pagingArea">
			<button><<처음</button>
			<button><이전</button>
			<button>1</button>
			<button>2</button>
			<button>3</button>
			<button>4</button>
			<button>5</button>
			<button>다음></button>
			<button>마지막>></button>
		</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>