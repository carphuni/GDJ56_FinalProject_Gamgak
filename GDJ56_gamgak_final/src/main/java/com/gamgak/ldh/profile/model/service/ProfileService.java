package com.gamgak.ldh.profile.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamgak.ldh.profile.model.dao.ProfileDao;
import com.gamgak.ldh.profile.model.vo.MyPic;
import com.gamgak.ldh.profile.model.vo.MyRes;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
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
	
	//내 저장한 맛집 조회
	public List<MyRes> selectMyResAll(int memberNo){
		return dao.selectMyResAll(session, memberNo);
	}
	
	//맛집 저장
	public int insertMyRes(Map param) {
		//식당 저장 후 map에 저장
		int result=dao.insertRestaurant(session, (Map)param.get("restaurant"));
		log.debug("식당 저장 결과 : {}",result);
		//맛집 저장 후 map에 저장
		result=dao.insertMyRes(session, param);
		log.debug("맛집 저장 결과 : {}",result);
		log.debug("MYRES PK : {}",param.get("myResNo"));
		//맛집 저장 성공 시
		if(result>0) {
			//맛집 사진 저장
			int result1=0;
			List<MyPic> files=(List<MyPic>)param.get("files");
			
			for(MyPic p : files ) {
				p.getMyres().setMyResNo((int)param.get("myResNo"));
				result1+=dao.insertMyPic(session, p);
			}
			//이미지 등록 수와 INSERT RETURN INT값이 같을 때
			if(result1==files.size()) {
				//commit
//				session.commit();
//				session.close();
				log.debug("맛집 사진 저장 결과 : {} 커밋",result1);
				return result1;
			}else {
				//rollback
//				session.rollback();
//				session.close();
				log.debug("맛집 사진 저장 결과 : {} 롤백",result1);
			}
			
		}
		return 0;
		
		
	}
	
	
	
}
