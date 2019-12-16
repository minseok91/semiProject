package com.kh.lp.admin.qnaAndReport.model.service;

import static com.kh.lp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.lp.admin.qnaAndReport.model.dao.QNADao;
import com.kh.lp.admin.qnaAndReport.model.vo.QNA;

public class QNAService {

	public int QNACount() {
		Connection con = getConnection();
		
		int result = new QNADao().QNACount(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<QNA> selectAll(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<QNA> list = new QNADao().QNASelectAll(currentPage, limit, con);
		
		close(con);
		
		return list;
	}

}
