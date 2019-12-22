package com.kh.lp.money.model.service;

import static com.kh.lp.common.JDBCTemplate.close;
import static com.kh.lp.common.JDBCTemplate.commit;
import static com.kh.lp.common.JDBCTemplate.getConnection;
import static com.kh.lp.common.JDBCTemplate.rollBack;

import java.sql.Connection;

import com.kh.lp.money.model.dao.MoneyDao;
import com.kh.lp.money.model.vo.Money;
import com.kh.lp.money.model.vo.MoneyDetail;
import com.kh.lp.win.model.vo.Win;

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

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 22. 오후 7:06:28
	 * @ModifyDate    : 2019. 12. 22. 오후 7:06:28
	 * @Description   : 회원 상세페이지에서 회원의 결제 갯수 조회오는 메소드
	 * @param userId
	 * @return
	 */
	public int purchaseCount(int userNo) {
		Connection con = getConnection();
		
		int result = new MoneyDao().purchaseCount(userNo, con);
		
		close(con);
		
		return result;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 22. 오후 8:27:26
	 * @ModifyDate    : 2019. 12. 22. 오후 8:27:26
	 * @Description   : 판매이력 갯수 조회
	 * @param memberNo
	 * @return
	 */
	public int salesCount(int memberNo) {
		Connection con = getConnection();
		
		int list = new MoneyDao().salesCont(memberNo, con);
		
		close(con);
		
		return list;
	}

	public int insertPayment(Money money) {
		Connection con = getConnection();
		int result = 0;
		Win win = new MoneyDao().getWinner(con , money.getAuctionId());
		int insertMoney = new MoneyDao().insertMoney(con, money, win);
		if(insertMoney > 0) {
			int insertMoneyHistory = new MoneyDao().insertMoneyHistory(con, money);
			if(insertMoneyHistory > 0) {
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

	public MoneyDetail getMoneyDetail(int auctionId) {
		Connection con = getConnection();
		
		MoneyDetail md = new MoneyDao().getMoneyDetail(con, auctionId);
		
		close(con);
		
		return md;
	}
	
	

}
