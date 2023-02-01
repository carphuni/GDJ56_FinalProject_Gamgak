package com.gamgak.psh.admin.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jackson.JsonObjectDeserializer;
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
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
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
		List<Map> list=service.selectMemberData(Map.of("cPage",cPage,"numPerpage",numPerpage));
		
		memberlist.put("list",list);
		memberlist.put("pageBar",PageFactory.getPage(cPage, numPerpage, total,"member.do",functionN));
		
		return memberlist;
	}
	
	@RequestMapping("/myresview.do")
	public ModelAndView myresView(ModelAndView mv,long no) {
		
		//List<Myres> list=service.selectMyresList(no);
		//System.out.println(list);
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
	public Map<String,Object> selectUserReport(@RequestParam String tableN,@RequestParam(value="cPage",defaultValue="1")int cPage,String functionN) {
		Map<String,Object> reportlist=new HashMap<String, Object>();
		int numPerpage=5;
		int total=service.selectCount(tableN);
		reportlist.put("list",service.selectReportData(Map.of("cPage",cPage,"numPerpage",numPerpage,"tableN",tableN)));
		reportlist.put("pageBar",PageFactory.getPage(cPage, numPerpage, total,"meeting.do",functionN));
		
		System.out.println(reportlist);
		return reportlist;
	}
	
	@RequestMapping("/myresreport.do")
	@ResponseBody
	public Map<String,Object> selectMyresReport(@RequestParam String tableN,@RequestParam(value="cPage",defaultValue="1")int cPage,String functionN) {
		Map<String,Object> reportlist=new HashMap<String, Object>();
		int numPerpage=5;
		int total=service.selectCount(tableN);
		reportlist.put("list",service.selectReportData(Map.of("cPage",cPage,"numPerpage",numPerpage,"tableN",tableN)));
		reportlist.put("pageBar",PageFactory.getPage(cPage, numPerpage, total,"meeting.do",functionN));
		
		return reportlist;
	}
	
	@RequestMapping("/meetingreport.do")
	@ResponseBody
	public Map<String,Object> selectMeetingReport(@RequestParam String tableN,@RequestParam(value="cPage",defaultValue="1")int cPage,String functionN) {
		Map<String,Object> reportlist=new HashMap<String, Object>();
		int numPerpage=5;
		int total=service.selectCount(tableN);
		reportlist.put("list",service.selectReportData(Map.of("cPage",cPage,"numPerpage",numPerpage,"tableN",tableN)));
		reportlist.put("pageBar",PageFactory.getPage(cPage, numPerpage, total,"meeting.do",functionN));
		
		return reportlist;
	}
	
	@RequestMapping("/deletemember.do")
	@ResponseBody
	public Map<String,Object> deleteSomething(@RequestParam Map nodata, String tableN,String columnN) {
		String data=(String)(nodata.get("nodata"));
		Map result=new HashMap();
		List total=new ArrayList();
//		System.out.println(data);
		String datas=data.substring(data.length()-(data.length()-1),data.length()-1);
		String list[]=datas.split(",");
		for(int i=0;i<list.length;i++) {
//			System.out.println(Integer.parseInt(list[i].substring(list[i].length()-(list[i].length()-1),list[i].length()-1)));
			int result1=service.deleteData(Integer.parseInt(list[i].substring(list[i].length()-(list[i].length()-1),list[i].length()-1)),tableN,columnN);
//			System.out.println(result1);
			total.add(result1);
		}
		result.put("result", total);
		System.out.println(result.get(result));
		return result;
	}
	
}
