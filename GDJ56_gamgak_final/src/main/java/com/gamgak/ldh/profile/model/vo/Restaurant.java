package com.gamgak.ldh.profile.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Restaurant {
	private int resNo;
	private String resName;
	private String resAddress;
	private String resPhone;
	private double resLat;
	private double resLon;
	private String resCategory;
	private String resOriName;
	private String resReName;
}
