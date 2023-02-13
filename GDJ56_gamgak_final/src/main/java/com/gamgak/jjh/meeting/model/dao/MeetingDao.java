package com.gamgak.jjh.meeting.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gamgak.csk.member.model.entity.Member;
import com.gamgak.jjh.meeting.model.vo.Chat;
import com.gamgak.jjh.meeting.model.vo.EnterChat;
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
	public List<Map> selectLoginUserMeetingList(SqlSessionTemplate session, int memberNo){
		return session.selectList("meeting.selectLoginUserMeetingList",memberNo);
	}
	
	public List<Map> selectChattingRoomInfo(SqlSessionTemplate session,Map m){
		return session.selectList("meeting.selectChattingRoomInfo",m);
	}
	public List<Map> selectchatmemberlist(SqlSessionTemplate session, Map m){
		return session.selectList("meeting.selectchatmemberlist",m);
	}
//	public int meetingCnt(SqlSessionTemplate session, Meeting m) {
//		return session.selectOne("meeting.meetingCnt",m);
//	}
	
	public int updateMeetingy(SqlSessionTemplate session,Map m) {
		return session.update("meeting.updateMeetingy",m);
	}
	
	public int updateMeetingn(SqlSessionTemplate session,Map m) {
		return session.update("meeting.updateMeetingn",m);
	}
	public int updateMeetingnn(SqlSessionTemplate session, Map m) {
		return session.update("meeting.updateMeetingnn",m);
	}
	
	public EnterChat SelctenterchatList(SqlSessionTemplate session, Map m) {
		return session.selectOne("meeting.SelctenterchatList", m);
	}
	//사람 명수 변경 추가해주는 sql
	public int updateplusNum(SqlSessionTemplate session, Meeting m) {
		System.out.println("변경할 cnt"+m);
		return session.update("meeting.updateNum",m);
	}
	//사람 명수 찾아주는 sql
	public Meeting selectacceptmember(SqlSessionTemplate session ,Map m) {
		return session.selectOne("meeting.selectacceptmember",m);
	}
	//모임 수정해주기전에 데이터 뽑아오는 기능
	public Meeting selectMeeting(SqlSessionTemplate session, Map m) {
		return session.selectOne("meeting.selectMeeting",m);
	}
	public int updateMeeting(SqlSessionTemplate session, Meeting mee) {
		return session.update("meeting.updateMeeting",mee);
	}
	//모임 채팅방 대화 내용 저장
	public int insertChat(SqlSessionTemplate session, Map m) {
		System.out.println("메세지 Dao"+m);
		return session.insert("meeting.insertChat",m);
	}
	
	//모임 대화방 채팅 불러오기
	public List<Chat> selectChatList(SqlSessionTemplate session, Map m) {
		return session.selectList("meeting.selectChatList",m);
	}
	
	//지역으로 모임 검색하기
	public List<Meeting> selectArea(SqlSessionTemplate session, Map m){
		return session.selectList("meeting.selectArea",m);
	}
	
	//모임 삭제하기
	public int meetingDelete(SqlSessionTemplate session, Map m) {
		return session.delete("meeting.meetingDelete",m);
	}

}
