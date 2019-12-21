package com.kh.lp.money.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.lp.common.JDBCTemplate.*;
import com.kh.lp.money.model.vo.Money;

public class MoneyDao {
	Properties prop = new Properties();
	
	public MoneyDao() {
		String fileName = MoneyDao.class.getResource("/sql/money/money-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int insertApp(Connection con, Money m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertApp");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, m.getMemberNo());
			pstmt.setString(2, m.getMerId());
			pstmt.setInt(3, m.getAmount());
			pstmt.setString(4, m.getImpId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
