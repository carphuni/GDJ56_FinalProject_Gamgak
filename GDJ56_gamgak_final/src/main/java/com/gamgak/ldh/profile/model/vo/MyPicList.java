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
public class MyPicList {
	private int myResNo;
	private List<MyPic> myPicList;
}
