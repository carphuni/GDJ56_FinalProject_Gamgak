package com.gamgak.psh.admin.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder 
public class Meeting {

	private long meeting_no;
	private long member_leader_no;
	private String meeting_title;
	private String meeting_gender;
	private int meeting_peoplenum;
	private int meeting_current_count;
	private Date meeting_date;
	private Date meeting_enroll_date;
	private int meeting_minage;
	private int meeting_maxage;
	private String meeting_area;
	private String meeting_detailed_addr;
	
	
	
}
