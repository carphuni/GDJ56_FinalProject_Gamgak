package com.gamgak.ldh.profile.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamgak.ldh.profile.model.dao.ProfileDao;

@Service
public class ProfileService {
	
	private ProfileDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public ProfileService(ProfileDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}
	
	public int selectMyResCount(int memberNo) {
		return dao.selectMyResCount(session, memberNo);
	}

	
	
}
