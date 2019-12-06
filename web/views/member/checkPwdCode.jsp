<%--
/**
 * <pre>
 * @Author      : gurwns
 * @CreateDate  : 2019. 12. 6. 오후 6:16:19
 * @ModifyDate  : 2019. 12. 6. 오후 6:16:19
 * @fileName    : checkPwdCode.jsp
 * @Description : 패스워드 이메일 체크코드 페이지
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LauXion</title>
<!-- favicon불러오는 링크 -->
<link rel="shortcut icon" href="<%= request.getContextPath() %>/img/favicon.ico" type="image/x-icon"/>
<style>
	.container {
		width: 1080px;
		margin: 0 auto;
		padding: 6px 0px 0;
	}
	.contents{
		height:650px;
		width:inherit;
	}
	#emailCheckArea{
		border-top:1px solid #211f22;
		border-bottom:1px solid #211f22;
		height:300px;
		width:inherit;
		display:inline-block;
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>
	<div class="container">
		<div class="contents">
			<br /><br /><br /><br />
			<table id="findTableArea" align="center"><!--  border="1"> -->
				<tr>
					<td><label for="">이름 : </label></td>
					<td><input type="text" id="memberName"/></td>
				</tr>
				<tr>
					<td><label for="">이메일 : </label></td>
					<td><input type="email" id="memberEmail"/></td>
				</tr>
			</table>
		</div>  <!-- contents end -->
	</div>  <!-- container end -->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>