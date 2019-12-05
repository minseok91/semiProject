$(function(){
			$(document).mouseover(function(e){
				//		console.log(e.target.innerText);
				if( e.target.innerText == "회원 정보" || e.target.innerText == "게시판 관리"){
					if(e.target.innerText == "회원 정보"){
						$("#usermit > li").show(0);
						$("#notice > li").hide(0);
						
					} else if(e.target.innerText == "게시판 관리") {
						$("#usermit > li").hide(0);
						$("#notice > li").show(0);
					}
					$("#bottom").animate({height:'70'},150);
					$("#bottom_div").animate({height:'70'},150);
				} else if(e.target.localName == "body"){
					$("#bottom").animate({height:'5'},150);
					$("#bottom_div").animate({height:'5'},150);
					$("#notice >li").delay(100).hide(0);
					$("#usermit >li").delay(100).hide(0);
				}
			});
		});
	
	$("#notice_li").click(function(){
		location.href="admin_notice.jsp";
	})
	
	$("#FAQ").click(function(){
		location.href="admin_FAQ.jsp";
	})
	$("#inquiryAndReport").click(function(){
		location.href="admin_inquiryAndReport.jsp";
	})
	$("#goods").click(function(){
		location.href="admin_appraisalProducts.jsp";
	})