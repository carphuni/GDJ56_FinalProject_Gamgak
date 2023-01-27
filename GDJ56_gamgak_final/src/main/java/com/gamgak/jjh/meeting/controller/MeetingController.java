package com.gamgak.jjh.meeting.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MeetingController {
	
	@RequestMapping("meetting/meettinglist.do")
	public ModelAndView meetingMainview(ModelAndView mv) {
		mv.setViewName("/jjh_meetting/meettinglist");
		return mv;
	}
	
	@RequestMapping("/meetting/meettingenroll.do")
	public ModelAndView meetingEnroll(ModelAndView mv) {
		mv.setViewName("/jjh_meetting/meettingEnroll");
		return mv;
	}
	
	@RequestMapping("/meetting/meettingmanage.do")
	public ModelAndView meetingManage(ModelAndView mv) {
		mv.setViewName("/jjh_meetting/meettingmanage");
		return mv;
	}
	
	@RequestMapping("/meetting/invitemeetting.do")
	public ModelAndView meetingInvite(ModelAndView mv) {
		mv.setViewName("/jjh_meetting/meettinginvite");
		return mv;
	}
	@RequestMapping("/meetting/updatemeetting.do")
	public ModelAndView meetingUpdate(ModelAndView mv) {
		mv.setViewName("/jjh_meetting/meettingUpdate");
		return mv;
	}
	
	@RequestMapping("/meetting/meettingchat.do")
	public ModelAndView meetingCaht(ModelAndView mv, HttpSession session) {
		mv.setViewName("/jjh_meetting/chattingroom");
		mv.addObject("loginMember", session.getAttribute("loginMember"));
		System.out.println("JJH_controller "+session.getAttribute("loginMember"));
		return mv;
	}

}
