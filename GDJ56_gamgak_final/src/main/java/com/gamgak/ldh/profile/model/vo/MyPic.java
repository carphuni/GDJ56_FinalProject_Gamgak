package com.gamgak.ldh.profile.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MyPic {
	private int myPicNo;
	private MyRes myres;
	private String myPicOriName;
	private String myPicReName;
}
