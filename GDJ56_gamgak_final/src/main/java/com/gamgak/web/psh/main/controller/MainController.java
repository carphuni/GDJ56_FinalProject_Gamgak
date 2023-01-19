package com.gamgak.web.psh.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/")
	public String mainPage() {
		return "index";
	}
	
	@RequestMapping("/admin")
	public String adminMainPage() {
		return "psh_admin/main";
	}
}
