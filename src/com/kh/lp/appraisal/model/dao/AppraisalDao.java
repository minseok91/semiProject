package com.kh.lp.appraisal.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.lp.appraisal.model.vo.AppResult;
import com.kh.lp.appraisal.model.vo.GenDetail;

import static com.kh.lp.common.JDBCTemplate.*;

public class AppraisalDao {
	
	Properties prop = new Properties();
	
	public AppraisalDao() {
		
		String fileName = AppraisalDao.class.getResource("/sql/appraisal/appraisal-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public int insertFake(Connection con, AppResult ap) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertFake");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, 1);//지금은 임시로 감정 ID 를 넣음 
			pstmt.setString(2, ap.getDetailDesc());
			//파일첨부터 쿼리에서 강제로 넣음
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public int insertGenResult(Connection con, AppResult ap) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertGenResult");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, 1);//지금은 임시로 감정 ID 를 넣음 
			pstmt.setString(2, ap.getDetailDesc());
			//파일첨부터 쿼리에서 강제로 넣음
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertGenDetail(Connection con, GenDetail gd) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertGenDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, gd.getBrand());
			pstmt.setString(2, gd.getModelName());
			pstmt.setInt(3, gd.getAppPrice());
			System.out.println("gd :"  + gd);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
