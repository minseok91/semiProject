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

	// 낙찰리스트 추출 테스트
	public ArrayList<Win> selectListTest(int memberNo) {
		Connection con = getConnection();
		
		ArrayList<Win> list = new WinDao().selectListTest(con, memberNo);
		
		close(con);
		
		return list;
	}

	// 낙찰리스트 갯수 확인 테스트
	public int getListCountTest(int memberNo) {
		Connection con = getConnection();
		
		int result = new WinDao().getListCountTest(con, memberNo);
		
		close(con);
		return result;
	}

	// 낙찰리스트 추출
	public ArrayList<Win> winSelectAll(int memberNo) {
		Connection con = getConnection();
		
		ArrayList<Win> list = new WinDao().winSelectAll(con, memberNo);
		
		close(con);
		
		return list;
	}
}
