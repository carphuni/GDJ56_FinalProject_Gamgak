package com.gamgak.kch.msg.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gamgak.kch.msg.common.PageFactory;
import com.gamgak.kch.msg.service.MsgService;
import com.gamgak.psh.admin.vo.Member;

@Controller
@RequestMapping("/msg")
public class MsgController {
	
	private MsgService service;
	
	
	@Autowired
	public MsgController(MsgService service) {
		this.service=service;
	}
	
	//페이지전환
	@RequestMapping("/msgList.do")
	public String msgList() {
		return "kch_msg/msgList";
	}
	
	//채팅방 목록
	@RequestMapping("/selectMsgList.do")
	@ResponseBody
	public Map<String,Object> selectMsgList(int loginMemberNo, int cPage) {
		Map<String,Object> list=new HashMap<String, Object>();
		int numPerpage=5;
		int total=service.selectMsgCount(loginMemberNo);
		list.put("list",service.selectMsgList(Map.of("loginMemberNo",loginMemberNo,"cPage",cPage,"numPerpage",numPerpage)));
		list.put("pageBar",PageFactory.getPage(loginMemberNo,cPage, numPerpage, total,"selectMsgList.do"));
		System.out.println(list);

		return list;
	}
	
	//채팅 대화내용
	@RequestMapping("/selectChatList.do")
	@ResponseBody
	public List<Map> selectChatList(int personalChatroomNo, int loginMemberNo){
		List<Map> list=service.selectChatList(personalChatroomNo, loginMemberNo);
		return list;
	}
	
	//메세지 저장
	@RequestMapping("/insertMsg.do")
	@ResponseBody
	public int insertMsg(int personalChatroomNo,int receiverNo, int senderNo, String content) {
		int result=service.insertMsg(personalChatroomNo,receiverNo,senderNo,content);
		return result;
	}
	
	//같은방 회원 정보 가져오기
	@RequestMapping("/chatroomMember.do")
	@ResponseBody
	public Map chatroomMember(int personalChatroomNo, int loginMemberNo) {
		Map m=new HashMap();
		m.put("data",service.chatroomMember(personalChatroomNo,loginMemberNo));
		return m;
	}
	
	//친구페이지전환
	@RequestMapping("/friend.do")
	public String friendList() {
		return "kch_msg/friend";
	}
	
	//방이 있는지 확인
	@RequestMapping("/chatroomCheck/do")
	@ResponseBody
	public Map chatroomCheck(int loginMember, int memberNo) {
		Map m=new HashMap();
		m.put("data",service.chatroomCheck(loginMember, memberNo));
		return m;
	}
	
	//채팅방 번호 생성
	@RequestMapping("/personalChatRoomInsert.do")
	@ResponseBody
	public int personalChatRoomInsert() {
		int result=service.personalChatRoomInsert();
		return result;
	}
	
	//생성된 채팅방 번호 가져오기
	@RequestMapping("/personalChatRoomNo.do")
	@ResponseBody
	public int personalChatRoomNo() {
		int result=service.personalChatRoomNo();
		return result;
	}
	
	//로그인회원 대화방참여에 추가
	@RequestMapping("/enterchatInsert.do")
	@ResponseBody
	public int enterchatInsert(int loginMemberNo, int chatRoomNo) {
		int result=service.enterchatInsert(loginMemberNo, chatRoomNo);
		return result;
	}
	
	//친구 대화방참여에 추가
	@RequestMapping("/enterchatFriend.do")
	@ResponseBody
	public int enterchatFriend(int memberNo, int chatRoomNo) {
		int result=service.enterchatFriend(memberNo, chatRoomNo);
		return result;
	}
	
	//enterchat에서 삭제
	@RequestMapping("/deleteChatroom.do")
	@ResponseBody
	public int deleteChatroom(int personalChatroomNo, int loginMemberNo) {
		int result=service.deleteChatroom(personalChatroomNo, loginMemberNo);
		return result;
	}
	
	//안읽은 메세지 리스트
	@RequestMapping("/unreadList.do")
	@ResponseBody
	public Map unreadList(int personalChatroomNo, int loginMemberNo){
		Map m=new HashMap();
		m.put("data",service.unreadList(personalChatroomNo, loginMemberNo));
		return m;
	}
	
	//읽음처리
	@RequestMapping("/updateReadcount.do")
	@ResponseBody
	public int updateReadCount(int min, int max, int personalChatroomNo) {
		int result=service.updateReadCount(min, max, personalChatroomNo);
		return result;
	}
	
	//헤더 안읽은 메세지 수
	@RequestMapping("/unreadCount.do")
	@ResponseBody
	public Map unreadCount(int loginMemberNo) {
		Map m=new HashMap();
		m.put("data",service.unreadCount(loginMemberNo));
		return m;
	}

}
