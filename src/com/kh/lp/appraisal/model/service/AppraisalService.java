package com.kh.lp.appraisal.model.service;

import static com.kh.lp.common.JDBCTemplate.close;
import static com.kh.lp.common.JDBCTemplate.commit;
import static com.kh.lp.common.JDBCTemplate.getConnection;
import static com.kh.lp.common.JDBCTemplate.rollBack;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.lp.appraisal.model.dao.AppraisalDao;
import com.kh.lp.appraisal.model.vo.AR1;
import com.kh.lp.appraisal.model.vo.App;
import com.kh.lp.appraisal.model.vo.AppCom;
import com.kh.lp.appraisal.model.vo.AppResult;
import com.kh.lp.appraisal.model.vo.Attachment;
import com.kh.lp.appraisal.model.vo.Auction;
import com.kh.lp.appraisal.model.vo.Bag;
import com.kh.lp.appraisal.model.vo.GenDetail;
import com.kh.lp.appraisal.model.vo.Item;
import com.kh.lp.appraisal.model.vo.ItemHistory;
import com.kh.lp.appraisal.model.vo.Watch;

public class AppraisalService {

	public int insertFake(AppResult ap) {
		Connection con = getConnection();
		
		int result = new AppraisalDao().insertFake(con, ap);
		
		if(result > 0) {
			commit(con);
		} else {
			rollBack(con);
		}
		close(con);
		
		return result;
	}

	public int insertGenDetail(AppResult ap, GenDetail gd, Attachment at) {
		Connection con = getConnection();
		int result  = 0;
		
		int result3 = new AppraisalDao().insertAttach(con, at);
		System.out.println("service : " + result3 );//이부분 로직에 맞게 옮겨놔야 돼 
		int result1 = new AppraisalDao().insertGenResult(con, ap);
		
		if(result1 > 0) {
			int result2 = new AppraisalDao().insertGenDetail(con, gd);
			if(result2 > 0 ) {
				commit(con);
				result = 1;
			} else {
				rollBack(con);
			}
		} else {
			rollBack(con);
		}
		
		close(con);
		
		return result;
	}

	public Item getItemInfo(String itemId) {
		Connection con = getConnection();
		
		Item item = new AppraisalDao().getItemInfo(con, itemId);
		
		close(con);
		
		return item;
	}
//
//	public int insertHistory(Item item) {
//		Connection con =getConnection();
//		
////		int result = new AppraisalDao().insertHistory(con, item);
////		
////		if(result > 0) {
////			commit(con);
////		} else {
////			rollBack(con);
////		}
////		close(con);
//		
//		//return result;
//	}

	public int insertAppraisalInfoFake(String itemId) {
		Connection con =getConnection();
		//여기서 처리할 것이 신청이력을 넣고
		int resultHistory = new AppraisalDao().insertHistory(con, itemId);
		System.out.println("resulthistory :  " + resultHistory);
		//상품감정정보 입력 가품일때
		int resultApp = new AppraisalDao().insertAppFake(con, itemId);
		//배그, 와치 상세정보 넣고
		int resultAll = 0;
		if(resultHistory > 0 && resultApp >0) {
			commit(con);
		} else {
			rollBack(con);
		}
		close(con);
		//상품감정 정보를 넣는다
		return resultAll;
	}

