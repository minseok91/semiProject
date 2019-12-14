package com.kh.lp.admin.reply.model.service;

import com.kh.lp.admin.reply.model.dao.ReplyDao;
import com.kh.lp.admin.reply.model.vo.Reply;
import static com.kh.lp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
public class ReplyService {
	
	public ArrayList<Reply> selectAll(int boardId) {
		Connection con = getConnection();
		
		ArrayList<Reply> Rlist = new ReplyDao().selectAll(boardId, con);
		
		if(Rlist != null) {
			commit(con);
		} else {
			rollBack(con);
		}
		
		
		return Rlist;
	}

	public int inserReply(int boardId, String comment, int memberId) {
		Connection con = getConnection();
		
		int result = new ReplyDao().insertReply(con, boardId, comment, memberId);
		
		if(result > 0) {
			commit(con);
		} else {
			rollBack(con);
		}
		
		
		return 0;
	}

}
