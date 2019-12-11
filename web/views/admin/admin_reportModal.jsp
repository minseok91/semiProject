<%--
/**
 * <pre>
 * @Author      : 안동환
 * @CreateDate  : 2019. 12. 11. 오후 2:45:20
 * @ModifyDate  : 2019. 12. 11. 오후 2:45:20
 * @fileName    : 신고이력 모달파일
 * @Description :
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta content="text/html;">
<title>Insert title here</title>
<style>
.modal {
	/* display: none; */
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0,0,0);
	background-color: rgba(0,0,0,0.4); 
}
.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	boarder: 1px solid #888;
	width: 70%;
	background: gray;
}
#modalTable {
	width: 100%;
	height: 50px;
	border: 1px solid;
}
</style>
</head>
<body>
	<div id="myModal" class="myModal">
		<div class="modal-content">
			<div id="infoBox">
				<table id="modalTable" align="center">
					<tr>
						<td>신고자 회원</td>
						<td><input type="text"></td>
						<td>피신고 회원</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td>신고일시</td>
						<td><input type="label"></td>
						<td>신고 대상</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td colspan="1">신고 유형 구분</td>
						<td colspan="3"><input type="text"></td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea rows="30" cols="115"></textarea>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>