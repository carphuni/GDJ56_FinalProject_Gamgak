package com.gamgak.kch.msg.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChatHandler {
	
	private String type;
	private int meetingNo;
	private int personalChatroomNo;
	private String memberReceiver;
	private String memberSender;
	private String chattingContent;
	private Date chattingEnrollDate;
	private int chattingUnreadCnt;
}

