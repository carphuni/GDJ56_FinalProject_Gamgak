package com.gamgak.kch.msg.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChatHandler {
	
	private String type;
	private int meetingNo;
	private int personalChatroomNo;
	private String memberReceiver;
	private String memberSender;
	private String chattingContent;
	private Date chattingEnrollDate;
	private String chattingEnrollDate2;
	private int chattingUnreadCnt;
	private String profileOriname;
	private String profileRename;
}

