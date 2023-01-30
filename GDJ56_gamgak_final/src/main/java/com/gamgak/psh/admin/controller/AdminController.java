package com.gamgak.psh.admin.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gamgak.psh.admin.service.AdminService;
import com.gamgak.psh.admin.vo.Member;
import com.gamgak.psh.admin.vo.Myres;
import com.gamgak.psh.admin.common.PageFactory;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	public Map<String,Object> selectMemberAll(@RequestParam(value="cPage",defaultValue="1")int cPage,String functionN) {
		Map<String,Object> memberlist=new HashMap<String, Object>();
//		@RequestParam(value="numPerpage",defaultValue="5") int numPerpage
		
		int numPerpage=5;
		String table="MEMBER";
		int total=service.selectCount(table);
		memberlist.put("list",service.selectMemberData(Map.of("cPage",cPage,"numPerpage",numPerpage)));
		memberlist.put("pageBar",PageFactory.getPage(cPage, numPerpage, total,"member.do",functionN));
		
		return memberlist;
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
	public Map<String,Object> selectMeetingAll(@RequestParam(value="cPage",defaultValue="1")int cPage,String functionN) {
		Map<String,Object> meetinglist=new HashMap<String, Object>();
//		@RequestParam(value="numPerpage",defaultValue="5") int numPerpage
		
		int numPerpage=5;
		String table="MEETING";
		int total=service.selectCount(table);
		meetinglist.put("list",service.selectMeetingData(Map.of("cPage",cPage,"numPerpage",numPerpage)));
		meetinglist.put("pageBar",PageFactory.getPage(cPage, numPerpage, total,"meeting.do",functionN));
		
		return meetinglist;
	}
	
	@RequestMapping("/report.do")
	public String adminReportPage() {
		return "psh_admin/reportlist";
	}
	
	@RequestMapping("/userreport.do")
	@ResponseBody
	public List<Map> selectUserReport(@RequestParam String tableN) {
		List<Map> users=service.selectReportData(tableN);
		return service.selectReportData(tableN);
	}
	
	@RequestMapping("/myresreport.do")
	@ResponseBody
	public List<Map> selectMyresReport(@RequestParam String tableN) {
		return service.selectReportData(tableN);
	}
	
	@RequestMapping("/meetingreport.do")
	@ResponseBody
	public List<Map> selectMeetingReport(@RequestParam String tableN) {
		List<Map> meetings=service.selectReportData(tableN);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		return service.selectReportData(tableN);
	}
	
}
