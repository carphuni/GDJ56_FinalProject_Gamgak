package com.gamgak.psh.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
	
	public int selectCount(String table) {
		return dao.selectCount(table);
	}
	
	public List<Map> selectMemberData(Map param) {
		
		return dao.selectMemberData(param);
	}
	
	public List<Map> selectMyresList(long no) {
		
		return dao.selectMyresList(no);
	}
	
	public List<Map> selectMeetingData(Map param) {
		
		return dao.selectMeetingList(param);
	}
	
	public List<Map> selectReportData(String tableN) {
		
		return dao.selectReportList(tableN);
	}	
//	public List<Object[]> selectMemberData2() {
//		
//		return (List<Object[]>)memberdao2.findAll();
//	}
//	
}
