package com.gamgak.psh.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gamgak.psh.admin.service.AdminService;

//import com.gamgak.psh.admin_service.AdminService;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String mainPage() {
		return "index";
	}
	

//	@RequestMapping("/profile")
//	public String profile() {
//		return "ldh_profile/profile";
//	}
	
}
