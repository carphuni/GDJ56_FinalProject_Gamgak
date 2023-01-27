package com.gamgak.psh.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.gamgak.psh.admin.dao.AdminMemberDao;
//import com.gamgak.psh.admin.dao.MemberDao2;
import com.gamgak.psh.admin.vo.Member;
import com.gamgak.psh.admin.vo.Myres;

@Service
public class AdminService {

	private AdminMemberDao dao;
//	private MemberDao2 memberdao2;
	
	@Autowired
	public AdminService(AdminMemberDao dao) {
		super();
		this.dao = dao;
//		this.memberdao2=memberdao2;
	}
	
	public List<Map> selectMemberData() {
		
		return dao.selectMemberData();
	}
	
	public List<Map> selectMyresList(long no) {
		
		return dao.selectMyresList(no);
	}
	
	public List<Map> selectMeetingData() {
		
		return dao.selectMeetingList();
	}	
	public List<Map> selectReportData() {
		
		return dao.selectReportList();
	}	
//	public List<Object[]> selectMemberData2() {
//		
//		return (List<Object[]>)memberdao2.findAll();
//	}
//	
}
