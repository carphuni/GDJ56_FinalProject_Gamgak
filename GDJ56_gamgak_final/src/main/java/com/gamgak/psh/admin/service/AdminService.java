package com.gamgak.psh.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.gamgak.psh.admin.dao.MemberDao;
//import com.gamgak.psh.admin.dao.MemberDao2;
import com.gamgak.psh.admin.vo.Member;
import com.gamgak.psh.admin.vo.Myres;

@Service
public class AdminService {

	private MemberDao dao;
//	private MemberDao2 memberdao2;
	
	@Autowired
	public AdminService(MemberDao dao) {
		super();
		this.dao = dao;
//		this.memberdao2=memberdao2;
	}
	
	public List<Member> selectMemberData() {
		
		return dao.selectMemberData();
	}
//	public List<Object[]> selectMemberData2() {
//		
//		return (List<Object[]>)memberdao2.findAll();
//	}
//	
}
