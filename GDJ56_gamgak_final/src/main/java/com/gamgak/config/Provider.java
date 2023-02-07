package com.gamgak.config;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.gamgak.csk.member.model.dao.MemberDao;
import com.gamgak.csk.member.model.entity.Member;

@Component
public class Provider implements AuthenticationProvider{
	
	private MemberDao dao;
	private SqlSessionTemplate session;
	private BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
	
	@Autowired
	public Provider(MemberDao dao, SqlSessionTemplate session) {
		// TODO Auto-generated constructor stub
		super();
		this.dao=dao;
		this.session=session;
	}
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String memberEmail=authentication.getName();
		String memberPassword=(String)authentication.getCredentials();
		Member loginMember=dao.selectMemberById(session, Member.builder().memberEmail(memberEmail).build());
		if(loginMember==null || !encoder.matches(memberPassword, loginMember.getMemberPassword())) {
			throw new BadCredentialsException("로그인할 수 없습니다.");
		}
		return new UsernamePasswordAuthenticationToken(loginMember, loginMember.getMemberPassword(), loginMember.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}
	
	
	
	
}
