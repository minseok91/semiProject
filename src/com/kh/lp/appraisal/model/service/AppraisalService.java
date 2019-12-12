package com.kh.lp.appraisal.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.lp.appraisal.model.dao.AppraisalDao;
import com.kh.lp.appraisal.model.vo.AppCom;
import com.kh.lp.appraisal.model.vo.AppResult;
import com.kh.lp.appraisal.model.vo.Attachment;
import com.kh.lp.appraisal.model.vo.GenDetail;
import com.kh.lp.appraisal.model.vo.Item;

import static com.kh.lp.common.JDBCTemplate.*;

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

}
