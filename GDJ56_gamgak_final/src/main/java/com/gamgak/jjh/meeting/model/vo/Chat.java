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
public class Chat {
	
	private int chatNo;
	private int meetingNo;
	private int memberReceuverNo;
	private int memberSenderNo;
	private String chattingContent;
	private Date chattingEnrollDate;
	private int chattingUnreadCnt;
	
	
	
	
	

}
