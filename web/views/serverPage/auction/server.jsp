<%--
/**
 * <pre>
 * @Author      : gurwns
 * @CreateDate  : 2019. 12. 21. 오후 4:46:14
 * @ModifyDate  : 2019. 12. 21. 오후 4:46:14
 * @fileName    : 
 * @Description :
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	.container {
		width: 1080px;
		margin: 0 auto;
		padding: 6px 0px 0;
	}
	.contents{
		height:660px;
		width:inherit;
		margin-top: 5%;
		border: 1px solid;
		border-radius: 10px; 
	}
	#tableArea {
		width: 1000px;
		text-align: center;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="contents" align="center">
			<table id="tableArea" border="1">
				<thead id="tableHeadArea">
				<!-- 리스트번호,상품번호,상품종류,회원아이디.신청받은날짜.배송받은날짜,처리기한 -->
					<tr>
						<th>No.</th>
						<th>유저아이디</th>
						<th>상품가격</th>
						<th>남은시간</th>
					</tr>	
				</thead>
				<tbody id="tableBodyArea"></tbody>
			</table>  <!-- tableArea end -->
		</div>  <!-- contents end -->
	</div>  <!-- container end -->
	
	<script>
		$(function(){
			$.ajax({
				url: "<%= request.getContextPath() %>/serverSelectAll",
				type: "post",
				data: {},
				success: function(data) {
					var arr = data.split("#");
					var temp = "";
					timeTemp = "";
					for(i in arr) {
						temp += "<tr>";
						var arr2 = arr[i].split("::");
						for(j in arr2) {
							if(j == 3) {
								if(i == arr.length - 1) {
									timeTemp += arr2[j];
								} else {
									timeTemp += arr2[j] + "::";
								}
							}
							temp += "<td>" + arr2[j] + "</td>";
						}
						temp += "</tr>";
					}
					$("table > tbody").append(temp);
					
					serverPageWebSocket();
				},
				error: function(data) {
					console.log("ajax 에러");
				}
			});
		});
		
		function serverPageWebSocket() {
			url = "ws://localhost:8010/<%= request.getContextPath() %>/serverWeb/serverAdministrator";
			serverSocket = new WebSocket(url);
			
			serverSocket.onopen = function(event) {
				serverSocketOnOpen(event);
			};
			
			serverSocket.onmessage = function(event) {
				serverSocketOnMessage(event);
			};
			
			serverSocket.onclose = function(event) {
				serverSocketOnClose(event);
			};
			
			serverSocket.onerror = function(event) {
				serverSocketOnError(event);
			};
		};
		
		function serverSocketOnOpen(event) {
			console.log("serverSocket연결");
			console.log(timeTemp);
			
		};
		
		function serverSocketOnMessage(event) {
			console.log(event.data);
		};
		
		function serverSocketOnClose(event) {
			alert(event.data + "서버종료...");
		};
		
		function severSocketOnError(event) {
			alert(event.data + "서버오류...");
		};
		
		
	</script>
</body>
</html>