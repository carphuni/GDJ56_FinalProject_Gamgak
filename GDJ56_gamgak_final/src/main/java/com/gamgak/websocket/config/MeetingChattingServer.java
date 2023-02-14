package com.gamgak.websocket.config;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gamgak.kch.msg.vo.ChatHandler;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class MeetingChattingServer extends TextWebSocketHandler{
	
	 private static HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘 맵
	 
	 private ObjectMapper mapper;
		
		@Autowired
		public void setMappr(ObjectMapper mapper) {
			this.mapper=mapper;
		}

	    @Override
	    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	    	//메시지 발송
//			String msg = message.getPayload();
//			for(String key : sessionMap.keySet()) {
//				WebSocketSession wss = sessionMap.get(key);
//				try {
//					wss.sendMessage(new TextMessage(msg));
//				}catch(Exception e) {
//					e.printStackTrace();
//				}
//			}
	    	
	    	// TODO Auto-generated method stub
			//super.handleTextMessage(session, message);
			//클라이언트가 보낸 메세지 확인하기
			//클라이언트가 보낸 메세지는 playload에서 저장된다.
			log.debug("{}",message.getPayload());
			//클라이언트가 보낸 json데이터 jackson이용해서 파싱하기
			//ObjectMapper mapper=new ObjectMapper();
			ChatHandler msg=mapper.readValue(message.getPayload(),ChatHandler.class);
			log.debug("{}",msg);
			System.out.println(msg);
			
			switch(msg.getType()) {
			case "open" : addClient(session,msg); break; //client정보에 추가
			case "msg" : sendMessage(msg); break; //메세지를 클라이언트에게 전달
			case "system" : sendAdminMessage(); break; //시스템정보를 클라이언트에게 전달
			case "msgCh" : sendMessageCh(msg);break;
			}
	    }
	    
	    
	    private void addClient(WebSocketSession session, ChatHandler msg) throws IOException{
	    	//System.out.println("접속");
	    	
			session.getAttributes().put("info", msg);
			sessionMap.put(msg.getMemberSender(), session);
			SendMessage adminmsg=new SendMessage("system","","",msg.getMemberSender()+"가 접속했습니다.",msg.getMeetingNo());
			System.out.println(adminmsg);
			//ObjectMapper mapper=new ObjectMapper();
			for(String id:sessionMap.keySet()) {
				WebSocketSession client=sessionMap.get(id);
				//client.sendMessage(new TextMessage(mapper.writeValueAsString(adminmsg)));
				ChatHandler clientInfo=(ChatHandler)client.getAttributes().get("info");
				if(client.isOpen()&&msg.getMeetingNo()==clientInfo.getMeetingNo()) {
					client.sendMessage(new TextMessage(mapper.writeValueAsString(adminmsg)));
					//break;
				}
			}
			//deleteClient();
		}
		
	    private void deleteClient() {
			//접속이 종료된 session은 삭제해야함.
			Set<String> keys=sessionMap.keySet();
			Iterator<String> iterKey=keys.iterator();
			while(iterKey.hasNext()) {
				String key=iterKey.next();
				if(!sessionMap.get(key).isOpen()) iterKey.remove();
			}
		}
		private void sendMessage(ChatHandler msg) throws IOException{
					
			
			for(String id:sessionMap.keySet()) {
				WebSocketSession client=sessionMap.get(id);
				System.out.println("sendClient : "+client);
				System.out.println("sendMessage : "+msg);
				ChatHandler clientInfo=(ChatHandler)client.getAttributes().get("info");
				
				//client.sendMessage(new TextMessage(mapper.writeValueAsString(msg)));
				if(client.isOpen()&&msg.getMeetingNo()==clientInfo.getMeetingNo()) {
					client.sendMessage(new TextMessage(mapper.writeValueAsString(msg)));
					//break;
				}
			}
			
		}
		private void sendAdminMessage() {
			
		}

	    /* Client가 접속 시 호출되는 메서드 */
	    @Override
	    public void afterConnectionEstablished( WebSocketSession session) throws Exception {

	    	//소켓 연결
			//super.afterConnectionEstablished(session);
			//sessionMap.put(session.getId(), session);
			log.debug("{}"+session.getId());
			
	    }

	    /* Client가 접속 해제 시 호출되는 메서드드 */

	    @Override
	    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	    	//소켓 종료
			//sessionMap.remove(session.getId());
			//super.afterConnectionClosed(session, status);
	    	log.debug("{}",session);
			log.debug("{}",session.getId());
			log.debug("{}",sessionMap);
			log.debug("{}",sessionMap.size());
			
				System.out.println("나오라!!"+sessionMap);
				ChatHandler clientInfo=(ChatHandler)session.getAttributes().get("info");
				//log.debug("{}",sessionMap.get(clientInfo.getMemberSender()).getId());
				if(session.getId().equals(sessionMap.get(clientInfo.getMemberSender()).getId())) {
						sessionMap.remove(clientInfo.getMemberSender());
				}
				
			
			//log.debug("{}",sessionMap.get().getId());			for(int i=0 ;i<sessionMap.size();i++) {
			//log.debug("{}",sessionMap.get("user02").getId());
			log.debug("{}",sessionMap.size());
			log.debug("{}",session);
			//sessionMap.isEmpty();
			
		
				
//				if(session.getId()==sessionMap.get(i).getId()) {
//					sessionMap.get(i).getId().isEmpty();
//				}
				
			
			
			log.debug("{}",sessionMap.size());
			
			
	    }


// ---------------------------------------------------------------------
		private void sendMessageCh(ChatHandler msg) throws IOException{
			
			for(String id:sessionMap.keySet()) {
				WebSocketSession client=sessionMap.get(id);
				System.out.println("1대1 메세지 : "+msg);
				System.out.println("1대1"+client);
				client.sendMessage(new TextMessage(mapper.writeValueAsString(msg)));
			}
			
		}









	
//	shift + alt +s +v---> 메소드를 재정의 해서 사용
	
	
	

}
