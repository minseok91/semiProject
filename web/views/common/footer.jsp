<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="chrome">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/footer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<footer>
	<div id="bottom-navbar">
		<div class="container">
			<div id="bn1">
				<a href="#" id="a1">개인정보취급방침</a>
				<a href="#" id="a2">이용약관</a>
				<a href="#" id="a3">전자금융거래이용약관</a>
			</div>
		</div>
	</div>
	<div id="bottom-footer">
		<div class="container">
			<div id="bf1">
				<p id="pbf1">
					<img src="<%= request.getContextPath() %>/img/LXN_logo.png" alt="" style="margin-bottom: 20px;"/>
				</p>
				
				<p id="pbf2" style="margin-top: 10px;">
					사이트명 : 중고명품 경매 럭션 | 상호명 : ㈜ 럭션<br />
					소재지 : 서울시 강남구 테헤란로 14길 6 남도빌딩2층<br>
					대표이사 : 윤혁준<br>
					사업자등록번호 : 123-45-67890 | FAX : 02-999-4989<br>			
				</p>
				
				<p id="pbf3">
					통신판매업신고 : 제 강남-9999호<br>
					개인정보 보호책임자 : 오수민<br>
					개인정보 보호기간 : 회원탈퇴시까지<br>
					email : lauxion@lxn.co.kr<br>					
				</p>
				
				<p id="pbf4">
					고객센터 : 1544-9999 <br> (월~금 09:00 ~ 18:00)<br><br>
				</p>
				
			</div>
		</div>
	</div>
</footer>
</html>