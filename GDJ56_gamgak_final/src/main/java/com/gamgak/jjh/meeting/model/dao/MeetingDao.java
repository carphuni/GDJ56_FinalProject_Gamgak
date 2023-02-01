package com.gamgak.jjh.meeting.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gamgak.jjh.meeting.model.vo.Meeting;

@Repository
public class MeetingDao {
	
	public int insertMeeting(SqlSessionTemplate session,Meeting mee) {
		System.out.println("dao"+mee);
		return session.insert("meeting.insertMeeting",mee);
	}
	
	public List<Meeting> selectMeetingList(SqlSessionTemplate session) {
		return session.selectList("meeting.selectMeetingList");
	}

}
