package com.kh.lp.common;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import lombok.extern.log4j.Log4j2;

@Log4j2
@ServerEndpoint(value="/endTime/{memberId}")
//@ServerendPoint를 통해 value값 /endTime/사용자아이디로 접속하게되면 클래스가 실행
public class EndTimeWebsocket {
	private static Map<String, Session> clients = Collections.synchronizedMap(new HashMap<String, Session>());
	
	//클라이언트가 웹소켓에 접속 시 서버측에서 실행하는 메소드
	//@PathParam 은 웹소켓에서 사용하는 @PathVariables
	@OnOpen
	public void handleOpen(Session session, @PathParam("memberId") String memberId) {
		clients.put(memberId, session);
		log.debug("접속 : " + memberId + " : " + session);
		log.debug("현재 접속자 수 : " + clients.size());
	}
	
	//클라이언트가 웹소켓으로부터 메세지를 보냈을 때 서버측에서 실행하는 메소드
	@OnMessage
	public void handleMessage(String msg, Session session) {
		log.info(msg);
		Timer t = new Timer();
		TimerTask task = new TimerTask() {
			
			@Override
			public void run() {
				String sendMsg = "";
				String arr[] = msg.split(",");
				for(int i = 0; i < arr.length; i++) {
					int sec = Integer.parseInt(arr[i]);
					sec -= 1;
					log.info(sec);
					if(i == arr.length - 1) {
						sendMsg += sec;
					} else {
						sendMsg += sec + ",";
					}
				}
				log.info(sendMsg);
				
				synchronized(clients) {
					String memberId = session.getId();
					Set<String> keys = clients.keySet();
					for(String key : keys) {
						if(memberId.equals(clients.get(key).getId())) {
							try {
								clients.get(key).getBasicRemote().sendText(sendMsg);
							} catch (IOException e) {
								e.printStackTrace();
							}
						}
					}
				}
			}//---run endPoint---
		};//---TimerTask endPoint---
		t.schedule(task, 1000);	//1초마다 타이머 스케쥴 실행
	}
	
	//클라이언트가 웹소켓으로부터 접속종료 시 서버측에서 실행하는 메소드
	@OnClose
	public void handleClose(Session session) {
		String memberId = session.getId();
		Set<String> keys = clients.keySet();
		for(String key : keys) {
			if(memberId.equals(clients.get(key).getId())) {
				log.debug(key + "님 접속종료");
				clients.remove(key, session);
				log.debug("남은 접속자 수 : " + clients.size());
			}
		}
	}
	
	//클라이언트와 서버로부터 에러 발생 시 서버측에서 실행하는 메소드
	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}
}
