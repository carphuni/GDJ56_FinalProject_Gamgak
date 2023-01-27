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
public class Meeting {
	private Integer meetingNo;
	private Integer memberLeaderNo;
	private String meetingTitle;
	private String meetingGender;
	private String meetingOriname;
	private String meetingRename;
	private int meetingPeopleNum;
	private int meetingCurrentCount;
	private Date meetingDate;
	private Date meetingEnrollDate;
	private int meetingMinAge;
	private int meetingMaxAge;
	private int meetingArea;

}
