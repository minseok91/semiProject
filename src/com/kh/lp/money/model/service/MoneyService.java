package com.kh.lp.money.model.service;

import static com.kh.lp.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.lp.money.model.dao.MoneyDao;
import com.kh.lp.money.model.vo.Money;

public class MoneyService {

	// 감정신청 시 결제데이터 삽입
	public int insertApp(Money m) {
		Connection con = getConnection();
		
		int result = new MoneyDao().insertApp(con, m);
		
		if(result > 0)
			commit(con);
		else
			rollBack(con);
		
		close(con);
		
		return result;
	}

}
