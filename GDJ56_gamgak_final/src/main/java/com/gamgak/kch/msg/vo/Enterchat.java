package com.gamgak.kch.msg.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Enterchat {

	private int memberNo;
	private int meetingNo;
	private int personalChatroomNo;
}
