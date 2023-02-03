package com.gamgak.jjh.meeting.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamgak.jjh.meeting.model.dao.MeetingDao;
import com.gamgak.jjh.meeting.model.vo.Meeting;

@Service
public class MeetingService {
	
	private MeetingDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public MeetingService(MeetingDao dao,SqlSessionTemplate session) {
		super();
		this.dao=dao;
		this.session=session;
	}
//	모임장이 모임 등록
	public int insertMeeting(Meeting mee) {
		return dao.insertMeeting(session,mee);
	}
//	모임 정보를 불러오기
	public List<Meeting> selectMeetingList() {
		return dao.selectMeetingList(session);
	}
//	모임 참여기능
	public int meetingjoin(Map m) {
		return dao.meetingjoin(session,m);
	}

}
