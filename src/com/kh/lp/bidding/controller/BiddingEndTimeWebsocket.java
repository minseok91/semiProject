package com.kh.lp.bidding.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import lombok.extern.log4j.Log4j2;

@Log4j2
@ServerEndpoint(value = "/biddingEndTime/{memberId}")
public class BiddingEndTimeWebsocket {
	private static Map<String, Session> clients = Collections.synchronizedMap(new HashMap<String, Session>());

	@OnOpen
	public void handleOpen(Session session, @PathParam("memberId") String memberId) {
		clients.put(memberId, session);
		log.debug("접속 : " + memberId + " : " + session);
		log.debug("현재 접속자 수 : " + clients.size());
	}
	
	@OnMessage
	public void handleMessage(String msg, Session session) {
		
	}
	
	
	// 클라이언트가 웹소켓으로부터 접속종료 시 서버측에서 실행하는 메소드
	@OnClose
	public void handleClose(Session session) {
		String memberId = session.getId();
		Set<String> keys = clients.keySet();
		for (String key : keys) {
			if (memberId.equals(clients.get(key).getId())) {
				log.debug(key + "님 접속종료");
				clients.remove(key, session);
				log.debug("남은 접속자 수 : " + clients.size());
			}
		}
	}

	// 클라이언트와 서버로부터 에러 발생 시 서버측에서 실행하는 메소드
	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}
}
