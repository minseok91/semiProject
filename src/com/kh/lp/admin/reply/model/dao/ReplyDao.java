package com.kh.lp.admin.reply.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.lp.admin.reply.model.vo.Reply;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

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
		
		
		return rList;
	}

}
