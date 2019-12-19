package com.kh.lp.common;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import lombok.extern.log4j.Log4j2;

@Log4j2
@ServerEndpoint("/bidding")
public class BiddingWebsocket {
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnOpen
	public void handleOpen(Session session) {
		clients.add(session);
		log.info("접속 : " + session);
	}
	
	@OnMessage
	public void handleMessage(String msg, Session session) {
		log.info(msg);
		
		synchronized (clients) {
			for(Session client : clients) {
				try {
					client.getBasicRemote().sendText(msg);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	@OnClose
	public void handleClose(Session session) {
		clients.remove(session);
		log.info("접속종료 : " + session);
	}
	
	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}
}
