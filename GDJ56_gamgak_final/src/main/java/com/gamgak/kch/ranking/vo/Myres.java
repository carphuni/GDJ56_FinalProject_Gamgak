package com.gamgak.kch.ranking.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Myres {

	int myresNo;
	int memberNo;
	int resNo;
	Date myresSaveDate;
	String myresMemo;
	String myresYn;
}
