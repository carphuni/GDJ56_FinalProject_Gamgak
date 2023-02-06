package com.gamgak.kch.msg.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gamgak.kch.msg.dao.MsgDao;

@Service
public class MsgService {
	
	private MsgDao dao;
	
	@Autowired
	public MsgService(MsgDao dao) {
		this.dao=dao;
	}
	
	//채팅방 목록
	public List<Map> selectMsgList(Map param){
		System.out.println(param);
		return dao.selectMsgList(param);
	}
	
	//페이징
	public int selectMsgCount(int loginMemberNo) {
		System.out.println(loginMemberNo);
		return dao.selectMsgCount(loginMemberNo);
	}
	
	//채팅 대화목록
	public List<Map> selectChatList(int personalChatroomNo, int loginMemberNo){
		return dao.selectChatList(personalChatroomNo, loginMemberNo);
	}

	//대화 저장
	@Transactional
	public int insertMsg(int personalChatroomNo, int receiverNo, int senderNo, String content) {
		int result=dao.insertMsg(personalChatroomNo, receiverNo, senderNo, content);
		return result;
	}
	
	//같은방 회원 정보 가져오기
	public Map chatroomMember(int personalChatroomNo, int loginMemberNo) {
		return dao.chatroomMember(personalChatroomNo, loginMemberNo);
	}
	
	//방이 있는지 확인
	public Map chatroomCheck(int loginMember, int memberNo) {
		return dao.chatroomCheck(loginMember, memberNo);
	}
	
	//채팅방 번호 생성
	@Transactional
	public int personalChatRoomInsert() {
		int result=dao.personalChatRoomInsert();
		return result;
	}
	
	//생성된 채팅방 번호 가져오기
	public int personalChatRoomNo() {
		int result=dao.personalChatRoomNo();
		return result;
	}
	
	//로그인회원 대화방참여에 추가
	@Transactional
	public int enterchatInsert(int loginMemberNo, int chatRoomNo) {
		int result=dao.enterchatInsert(loginMemberNo, chatRoomNo);
		return result;
	}
	
	//친구 대화방참여에 추가
	@Transactional
	public int enterchatFriend(int memberNo, int chatRoomNo) {
		int result=dao.enterchatFriend(memberNo, chatRoomNo);
		return result;
	}
	
	//enterchat에서 삭제
	public int deleteChatroom(int personalChatroomNo, int loginMemberNo) {
		int result=dao.deleteChatroom(personalChatroomNo, loginMemberNo);
		return result;
	}
	
	//안읽은 메세지 리스트
	public Map unreadList(int personalChatroomNo, int loginMemberNo){
		return dao.unreadList(personalChatroomNo, loginMemberNo);
	}
	
	//읽음처리
	public int updateReadCount(int min, int max, int personalChatroomNo) {
		int result=dao.updateReadCount(min, max, personalChatroomNo);
		return result;
	}
	
	//헤더 안읽은 메세지 수
	public Map unreadCount(int loginMemberNo) {
		return dao.unreadCount(loginMemberNo);
	}

}
