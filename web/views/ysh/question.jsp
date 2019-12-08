<%--
/**
 * <pre>
 * @Author      : minseok
 * @CreateDate  : 2019. 12. 5. 오후 5:23:37
 * @ModifyDate  : 2019. 12. 5. 오후 5:23:37
 * @fileName    : question.jsp
 * @Description : 문의사항 입력 페이지
 * </pre>
 */
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.container {
	margin: 0 auto;
	padding-bottom: 10px;
}

.container>#myPageMenu {
	width: 210px;
	height: 1080px;
	border-right: 2px solid black;
	display: inline-block;
	float: left;
}

.container>#myPageMenu>dl>dt {
	font-size: 1.5em;
	font-family: 'Nanum Myeongjo', serif;
	margin-top: 50px;
	margin-bottom: 10px;
}

.container>#myPageMenu>dl>dd {
	font-size: 15px;
	margin-left: 20px;
	margin-top: 7px;
	margin-bottom: 7px;
}

#h3 {
	font-family: 'Nanum Myeongjo', serif;
	background-color: #211f22;
	padding-top: 7px;
	padding-bottom: 7px;
	color: #a07342;
	margin-top: 0px;
}

.container>#myPageMenu>dl>dd>a {
	color: darkgray;
	text-decoration: none;
}

.container>#myPageMenu>dl>dd>#selectMenu {
	font-size: 1em;
	font-weight: bold;
	color: black;
	text-decoration: underline;
}

.container>#myPageMenu>dl>dd>a:hover {
	font-size: 1em;
	font-weight: bold;
	color: black;
	text-decoration: underline;
}

.container>.menuStatus {
	width: 920px;
	display: inline-block;
	margin-left: 10px;
	border-bottom: 1px solid #000;
}

.container>.menuStatus>.status2 {
	display: flex;
	width: 920px;
	height: 54px;
	background-color: lightgray;
	padding-left: 25px;
    padding-top: 18px;
}

.status2>p:nth-of-type(2) {
	padding-left: 10px;
    color: #f00;
    font-weight: bold;
}

.contentArea {
	display: flex;
	position: relative;
	width: auto;
	margin-top: 75px;
	left: 2%;
}

.contentArea>table>tbody>tr>th, .contentArea>table>tbody>tr>td {
	width: auto;
	border-bottom: 1px solid #d9d9d9;
	padding: 5px;
	font-size: 15px;
	text-align: center;
}

.contentArea>table>tbody>tr>td>img {
	width: 100px;
	height: 100px;
}

