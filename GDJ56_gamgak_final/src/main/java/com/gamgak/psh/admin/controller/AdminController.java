package com.gamgak.psh.admin.controller;

import java.util.List;
import java.util.Map;

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
	
	@RequestMapping("/member.do")
	public String adminMemberPage() {
		return "/psh_admin/memberlist";
	}
	
	@RequestMapping("/selectmember.do")
	@ResponseBody
	public List<Map> selectMemberAll() {
		//System.out.println(service.selectMemberData());
		return service.selectMemberData();
	}
	
	@RequestMapping("/myresview.do")
	public ModelAndView myresView(ModelAndView mv,long no) {
		
		mv.addObject("myreslist",service.selectMyresList(no));
		System.out.println(mv);
		mv.setViewName("/psh_admin/myresview");
		return mv;
	}
	
	@RequestMapping("/meeting.do")
	public String adminMeetingPage() {
		return "/psh_admin/meetinglist";
	}
	
	@RequestMapping("/selectmeeting.do")
	@ResponseBody
	public List<Map> selectMeetingAll() {
		System.out.println(service.selectMeetingData());
		return service.selectMeetingData();
	}
	
	@RequestMapping("/report.do")
	public String adminReportPage() {
		return "psh_admin/reportlist";
	}
	@RequestMapping("/selectreport.do")
	public ModelAndView adminReportPage(ModelAndView mv) {
		mv.addObject(service.selectReportData());
		mv.setViewName("psh_admin/reportlist");
		return mv;
	}
	
	
}
