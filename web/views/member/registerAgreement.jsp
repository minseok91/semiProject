<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<title>LauXion</title>
<style>
	html, body {
		margin: 0;
		pause: 0;
	}
	#header {
		height: 150px;
		width: 1600px;
		border: solid 1px;
		margin-bottom: 20px;
		margin-left: auto;
		margin-right: auto;
	}
	#container { 
		width: 1600px; 
		height: 100%;
		border: solid 1px;
		padding: 0;
		margin-left: auto;
		margin-right: auto;
	}
	ol {
		list-style: none;
		padding: 0;
		margin: 0;
	}
	#bigtitlelist > li{
		float: left;
		margin: 3px;
	}
	#bigtitlelist_div {
		height: 30px;
		border-bottom: solid 1px;
	}
	#agreement {
		margin: 0;
	}
	#agreement > ul{
		padding-left: 30px;
	}
	#agreement_dl {
		padding-bottom: 30px;
	}
	#usagreement {
		padding-left: 10px;
		padding-right: 10px;
		padding-top: 5px;
		padding-bottom: 5px;
		margin-bottom: 10px;
		border: solid 1px;
		height : 250px;
		overflow: scroll;
	}
	#usagreement_dd {
		margin-left: 20px;
		margin-right: 20px;
	}
	li {
		list-style: none;
	}
	ul {
		margin: 0;
	}
	#useragch{
		width: 100%;
	}
	#useragch > label,input{
		float: right;
	    padding-right:30px; 
	}
	#joinsec {
	
		margin-bottom: 80px;
	}
	#okButton {
		text-align: center;	
		margin-bottom: 30px;
	}
	#footer {
		height: 300px;
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>
	<div id="container">
		<div id="bigtitlelist_div">
			<ol id="bigtitlelist">
				<li>홈 ></li>
				<li>회원가입 ></li>
				<li>약관동의</li>
			</ol>
		</div>
		<div id="joinsec">
			<h2 alt="step1.약관동의"></h2>
				<dl id="agreement_dl">
					<dt>
						<img alt="약관동의" src="#">
					</dt>
					<dd id="agreement">
						<ul>
							<li>
								이용약관과 개인정보 보호정책은 GUGUS 사이트 이용과 GUGUS 서비스를 통한 상품매매 규정사항 입니다.
							</li>
							<li>
								가입 전에 반드시 읽어보시고, 동의를 하셔야 회원가입이 완료됩니다.
							</li>
						</ul>
					</dd>
				</dl>
				<dl>
					<dt>
						<img alt="회원가입 이용약관" src="#">
					</dt>
					<dd id="usagreement_dd">
						<div id="usagreement">
							<dl>
								<dt>제1조 (목적)</dt>
								<dd>
								이 약관은 LAUXION(전자상거래 사업자)가 운영하는 LAUXION 사이버 몰(이하 "몰"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 
								이용함에 있어 사이버 몰과 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.
								</dd>
							</dl>
							<dl>
								<dt>제2조(정의)</dt>
								<dd>
									① "몰"이란 재화 또는 용역(이하 "재화 등"이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
								</dd>
								<dd>
									② "이용자"란 "몰"에 접속하여 이 약관에 따라 "몰"이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
								</dd>
								<dd>
									③ "회원"이라 함은 "몰"에 개인정보를 제공하여 회원등록을 한 자로서, "몰"의 정보를 지속적으로 제공받으며, "몰"이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
								</dd>
								<dd>
									④ "비회원"이라 함은 회원에 가입하지 않고 "몰"이 제공하는 서비스를 이용하는 자를 말합니다.
								</dd>
								<dd>
									⑤ "위탁자"(이하 "판매자"라 함)란 재화를 판매할 의사로 해당 재화를 회사가 온라인으로 제공하는 양식에 맞추어 등록하고 재화를 위탁한 회원을 말하며, 법인사업자 및 개인사업자 등의 사업자는 회원가입을 할 수 없으며 위탁판매가 불가합니다.
								</dd>
								<dd>
									⑥ "구매자"란 위탁된 재화를 구매 또는 낙찰 받은 회원 또는 비회원을 말합니다.
								</dd>
							</dl>
							<dl>
								<dt>제3조 (약관의 명시와 개정)</dt>
								<dd>
									① "몰"은 이 약관의 내용과 상호, 대표자의 성명, 영업소 소재지, 사업자등록번호, 통신판매업신고번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 구구스 사이버 몰의 초기 서비스화면(전면)에 게시합니다. 다만 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
								</dd>
								<dd>
									② "몰"은 약관의규제에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
								</dd>
								<dd>
									③ "몰"이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행 약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.
								</dd>
								<dd>
									④ "몰"이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 "몰"에 송신하여 "몰"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
								</dd>
								<dd>
									⑤ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 정부가 제정한 전자거래소비자보호지침 및 관계법령 또는 상관례에 따릅니다.
								</dd>
							</dl>
							<dl>
								<dt>제4조 (서비스의 제공 및 변경)</dt>
								<dd>
									① "몰"은 다음과 같은 업무를 수행합니다.
									<ol>
										<li>
											1. 위탁판매 서비스: 회사가 인터넷사이트(http://www.LAUXION.co.kr)를 통하여 회원 상호간에 물품매매거래가 이루어질 수 있는 ON라인으로 거래장소를 제공하는 서비스 및 관련 부가서비스 일체를 말합니다.
										</li>
										<li>
											2. "몰"은 판매자를 대신하여 다음과 같은 업무를 수행합니다.
											<ul>
												<li>- 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결</li>
												<li>- 구매계약이 체결된 재화 또는 용역의 배송</li>
												<li>- 기타 "몰"이 정하는 업무</li>
											</ul>
										</li>
									</ol>
								</dd>
								<dd>
									② "몰"은 재화의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화·용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화·용역의 내용 및 제공일자를 명시하여 현재의 재화·용역의 내용을 게시한 곳에 그 제공일자 이전 7일부터 공지합니다.
								</dd>
								<dd>
									③ "몰"이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 "몰"은 이로 인하여 이용자가 입은 손해를 배상합니다. 단, "몰"에 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.
								</dd>
							</dl>
							<dl>
								<dt>제5조 (서비스의 중단)</dt>
								<dd>
									① "몰"은 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
								</dd>
								<dd>
									② 제1항에 의한 서비스 중단의 경우에는 "몰"은 제8조에 정한 방법으로 이용자에게 통지합니다.
								</dd>
								<dd>
									③ "몰"은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, "몰"에 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.
								</dd>
							</dl>
							<dl>
								<dt>제6조 (회원가입)</dt>
								<dd>
									① 이용자는 "몰"이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로써 회원가입을 신청합니다.
								</dd>
								<dd>
									② "몰"은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다.
									<ul>
										<li>1. 가입신청자가 이 약관 제7조 제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우. 다만, 제7조 제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 "몰"의 회원 재가입 승낙을 얻은 경우에는 예외로 한다.</li>
										<li>2. 등록 내용에 허위, 기재누락, 오기가 있는 경우</li>
										<li>3. 기타 회원으로 등록하는 것이 "몰"의 기술상 현저히 지장이 있다고 판단되는 경우</li>
									
									</ul>
								</dd>
								<dd>
									③ 회원가입계약의 성립시기는 "몰"의 승낙이 회원에게 도달한 시점으로 합니다.
								</dd>
								<dd>
									④ 회원은 제15조 제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 "몰"에 대하여 그 변경사항을 알려야 합니다.
								</dd>
							</dl>
							<dl>
								<dt>제7조 (회원 탈퇴 및 자격 상실 등)</dt>
								<dd>
									① 회원은 "몰"에 언제든지 탈퇴를 요청할 수 있으며 "몰"은 즉시 회원탈퇴를 처리합니다.
								</dd>
								<dd>
									② 회원이 다음 각호의 사유에 해당하는 경우, "몰"은 회원자격을 제한 및 정지시킬 수 있습니다.
									<ul>
										<li>1. 가입 신청 시에 허위 내용을 등록한 경우</li>
										<li>2. "몰"을 이용하여 구입한 재화·용역 등의 대금, 기타 "몰" 이용에 관련하여 회원이 부담하는 채무를 기일에 이행하지 않는 경우</li>
										<li>3. 다른 사람의 "몰" 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우</li>
										<li>4. "몰"을 이용하여 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우</li>
										<li>5. 판매자가 비정품을 위탁하는 경우</li>
									</ul>	
								</dd>
								<dd>
									③ "몰"이 회원 자격을 제한·정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 "몰"은 회원자격을 상실시킬 수 있습니다.
								</dd>
								<dd>
									④ "몰"이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 소명할 기회를 부여합니다.
								</dd>
							</dl>
							<dl>
								<dt>제8조 (회원에 대한 통지)</dt>
								<dd>
									① "몰"이 회원에 대한 통지를 하는 경우, 회원이 "몰"에 제출한 전자우편 주소로 할 수 있습니다.
								</dd>
								<dd>
									② "몰"은 불특정다수 회원에 대한 통지의 경우 1주일 이상 "몰" 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다.
								</dd>
							</dl>
							<dl>
								<dt>제9조 (구매신청)</dt>
								<dd>
									"몰" 이용자는 "몰" 상에서 이하의 방법에 의하여 구매를 신청합니다.
								</dd>
								<dd>
									① 성명, 주소, 전화번호, 전자우편주소의 입력
								</dd>
								<dd>
									② 재화 또는 용역의 선택
								</dd>
								<dd>
									③ 결제방법의 선택
								</dd>
								<dd>
									④ 이 약관에 동의한다는 표시(예, 마우스 클릭)
								</dd>
							</dl>
							<dl>
								<dt>제10조 (계약의 성립)</dt>
								<dd>
									① "몰"은 제9조와 같은 구매신청에 대하여 다음 각호에 해당하지 않는 한 승낙합니다.
									<ul>
										<li>1. 신청 내용에 허위, 기재누락, 오기가 있는 경우</li>
										<li>2. 기타 구매신청에 승낙하는 것이 "몰" 기술상 현저히 지장이 있다고 판단하는 경우</li>
									</ul>
								</dd>
								<dd>
									② "몰"의 승낙이 제12조 제1항의 수신확인통지 형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.
								</dd>
							</dl>
							<dl>
								<dt>제11조 (지급방법)</dt>
								<dd>
									"몰"에서 구매한 재화 또는 용역에 대한 대금 지급방법은 다음 각호의 하나로 할 수 있습니다.
								</dd>
								<dd>
									① 신용카드결제
								</dd>
							</dl>
							<dl>
								<dt>제12조 (수신확인 통지·구매신청 변경 및 취소)</dt>
								<dd>
									① "몰"은 이용자의 구매신청이 있는 경우 이용자에게 수신확인 통지를 합니다.
								</dd>
								<dd>
									② 수신확인 통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인 통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있습니다.
								</dd>
								<dd>
									③ "몰"은 배송 전 이용자의 구매신청 변경 및 취소 요청이 있는 때에는 지체없이 그 요청에 따라 처리합니다.
								</dd>
							</dl>
							<dl>
								<dt>제13조 (배송)</dt>
								<dd>
									"몰"의 모든 배송은 택배와 퀵 서비스에 의하고, 배송비용은 "몰" 내의 '상품배송'란에 준하며 배송기간은 결제확인 후 제 3영업일 이내에 배송됩니다. 만약 "몰"의 고의·과실로 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상합니다.
								</dd>
							</dl>
							<dl>
								<dt>제14조 (환급, 반품)</dt>
								<dd>
									① "몰"은 이용자가 구매신청한 재화 또는 용역이 품절 등의 사유로 재화의 인도 또는 용역의 제공을 할 수 없을 때에는 지체없이 그 사유를 이용자에게 통지하고, 사전에 재화 또는 용역의 대금을 받은 경우에는 대금을 받은 날부터 3일 이내에, 그렇지 않은 경우에는 그 사유발생일로부터 3일 이내에 계약해제 및 환급절차를 취합니다.
								</dd>
								<dd>
									② "몰"은 이용자의 개인적 사유로 반품을 요구할 시에는 재화가 이용자에게 도착 후 24시간 이내에 전화 또는 전자우편 기타 방법으로 통지 시에만 반품을 접수하며, 재화의 도착일은 반품 통지의사를 밝힌 날을 포함한 제 3영업일 이내에 "몰"에 도착 시에만 3일 이내(공휴일제외)에 전액 환불해 드립니다.
								</dd>
								<dd>
									③ "몰"은 반품불가의 조건이 있는 재화에 대하여는 반품접수 및 환불을 하지 않습니다. 만약 "몰"의 고의·과실로 재화에 대한 정보제공이 주문내용과 현저한 차이가 있는 경우에는 전액 환불해 드립니다.
								</dd>
								<dd>
									④ 이용자가 영업소 소재지에서 직접 구매한 재화는 반품접수가 되지 않습니다
								</dd>
								<dd>
									⑤ "몰"은 최종 이용자가 구매한 재화와 용역이 관련 전문점 최종확인 후 정품이 아닌 비정품 시에는 위 ②, ③, ④항의 모든 기일과 관계없이 3일 이내(공휴일제외)에 전액 환불해 드립니다. 단, 그에 대한 모든 민·형사상의 법적 책임 및 부대비용은 해당 재화의 위탁 의뢰자에게 있습니다
								</dd>
								<dd>
									⑥ 다음 각호의 경우에는 "몰"은 배송된 재화 일지라도 재화를 반품받은 다음 영업일 이내에 이용자의 요구에 따라 즉시 환급 및 반품 조치를 합니다. 다만, 그 요구기한은 배송된 날로부터 20일 이내로 합니다.
									<ul>
										<li>1. 배송된 재화가 주문내용과 상이하거나 "몰"이 제공한 정보와 상이할 경우</li>
										<li>2. 배송된 재화가 파손, 손상되었거나 오염되었을 경우</li>
										<li>3. 재화가 광고에 표시된 배송기간보다 늦게 배송된 경우</li>
										<li>4. 방문판매등에관한법률 제18조에 의하여 광고에 표시하여야 할 사항을 표시하지 아니한 상태에서 이용자의 청약이 이루어진 경우</li>
									</ul>
								</dd>
							</dl>
							<dl>
								<dt>제15조 (개인정보보호)</dt>
								<dd>
									① "몰"은 이용자의 정보수집 시 구매계약 이행에 필요한 최소한의 정보를 수집합니다. 다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다.
									<ul>
										<li>1. 성명</li>
										<li>2. 주민등록번호(회원의 경우)</li>
										<li>3. 주소</li>
										<li>4. 전화번호(자택, 이동통신 포함)</li>
										<li>5. 희망ID(회원의 경우)</li>
										<li>6. 비밀번호(회원의 경우)</li>
										<li>7. 전자우편(이메일) 주소</li>
									</ul>
								</dd>
								<dd>
									② "몰"이 이용자의 개인식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다.
								</dd>
								<dd>
									③ 제공된 개인정보는 당해 이용자의 동의없이 목적 외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 "몰"이 집니다. 다만, 다음의 경우에는 예외로 합니다.
									<ul>
										<li>1. 배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려 주는 경우</li>
										<li>2. 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우</li>
									</ul>
								</dd>
								<dd>
									④ "몰"이 ②항과 ③항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받는 자, 제공목적 및 제공할 정보의 내용)등 정보통신망이용촉진등에관한법률 제16조 제3항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.
								</dd>
								<dd>
									⑤ 이용자는 언제든지 "몰"이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 "몰"은 이에 대해 지체없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 "몰"은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
								</dd>
								<dd>
									⑥ "몰"은 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.
								</dd>
								<dd>
									⑦ "몰" 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체없이 파기합니다.
								</dd>
							</dl>
							<dl>
								<dt>제16조 ("몰"의 의무)</dt>
								<dd>
									① "몰은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화·용역을 제공하는 데 최선을 다하여야 합니다.
								</dd>
								<dd>
									② "몰"은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.
								</dd>
								<dd>
									③ "몰"이 상품이나 용역에 대하여 '표시·광고의공정화에관한법률' 제3조 소정의 부당한 표시·광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.
								</dd>
								<dd>
									④ "몰"은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.
								</dd>
								<dd>
									⑤ "몰은 위탁받은 제화에 대하여 적절한 절차를 거쳐 정품여부를 확인 후 판매합니다
								</dd>
							</dl>
							<dl>
								<dt>제17조 (회원의 ID 및 비밀번호에 대한 의무)</dt>
								<dd>
									① 제15조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.
								</dd>
								<dd>
									② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
								</dd>
								<dd>
									③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 "몰"에 통보하고 "몰"의 안내가 있는 경우에는 그에 따라야 합니다.
								</dd>
							</dl>
							<dl>
								<dt>제18조 (이용자의 의무)</dt>
								<dd>
									이용자는 다음 행위를 하여서는 안됩니다.
									<ul>
										<li>1. 비정품에 대한 모든 민·형사상의 법적 책임은 판매자에게 있습니다</li>
										<li>2. 신청 또는 변경시 허위내용의 등록</li>
										<li>3. "몰"에 게시된 정보의 변경</li>
										<li>4. "몰"이 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시</li>
										<li>5. "몰" 기타 제3자의 저작권 등 지적재산권에 대한 침해</li>
										<li>6. "몰" 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위</li>
										<li>7. 외설 또는 폭력적인 메시지·화상·음성 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위</li>
									</ul>
								</dd>
							</dl>
							<dl>
								<dt>제19조 (매매보호 서비스)</dt>
								<dd>
									① 회사는 위탁판매서비스를 제공하는 과정에서 대금의 수령, 보관 및 송금업무로 이루어지는 매매보호 서비스를 제공합니다. 이러한 매매보호 서비스는 위탁판매를 통하여 이루어지는 회원 상호간의 거래의 안전성과 신뢰성을 도모하고 구매자를 보호하기 위한 목적에서 제공하는 장치이므로 회사가 매매보호 서비스를 통하여 판매자 또는 구매자를 대리, 대행하거나 그 이행을 보조하는 것은 아닙니다.
								</dd>
								<dd>
									② 회사가 제공하는 매매보호 서비스는 기본적인 위탁판매서비스에 포함됩니다.
								</dd>
								<dd>
									③ 매매보호 서비스의 일환으로 이루어지는 대금보관으로 인하여 회사가 취득하는 이자 등은 서비스 제공의 대가이므로 회원은 회사에 대하여 이자 등의 반환을 청구할 수 없고, 대금송금으로 인하여 발생하는 수수료는 대금을 송금하는 회사가 부담합니다.
								</dd>
								<dd>
									④ 회사가 제공하는 매매보호 서비스를 이용하지 않은 거래 및 물품 또는 매매보호 서비스를 이용한 거래 및 물품에 대하여 매매보호 서비스가 종결된 경우 해당 거래와 관련하여 발생한 모든 사항은 판매자와 구매자가 상호협의를 통해 해결하여야 합니다.
								</dd>
								<dd>
									⑤ 판매자는 회사가 제공하는 서비스를 이용함에 있어서 매매보호 서비스의 이용과 그 규칙에 동의하여야 합니다.
								</dd>
							</dl>
							<dl>
								<dt>제20조 (연결 "몰"과 피연결 "몰" 간의 관계)</dt>
								<dd>
									① 상위 "몰"과 하위 "몰"이 하이퍼 링크(예 : 하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 "몰"(웹 사이트)이라고 하고 후자를 피연결 "몰"(웹 사이트)이라고 합니다.
								</dd>
								<dd>
									② 연결 "몰"은 피연결 "몰"이 독자적으로 제공하는 재화·용역에 의하여 이용자와 행하는 모든 거래에 대해서 보증책임을 지지 않습니다.
								</dd>
							</dl>
							<dl>
								<dt>제21조 (저작권의 귀속 및 이용제한)</dt>
								<dd>
									① "몰"이 작성한 저작물에 대한 저작권 기타 지적재산권은 "몰"에 귀속합니다.
									
								</dd>
								<dd>
									② 이용자는 "몰"을 이용함으로써 얻은 정보를 "몰"의 사전 승낙없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
									
								</dd>
							</dl>
							<dl>
								<dt>제22조 (분쟁해결)</dt>
								<dd>
									① "몰"은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치·운영합니다.
								</dd>
								<dd>
									② "몰"은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.
								</dd>
								<dd>
									③ "몰"과 이용자간에 발생한 분쟁은 전자거래기본법 제28조 및 동 시행령 제15조에 의하여 설치된 전자거래분쟁조정위원회의 조정에 따를 수 있습니다.
								</dd>
							</dl>
							<dl>
								<dt>제23조 (재판권 및 준거법)</dt>
								<dd>
									"몰"과 이용자간에 발생한 전자거래 분쟁에 관한 소송은 "몰"의 영업소 소재지 관할법원으로 합니다.
								</dd>
							</dl>
							<dl>
								<dt></dt>
								<dd>
									① 회사는 수수료율을 해당 몰의 "이용안내" 코너의 '위탁 수수료'에 공지하며 수수료의 변경은 이메일 발송과 해당 몰 내에 공지하는 것으로 갈음한다.
								</dd>	
								<dd>
									② 판매자는 위탁한 제품이 일정기간 판매되지 않을 경우 스스로 가격인하를 할 수 있으며, 3개월이상 장기간 판매되지 않을 경우에는 판매가격의 10%를 자동적으로 인하하여 판매한다.
								</dd>
								<dd>
									③ 위탁판매기간은 최소 2개월에서 최소 12개월(1년)로 하며 위탁기간 내 에 회수하는 경우 1개월 이내 회수는 3만원, 1개월 초과 2개월 이내 회수는 1만원의 위약금을 판매자에게 부과한다.
								</dd>
								<dd>
									④ "몰"에서 판매하는 상품을 구매하는 회원자격의 구매자나 "몰"에 재화를 위탁한 회원자격의 판매자에게 거래 실적에 부수하여 회사는 회원자격의 구매자와 판매자에게 몰의 "이용안내" 코너의 '포인트 적립제도'에 약정한 바에 따라 '포인트'를 제공하며, 회원자격의 구매자가 일정량 이상 적립된 포인트를 일부 결제수단으로 활용하여 "몰"의 상품이나 용역을 구입할 수 있다.
								</dd>
								<dd>
									⑤ "몰"은 위탁 가능한 브랜드를 "위탁센터" 코너 '위탁 브랜드'에 공지하며 위탁 받을 제화의 브랜드 종류가 적정한 가를 수시로 검토하여 위탁 브랜드를 변경(추가 및 삭제)할 수 있다.
								</dd>
								<dd>
									⑥ 회사는 위탁 불가 상품 및 위탁 판매 기간이 1년이 경과된 상품에 대하여 판매자의 동의 없이 상품 회수를 진행할 수 있으며, 상품의 전달은 택배(착불)를 원칙으로 한다.
								</dd>
								<dd>
									⑦ 회수 통보 후 30일 이내 회수되지 않은 상품은 판매자의 회원정보에 기재된 주소로 택배(착불) 발송되며, 주소지 불분명, 연락 두절 등의 사유로 인해 반송되는 제품은 회사에서 임의 폐기처분 되며, 판매자는 이에 이의를 제기할 수 없다.
								</dd>
							</dl>
						</div>
					</dd>
				</dl>
				<p id="useragch">
				<label for="nouserag">동의안함</label><input type="radio" id="nouserag" name="userag">
					<label for="userag">동의함</label><input type="radio" id="userag" name ="userag">
				</p>
		</div>
		<div id="joinsec">
			<dl>
				<dt>
					<img alt="개인정보 수집,이용" src="#">
				</dt>
				<dd id="usagreement_dd">
					<div id="usagreement">
						<dl>
							<dt>수집하는 개인정보 항목</dt>
							<dd>
								회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
								<ol>
									<li>수집항목 : 이름 , 로그인ID , 비밀번호 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 , 직업 , 회사명 , 회사전화번호 , 주민등록번호 , 은행계좌 정보 , 쿠키 , 접속 IP 정보</li>
									<li>개인정보 수집방법 : 홈페이지(회원가입,상담게시판 등)</li>		
								</ol>
							</dd>
						</dl>
						<dl>
							<dt>개인정보의 수집 및 이용목적</dt>
							<dd>
								회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.
								<ul>
									<li>서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
										<ul>
											<li>- 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송
											</li>
										</ul>
									</li>
									<li>회원 관리
										<ul>
											<li>- 회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 가입 의사 확인 , 불만처리 등 민원처리 , 고지사항 전달</li>
										</ul>
									</li>
									<li>
										마케팅 및 광고에 활용
										<ul>
											<li>- 신규 서비스(제품) 개발 및 특화 , 이벤트 등 광고성 정보 전달 , 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계</li>
										</ul>
									</li>
								</ul>
							</dd>
						</dl>
						<dl>
							<dt>개인정보의 보유 및 이용기간</dt>
							<dd>
								원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.
								<ul>
									<li>보존 항목 : 이름 , 로그인ID , 비밀번호 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 , 직업 , 회사명 , 회사전화번호 , 주민등록번호 , 은행계좌 정보</li>
									<li>보존 근거 : 전자상거래등에서의 소비자보호에 관한 법률</li>
									<li>보존 기간 : 5년</li>
								</ul>
							</dd>
							<dd>
								계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)
							</dd>
							<dd>
								대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)
							</dd>
							<dd>
								소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래등에서의 소비자보호에 관한 법률)
							</dd>
						</dl>
					</div>
					<p id="useragch">
					<label for="nouserag">동의안함</label><input type="radio" id="nouserag" name="userag">
					<label for="userag">동의함</label><input type="radio" id="userag" name ="userag">
				</p>
				</dd>
			</dl>
		</div>
		<div id="okButton">
				<a href="<%= request.getContextPath() %>/views/member/registerInfo.jsp">
					<img alt="다음" src="#">
				</a>
				<a href="<%= request.getContextPath() %>/index.jsp">
					<img alt="취소" src="#">
				</a>
			</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>