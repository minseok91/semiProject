<%--
/**
 * <pre>
 * @Author      : minseok kim
 * @CreateDate  : Dec 5, 2019 11:19:07 AM
 * @ModifyDate  : Dec 5, 2019 11:19:07 AM
 * @fileName    : deliveryDetail.jsp
 * @Description : 	배송상세
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/deliveryList.css">
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
<%@ include file="../common/headerPage.jsp" %>
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
						<th>배송상태</th>
						<th>운송장번호</th>
					</tr>
					 <tr>
						<td>1</td>
						<td>pr001</td>
						<td>adh5677</td>
						<td>배송전<br>(목록에추간된시간)</td>
						<td id="del">
							<div id="delNum">354952299354</div><br>
							<select id="delName">
								<option value="kr.cjlogistics">CJ대한통운</option>
								<option value="kr.epost">우체국 택배</option>
								<option value="kr.lotte">롯데택배</option>
							</select>
							<button class="detail">배송정보</button>
						</td>
					</tr>
					 <tr>
						<td>2</td>
						<td>pr002</td>
						<td>kingminseok</td>
						<td>배송중<br>(시작시간)</td>
						<td id="del"><div id="delNum">6892110658249</div><br>
							<select id="delName">
								<option value="kr.cjlogistics">CJ대한통운</option>
								<option value="kr.epost">우체국 택배</option>
								<option value="kr.lotte">롯데택배</option>
							</select>
							<button class="detail">배송정보</button>
						</td>
					</tr>
					 <tr>
						<td>3</td>
						<td>pr003</td>
						<td>관리자</td>
						<td>배송완료<br>(완료된시간)</td>
						<td id="del"><div id="delNum">232192872730</div><br>
							<select id="delName">
								<option value="kr.cjlogistics">CJ대한통운</option>
								<option value="kr.epost">우체국 택배</option>
								<option value="kr.lotte">롯데택배</option>
							</select>
							<button class="detail">배송정보</button>
						</td>
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
	
	<!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">배송정보 입력</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;">
					<div id="deliNum">
						<label>상품ID</label>
						<input type="text" id="delPName" value="">
						<br>
						<label>운송장번호</label>
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
	<script>
	$(function(){
		var $tableTr = $("#table tr");
		
		$.each($tableTr, function(index, val){
			var $delTd = val.children[4];
			/* ajax로 데이터 가져오는 부분 */
			$.ajax({
				url:"https://apis.tracker.delivery/carriers/" + "kr.cjlogistics" + "/tracks/" + 354952299354,
				type:"get",
				success:function(data){
					var stateInfo = data.state.text;
					
					var div2 = document.createElement( 'div' );
					
					div2.innerHTML = stateInfo;
					
					if(index !== 0 ){
						$delTd.append(div2);
					}
				},
				error:function(error, status){
					console.log("서버 전송 실패 !");
				}
			})
		})
	})
	
	function close_pop(flag) {
	      $('#myModal').hide();
	 };	
	
	
	$(function(){
		$(".insertDel").click(function(){
			$('#myModal').show();
			var pr = $(this).parent().parent('tr').children().eq(1).text();
			$("#delPName").val(pr);
			$("#rejName").val(pr);
			console.log("pr : "  + pr );
			/* var url = "FAQList.jsp";
            var name = "popup test";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option); */
		})	
	})
	
	$(".detail").click(function(){
		var delNum = $(this).parent().parent().children().eq(4).children().eq(0).html();
		console.log(delNum);
		var delName = $(this).parent().parent().children().eq(4).children().eq(2).val();
		console.log(delName);
		window.open("https://tracker.delivery/#/"+ delName + "/" + delNum, "배송정보", "width=600, height=400, left=100, top=50");
	})
	
	</script>
</body>
</html>