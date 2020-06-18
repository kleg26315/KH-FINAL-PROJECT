package com.kh.bubblebee.handler;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.bubblebee.alert.model.dao.AlertDAO;

@Repository
public class WebSocketHandler extends TextWebSocketHandler {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	private AlertDAO aDAO;
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		session.sendMessage(new TextMessage(aDAO.count_receive(sqlSession,message.getPayload())+ 
				"&" + aDAO.receive_data(sqlSession,message.getPayload())));
	}
}
