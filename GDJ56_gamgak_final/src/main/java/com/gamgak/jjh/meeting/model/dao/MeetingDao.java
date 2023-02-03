package com.gamgak.jjh.meeting.model.dao;

import java.util.List;
import java.util.Map;

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
	
	public int meetingjoin(SqlSessionTemplate session,Map m) {
		return session.insert("meeting.meetingjoin",m);
	}
	
	public int meetingjoin(SqlSessionTemplate session,Meeting mee) {
		return session.insert("meeting.meetingjoin2",mee);
	}

}