	public int listCount() {
		Connection con = getConnection();
		
		int result = new AppraisalDao().listCount(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<AppCom> appPaging(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<AppCom> list = new AppraisalDao().appPaging(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int insertIsGenW(ItemHistory ih, App ap, Watch w, AR1 ar, ArrayList<Attachment> fileList, Auction au) {
		Connection con = getConnection();
		
		int result = 0;
		//IH처리
		int resultIh = new AppraisalDao().insertIh(con, ih);
		
		System.out.println("resultIh" + resultIh);
		//app 처리
		int resultApp = new AppraisalDao().insertApp(con, ap);
		System.out.println("resultApp" + resultApp);
		//W 처리
		int resultW = new AppraisalDao().insertW(con, w);
		System.out.println("resultW" + resultW);
		//Ar 처리
		int resultAr = new AppraisalDao().insertArW(con, ar);
		System.out.println("resultAr" + resultAr);
		result = resultIh + resultApp + resultW + resultAr;
		System.out.println("result : "+ result);
		if (result> 3) {
			
			int appId = new AppraisalDao().selectCurrvalApp(con);
			
			System.out.println("appId :" + appId);
			
			for (int i = 0; i < fileList.size(); i++) {
				
				fileList.get(i).setAttachmentRefApp(appId);
				
			}
		}
		
		int resultAt = new AppraisalDao().insertAttachment(con, fileList);
		result = resultIh + resultApp + resultW + resultAr + resultAt;
		
		int memberNo = new AppraisalDao().getMemberNo(con, ih.getItemId());
		
		int resultAu = new AppraisalDao().insertAuction(con, au, memberNo);
		
		result += resultAu;
		System.out.println(result);
		
		if(result > 5) {
			commit(con);
		} else {
			rollBack(con);
		}
		close(con);
		
		return result;
	}

	public int insertIsGenB(ItemHistory ih, App ap, Bag b, AR1 ar, ArrayList<Attachment> fileList, Auction au) {
		Connection con = getConnection();
		
		int result = 0;
		//IH처리
		int resultIh = new AppraisalDao().insertIh(con, ih);
		System.out.println("resultIh" + resultIh);
		//app 처리
		int resultApp = new AppraisalDao().insertApp(con, ap);
		System.out.println("resultApp" + resultApp);
		//W 처리
		int resultB = new AppraisalDao().insertB(con, b);
		System.out.println("resultB" + resultB);
		//Ar 처리
		int resultAr = new AppraisalDao().insertArB(con, ar);
		System.out.println("resultAr" + resultAr);
		result = resultIh + resultApp + resultB + resultAr;
		System.out.println("result : "+ result);
		if (result> 3) {
			
			int appId = new AppraisalDao().selectCurrvalApp(con);
			
			System.out.println("appId :" + appId);
			
			for (int i = 0; i < fileList.size(); i++) {
				
				fileList.get(i).setAttachmentRefApp(appId);
				
			}
		}
		
		int resultAt = new AppraisalDao().insertAttachment(con, fileList);
		
		result = resultIh + resultApp + resultB + resultAr + resultAt;
		
		int memberNo = new AppraisalDao().getMemberNo(con, ih.getItemId());
		
		int resultAu = new AppraisalDao().insertAuction(con, au, memberNo);
		
		result += resultAu;
		
		
		if(result > 5) {
			commit(con);
		} else {
			rollBack(con);
		}
		close(con);
		
		return result;
	}

	public int insertIsFake(ItemHistory ih, App ap, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		
		int result = 0;
		//IH처리
		int resultIh = new AppraisalDao().insertIh(con, ih);
		System.out.println("resultIh" + resultIh);
		//app 처리
		int resultApp = new AppraisalDao().insertAppF(con, ap);
		System.out.println("resultApp" + resultApp);
		
		result = resultIh + resultApp;
		
		if (result> 1) {
			
			int appId = new AppraisalDao().selectCurrvalApp(con);
			
			System.out.println("appId :" + appId);
			
			for (int i = 0; i < fileList.size(); i++) {
				
				fileList.get(i).setAttachmentRefApp(appId);
				
			}
		}
		
		int resultAt = new AppraisalDao().insertAttachment(con, fileList);
		
		result = resultIh + resultApp + resultAt;
		
		if(result > 2) {
			commit(con);
		} else {
			rollBack(con);
		}
		close(con);
		
		return result;
	}

	public ArrayList<ArrayList<Object>> selectItemResult(int memberNo) {
		Connection con = getConnection();
		ArrayList<ArrayList<Object>> app = new AppraisalDao().selectItemResult(con, memberNo);
		
		close(con);
		return app;
	}
	
	// 등록상품 갯수 추출
	public int getListCount(int memberNo) {
		Connection con = getConnection();
		
		int resultCount = new AppraisalDao().getListCount(con, memberNo);
		
		return 0;
	}

}
