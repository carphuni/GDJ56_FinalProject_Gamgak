package com.gamgak.kch.msg.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MsgDao {

	//채팅방 목록
	@Select("SELECT * FROM(SELECT ROWNUM AS RNUM,DATA.* FROM(SELECT A.*, B.MEMBER_NO AS \"MEMBER_NO_S\", B.MEMBER_NICKNAME AS \"MEMBER_NICKNAME_S\" FROM(SELECT M.*, R.MEMBER_NICKNAME AS \"MEMBER_NICKNAME_R\", R.MEMBER_NO AS \"MEMBER_NO_R\" FROM (SELECT * FROM(SELECT * FROM(SELECT MAX(CHAT_NO) AS \"MAX_CHAT_NO\" FROM(select * from chat where member_receiver_no=${loginMemberNo} or member_sender_no=${loginMemberNo}) GROUP BY PERSONAL_CHATROOM_NO)JOIN CHAT ON MAX_CHAT_NO=CHAT_NO))M JOIN MEMBER R ON MEMBER_RECEIVER_NO=MEMBER_NO)A JOIN MEMBER B ON A.MEMBER_SENDER_NO=B.MEMBER_NO ORDER BY CHATTING_ENROLL_DATE DESC)DATA) WHERE RNUM BETWEEN (${cPage}-1)*${numPerpage}+1 and ${cPage}*${numPerpage}")
	List<Map> selectMsgList(Map pram);		

	//페이징
	@Select("SELECT COUNT(*) FROM ENTERCHAT WHERE MEMBER_NO=#{loginMemberNo}")
	int selectMsgCount(int loginMemberNo);
	
	//채팅 대화목록
	@Select("SELECT * FROM (SELECT * FROM CHAT JOIN ENTERCHAT USING (PERSONAL_CHATROOM_NO) WHERE PERSONAL_CHATROOM_NO=#{personalChatroomNo} AND MEMBER_NO!=#{loginMemberNo}) JOIN MEMBER USING(MEMBER_NO) ORDER BY CHATTING_ENROLL_DATE ASC")
	List<Map> selectChatList(int personalChatroomNo, int loginMemberNo);
	
	//대화 저장
	@Insert("INSERT INTO CHAT VALUES(SEQ_CHATNO.NEXTVAL, NULL, #{personalChatroomNo}, #{receiverNo}, #{senderNo}, #{content}, DEFAULT, 0)")
	int insertMsg(int personalChatroomNo, int receiverNo, int senderNo, String content);
	
	@Select("SELECT * FROM MEMBER JOIN ENTERCHAT USING (MEMBER_NO) WHERE PERSONAL_CHATROOM_NO=#{personalChatroomNo} AND MEMBER_NO!=#{loginMemberNo}")
	Map chatroomMember(int personalChatroomNo, int loginMemberNo);
	
}
