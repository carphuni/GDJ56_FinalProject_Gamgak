package com.gamgak.jjh.meeting.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Meeting {
	private int meetingNo;
	private int memberLeaderNo;
	private String meetingTitle;
	private String meetingGender;
	private String meetingOriname;
	private String meetingRename;
	private int meetingPeopleNum;
	private int meetingCurrentCount;
	private String meetingDate;
	private Date meetingEnrollDate;
	private int meetingMinAge;
	private int meetingMaxAge;
	private String meetingArea;
	private String meetingDetailAddr;

}
