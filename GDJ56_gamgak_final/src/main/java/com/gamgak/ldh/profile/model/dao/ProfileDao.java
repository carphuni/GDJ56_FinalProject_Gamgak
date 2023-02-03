package com.gamgak.ldh.profile.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gamgak.jjh.meeting.model.vo.Meeting;
import com.gamgak.ldh.profile.model.vo.MyPic;
import com.gamgak.ldh.profile.model.vo.MyRes;

@Repository
public class ProfileDao {
	
	//저장한 맛집 카운트 가져오기
	public int selectMyResCount(SqlSessionTemplate session, int memberNo){
		return session.selectOne("profile.selectMyResCount",memberNo);
	}
	
	//친구 카운트 가져오기
	public int selectFriendCount(SqlSessionTemplate session, int memberNo){
		return session.selectOne("profile.selectFriendCount",memberNo);
	}
	
	//모임 카운트 가져오기
	public int selectMeetingCount(SqlSessionTemplate session, int memberNo){
		return session.selectOne("profile.selectMeetingCount",memberNo);
	}
	//로그인한 사용자의 모임 정보 가져오기-jjh
	public List<Meeting> selectMeetingInfo(SqlSessionTemplate session,int memberNo){
		return session.selectList("profile.selectMeetingInfo",memberNo);
	}
	
	//내 저장한 맛집 조회
	public List<MyRes> selectMyResAll(SqlSessionTemplate session, Map param){
		return session.selectList("profile.selectMyResAll",param.get("memberNo"),new RowBounds((((int)param.get("cPage"))-1)*(int)param.get("numPerpage"),(int)param.get("numPerpage")));
	}
	
	//식당 저장
	public int insertRestaurant(SqlSessionTemplate session, Map restaurant) {
		try{
			return session.insert("profile.insertRestaurant",restaurant);
		}catch (Exception e) {
			return 0;
		}
	}
	
	//맛집 저장
	public int insertMyRes(SqlSessionTemplate session, Map param) {
		return session.insert("profile.insertMyRes",param);
	}
	
	//맛집 사진 저장
	public int insertMyPic(SqlSessionTemplate session, MyPic myPic) {
		return session.insert("profile.insertMyPic", myPic);
	}
	
}