.contentArea>table>tbody>tr>th  {
	background: #f5efe7;
	border-top: 1px solid #3e2d1a;
}
#queNoti{
	border:1px solid black;
	width:700px;
	background:#f9faf1;
	margin-left:210px;
}
li{
	list-style:none;
	width:20%;
	display:inline-block;
	margin:0;
	padding-left:0;
	float:left;
}
.textArea{
	background:#f6f6f6;
}
</style>
<meta charset="UTF-8">
<title>LauXion</title>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>
	<div class="container">
		<div id="myPageMenu">
			<h3 id="h3" align="center">마이페이지</h3>
			<dl>
				<dt>§  구매정보</dt>
				<dd><a href="">▶   위시리스트</a></dd>
				<dd><a href="" >▶   입찰리스트</a></dd>
				<dd><a href="">▶   낙찰리스트</a></dd>
				
				<dt>§  판매정보</dt>
				<dd><a href="">▶  상품감정 신청</a></dd>
				<dd><a href="">▶  등록상품 관리</a></dd>
				<dd><a href="">▶  경매 진행 상품 관리</a></dd>
				<dd><a href="">▶  경매 마감 상품 관리</a></dd>
				
				<dt>§  결제/배송조회</dt>
				<dd><a href="">▶  결제 내역</a></dd>
				<dd><a href="">▶  감정 상품 배송 조회</a></dd>
				<dd><a href="">▶  구매 상품 배송 조회</a></dd>
				
				<dt>§  메세지</dt>
				<dd><a href="">▶  전체 메세지</a></dd>
				<dd><a href="">▶  받은 메세지</a></dd>
				<dd><a href="">▶  보낸 메세지</a></dd>
				
				<dt>§  문의 및 신고</dt>
				<dd><a href="" id="selectMenu">▶  문의 내역</a></dd>
				<dd><a href="">▶  신고 내역</a></dd>
				
				<dt>§  회원정보</dt>
				<dd><a href="">▶  회원정보 변경</a></dd>
				<dd><a href="">▶  회원 탈퇴</a></dd>
				
			</dl>
		</div>  <!-- myPageMenu end -->
		<div class="menuStatus">
			<div class="status1">
				<h3>&nbsp;&nbsp;<&nbsp;문의 상세 &nbsp;>&nbsp;</h3>
			</div>  <!-- status1 end -->
			<div class="status2">
				<p>문의하신 내용과 답변입니다.</p>
			</div>  <!-- status2 end -->
		</div>  <!-- menuStatus end -->
		<div class="contentArea">
		<table cellspacing="0" cellpadding="0" class="tb_sosmail mgt15">
						<colgroup><col width="85">
						</colgroup><tbody><tr>
						<hr>
							<th class="con">제목</th>
							<td class="con">
								<input type="text" class="border_popep textArea" style="width:560px;height:20px;" name="sosTitle" value="">
							</td>
						</tr>
						<tr>
							<th class="con">세부분류</th>
							<td class="con">
								<ul class="soskind_list">
									<li><input type="radio" name="majorTp" value="CST0102" onclick="chg_kindcon(1);">주문</li>
									<li><input type="radio" name="majorTp" value="CST0130" onclick="chg_kindcon(2);">결제</li>
									<li><input type="radio" name="majorTp" value="CST0105" onclick="chg_kindcon(3);">환불</li>
									<li><input type="radio" name="majorTp" value="CST0106" onclick="chg_kindcon(4);">회원</li>
									<li><input type="radio" name="majorTp" value="CST0107" onclick="chg_kindcon(5);">GiftCard</li>
									<li><input type="radio" name="majorTp" value="CST0140" onclick="chg_kindcon(6);">I-Point</li>
									<li><input type="radio" name="majorTp" value="CST0108" onclick="chg_kindcon(7);">서비스</li>
									<li><input type="radio" name="majorTp" value="CST0131" onclick="chg_kindcon(8);">배송</li>
									<li><input type="radio" name="majorTp" value="CST0112" onclick="chg_kindcon(9);">반품</li>
									<li><input type="radio" name="majorTp" value="CST0113" onclick="chg_kindcon(10);">교환</li>
									<li><input type="radio" name="majorTp" value="CST0118" onclick="chg_kindcon(11);">판매관련</li>
									<li><input type="radio" name="majorTp" value="CST0121" onclick="chg_kindcon(0);">고객제안</li>
								</ul>
							</td>
						</tr>
						<tr>
							<th class="con">문의내용</th>
							<td class="con">
								<ul class="soskind_list">
									<li>
									<textarea rows="10" cols="120" class="textArea"></textarea>
									</li>
								</ul>
							</td>
						</tr>
						<tr>
							<th class="con">답변내용</th>
							<td class="con">
								<ul class="soskind_list">
									<li>
									<textarea rows="10" cols="120" class="textArea"></textarea>
									</li>
								</ul>
							</td>
						</tr>
					</tbody>
					</table>
					
					
			<!-- <div id="queNoti">
				<ul>
					<li>도서 관련 문의는 도서 > 고객센터로 문의해주세요.</li>
					<li>마트 관련 문의는 마트 > 고객센터로 문의해주세요.</li>
					<li>항공 및 여행 관련 문의는 여행 > 고객센터로 문의해주세요.</li>
					<li>E미용실 관련 문의는 포도커뮤니케이션 고객센터(02-514-9960)에서 전담하고 있습니다.</li>
				</ul>
			</div>
			<hr>
			<div id="title">
				<label>제목</label> 
				<input type="text" value="" placeholder="제목을 입력하세요">
			</div>
			<hr>
			<div id="category">
				<label for="order">주문</label>
				<input type="radio" id="order" name="category">
				<label for="payment">결제</label>
				<input type="radio" id="payment" name="category">
				<label for="refund">환불</label>
				<input type="radio" id="refund" name="category">
				<label for="member">회원</label>
				<input type="radio" id=""member"" name="category">
			</div>
			<hr>
			<div id="notiContent">
				<textarea rows="10" cols="120">
				
				
				
				</textarea>
			</div>
			<button type="submit">문의하기</button> -->
			
			
		</div> <!-- contentArea End -->
	</div> <!-- container End -->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>