package com.kh.lp.win.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import javax.sql.DataSource;

import com.kh.lp.appraisal.model.vo.AR1;
import com.kh.lp.common.Attachment;
import com.kh.lp.win.model.dao.WinDao;
import com.kh.lp.win.model.vo.Win;
import static com.kh.lp.common.JDBCTemplate.*;

public class WinService {

	// 낙찰리스트 추출
	public ArrayList<ArrayList<Object>> selectList(int memberNo) {
		Connection con = getConnection();
		
		ArrayList<ArrayList<Object>> map = new WinDao().selectList(con, memberNo);
		
		close(con);
		
		return map;
	}

}
