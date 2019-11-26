<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/admin_mainPage.css">
</head>
<body>
	<%@include file="headerPage.jsp"%>
	<div id="container">
		<div id="container_box">
			<div>
				<h2>관리자 메인 화면</h2>
			</div>
			<table>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
				<tr>
					<td colspan="3">
					<div id="sales">
						
					</div>

					</td>
					<td colspan="1">
					<div id="mission">
							<div>
							<label>오늘 할 일</label>
							</div>
							<div>
								 <ul>
									<li><input type="checkBox" id="checkBox1"><label for="checkBox1">블랙리스트 확인하기</label></li>
									<li><input type="checkBox" id="checkBox2"><label for="checkBox2">경매 물품 확인하기</label></li>
									<li><input type="checkBox" id="checkBox3"><label for="checkBox3">경매 상황 확인하기</label></li>
								</ul> 
							</div>
						</div>
				   </td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="question">
						<div>
							 <label>신고 및 문의 알람</label>
							<ul>
								<li><a>명품 감정 믿을 수 있는건가요?</a><button>삭제</button></li>
							</ul>
						</div>
						</div>
					</td>
					<td colspan="2">
						<div id="bbs">
							<label>게시판 관리</label>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>