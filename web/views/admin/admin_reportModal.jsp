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
<%@page import="com.kh.lp.common.PageInfo,java.util.ArrayList
,com.kh.lp.report.model.vo.*"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Report list = (Report)request.getAttribute("list");
	//System.out.println("sss : "+list);
%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<title>Insert title here</title>
<style>
.myModal {
	display: none;
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
	background: white;
}
#modalTable {
	width: 100%;
	height: 50px;
	border: 1px solid;
	border-collapse: collapse;
}
#modalTable td {
	width: 300px;
}
#close{
	margin: 0 auto;
}
#btn_div {
	width: 45px;
	margin: 0 auto;
}
textarea{
	width: 99%;
}
</style>
</head>
<body>
	<div id="myModal" class="myModal">
		<div class="modal-content">
			<div id="infoBox">
				<table id="modalTable" align="center">
				<tbody>
				</tbody>
				</table>
				<div id="btn_div">
					<button id="close">닫기</button>
				</div>		
			</div>
		</div>
	</div>
</body>
</html>