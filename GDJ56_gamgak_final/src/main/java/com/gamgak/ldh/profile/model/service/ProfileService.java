package com.gamgak.ldh.profile.model.service;

import java.util.Map;

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
	
	//저장한 맛집 카운트 가져오기
	public int selectMyResCount(int memberNo) {
		return dao.selectMyResCount(session, memberNo);
	}
	
	//친구 카운트 가져오기
	public int selectFriendCount(int memberNo) {
		return dao.selectFriendCount(session, memberNo);
	}
	
	//모임 카운트 가져오기
	public int selectMeetingCount(int memberNo) {
		return dao.selectMeetingCount(session, memberNo);
	}
	
	//맛집 저장
	public int insertMyRes(Map param) {
		//식당 저장 후 map에 저장
		int result=dao.insertRestaurant(session, (Map)param.get("restaurant"));
		System.out.println(result);
		System.out.println(param.get("resNo"));
//		param.put("resNo", resNo);
//		//맛집 저장 후 map에 저장
//		int myResNo=dao.insertMyRes(session, param);
//		param.put("myResNo", myResNo);
//		//맛집 사진 저장
		
		return 0;
	}
	
	
	
}
