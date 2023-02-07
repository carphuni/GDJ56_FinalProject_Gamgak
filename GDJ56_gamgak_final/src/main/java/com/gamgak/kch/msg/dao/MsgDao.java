package com.gamgak.kch.msg.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface MsgDao {

	//채팅방 목록
//	@Select("SELECT * FROM(SELECT ROWNUM AS RNUM,DATA.* FROM(SELECT A.*, B.MEMBER_NO AS \"MEMBER_NO_S\", B.MEMBER_NICKNAME AS \"MEMBER_NICKNAME_S\" FROM(SELECT M.*, R.MEMBER_NICKNAME AS \"MEMBER_NICKNAME_R\", R.MEMBER_NO AS \"MEMBER_NO_R\" FROM (SELECT * FROM(SELECT * FROM(SELECT MAX(CHAT_NO) AS \"MAX_CHAT_NO\" FROM(select * from chat where member_receiver_no=${loginMemberNo} or member_sender_no=${loginMemberNo}) GROUP BY PERSONAL_CHATROOM_NO)JOIN CHAT ON MAX_CHAT_NO=CHAT_NO))M JOIN MEMBER R ON MEMBER_RECEIVER_NO=MEMBER_NO)A JOIN MEMBER B ON A.MEMBER_SENDER_NO=B.MEMBER_NO ORDER BY CHATTING_ENROLL_DATE DESC)DATA) WHERE RNUM BETWEEN (${cPage}-1)*${numPerpage}+1 and ${cPage}*${numPerpage}")
//	List<Map> selectMsgList(Map pram);		
	
	//채팅방 목록
	@Select("SELECT * FROM(SELECT ROWNUM AS RNUM,DATA.* FROM(SELECT * FROM(SELECT A.*, B.MEMBER_NO AS \"MEMBER_NO_S\", B.MEMBER_NICKNAME AS \"MEMBER_NICKNAME_S\" FROM(SELECT M.*, R.MEMBER_NICKNAME AS \"MEMBER_NICKNAME_R\", R.MEMBER_NO AS \"MEMBER_NO_R\" FROM (SELECT * FROM(SELECT * FROM(SELECT MAX(CHAT_NO) AS \"MAX_CHAT_NO\" FROM(SELECT * FROM(select * from chat JOIN where member_receiver_no=${loginMemberNo} or member_sender_no=${loginMemberNo}) JOIN ENTERCHAT USING(PERSONAL_CHATROOM_NO) WHERE MEMBER_NO=${loginMemberNo} AND CHAT_OUT_YN IS NULL)GROUP BY PERSONAL_CHATROOM_NO)JOIN CHAT ON MAX_CHAT_NO=CHAT_NO))M JOIN MEMBER R ON MEMBER_RECEIVER_NO=MEMBER_NO)A JOIN MEMBER B ON A.MEMBER_SENDER_NO=B.MEMBER_NO ORDER BY CHATTING_ENROLL_DATE DESC)DATA LEFT JOIN (SELECT PERSONAL_CHATROOM_NO, COUNT(*)AS \"UNREAD\" FROM CHAT WHERE MEMBER_RECEIVER_NO=${loginMemberNo} GROUP BY PERSONAL_CHATROOM_NO, CHATTING_UNREAD_CNT HAVING CHATTING_UNREAD_CNT=1)R USING (PERSONAL_CHATROOM_NO))DATA) WHERE RNUM BETWEEN (${cPage}-1)*${numPerpage}+1 and ${cPage}*${numPerpage}")
	List<Map> selectMsgList(Map pram);

	//페이징
	@Select("SELECT COUNT(*) FROM ENTERCHAT WHERE MEMBER_NO=#{loginMemberNo}")
	int selectMsgCount(int loginMemberNo);
	
	//채팅 대화목록
	@Select("SELECT * FROM (SELECT * FROM CHAT JOIN ENTERCHAT USING (PERSONAL_CHATROOM_NO) WHERE PERSONAL_CHATROOM_NO=#{personalChatroomNo} AND MEMBER_NO=#{loginMemberNo}) LEFT JOIN MEMBER M ON MEMBER_SENDER_NO=M.MEMBER_NO WHERE TO_CHAR(CHAT_OUT_DATE, 'YYYY/MM/DD HH24:MI:SS')<TO_CHAR(CHATTING_ENROLL_DATE, 'YYYY/MM/DD HH24:MI:SS') ORDER BY CHATTING_ENROLL_DATE ASC")
	List<Map> selectChatList(int personalChatroomNo, int loginMemberNo);
	
	//대화 저장
	@Insert("INSERT INTO CHAT VALUES(SEQ_CHATNO.NEXTVAL, NULL, #{personalChatroomNo}, #{receiverNo}, #{senderNo}, #{content}, DEFAULT, 1)")
	int insertMsg(int personalChatroomNo, int receiverNo, int senderNo, String content);
	
	//같은방 회원 정보 가져오기
	@Select("SELECT * FROM MEMBER JOIN ENTERCHAT USING (MEMBER_NO) WHERE PERSONAL_CHATROOM_NO=#{personalChatroomNo} AND MEMBER_NO!=#{loginMemberNo}")
	Map chatroomMember(int personalChatroomNo, int loginMemberNo);
	
	//방이 있는지 확인
	@Select("SELECT * FROM(SELECT * FROM ENTERCHAT JOIN(SELECT PERSONAL_CHATROOM_NO FROM ENTERCHAT WHERE MEMBER_NO=#{loginMember}) USING (PERSONAL_CHATROOM_NO) WHERE MEMBER_NO!=#{loginMember})WHERE MEMBER_NO=#{memberNo}")
	Map chatroomCheck(int loginMember, int memberNo);
	
	//채팅방 번호 생성
	@Insert("INSERT INTO PERSONALCHATROOM VALUES(SEQ_PERSONALCHATROOMNO.NEXTVAL)")
	int personalChatRoomInsert();
	
	//생성된 채팅방 번호 가져오기
	@Select("SELECT MAX(PERSONAL_CHATROOM_NO) FROM PERSONALCHATROOM")
	int personalChatRoomNo();
	
	//로그인회원 대화방참여에 추가
	@Insert("INSERT INTO ENTERCHAT VALUES(#{loginMemberNo}, NULL, #{chatRoomNo}, NULL, NULL, SYSDATE)")
	int enterchatInsert(int loginMemberNo, int chatRoomNo);
	
	//친구 대화방참여에 추가
	@Insert("INSERT INTO ENTERCHAT VALUES(#{memberNo}, NULL, #{chatRoomNo}, NULL)")
	int enterchatFriend(int memberNo, int chatRoomNo);
	
	//나가기버튼 enterchat 수정
	@Update("UPDATE ENTERCHAT SET CHAT_OUT_YN='Y', CHAT_OUT_DATE=SYSDATE WHERE PERSONAL_CHATROOM_NO=#{personalChatroomNo} AND MEMBER_NO=#{loginMemberNo}")
	int updateChatroom(int personalChatroomNo, int loginMemberNo);
	
	//안읽은 메세지 리스트
	@Select("SELECT MIN(CHAT_NO)AS \"MIN\",MAX(CHAT_NO)AS \"MAX\" FROM CHAT WHERE PERSONAL_CHATROOM_NO=#{personalChatroomNo} AND MEMBER_RECEIVER_NO=#{loginMemberNo} AND CHATTING_UNREAD_CNT=1")
	Map unreadList(int personalChatroomNo, int loginMemberNo);
	
	//읽음처리
	@Update("UPDATE CHAT SET CHATTING_UNREAD_CNT=0 WHERE CHAT_NO BETWEEN #{min} AND #{max} AND PERSONAL_CHATROOM_NO=#{personalChatroomNo}")
	int updateReadCount(int min, int max, int personalChatroomNo);
	
	//헤더 안읽은 메세지 수
	@Select("SELECT	COUNT(*)AS \"COUNT\" FROM CHAT WHERE MEMBER_RECEIVER_NO=${loginMemberNo} GROUP BY CHATTING_UNREAD_CNT HAVING CHATTING_UNREAD_CNT=1")
	Map unreadCount(int loginMemberNo);
	
	//같은 방 회원 나가기 여부 수정
	@Update("UPDATE ENTERCHAT SET CHAT_OUT_YN=NULL WHERE PERSONAL_CHATROOM_NO=#{personalChatroomNo} AND MEMBER_NO!=#{loginMemberNo}")
	int updateChatOut(int personalChatroomNo, int loginMemberNo);
	
	//로그인 회원의 해당 방 정보
	@Select("SELECT * FROM ENTERCHAT WHERE PERSONAL_CHATROOM_NO=#{personalChatroomNo} AND MEMBER_NO=#{loginMemberNo}")
	Map chatroomLoginMember(int personalChatroomNo, int loginMemberNo);
	
	//로그인 회원의 방 나가기 여부 수정
	@Update("UPDATE ENTERCHAT SET CHAT_OUT_YN=NULL WHERE PERSONAL_CHATROOM_NO=#{personalChatroomNo} AND MEMBER_NO=#{loginMemberNo}")
	int updateLoginMemberChatOut(int personalChatroomNo, int loginMemberNo);
}
