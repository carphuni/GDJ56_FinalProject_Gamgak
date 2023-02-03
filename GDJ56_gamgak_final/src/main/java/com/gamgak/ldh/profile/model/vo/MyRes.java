package com.gamgak.ldh.profile.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MyRes {
	private int myResNo;
	private int memberNo;
	private int resNo;
	private String myResSaveDate;
	private String myResMemo;
	private String myResYn;
	private String delYn;
	private Restaurant restaurant;
	private MyPic myPic;
}
