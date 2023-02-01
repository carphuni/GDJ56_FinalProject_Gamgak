package com.gamgak.kch.msg.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	
	

}
