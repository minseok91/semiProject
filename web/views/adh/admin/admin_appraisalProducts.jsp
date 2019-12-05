<%--
/**
 * <pre>
 * @Author      : 안동환
 * @CreateDate  : 2019. 12. 5. 오후 1:28:14
 * @ModifyDate  : 2019. 12. 5. 오후 1:28:14
 * @fileName    : 감정신청상품목록
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="icon" type="image/png" sizes="32x32" href="image/loginimg(2).png">
<title>감정 신청상품 목록</title>
<style>
html, body {
	padding: 0;
	margin: 0;
	width: 100%;
	height: 100%;
}
#container {
	width: 1080px;
	height: 800px;
	margin-left: auto;
	margin-right: auto;
	
}
#container_Box {
	width: 100%;
	height: 90%;
	margin-top: 10%;
	border: 1px solid;
	border-radius: 10px; 
	
}
#container_Box > div:first-child {
	width: 96%;
	height: 25px;
	padding: 20px;

}
#container_Box > div > p, h3 {
	width: 150px;
	margin: 0;
	float: left;
	
}
#container_Box > div > p {
	padding-top: 1px;
}
#container_Box > div:nth-child(2) {
	width: 95%;
	height: 73.5%;
	margin-top: 30px;
	margin-left: auto;
	margin-right: auto;
}
#table {
	width: 100%;	
	border-collapse: collapse;
}
th {
	border-top: 1px solid;
	background: #EAEAEA;
	color: black;
	border-top: 2px solid #CCCCCC;
}
th, td {
	border-bottom: 1px solid #CCCCCC;
	text-align: center;
	padding-top: 5px;
}
#nextPage {
	width: 100%;
	height: 15%;
} 
#searchBox {
	width: 250px;
	height: 25px;
	float: right;
	border: 1px solid rgb(160, 115, 66);
	border-radius: 5px; 
}
#sarchBoxBtn {
	width: 65px;
	height: 31px;
	margin-left: 2%;
	float: right;
	background: rgb(33, 31, 34);
	border: none;
	color: #e2ceb8;
	border-radius: 5px; 
}
#nextPageBox {
	width: 83px;
	height: 100%;
	margin-left: auto;
	margin-right: auto;
}
 .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 22%; /* Could be more or less, depending on screen size */  
        }
#infoBox {
	width: 300px;
	margin: 0 auto;
}
#modalBox {
	
}
</style>
</head>
<body>
<%@ include file="headerPage.jsp" %>
	 <div id="myModal" class="modal">
 
      <!-- 모달 시작  -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">배송 정보 입력</span></b></span></p>
           		<div id="infoBox">
           			<table align="center">
           				<tr>
           					<td>기사 ID</td>
           					<td><input type="text"></td>
           				</tr>
           				<tr>
           					<td>기사 이름</td>
           					<td><input type="text"></td>
           				</tr>
           				<tr>
           					<td>기사 출발 시간</td>
           					<td><input type="time"></td>
           				</tr>
           				<tr>
           					<td>물건 수령 시간</td>
           					<td><input type="time"></td>
           				</tr>
           				<tr>
           					<td>물건 배달 완료 시간</td>
           					<td><input type="time"></td>
           				</tr>
           			</table>
           		</div>
            <div onClick="close_pop();" style="width: 81px; margin: 0 auto;"> 
                <span id="modalBoxClose">
                   			  닫기
                </span>
              	&nbsp;
                <span id="modalBoxOk">
                			완료
                </span>
            </div>
      </div>
 
    </div>
	<!-- 모달 끝 -->
	<div id="container">
		<div id="container_Box">
			<div>
				<p>감정 신청상품 목록<h3>4권</h3>
				<button id="sarchBoxBtn">검색</button>
				<input type="text" id="searchBox">
			</div>
			<div>
				<table id="table">
					<tr>
						<th>No.</th>
						<th>상품ID</th>
						<th>판매자</th>
						<th>판매자주소</th>
						<th>상태</th>
							<!-- 상품ID/판매자/판매자주소입력창↓ -->
					</tr>
					 <tr>
						<td>1</td>
						<td>kk13ei</td>
						<td>김민석</td>
						<td>경기도 성남시 어딘가</td>
						<td><button id="enterInformation">정보 입력</button></td>
					</tr>
					<tr>
						<td>2</td>
						<td>kms1234</td>
						<td>김민석</td>
						<td>경기도 성남시 어딘가</td>
						<td><button>정보 수정</button></td>
						<td></td>
					</tr>
					<tr>
						<td>3</td>
						<td>kms1234</td>
						<td>김민석</td>
						<td>경기도 성남시 어딘가</td>
						<td><button>정보 입력</button></td>
						<td></td>
					</tr>
					
				</table>
			</div>
			<div id="nextPage">
				<div id="nextPageBox">
					<button><</button>
					<button>o</button>
					<button>></button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$("#enterInformation").click(function(){
			$("#myModal").show();
		})
		
		$("#modalBoxClose").click(function(){
			$("#myModal").hide();
		})
		$("#modalBoxOk").click(function(){
			
		})
		$("span").mouseover(function(){
			$("span").css({'cursor':'pointer'})
		})
		$("button").mouseover(function(){
			$("button").css({'cursor':'pointer'})
		})
		
	</script>
</body>
</html>