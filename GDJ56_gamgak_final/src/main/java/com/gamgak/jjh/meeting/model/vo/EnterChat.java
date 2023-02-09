package com.gamgak.jjh.meeting.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EnterChat {
	private int memberNo;
	private int meetingNo;
	private int personalChatRoomNo;
	private String meetingYN;
	private String ChatOutYn;
	private Date ChatOutDate;
	

}
