package com.gamgak.kch.msg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MsgController {
	
	@RequestMapping("/msg")
	public String msgList() {
		return "kch_msg/msgList";
	}
}
