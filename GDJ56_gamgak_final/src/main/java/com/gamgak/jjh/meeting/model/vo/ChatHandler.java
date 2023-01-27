package com.gamgak.jjh.meeting.model.vo;

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
	private String memberReceuver;
	private String memberSender;
	private String chattingContent;
	private Date chattingEnrollDate;
	private int chattingUnreadCnt;
}

