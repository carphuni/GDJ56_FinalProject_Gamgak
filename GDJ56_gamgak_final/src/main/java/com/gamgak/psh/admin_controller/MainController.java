package com.gamgak.psh.admin_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//import com.gamgak.psh.admin_service.AdminService;

@Controller
public class MainController {
	
//	private AdminService service;
//	@Autowired
//	public MainController(AdminService service) {
//		super();
//		this.service = service;
//	}
	
	
	@RequestMapping("/")
	public String mainPage() {
		return "index";
	}
	

	@RequestMapping("/profile")
	public String profile() {
		return "ldh_profile/profile";
	}
	
	@RequestMapping("/admin")
	public String adminMainPage(ModelAndView mv) {
//		mv.addObject(service.selectCountData());
//		mv.setViewName("psh_admin/main");
		return "psh_admin/main";
	}
	
	@RequestMapping("/member")
	public String adminMemberPage(ModelAndView mv) {
//		mv.addObject(service.selectMemberData());
//		mv.setViewName("psh_admin/memberlist");
		return "psh_admin/memberlist";
	}
	
	
	
	
	@RequestMapping("/report")
	public String adminReportPage(ModelAndView mv) {
//		mv.addObject(service.selectReportData());
//		mv.setViewName("psh_admin/reportlist");
		return "psh_admin/reportlist";
	}
	
	
	
	
	@RequestMapping("/meeting")
	public String adminMeetingPage(ModelAndView mv) {
//		mv.addObject(service.selectMeetingData());
//		mv.setViewName("psh_admin/meetinglist");
		return "psh_admin/meetinglist";
	}
	
//	@RequestMapping("/admin")
//	public ModelAndView adminMainPage(ModelAndView mv) {
//		mv.addObject(service.selectCountData());
//		mv.setViewName("psh_admin/main");
//		return mv;
//	}
//	
//	@RequestMapping("/member")
//	public ModelAndView adminMemberPage(ModelAndView mv) {
//		mv.addObject(service.selectMemberData());
//		mv.setViewName("psh_admin/memberlist");
//		return mv;
//	}
//	
//	
//	
//	
//	@RequestMapping("/report")
//	public ModelAndView adminReportPage(ModelAndView mv) {
//		mv.addObject(service.selectReportData());
//		mv.setViewName("psh_admin/reportlist");
//		return mv;
//	}
//	
//	
//	
//	
//	@RequestMapping("/meeting")
//	public ModelAndView adminMeetingPage(ModelAndView mv) {
//		mv.addObject(service.selectMeetingData());
//		mv.setViewName("psh_admin/meeting");
//		return mv;
//	}
}
