package com.gamgak.csk.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.gamgak.csk.member.model.dao.MemberDao;
import com.gamgak.csk.member.model.entity.Member;
@Service
public class SecurityService implements UserDetailsService{
	
	private MemberDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public SecurityService(MemberDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}

	@Override
	public UserDetails loadUserByUsername(String memberEmail) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		
		Member m=dao.selectMemberById(session, Member.builder().memberEmail(memberEmail).build());
		
		if(m==null) throw new UsernameNotFoundException(memberEmail);
		
		return m;
	}
	
	
	
	

}
