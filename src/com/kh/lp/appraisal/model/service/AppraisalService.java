package com.kh.lp.appraisal.model.service;

import java.sql.Connection;

import com.kh.lp.appraisal.model.dao.AppraisalDao;
import com.kh.lp.appraisal.model.vo.AppResult;
import com.kh.lp.appraisal.model.vo.GenDetail;

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

	public int insertGenDetail(AppResult ap, GenDetail gd) {
		Connection con = getConnection();
		int result  = 0;
		
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

}
