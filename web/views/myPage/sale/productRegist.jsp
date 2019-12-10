<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	.container {
		margin: 0 auto;
		padding-bottom: 10px;
	}
	.container>#myPageMenu{
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
	#h3{
		font-family: 'Nanum Myeongjo', serif;
		background-color: #211f22;
		padding-top: 7px;
		padding-bottom: 7px;
		color: #a07342;
		margin-top: 0px;
	}
	
	.container>#myPageMenu>dl>dd>a{
		color: darkgray;
		text-decoration: none;
	}
	.container>#myPageMenu>dl>dd>#selectMenu{
		font-size: 1em;
		font-weight: bold;
		color: black;
		text-decoration: underline;
	}
	.container>#myPageMenu>dl>dd>a:hover{
		font-size: 1em;
		font-weight: bold;
		color: black;
		text-decoration: underline;
	}
	.container>.menuStatus{
		width: 920px;
		height: 110px;
		display: inline-block;
		margin-left: 10px;
	}
	.container>.menuStatus>.status1>h3{
		margin-top:10px;
	}
	.container>.menuStatus>.status2{
		width: 920px;
		height: 54px;
		background-color: lightgray;
		vertical-align: middle;

	}
	.container>.menuStatus>.status2>p{
		padding-top: 16px;
		padding-left: 30px;
		font-size: 17px;
	}
	.container>.contentArea{
		width: 920px;
		height: 970px;
		border: 1px solid black;
		display: inline-block;
		margin-left: 10px;
		
	}
	#picArea{
		width:29%;
		border:1px solid black;
		height:300px;
		display:inline-block;
		float:left;
		text-align:center;
	}
	#contArea{
		width:70%;
		border:1px solid black;
		height:300px;
		display:inline-block;
		float:left;
	}
	#regist{
	
	}
	.picSmall{
		display:inline-block;
		width:50px;
		height:50px;
		border:1px solid black;
	}
	
	
</style>
</head>
<body>
	<%@ include file="../../common/header.jsp" %>
	<%@ include file="../../common/nav.jsp" %>
	<div class="container">
		<div id="myPageMenu">
			<h3 id="h3" align="center">마이페이지</h3>
			<dl>
				<dt>§  구매정보</dt>
				<dd><a id=selectMenu value="buy/wishList">▶   위시리스트</a></dd>
				<dd><a value="buy/biddingList">▶   입찰리스트</a></dd>
				<dd><a value="buy/winningList">▶   낙찰리스트</a></dd>
				
				<dt>§  판매정보</dt>
				<dd><a value="sale/productAppRequest" id="selectMenu">▶  상품감정 신청</a></dd>
				<dd><a value="sale/goodsEnrollList">▶  등록상품 관리</a></dd>
				<dd><a value="sale/auctionList">▶  경매 진행 상품 관리</a></dd>
				<dd><a value="sale/auctionDeadline">▶  경매 마감 상품 관리</a></dd>
				
				<dt>§  결제/배송조회</dt>
				<dd><a value="delivery/paymentList">▶  결제 내역</a></dd>
				<dd><a value="delivery/apprDeli">▶  감정 상품 배송 조회</a></dd>
				<dd><a value="delivery/sellDeli">▶  구매 상품 배송 조회</a></dd>
				
				<dt>§  문의 및 신고</dt>
				<dd><a value="queAndReport/questionList">▶  문의 내역</a></dd>
				<dd><a value="queAndReport/reportList">▶  신고 내역</a></dd>
				
				<dt>§  회원정보</dt>
				<dd><a value="memberChange/userInfoChange">▶  회원정보 변경</a></dd>
				<dd><a value="memberChange/userDelete">▶  회원 탈퇴</a></dd>
				
			</dl>
		</div>  <!-- myPageMenu end -->
		<div class="menuStatus">
			<div class="status1">
				<h3>&nbsp;&nbsp;<&nbsp;상품등록 &nbsp;>&nbsp;</h3>
			</div>  <!-- status1 end -->
			<div class="status2">
				<p>상품을 등록하는 공간입니다. 이미지는 1개 이상 등록해주세요</p>
			</div>  <!-- status2 end -->
		</div>  <!-- menuStatus end -->
		<div class="contentArea">
			<div id="picArea">
				<img src="../../img/step01.png">
				<input type="file" value="사진업로드">
				<div class="picSmall"  ></div>
				<div class="picSmall"  ></div>
				<div class="picSmall" ></div>
				<div class="picSmall" ></div>
				<div class="picSmall" ></div>
				<div class="picSmall" ></div>
				<div class="picSmall" ></div>
				<div class="picSmall" ></div>
			</div>
			<div id="contArea">
			<div>
			<label>종류</label>
			<select>
				<option>시계</option>
				<option>가방</option>
			</select>
			<label>브랜드</label>
			<select name="brand" onchange="setBaseModelSelect()" id="brand" class="span3">
