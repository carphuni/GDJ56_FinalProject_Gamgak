package com.gamgak.psh.admin.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Report {

	private long report_no;
	private String report_title;
	private Date report_date;
	private String report_reason;
	private String report_tag;
}
