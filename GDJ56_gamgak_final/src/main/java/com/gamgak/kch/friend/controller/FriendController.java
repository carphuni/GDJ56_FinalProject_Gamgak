package com.gamgak.kch.friend.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gamgak.kch.friend.service.FriendService;
import com.gamgak.kch.msg.common.PageFactory;

@Controller
@RequestMapping("/friend")
public class FriendController {
	
	private FriendService service;
	
	@Autowired
	public FriendController(FriendService service) {
		this.service=service;
	}

	//친구목록
	@RequestMapping("/friendList.do")
	@ResponseBody
	public Map<String,Object> selectFriendList(int loginMemberNo, int cPage, String functionN){
		Map<String,Object> list=new HashMap<String, Object>();
		int numPerpage=10;
		int total=service.selectFriendCount(loginMemberNo);
		list.put("list",service.selectFriendList(Map.of("loginMemberNo",loginMemberNo,"cPage",cPage,"numPerpage",numPerpage)));
		list.put("pageBar",PageFactory.getPage(loginMemberNo,cPage, numPerpage, total,functionN, "friend.do"));
		return list;
	}
	
	//친구 검색
	@RequestMapping("/friendSearch.do")
	@ResponseBody
	public List<Map> friendSearch(String keyword, int loginMemberNo){
		return service.friendSearch(keyword, loginMemberNo);
	}
	
	//친구신청
	@RequestMapping("/insertFriend.do")
	@ResponseBody
	public int insertFriend(int loginMemberNo, int memberNo) {
		return service.insertFriend(loginMemberNo, memberNo);
	}
	
	//친구신청취소
	@RequestMapping("/cancleFriend.do")
	@ResponseBody
	public int cancleFriend(int loginMemberNo, int memberNo) {
		return service.cancleFriend(loginMemberNo, memberNo);
	}	 
	
	//친구수락
	@RequestMapping("/acceptFriend.do")
	@ResponseBody
	public int acceptFriend(int loginMemberNo, int memberNo) {
		return service.acceptFriend(loginMemberNo, memberNo);
	}	 		
	
	//친구신청수
	@RequestMapping("/friendCount.do")
	@ResponseBody
	public int friendCount(int loginMemberNo) {
		System.out.println("로그인멤버"+loginMemberNo);
		return service.friendCount(loginMemberNo);
	}
	
	//친구삭제
	@RequestMapping("/deleteFriend.do")
	@ResponseBody
	public int deleteFriend(int loginMemberNo, int friendMemberNO) {
		service.deleteFriend(loginMemberNo, friendMemberNO);
		return service.deleteFriend(loginMemberNo, friendMemberNO);
	}		
}
