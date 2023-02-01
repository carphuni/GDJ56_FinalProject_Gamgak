package com.gamgak.kch.msg.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MsgDao {

//	@Insert("INSERT INTO CHAT VALUES(")
	
	//채팅방 목록
	@Select("SELECT * FROM (SELECT ROWNUM AS RNUM,DATA.* FROM(SELECT * FROM (SELECT * FROM (SELECT * FROM (SELECT * FROM (SELECT MAX(CHAT_NO) as \"MAX_CHAT_NO\" FROM CHAT GROUP BY PERSONAL_CHATROOM_NO) JOIN CHAT ON MAX_CHAT_NO=CHAT_NO) JOIN ENTERCHAT USING(PERSONAL_CHATROOM_NO) WHERE MEMBER_NO NOT IN(${loginMemberNo}))) JOIN MEMBER USING(MEMBER_NO))data) WHERE RNUM BETWEEN (${cPage}-1)*${numPerpage}+1 and ${cPage}*${numPerpage}")
	List<Map> selectMsgList(Map pram);

	//페이징
	@Select("SELECT COUNT(*) FROM ENTERCHAT WHERE MEMBER_NO=#{loginMemberNo}")
	int selectMsgCount(int loginMemberNo);
	
	@Select("SELECT * FROM (SELECT * FROM CHAT JOIN ENTERCHAT USING (PERSONAL_CHATROOM_NO) WHERE PERSONAL_CHATROOM_NO=#{personalChatroomNo} AND MEMBER_NO!=#{loginMemberNo}) JOIN MEMBER USING(MEMBER_NO)")
	List<Map> selectChatList(int personalChatroomNo, int loginMemberNo);

}