<option value="aba">A BATHING APE</option>
<option value="ls">A.Lange &amp; Sohne</option>
<option value="ax">ALEXANDER SHOROKHOFF</option>
<option value="aw">Aerowatch</option>
<option value="ag">Aigner</option>
<option value="as">Alain Silberstein</option>
<option value="axm">Alexander McQueen</option>
<option value="aww">Alexander Wang</option>
<option value="ar">Alfred Rochat</option>
<option value="al">Alpina</option>
<option value="ak">Anne Klein</option>
<option value="an">Anonimo</option>
<option value="atp">Anteprima</option>
<option value="at">Antoine Preziuso</option>
<option value="anh">Anya Hindmarch</option>
<option value="pl">Apple</option>
<option value="aq">Aquanautic</option>
<option value="ac">Armand Nicolet</option>
<option value="ad">Arnold &amp; Son</option>
<option value="ap">Audemars Piguet</option>
<option value="am">Auguste Reymond</option>
<option value="brm">B.R.M</option>
<option value="ba">Balenciaga</option>
<option value="bw">Ball Watch</option>
<option value="by">Bally</option>
<option value="bm">Baume &amp; Mercier</option>
<option value="bd">Bedat &amp; Co.</option>
<option value="br">Bell &amp; Ross</option>
<option value="be">Berluti</option>
<option value="bp">Blancpain</option>
<option value="bmb">Bomberg</option>
<option value="btg">Bottega Veneta</option>
<option value="bn">Boucheron</option>
<option value="bo">Bovet</option>
<option value="bg">Breguet</option>
<option value="bl">Breitling</option>
<option value="bu">Bulova</option>
<option value="bb">Burberry</option>
<option value="bt">Buti</option>
<option value="bv">Bvlgari</option>
<option value="cln">CELINE</option>
<option value="cdg">COMME des GARÇONS</option>
<option value="ck">Calvin Klein</option>
<option value="mp">Campanola</option>
<option value="cn">Candino</option>
<option value="cb">Carl F.Bucherer</option>
<option value="cf">Carlo Ferrara</option>
<option value="ca">Cartier</option>
<option value="cs">Casio</option>
<option value="ce">Certina</option>
<option value="ch">Chanel</option>
<option value="cl">Charriol</option>
<option value="cm">Chaumet</option>
<option value="xe">Chloe</option>
<option value="cp">Chopard</option>
<option value="cd">Christian Dior</option>
<option value="clb">Christian Louboutin</option>
<option value="cw">Chronoswiss</option>
<option value="ci">Citizen</option>
<option value="co">Coach</option>
<option value="cc">Concord</option>
<option value="cr">Corum</option>
<option value="crd">Credor</option>
<option value="cy">Cuervo Y Sobrinos</option>
<option value="cv">Cvstos</option>
<option value="dr">Daniel Roth</option>
<option value="dv">Davosa</option>
<option value="db">De Witt</option>
<option value="dt">De bethune</option>
<option value="di">Diesel</option>
<option value="doh">Dior Homme</option>
<option value="dx">Doxa</option>
<option value="dm">Dr. Marten</option>
<option value="ds">Dubey &amp; Schaldenbrand</option>
<option value="dh">Dunhill</option>
<option value="els">ELYSEE</option>
<option value="eb">Ebel</option>
<option value="eh">Eberhard</option>
<option value="ed">Edox</option>
<option value="eg">Elgin</option>
<option value="ea">Emporio Armani</option>
<option value="ep">Epos</option>
<option value="zgn">Ermenegildo Zegna</option>
<option value="er">Eterna</option>
<option value="ec">European Company Watch</option>
<option value="fp">F.P.Journe</option>
<option value="fe">Fendi</option>
<option value="fs">Festina</option>
<option value="fl">Filson</option>
<option value="fo">Fortis</option>
<option value="fm">Franck Muller</option>
<option value="fc">Frederique Constant</option>
<option value="frl">Furla</option>
<option value="gmn">GARMIN</option>
<option value="gvc">GIVENCHY</option>
<option value="gl">GOLDEN GOOSE</option>
<option value="gm">GaGa Milano</option>
<option value="ga">Gant</option>
<option value="ggj">Georg Jensen</option>
<option value="gg">Gerald Genta</option>
<option value="gp">Girard Perregaux</option>
<option value="go">Glashutte Original</option>
<option value="gc">Glycine</option>
<option value="gr">Graham</option>
<option value="gs">Grand Seiko</option>
<option value="gu">Gucci</option>
<option value="hm">H. Moser &amp; cie</option>
<option value="ha">Hamilton</option>
<option value="hr">Harry Winston</option>
<option value="hlk">Helen Kaminski</option>
<option value="he">Hermes</option>
<option value="hl">Hublot</option>
<option value="hw">Hunting World</option>
<option value="hg">Hysteric Grammer</option>
<option value="it">I.T.A</option>
<option value="iw">IWC</option>
<option value="ic">Ice Watch</option>
<option value="ja">Jacob &amp; Co.</option>
<option value="jl">Jaeger Lecoultre</option>
<option value="jd">Jaquet Droz</option>
<option value="jr">Jean Richard</option>
<option value="jc">Jimmy Chow</option>
<option value="lo">John Lobb</option>
<option value="jh">Junghans</option>
<option value="jv">Juvenia</option>
<option value="ks">Kate Spade</option>
<option value="lc">Laco</option>
<option value="lp">Lip</option>
<option value="lg">Longines</option>
<option value="le">Louis Erard</option>
<option value="lv">Louis Vuitton</option>
<option value="lu">Luminox</option>
<option value="ma">MARNI</option>
<option value="mcm">MCM</option>
<option value="me">MECCANICHE VELOCI</option>
<option value="mj">Marc Jacobs</option>
<option value="ml">Maurice Lacroix</option>
<option value="mm">Mauron Musy</option>
<option value="mb">Max Bill</option>
<option value="ms">Meister Singer</option>
<option value="mmg">Memorigin</option>
<option value="mk">Michael Kors</option>
<option value="mid">Mido</option>
<option value="miu">Miu Miu</option>
<option value="mo">Montblanc</option>
<option value="mv">Movado</option>
<option value="mg">Muhle Glashutte</option>
<option value="ni">NIKE</option>
<option value="nx">NIXON</option>
<option value="no">Nomos</option>
<option value="oa">Obaku Watches</option>
<option value="ob">Obrey</option>
<option value="on">Oceanaut</option>
<option value="om">Omega</option>
<option value="ot">Orient</option>
<option value="or">Oris</option>
<option value="orb">Orobianco</option>
<option value="pn">Panerai</option>
<option value="pf">Parmigani Fleurier</option>
<option value="pa">Patek Philippe</option>
<option value="pp">Paul Picot</option>
<option value="pr">Perrelet</option>
<option value="pst">Philip Stein</option>
<option value="pd">Philippe Dufour</option>
<option value="pi">Piaget</option>
<option value="pk">Pierrekunz</option>
<option value="po">Porsche Design</option>
<option value="prd">Prada</option>
<option value="rd">Rado</option>
<option value="rw">Raimond Weil</option>
<option value="re">Regal</option>
<option value="rt">Revue Thommen</option>
<option value="rm">Richard Mille</option>
<option value="ro">Roamer</option>
<option value="rbc">Roberto Cavalli</option>
<option value="rg">Roger Dubuis</option>
<option value="rx" selected="selected">Rolex</option>
<option value="rj">Romain Jerome</option>
<option value="sg">SKAGEN</option>
<option value="sm">STELLA MCCARTNEY</option>
<option value="sts">STUSSY</option>
<option value="swa">SWATCH</option>
<option value="slr">Saint Laurent</option>
<option value="svf">Salvatore Ferragamo</option>
<option value="sv">Samantha Thavasa</option>
<option value="sc">Sarcar</option>
<option value="sb">Schauburg</option>
<option value="sec">Sector</option>
<option value="sbc">See By Chloe</option>
<option value="se">Seiko</option>
<option value="sf">Seven Friday</option>
<option value="sh">Shellman</option>
<option value="si">Sinn</option>
<option value="sq">Squale</option>
<option value="st">Stowa</option>
<option value="spr">Supreme</option>
<option value="sn">Suunto</option>
<option value="tw">TID Watches</option>
<option value="to">TOD'S</option>
<option value="tr">TRASER</option>
<option value="uc">TSUMORI CHISATO</option>
<option value="ta">Tag Heuer</option>
<option value="tb">Ted Baker</option>
<option value="tem">Temption</option>
<option value="td">Tendence</option>
<option value="tc">Tiffany</option>
<option value="tl">Timberland</option>
<option value="ti">Tissot</option>
<option value="tu">Tudor</option>
<option value="tm">Tutima</option>
<option value="ub">U-BOAT</option>
<option value="un">Ulysse Nardin</option>
<option value="ug">Universal Geneve</option>
<option value="vc">Vacheron Constantin</option>
<option value="va">Van Cleef &amp; Arpels</option>
<option value="vn">Victorinox</option>
<option value="vm">Vince Camuto</option>
<option value="vb">Vincent Calabrese</option>
<option value="vt">Visconti</option>
<option value="vw">Vivienne Westwood</option>
<option value="vl">Vulcain</option>
<option value="wc">WANCHER</option>
<option value="wm">Wakmann</option>
<option value="wa">Waltham</option>
<option value="ysl">YVES SAINT LAURENT</option>
<option value="ze">Zenith</option>
<option value="zw">Zeno-Watch Basel</option>
<option value="zp">Zeppelin</option>
<option value="zd">Zodiac</option>
<option value="et">_기타</option>
<option value="dg">de Grisogono</option>
<option value="dc">deLaCour</option>
<option value="mnp">mina perhonen</option>
</select>
			</div>
			<div>
				<label>모델명</label>
				<input type="text">
				<label>구매일자</label>
				<input type="date">
			</div>
			<br>
			<label>상세설명</label>
			<br>
			<textarea style="width: inherit; height:50px" >
			
			
			</textarea>
			</div>
			<button id="regist" align="center">등록하기</button>




						
		</div>  <!-- contentArea end -->
	</div>  <!-- container end -->
	<%@ include file="../../common/footer.jsp" %>

	<script>
		$(function() {
			$('a').click(function() {
				let values=$(this).attr('value');
				console.log(values);
				location.href='<%= request.getContextPath() %>/views/myPage/'+values+'.jsp';
			})
		});
	</script>
</body>
</html>