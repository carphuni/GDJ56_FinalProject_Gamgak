package com.gamgak.psh.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gamgak.psh.admin.service.AdminService;
import com.gamgak.psh.admin.vo.Member;
import com.gamgak.psh.admin.vo.Myres;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private AdminService service;
	@Autowired
	public AdminController(AdminService service) {
		super();
		this.service = service;
	}
	
	@RequestMapping("/")
	public String adminMainPage(ModelAndView mv) {
//		mv.addObject(service.selectCountData());
//		mv.setViewName("psh_admin/main");
		return "psh_admin/main";
	}
	
//	@RequestMapping("/admin")
//	public ModelAndView adminMainPage(ModelAndView mv) {
//		mv.addObject(service.selectCountData());
//		mv.setViewName("psh_admin/main");
//		return mv;
//	}
	
	@RequestMapping("/member.do")
	public String adminMemberPage() {
		return "/psh_admin/memberlist";
	}
	
	@RequestMapping("/selectmember.do")
	@ResponseBody
	public List<Member> selectMemberAll() {
		System.out.println(service.selectMemberData());
		return service.selectMemberData();
	}
	
	
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
