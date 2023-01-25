package com.gamgak.main;

import org.springframework.web.bind.annotation.RequestMapping;

public class IndexController {
	
	@RequestMapping("/")
	public String mainPage() {
		return "index";
	}	
	
}
