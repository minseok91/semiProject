package com.kh.lp.appraisal.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.lp.appraisal.model.service.AppraisalService;
import com.kh.lp.appraisal.model.vo.AR1;
import com.kh.lp.appraisal.model.vo.App;
import com.kh.lp.appraisal.model.vo.AppResult;
import com.kh.lp.appraisal.model.vo.Attachment;
import com.kh.lp.appraisal.model.vo.Auction;
import com.kh.lp.appraisal.model.vo.Bag;
import com.kh.lp.appraisal.model.vo.ItemHistory;
import com.kh.lp.appraisal.model.vo.Watch;
import com.kh.lp.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;


/**
 * Servlet implementation class AppraisalInsertServlet
 */
@WebServlet("/insert.app")
public class AppraisalInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppraisalInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String isGen = request.getParameter("isGen");
//		System.out.println("isGen : " + isGen);
//		String desc = request.getParameter("comment");
//		String desc2 = request.getParameter("comment2");
		int result = 0;
		if(ServletFileUpload.isMultipartContent(request)) {
			
			
		//전송파일 용량 제한 10mb 로 용향제한
		int maxSize = 1024 * 1024 * 10;
		
		//웹서버 컨테이너 경로추출
		String root = request.getSession().getServletContext().getRealPath("/");
		
		System.out.println(root);
		
		//파일 저장 경로 
		String savePath = root + "img/appraisal/";
		
		//사용자가 올린 파일을 그대로 저장하지 않는 것이 일반적이다.
		//1. 같은 파일명이 있는 경우 이전 파일을 덮어씌운다;
		//2. 한글로된 파일명 , 특수기호, 띄어쓰기 등이 서버의 운영체제에 따라 문제가 생길 수 있다.
		//DefaultFileRenamePolicy는 cos.jar안에 존재하는 클래스로 
		//같은 파일명이 존재 하는지 검사하고, 있는 경우 파일명 뒤에 숫자를 붙여준다.
		//ex :aaa.zip, aaa1.zip, aaa2.zip
		//MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		System.out.println("multiRequest : " + multiRequest);
		
		
		//감정아이템정보 가져오기 시작
		System.out.println("itemId :" + "이놈이 문제야 문제!!");
		int itemId = Integer.parseInt(multiRequest.getParameter("itemId"));
		System.out.println("itemId :" + itemId);
		
//		Item item = new AppraisalService().getItemInfo(itemId);
		//감정아이템정보 가져오기 끝	
		//감정신청이력 4로 인서트 시작
//		int resultHisory = new AppraisalService().insertHistory(item); 
		//감정신청이력 4로 인서트 끝
		String isGen = multiRequest.getParameter("isGen");
		System.out.println("isGen" + isGen);
		
		//저장할 파일의 이름을 저장할 arrayList를 생성 
		ArrayList<String> saveFiles = new ArrayList<String>();
		
		//원본파일의 이름을 저장할 arrayList 를 생성 
		ArrayList<String> originFiles = new ArrayList<>();
		
		//파일이 전송된 input 태그의 name을 반환
		Enumeration<String> files =  multiRequest.getFileNames();
		System.out.println("files :" + files);
		
		while(files.hasMoreElements()) {
			String name = files.nextElement();
			
			//System.out.println("name : " + name);
			
			saveFiles.add(multiRequest.getFilesystemName(name));
			originFiles.add(multiRequest.getOriginalFileName(name));
		}
		
		//Attachment 객체 생성해서 arrayList에 담기 
		ArrayList<Attachment> fileList = new ArrayList<>();
		
		//전송 순서가 역순으로 들어왔기 때문에 반복문을 역순으로 돌여 arrayList에 담기
		for(int i = originFiles.size() - 1 ; i >= 0; i--) {
			Attachment at = new Attachment();
			at.setAtPath(savePath);
			at.setAtName(originFiles.get(i));
			at.setAtRename(saveFiles.get(i));
			
//			at.setFilePath(savePath);
//			at.setOriginName(originFiles.get(i));
//			at.setChangeName(saveFiles.get(i));
			
			fileList.add(at);
			
		}
		
		if(isGen.equals("Y")) {
			
			
			//1. IH넣기
			ItemHistory ih = new ItemHistory();
			//SYSDATE로 넣기 ih.setItemHistoryDate(itemHistoryDate);
			//시퀀스로 넣기 ih.setItemHistoryId(itemHistoryId);
			//값 4로 넣기 ih.setItemHistoryStatus(itemHistoryStatus);
			ih.setItemId(itemId);
			
			//확인 IH
			System.out.println("IH :" + ih);
			
			//2. APP 넣기
			String multiComment = multiRequest.getParameter("comment");
			App ap = new App();
			//시퀀스로 넣기 ap.setAppId(appId);
			ap.setAppItemId(itemId);
			ap.setAppNote(multiComment);
			ap.setAppResult("Y");
			//확인 APP
			System.out.println("ap :" + ap);
			
			//3. 상세 넣기
			
			//상세 타입 확인
			String type = multiRequest.getParameter("type");
			System.out.println("타입 확인 :" + type);
			
			Watch w = new Watch();
			Bag b = new Bag();
			
			if(type.equals("W")) {
				String chronograph = multiRequest.getParameter("chronograph");
				String movement = multiRequest.getParameter("movement");
				String matertial = multiRequest.getParameter("matertial");
				String boxYn = multiRequest.getParameter("boxYn");
				String guaranteeYn = multiRequest.getParameter("guaranteeYn");
				
				
				w.setWatchChronograph(chronograph);
				w.setWatchGuaranteeYn(guaranteeYn);
				//시퀀스로 w.setWatchId(watchId);
				w.setWatchMaterial(matertial);
				w.setWatchMovement(movement);
				w.setWatchBoxYn(boxYn);
				
				//확인 watch
				System.out.println("watch :" + w);
				
			} else {
				String bagSize = multiRequest.getParameter("size");
				String bagStrap = multiRequest.getParameter("strap");
				String gender = multiRequest.getParameter("gender");
				
				//시퀀스로  b.setBagId(bagId);
				b.setBagSize(bagSize);
				b.setBagStrap(bagStrap);
				b.setGender(gender);
				
				//확인 bag
				System.out.println("bag :" + b);
			}
			
			
			//4. 진품정보 넣기
			
			String multiBrand = multiRequest.getParameter("brand");
			String multiModel = multiRequest.getParameter("model");
			int multiPrice = Integer.parseInt(multiRequest.getParameter("price"));
			
			String multiGrade = multiRequest.getParameter("status");
			
			AR1 ar = new AR1();
			//시퀀스로 ar.setAppId(appId);
			//시퀀스로 ar.setBagId(bagId);
			//시퀀스로 ar.setWatchId(watchId);
			ar.setBrand(multiBrand);
			ar.setCondition(multiGrade);
			ar.setModel(multiModel);
			ar.setPrice(multiPrice);
			//확인 ar1 
			System.out.println("ar1 : " + ar);
			

			//5. 경매에 넣기
			Auction au = new Auction();
			//app 시퀀스 넣기 au.setAuAppId(auAppId);
			//시퀀스로 넣기 au.setAuctionId(auctionId);
			//판매자가 설정 au.setAuPeriod(auPeriod);
			//판매자가 설정 au.setAuStartPrice(auStartPrice);
			//판매자가 설정 au.setAuStartTime(auStartTime);
			au.setCount(0);//초기값인데 재경매 일때 다시해야 되나? 
			//au.setMemberNo(memberNo);//판매자 아이디 넣기 
			System.out.println("au : "+ au);
			//ih,ap,w,ar,fileList
			System.out.println("type :" + type);
			if(type.equals("W")) {
				result = new AppraisalService().insertIsGenW(ih, ap , w, ar, fileList, au);
			} else {
				System.out.println("여기는 가방이에요 ");
				result = new AppraisalService().insertIsGenB(ih, ap , b, ar, fileList, au);
			}
			
			System.out.println("여긴 진품일때");
		} else {
			System.out.println("여긴 가품일때");
			
			//1. IH넣기
			ItemHistory ih = new ItemHistory();
			//SYSDATE로 넣기 ih.setItemHistoryDate(itemHistoryDate);
			//시퀀스로 넣기 ih.setItemHistoryId(itemHistoryId);
			//값 4로 넣기 ih.setItemHistoryStatus(itemHistoryStatus);
			ih.setItemId(itemId);
			
			//확인 IH
			System.out.println("IH :" + ih);
			
			//2. APP 넣기
			String multiComment = multiRequest.getParameter("comment2");
			App ap = new App();
			//시퀀스로 넣기 ap.setAppId(appId);
			ap.setAppItemId(itemId);
			ap.setAppNote(multiComment);
			ap.setAppResult("N");
			//확인 APP
			System.out.println("ap :" + ap);
			
			
			
			System.out.println("여긴 가품일때");
			
			result = new AppraisalService().insertIsFake(ih, ap , fileList);
		}
		
		 
		
		String page = "";
		if(result > 0) {
			page = "/lp/selectAll.app";
			response.sendRedirect(page);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "인서트 실패");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
