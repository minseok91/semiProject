<%--
/**
 * <pre>
 * @Author      : apple
 * @CreateDate  : Dec 4, 2019 9:19:35 PM
 * @ModifyDate  : Dec 4, 2019 9:19:35 PM
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta content="text/html;">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/admin_appRequest.css">
 <style>
        /* The Modal (background) */
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
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
 	#acpContent{
 		/* display:hidden; */
 	}
 	#rejContent{
 		display:none;
 	}
</style>
</head>
<body>
<%@ include file="headerPage.jsp" %>
	<div id="container">
		<div id="container_Box">
			<div>
				<div>
					<table id="search_Box">
						<tr>
							<td>아이디 검색</td>
							<td>
								<input type="text" id="idSearch">
								<button id="idSearchBtn">검색</button>
							</td>
						</tr>
					</table>
				</div>
				<div>
					<table id="search_Box">
							<tr>
								<td>검색판명 선택</td>
								<td>
								<select>
									<option> -- 선택 -- </option>
									<option> 자유 게시판 </option>
									<option> 건의 게시판 </option>
									<option> 리뷰 게시판 </option>
								</select>
								</td>
							</tr>
						</table>
				</div>
			</div>
			<div>
			<div id="NoticeNumber">
				<p>총 게시판 수 :</p><h4>4명</h4>
			</div>
				<table id="table">
					<tr>
						<th>No.</th>
						<th>상품ID</th>
						<th>판매자ID</th>
						<th>게시판명</th>
						<th>목록보기</th>
						<th>내용보기</th>
						<th>글쓰기</th>
						<th>답변쓰기</th>
						<th>코멘트쓰기</th>
						<th>감정정보입력</th>
					</tr>
					 <tr>
						<td>1</td>
						<td>커뮤니티</td>
						<td>adh5677</td>
						<td>자유게시판</td>
						<td>전체</td>
						<td>전체</td>
						<td>전체</td>
						<td>전체</td>
						<td>전체</td>
						<td>
							<button class="insertApp">정보입력</button>
						</td>
					</tr>
					 <tr>
						<td>2</td>
						<td>커뮤니티</td>
						<td>kingminseok</td>
						<td>건의게시판</td>
						<td>관리자</td>
						<td>관리자</td>
						<td>사용자</td>
						<td>관리자</td>
						<td>관리자</td>
						<td>
							<button class="insertApp">정보입력</button>
						</td>
					</tr>
					 <tr>
						<td>3</td>
						<td>커뮤니티</td>
						<td>관리자</td>
						<td>공지</td>
						<td>전체</td>
						<td>전체</td>
						<td>관리자</td>
						<td>관리자</td>
						<td>관리자</td>
						<td>
							<button class="insertApp">정보입력</button>
						</td>
					</tr>
					
				</table>
			</div>
			<!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">감정정보 입력</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;">
					<input type="radio" name="choose" id="accept" value="accept" checked>
					<label for="accept">진품</label>
					<input type="radio" name="choose" id="reject" value="reject">
					<label for="reject">가품</label>
					<div id="acpContent">
						여기는 진품일 시에 넣는 공간
						<input type="text" id="acpName" value="">
						<label>진품입니까?</label>
						<input type="text" >
						<button >입력하기</button>
					</div>
					<div id="rejContent">
						<input type="text" id="rejName" value="">
						여기는 가품일 시에 넣는 공간
						<label>가품입니까?</label>
						<input type="text" >
						<button >입력하기</button>
					</div>

				</p>
                <p><br /></p>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;" >
                     닫기
                </span>
            </div>
      </div>
 
    </div>
        <!--End Modal-->


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
	function close_pop(flag) {
	      $('#myModal').hide();
	 };	
		$(function(){
			
			
			$(".insertApp").click(function(){
				$('#myModal').show();
				var pr = $(this).parent().parent('tr').children().eq(2).text();
				$("#acpName").val(pr);
				$("#rejName").val(pr);
				console.log("pr : "  + pr );
				/* var url = "FAQList.jsp";
	            var name = "popup test";
	            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
	            window.open(url, name, option); */
			})
			
			
			$("#accept").click(function(){
				
				$("#acpContent").show();
				$("#rejContent").hide();
			})
			
			$("#reject").click(function(){
				
				$("#rejContent").show();
				$("#acpContent").hide();
			})
		})
	</script>
	
</body>
</html>