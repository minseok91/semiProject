package com.kh.lp.bidding.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.kh.lp.bidding.model.service.BidService;
import com.kh.lp.bidding.model.vo.Bidding;

import lombok.extern.log4j.Log4j2;

@Log4j2
@ServerEndpoint(value="/bidding/{memberId}")
public class BiddingWebsocket {
	private static Map<String, Session> clients = Collections.synchronizedMap(new HashMap<String, Session>());
	
	@OnOpen
	public void handleOpen(Session session, @PathParam("memberId") String memberId) {
		clients.put(memberId, session);
		log.debug("접속 : " + memberId + " : " + session);
		log.debug("현재 접속자 수 : " + clients.size());
	}
	
	@OnMessage
	public void handleMessage(String msg, Session session) {
		log.info(msg);
		
		
		
		String arr[] = msg.split("::");
		Bidding requestBidding = new Bidding();
		requestBidding.setBiddingMemberNo(Integer.parseInt(arr[0]));
		requestBidding.setBiddingAuctionId(Integer.parseInt(arr[1]));
		requestBidding.setBiddingPrice(Integer.parseInt(arr[2]));
		
		log.info(requestBidding.getBiddingMemberNo());
		log.info(requestBidding.getBiddingAuctionId());
		log.info(requestBidding.getBiddingPrice());
		
		int result = new BidService().insertBiddingHistory(requestBidding);
		String sendMsg = "";
		if(result > 0) {
			sendMsg = requestBidding.getBiddingMemberNo() + "::" + requestBidding.getBiddingAuctionId() + "::" + requestBidding.getBiddingPrice();
			synchronized(clients) {
				Set<String> keys = clients.keySet();
				for (String key : keys) {
					try {
						clients.get(key).getBasicRemote().sendText(sendMsg);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		} else {
			synchronized(clients) {
				sendMsg = "입찰 실패했습니다. 새로고침 후 다시 진행해주세요";
				String memberId = session.getId();
				Set<String> keys = clients.keySet();
				for(String key : keys) {
					if(memberId.equals(clients.get(key).getId())) {
						try {
							clients.get(key).getBasicRemote().sendText(sendMsg);
							handleClose(session);
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
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
