package com.gamgak.ldh.profile.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ProfileDao {
	
	public int selectMyResCount(SqlSessionTemplate session, int memberNo){
		return session.selectOne("profile.selectMyResCount",memberNo);
	}
	
}
