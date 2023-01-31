package com.gamgak.ldh.profile.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gamgak.csk.member.model.entity.Member;
import com.gamgak.ldh.profile.model.service.ProfileService;

@Controller
public class ProfileController {

	private ProfileService service;
	private final HttpSession httpSession;

	@Autowired
	public ProfileController(ProfileService service, HttpSession httpSession) {
		super();
		this.service = service;
		this.httpSession = httpSession;
	}



	@RequestMapping("/profile")
	public String profile(Model model) {
		Member loginMember=(Member)httpSession.getAttribute("loginMember");
		model.addAttribute("myResCount", service.selectMyResCount(loginMember.getMemberNo()));
		model.addAttribute("friendCount", loginMember);
   	 	model.addAttribute("meetingCount", loginMember);
		return "ldh_profile/profile";
	}

	
}
