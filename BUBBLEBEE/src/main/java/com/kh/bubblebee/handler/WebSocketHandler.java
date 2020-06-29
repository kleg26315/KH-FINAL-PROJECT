package com.kh.bubblebee.handler;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.bubblebee.alert.model.dao.AlertDAO;
import com.kh.bubblebee.notice.model.dao.NoticeDAO;

@Repository
public class WebSocketHandler extends TextWebSocketHandler {
	@Autowired
	SqlSessionTemplate sqlSession;
	@Autowired
	private AlertDAO aDAO;
	@Autowired
	private NoticeDAO nDAO;
	
	List<WebSocketSession> sessionList = new ArrayList<>();
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		if(message.getPayload().equals("reload")) {
			for(WebSocketSession sess : sessionList) {
				sess.sendMessage(new TextMessage("reload"));			
			}
		}else {
			session.sendMessage(new TextMessage(aDAO.count_receive(sqlSession,message.getPayload())+ 
					"&" + aDAO.receive_data(sqlSession,message.getPayload())));
		
		}
	}
}
