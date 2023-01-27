package com.gamgak.websocket.config;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SendMessage {
	private String type;
	private String sender;
	private String reciever;
	private String msg;
	private String room;

}
