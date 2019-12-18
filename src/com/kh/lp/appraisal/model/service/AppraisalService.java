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
import com.kh.lp.appraisal.model.vo.Attachment;
import com.kh.lp.appraisal.model.vo.Bag;
import com.kh.lp.appraisal.model.vo.ItemHistory;
import com.kh.lp.appraisal.model.vo.Watch;
import com.kh.lp.auction.model.vo.Auction;
import com.kh.lp.item.model.vo.Item;

public class AppraisalService {

	

	public Item getItemInfo(String itemId) {
		Connection con = getConnection();
		
		Item item = new AppraisalDao().getItemInfo(con, itemId);
		
		close(con);
		
		return item;
	}

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
		if(resultIh > 0) {
			//app 처리
			int resultApp = new AppraisalDao().insertApp(con, ap);
			System.out.println("resultApp" + resultApp);
			if(resultApp > 0) {
				//W 처리
				int resultW = new AppraisalDao().insertW(con, w);
				System.out.println("resultW" + resultW);
				if(resultW > 0) {
					//Ar 처리
					int resultAr = new AppraisalDao().insertArB(con, ar);
					System.out.println("resultAr" + resultAr);
					
					if(resultAr > 0) {
						int appId = new AppraisalDao().selectCurrvalApp(con);
						
						System.out.println("appId :" + appId);
						
						for (int i = 0; i < fileList.size(); i++) {
							
							fileList.get(i).setAttachmentRefApp(appId);
							
						}
						
						
						int resultAt = new AppraisalDao().insertAttachment(con, fileList);
						
						if(resultAt > 0) {
							int memberNo = new AppraisalDao().getMemberNo(con, ih.getItemId());
							
							int resultAu = new AppraisalDao().insertAuction(con, au, memberNo);
							
							if(resultAu > 0) {
								commit(con);
								result = 1;
							} else {
								rollBack(con);
							}
						} else {
							rollBack(con);
						}
					} else {
						rollBack(con);
					}
				} else {
					rollBack(con);
				}
			} else {
				rollBack(con);
			}
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
		if(resultIh > 0) {
			//app 처리
			int resultApp = new AppraisalDao().insertApp(con, ap);
			System.out.println("resultApp" + resultApp);
			if(resultApp > 0) {
				//W 처리
				int resultB = new AppraisalDao().insertB(con, b);
				System.out.println("resultB" + resultB);
				if(resultB > 0) {
					//Ar 처리
					int resultAr = new AppraisalDao().insertArB(con, ar);
					System.out.println("resultAr" + resultAr);
					
					if(resultAr > 0) {
						int appId = new AppraisalDao().selectCurrvalApp(con);
						
						System.out.println("appId :" + appId);
						
						for (int i = 0; i < fileList.size(); i++) {
							
							fileList.get(i).setAttachmentRefApp(appId);
							
						}
						
						
						int resultAt = new AppraisalDao().insertAttachment(con, fileList);
						System.out.println("resultAt : " + resultAt);
						if(resultAt > 0) {
							int memberNo = new AppraisalDao().getMemberNo(con, ih.getItemId());
							
							int resultAu = new AppraisalDao().insertAuction(con, au, memberNo);
							
							if(resultAu > 0) {
								commit(con);
								result = 1;
							} else {
								rollBack(con);
							}
						} else {
							rollBack(con);
						}
					} else {
						rollBack(con);
					}
				} else {
					rollBack(con);
				}
			} else {
				rollBack(con);
			}
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
