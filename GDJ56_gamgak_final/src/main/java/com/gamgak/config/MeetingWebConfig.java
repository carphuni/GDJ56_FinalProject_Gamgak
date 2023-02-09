package com.gamgak.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.gamgak.websocket.config.ChattingServer;
import com.gamgak.websocket.config.MeetingChattingServer;

import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
@EnableWebSocket
public class MeetingWebConfig implements WebSocketConfigurer, WebMvcConfigurer {
	
	private MeetingChattingServer meetingChattingServer;
	
	@Autowired
	public MeetingWebConfig(MeetingChattingServer meetingChattingServer) {
		super();
		this.meetingChattingServer=meetingChattingServer;
	}

	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**").allowedOrigins("http://localhost:3000");
	}

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(meetingChattingServer, "/jjh_chatting_Server").setAllowedOrigins("*");
	}
	

}
