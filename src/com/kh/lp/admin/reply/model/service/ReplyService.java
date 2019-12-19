package com.kh.lp.admin.reply.model.service;

import com.kh.lp.admin.qnaAndReport.model.vo.QNA;
import com.kh.lp.admin.reply.model.dao.ReplyDao;
import com.kh.lp.admin.reply.model.vo.Reply;
import static com.kh.lp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
public class ReplyService {
	
	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 19. 오후 5:06:25
	 * @ModifyDate    : 2019. 12. 19. 오후 5:06:25
	 * @Description   : 댓글 조회 메소드
	 * @param boardId
	 * @return
	 */
	public ArrayList<Reply> selectAll(int boardId) {
		Connection con = getConnection();
		
		ArrayList<Reply> Rlist = new ReplyDao().selectAll(boardId, con);
		
		close(con);
		
		return Rlist;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 19. 오후 5:05:02
	 * @ModifyDate    : 2019. 12. 19. 오후 5:05:02
	 * @Description   : 게시판 댓글 입력하는 곳
	 * @param boardId
	 * @param comment
	 * @param memberId
	 * @return
	 */
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

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 19. 오후 5:04:44
	 * @ModifyDate    : 2019. 12. 19. 오후 5:04:44
	 * @Description   : QNA 댓글 추가하는 메소드
	 * @param QNAId
	 * @param comment
	 * @return
	 */
	public int insertReply(int QNAId, String comment) {
		Connection con = getConnection();
		
		int result = new ReplyDao().insertQNAReply(QNAId, comment, con);
		
		if(result > 0) {
			commit(con);
		} else {
			rollBack(con);
		}
		
		return result;
	}

	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 19. 오후 5:04:24
	 * @ModifyDate    : 2019. 12. 19. 오후 5:04:24
	 * @Description   : QNA댓글 검색하는 메소드
	 * @param qNAId
	 * @return
	 */
	public QNA selectQNAReply(int qNAId) {
		Connection con = getConnection();
		
		QNA list = new ReplyDao().selectQNAReply(qNAId, con);

		close(con);
		
		return list;
	}
	/**
	 * @Author         : 안동환
	 * @CreateDate    : 2019. 12. 19. 오후 5:04:12
	 * @ModifyDate    : 2019. 12. 19. 오후 5:04:12
	 * @Description   : 댓글 삭제하는 메소드
	 * @param boardReply
	 * @return
	 */
	public int deleteBoardReply(int boardReply) {
		Connection con = getConnection();
		
		int result = new ReplyDao().deleteBoardReply(con, boardReply);
		
		if(result>0) {
			commit(con);
		} else {
			rollBack(con);
		}
		
		return result;
	}

}
