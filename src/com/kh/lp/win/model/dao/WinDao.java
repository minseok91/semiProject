package com.kh.lp.win.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.lp.appraisal.model.dao.AppraisalDao;
import com.kh.lp.appraisal.model.vo.AR1;
import com.kh.lp.common.Attachment;
import com.kh.lp.win.model.vo.Win;

import lombok.extern.log4j.Log4j2;

import static com.kh.lp.common.JDBCTemplate.*;

@Log4j2
public class WinDao {
	Properties prop = new Properties();
	
	public WinDao() {
		String fileName = WinDao.class.getResource("/sql/win/winning-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 낙찰리스트 추출
	public ArrayList<ArrayList<Object>> selectList(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Win w = null;
		AR1 ar = null;
		Attachment at = null;
		ArrayList<ArrayList<Object>> win = null;
		ArrayList<Object> list = null;
		
		String query = prop.getProperty("winList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				w = new Win();
				ar = new AR1();
				at = new Attachment();
				list = new ArrayList<>();
				
				w.setWinAuctionId(rset.getInt("W.WIN_AUCTION_ID"));
				at.setAttachmentRename(rset.getString("AT.ATTACHMENT_RENAME"));
				ar.setAr1Brand(rset.getString("AR.AR1_BRAND"));
				ar.setAr1Model(rset.getString("AR.AR1_MODEL"));
				w.setWinPrice(rset.getInt("W.WIN_PRICE"));
				w.setWinStatus(rset.getString("WSC.NAME"));
				
				list.add(w);
				list.add(ar);
				list.add(at);
				win.add(list);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		log.debug(list);
		log.debug(win);
		
		return win;
	}

	public ArrayList<Win> selectListTest(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Win> list = null;
		Win w = null;
		
		String query = prop.getProperty("winListTest");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, memberNo);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			
			while(rset.next()) {
				w = new Win();
				
				w.setWinAuctionId(rset.getInt("WIN_AUCTION_ID"));
				w.setWinMemberNo(rset.getInt("WIN_MEMBER_NO"));
				w.setWinPrice(rset.getInt("WIN_PRICE"));
				w.setWinSecondMemberNo(rset.getInt("WIN_SECOND_MEMBER_NO"));
				w.setWinsecondPrice(rset.getInt("WIN_SECOND_PRICE"));
				w.setWinStatus(rset.getString("WIN_STATUS"));
				w.setAttRename(rset.getString("ATTACHMENT_RENAME"));
				w.setWinDate(rset.getDate("WIN_DATE"));
				
				list.add(w);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		log.debug(list);
		return list;
	}

}
