package com.gamgak.csk.member.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamgak.csk.member.model.dao.MemberDao;
import com.gamgak.csk.member.model.entity.Member;

@Service
public class MemberService {
	
	private MemberDao dao;
	private SqlSessionTemplate session;

	
	@Autowired
	public MemberService(MemberDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}

	public Member selectMemberById(Member m) {
		return dao.selectMemberById(session,m);
	}
	public Member selectMemberByEmail(String memberEmail) {
		return dao.selectMemberByEmail(session,memberEmail);
	}
	public Member selectMemberByNickName(Member m) {
		return dao.selectMemberByNickName(session,m);
	}
	public int insertMember(Member m) {
		return dao.insertMember(session, m);
	}
	public int updateMember(Map param) {
		return dao.updateMember(session, param);
	}
	public int updatePassword(Member m) {
		return dao.updatePassword(session, m);
	}
	public String checkPassword(int memberNo) {
		return dao.checkPassword(session, memberNo);
	}
	
	public int updateProfileImg(Map param) {
		return dao.updateProfileImg(session, param);
		
	}
	public String selectFileReName(int memberNo) {
		return dao.selectFileReName(session, memberNo);
	}
	public int resetProfileImg(int memberNo) {
		return dao.resetProfileImg(session, memberNo);
	}

}
