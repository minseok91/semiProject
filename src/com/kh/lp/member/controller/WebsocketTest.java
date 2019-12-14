package com.kh.lp.member.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import lombok.extern.log4j.Log4j2;

@Log4j2
@ServerEndpoint("/doTime")
public class WebsocketTest {
	private static Map<String, Session> clients = Collections.synchronizedMap(new HashMap<String, Session>());
	
	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 14. 오후 11:17:28
	 * @ModifyDate    : 2019. 12. 14. 오후 11:17:28
	 * @Description   : 웹소켓 접속 시 실행하는 메소드
	 * @param memberId
	 * @param memberSession
	 */
	@OnOpen	
	public void handleOpen(String memberId, Session memberSession) {
		log.debug("사용자 아이디 접속 : " + memberId);
		log.debug("사용자 세션 접속 : " + memberSession);
		clients.put(memberId, memberSession);
	}
	
	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 14. 오후 11:17:40
	 * @ModifyDate    : 2019. 12. 14. 오후 11:17:40
	 * @Description   : 클라이언트가 웹소켓서버로 메세지를 전송했을 때 실행하는 메소드
	 * @param msg
	 * @param memberId
	 * @param memberSession
	 */
	@OnMessage
	public void handleMessage(String msg, String memberId, Session memberSession) {
		log.debug("사용자 -> 서버로 보낸 메세지 실행");
		log.debug("사용자 아이디 : " + memberId);
		log.debug("사용자 세션 : " + memberSession);
		
		Iterator<String> iter = clients.keySet().iterator();
		synchronized (clients) {
			while(iter.hasNext()) {
				String key = iter.next();
				if(!key.equals(memberId)) {
					log.debug("응답받은 메시지 : " + msg);
					try {
						clients.get(key).getBasicRemote().sendText(msg);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
	
	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 14. 오후 11:19:07
	 * @ModifyDate    : 2019. 12. 14. 오후 11:19:07
	 * @Description   : 사용자가 웹소켓을 종료할 때 실행하는 메소드
	 * @param memberId
	 * @param memberSession
	 */
	@OnClose
	public void handleClose(String memberId, String memberSession) {
		log.debug("사용자 아이디 종료 : " + memberId);
		log.debug("사용자 세션 종료 : " + memberSession);
		clients.remove(memberId);
	}
	
	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 14. 오후 11:19:48
	 * @ModifyDate    : 2019. 12. 14. 오후 11:19:48
	 * @Description   : 웹소켓 에러시 실행하는 메소드
	 * @param t
	 */
	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}
}
