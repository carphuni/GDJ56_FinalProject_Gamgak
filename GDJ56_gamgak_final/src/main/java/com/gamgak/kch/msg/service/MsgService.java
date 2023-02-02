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

	//메세지 저장
	@Transactional
	public int insertMsg(int personalChatroomNo, int receiverNo, int senderNo, String content) {
		int result=dao.insertMsg(personalChatroomNo, receiverNo, senderNo, content);
		return result;
	}
	
	//같은방 회원 정보 가져오기
	public Map chatroomMember(int personalChatroomNo, int loginMemberNo) {
		return dao.chatroomMember(personalChatroomNo, loginMemberNo);
		
	}
	
	

}
