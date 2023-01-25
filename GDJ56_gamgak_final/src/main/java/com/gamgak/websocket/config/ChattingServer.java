package com.gamgak.websocket.config;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.MessageHandler;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gamgak.jjh.meeting.model.vo.Chat;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class ChattingServer extends TextWebSocketHandler{
	
	private Map<Integer,WebSocketSession> clients=new HashMap<>();
	private ObjectMapper mapper=new ObjectMapper();
	private List<MessageHandler> messages=new ArrayList<>();
	
	private static int i;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		i++;
		System.out.println(i);
		// TODO Auto-generated method stub
		log.debug("클라이언트 접속");
	}
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
				//super.handleTextMessage(session, message);
				//클라이언트가 보낸 메세지 확인하기
				//클라이언트가 보낸 메세지는 playload에서 저장된다.
				log.debug("{}",message.getPayload());
				//클라이언트가 보낸 json데이터 jackson이용해서 파싱하기
				//ObjectMapper mapper=new ObjectMapper();
				Chat msg=mapper.readValue(message.getPayload(), Chat.class);
				log.debug("{}",msg);
				
				switch(msg.getType()) {
				case "open" : addClient(session, msg); break; //client정보에 추가
				case "msg" : sendMessage(msg); break; //메세지를 클라이언트에게 전달
				case "system" : sendAdminMessage(); break; //시스템정보를 클라이언트에게 전달
				}
				
				
	}
	 Date today = new Date(0);
	private void addClient(WebSocketSession session, Chat msg) throws IOException{
		
		session.getAttributes().put("info", msg);
		clients.put(msg.getMemberSenderNo(), session);
		Chat adminmsg = new Chat(10,10,10,10,"ㅁㄴㅇ",today,10,"");
		//Chat adminmsg=new Chat("system","","",msg.getMemberSenderNo()+"가 접속했습니다.","");
		//ObjectMapper mapper=new ObjectMapper();
		for(Integer id:clients.keySet()) {
			WebSocketSession client=clients.get(id);
			client.sendMessage(new TextMessage(mapper.writeValueAsString(adminmsg)));
		}
	}
	
private void sendMessage(Chat msg) throws IOException{
		
		for(Integer id:clients.keySet()) {
			WebSocketSession client=clients.get(id);
			client.sendMessage(new TextMessage(mapper.writeValueAsString(msg)));
			
			
		}
		
	}
	private void sendAdminMessage() {
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		i--;
		System.out.println(i);
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
	}
	
	

}
