package com.gamgak.csk.member.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.gamgak.csk.member.model.entity.Member;
import com.gamgak.csk.member.model.service.MemberService;

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
//	String a="";
	@RequestMapping("/login")
//	@ResponseBody
	public String login(Member m,HttpServletRequest request ,HttpSession session, Model model) throws Exception {
		Member loginMember=service.selectMemberById(m);
		System.out.println("DB에서 받아온 로그인 정보 : "+loginMember);
		log.debug("{}"+loginMember);
		if(loginMember!=null && loginMember.getMemberPassword().equals(m.getMemberPassword())) {		
			session.setAttribute("loginMember", loginMember);
		}
		System.out.println("controller "+session.getAttribute("loginMember"));
		return "redirect:/profile";
	}

}
