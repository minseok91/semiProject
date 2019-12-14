package com.kh.lp.admin.reply.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.lp.admin.reply.model.vo.Reply;
import static com.kh.lp.common.JDBCTemplate.*;
public class ReplyDao {
	private Properties admin_prop = new Properties();
	public ReplyDao() {
		String fileName = ReplyDao.class.getResource("/sql/admin/reply/reply-query.properties").getPath();
		
		try {
			admin_prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ArrayList<Reply> selectAll(int boardId, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reply> rList = null;
		Reply r = null;
		
		String query = admin_prop.getProperty("selectAll");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardId);
			
			rset = pstmt.executeQuery();
			
			rList = new ArrayList<Reply>();
			while(rset.next()) {
				r = new Reply();
				r.setReplyId(rset.getInt("REPLY_ID"));
				r.setReplyBoardId(rset.getInt("REPLY_BOARD_ID"));
				r.setReplyMemberName(rset.getString("MEMBER_NAME"));
				r.setReplyDate(rset.getDate("REPLY_DATE"));
				r.setReplyContent(rset.getString("REPLY_CONTENT"));
				
				rList.add(r);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return rList;
	}
	public int insertReply(Connection con, int boardId, String comment, int memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = admin_prop.getProperty("");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardId);
			pstmt.setInt(2, memberId);
			pstmt.setString(3, comment);
			
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
