package com.gamgak.web.psh.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {

	@RequestMapping("/")
	public String mainPage() {
		return "index";
	}
	
	@RequestMapping("/profile")
	public String profile() {
		return "ldh_profile/profile";
	}
	
	@RequestMapping("/admin")
	public String adminMainPage() {
		return "psh_admin/main";
	}
}
