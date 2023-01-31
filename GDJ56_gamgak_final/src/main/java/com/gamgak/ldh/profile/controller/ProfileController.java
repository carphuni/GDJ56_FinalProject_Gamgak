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
		int memberNo=loginMember.getMemberNo();
		model.addAttribute("myResCount", service.selectMyResCount(memberNo));
		model.addAttribute("friendCount", service.selectFriendCount(memberNo));
   	 	model.addAttribute("meetingCount", service.selectMeetingCount(memberNo));
		return "ldh_profile/profile";
	}

	
}
