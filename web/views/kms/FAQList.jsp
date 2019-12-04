<%--
/**
 * <pre>
 * @Author      : minseok
 * @CreateDate  : Dec 4, 2019 6:20:19 PM
 * @ModifyDate  : Dec 4, 2019 6:20:19 PM
 * @fileName    : FAQList.jsp
 * @Description : FAQ 항목 리스트
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="images/lauction_favicon.png">
<title>FAQ</title>
<link rel="stylesheet" type="text/css" href="css/admin_FAQ.css">
<style>
	.reply{
		display:none;
	}
</style>
</head>
<body>
		<h3 align="center">FAQ</h3>
	<div id="container">
		
		<div id="container_Box">
			<div>
				<div>
					<table id="search_Box">
						<tr>
							<td>제목 검색</td>
							<td><input type="text" id="idSearch">
								<button id="idSearchBtn">검색</button></td>
						</tr>
					</table>
				</div>
				<div>
					<table id="search_Box">
						<tr>
							<td>카테고리 선택</td>
							<td><select>
									<option>-- 선택 --</option>
									<option>배송</option>
									<option>주문</option>
									<option>환불</option>
							</select></td>
						</tr>
					</table>
				</div>
			</div>
			<div>
				<div id="NoticeNumber">
					<p>총 게시판 수 :</p>
					<h4>4명</h4>
				</div>
				<table id="table">
					<tr>
						<th width="10%">No.</th>
						<th>제목</th>
						<th width="15%">등록일</th>
					</tr>
					<tr class="faq">
						<td>1</td>
						<td>비밀번호 찾기는 어떻게 하나요?</td>
						<td>2019-12-04</td>
					</tr>
					<tr class="reply">
						<td>A</td>
						<td>비밀번호 찾기는 마이페이지에서 회원정보 수정에서 가능합니다.
							비밀번호 찾기는 마이페이지에서 회원정보 수정에서 가능합니다.
							비밀번호 찾기는 마이페이지에서 회원정보 수정에서 가능합니다.</td>
						<td></td>
					</tr>
					<tr class="faq">
						<td>2</td>
						<td>[주문방법] 주문과 결제 방법은 어떻게?</td>
						<td>2019-12-04</td>
					</tr>
					<tr class="reply">
						<td>A</td>
						<td>우리는 대한민국의 건아들 아자아장자앚ㅇ
							우리는 대한민국의 건아들 아자아장자앚ㅇ
							우리는 대한민국의 건아들 아자아장자앚ㅇ</td>
						<td></td>
					</tr>
					<tr class="faq">
						<td>3</td>
						<td>[배송확인][배송비] 배송 관련 궁금한점을 모아봤습니다!</td>
						<td>2019-12-04</td>
					</tr>
					<tr class="reply">
						<td>A</td>
						<td>아브라카다브라 이루어져라 ㅁㅁㅁㅁㅁ
							우리는 대한민국의 건아들 아자아장자앚ㅇ
							우리는 대한민국의 건아들 아자아장자앚ㅇ</td>
						<td></td>
					</tr>
				</table>
				<div align="center">
				<span><<</span>
				<span><</span>
				<% for(int i = 1 ; i <= 10; i++) {%>
				<span> <%=i %></span>
				
				<% } %>
				<span>></span>
				<span>>></span>
				<button style="float:right" id="write">글쓰기</button>
				</div>
				
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
		$(function(){
			$(".faq").click(function(){
				$(this).css({"font-weight":"bold"});
				var tr = $(this).next().show();
				console.log(tr);
			});
			if(true){
				$(".reply").click(function(){
					$(this).prev().css({"font-weight":"normal"});
					var tr = $(this).hide();
					console.log(tr);
				});
			}
			
			$("#write").click(function(){
				alert("아브라 카다브라")
			})
			
		})
	
	</script>
</body>
</html>