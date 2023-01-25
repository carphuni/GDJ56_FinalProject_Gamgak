package com.gamgak.kch.ranking.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Restaurant {

	int resNo;
	String resName;
	String resAddress;
	String resPhone;
	double resLat;
	double resLon;
	String resCategory;
	String resOriname;
	String resRename;
	
}
