package com.gamgak.jjh.meeting.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamgak.csk.member.model.entity.Member;
import com.gamgak.jjh.meeting.model.dao.MeetingDao;
import com.gamgak.jjh.meeting.model.vo.Chat;
import com.gamgak.jjh.meeting.model.vo.EnterChat;
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
		
		int result=dao.insertMeeting(session,mee);
		if(result>0) {

			
			//자신의 모음에 자동으로 참여하기
			return dao.meetingjoin(session,mee);
		}else {
			return 0;
		}
		 
	}
//	모임 정보를 불러오기
	public List<Meeting> selectMeetingList() {
		return dao.selectMeetingList(session);
	}
//	모임 참여기능
	public int meetingjoin(Map m) {
		return dao.meetingjoin(session,m);
	}
	//채팅방 모임방 리스트불러오기
	public List<Map> selectLoginUserMeetingList(int memberNo){
		return dao.selectLoginUserMeetingList(session,memberNo);
	}
	//채팅방 정보 불러오기
	public List<Map> selectChattingRoomInfo(Map m){
		return dao.selectChattingRoomInfo(session,m);
	}
	
	//채팅방 멤버리스트 불러오기
	public List<Map> selectchatmemberlist(Map m){
		return dao.selectchatmemberlist(session,m);
	}
	//모임장이 모임신청 수락 y
	public int updateMeetingy(Map m) {
		int result=dao.updateMeetingy(session,m);
		if(result>0) {
			Meeting ber=dao.selectacceptmember(session,m);
			ber.setMeetingCurrentCount(ber.getMeetingCurrentCount()+1);
			
			int plusResult=dao.updateplusNum(session,ber);
			System.out.println("최종"+plusResult);
			return plusResult;
		}else {
			return 0;
		}
		
		//return dao.updateMeetingy(session,m);
	}
	
	//모임장이 모임신청 수락 n
		public int updateMeetingn(Map m) {
			//int rssult=dao.updateMeetingn(session,m);
			
			return dao.updateMeetingn(session,m);
		}
		//모임 나가기
		public int updateMeetingnn(Map m) {
			int result=dao.updateMeetingnn(session,m);
			if(result>0) {
				Meeting ber=dao.selectacceptmember(session,m);
				ber.setMeetingCurrentCount(ber.getMeetingCurrentCount()-1);
				
				int plusResult=dao.updateplusNum(session,ber);
				System.out.println("최종"+plusResult);
				return plusResult;
			}else {
				return 0;
			}
			//return dao.updateMeetingnn(session,m);
		}
		
	//사용자가 모음을 신청하기전에 enterchat에 등록되어있는 모임인지 확인하기위해 리스트를 불러오는 기능
		public EnterChat SelctenterchatList(Map m) {
			return dao.SelctenterchatList(session,m);
		}
		
		//모임 수정하기전에 데이터 뽑아 오기
		public Meeting selectMeeting(Map m) {
			return dao.selectMeeting(session,m);
		}
		
		//모임 수정하기
		public int updateMeeting(Meeting mee) {
			return dao.updateMeeting(session,mee);
		}
		//지역으로 모임 검색
		public List<Meeting> selectArea(Map m){
			return dao.selectArea(session,m);
		}
		
		// 채팅방 대화내용 저장
		public int insertChat(Map m) {
			return dao.insertChat(session,m);
		}
		
		//채팅방 대화 내용 불러오기
		public List<Chat> selectChatList(Map m) {
			return dao.selectChatList(session, m);
		}
		
		//모임삭제하기
		public int meetingDelete(Map m) {
			return dao.meetingDelete(session,m);
		}

}
