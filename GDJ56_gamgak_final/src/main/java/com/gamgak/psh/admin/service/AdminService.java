package com.gamgak.psh.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	public List<Map> selectStopMember() {
		return dao.selectStopMember();
	}
	
	public List<Map> selectReportMember() {
		return dao.selectReportMember();
	}
	
	public List<Map> selectMyrestMember() {
		return dao.selectMyrestMember();
	}
	
	public List<Map> selectMeetingMember() {
		return dao.selectMeetingMember();
	}
	
	public int selectCount(Map param) {
		return dao.selectCount(param);
	}
	
	public int selectReportCount(Map param) {
		return dao.selectReportCount(param);
	}
	
	public int selectData(Map param) {
		return dao.selectData(param);
	}
	
	public int selectMsgtotalData(Map param) {
		return dao.selectMsgtotalData(param);
	}
	
	public int selectCountNo(Map param) {
		return dao.selectCountNo(param);
	}
	
	public List<Map> selectMemberData(Map param) {
		
		return dao.selectMemberData(param);
	}
	
	public List<Map> selectMyresList(Map param) {
		
		return dao.selectMyresList(param);
	}
	
	public List<Map> selectMeetingData(Map param) {
		
		return dao.selectMeetingList(param);
	}
	
	public List<Map> selectMsgData(Map param) {
		
		return dao.selectMsgData(param);
	}

	public int selectMsgCount(Map param) {
		
		return dao.selectMsgCount(param);
	}

	public List<Map> selectReportData(Map param) {
		
		return dao.selectReportList(param);
	}

	public List<Map> reportView(Map param) {
		
		return dao.reportView(param);
	}
	
	public Member selectMember(int no) {
		return dao.selectMember(no);
	}
	
	@Transactional
	public int deleteData(int no,String tableN,String columnN,String yn) {
		int result=dao.deleteData(no,tableN,columnN,yn);
		return result;
	}
//	public List<Object[]> selectMemberData2() {
//		
//		return (List<Object[]>)memberdao2.findAll();
//	}
//	
}
