package com.gamgak.jjh.meeting.model.service;

import java.util.List;

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
	public int insertMeeting(Meeting mee) {
		return dao.insertMeeting(session,mee);
	}
	
	public List<Meeting> selectMeetingList() {
		return dao.selectMeetingList(session);
	}

}
