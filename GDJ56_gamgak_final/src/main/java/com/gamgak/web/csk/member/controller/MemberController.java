package com.gamgak.web.csk.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.gamgak.web.csk.member.model.entity.Member;
import com.gamgak.web.csk.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;
@SessionAttributes({"loginMember"})
@Slf4j
@Controller
public class MemberController {
	private MemberService service;

	@Autowired 
	public MemberController(MemberService service) {
		super();
		this.service = service;
	}
	
	@RequestMapping("/login")
	@ResponseBody
	public String login(Member m, HttpSession session) {
		Member loginMember=service.selectMemberById(m);
		log.debug("{}"+loginMember);
		if(loginMember!=null&&
				loginMember!=null && loginMember.getMemberPassword().equals(m.getClass())) {
			session.setAttribute("loginMember", loginMember);
		}
		return "redirect:/ldh_profile/profile";
	}

}
