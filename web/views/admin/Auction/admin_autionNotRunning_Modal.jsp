<%--
/**
 * <pre>
 * @Author      : 안동환
 * @CreateDate  : 2019. 12. 6. 오후 1:54:50
 * @ModifyDate  : 2019. 12. 6. 오후 1:54:50
 * @fileName    : 
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
      		display: none;
      		position: fixed;
      		z-index: 1;
      		left: 0;
      		top : 0;
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
      		border: 1px solid #888;
      		width: 22%;
      	}
</style>
</head>
<body>
	<div id="myModal" class="modal">
		<div class="modal-content">
		<p style="text-align: center"><span style="font-size: 14pt"><b><span style="font-size:24pt;">배송상태 보기</span></b></span></p>
		<div id="infoBox">
			<table align="center" id="infoBox_table">
				<tr>
					<td>상품ID</td>
					<td>442622</td>
				</tr>
				<tr>
					<td>판매자ID</td>
					<td>adh1234</td>
				</tr>
				<tr>
					<td>판매자 주소</td>
					<td>서울 강남구</td>
				</tr>
				<tr>
					<td>기사ID</td>
					<td>kingsa123</td>
				</tr>
				<tr>
					<td>상태</td>
					<td>배송중</td>
				</tr>
			</table>
			<div id="closeBtn_div">
				<button id="closeBtn">닫기</button>
			</div>
		</div>
	</div>
	</div>
</body>
</html>