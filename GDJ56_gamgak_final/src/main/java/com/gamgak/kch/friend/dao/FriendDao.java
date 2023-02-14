package com.gamgak.kch.friend.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface FriendDao {


	//친구목록
	@Select("SELECT * FROM(SELECT ROWNUM AS RNUM,DATA.* FROM(SELECT * FROM(SELECT * FROM FRIEND JOIN MEMBER ON MEMBER_FOLLOWING_NO=MEMBER_NO WHERE MEMBER_FOLLOWING_NO!=${loginMemberNo} AND MEMBER_FOLLOWER_NO=${loginMemberNo} UNION SELECT * FROM FRIEND JOIN MEMBER ON MEMBER_FOLLOWER_NO=MEMBER_NO WHERE MEMBER_FOLLOWING_NO=${loginMemberNo} AND MEMBER_FOLLOWER_NO!=${loginMemberNo})ORDER BY ACCEPT_YN ASC)DATA) WHERE RNUM BETWEEN (${cPage}-1)*${numPerpage}+1 and ${cPage}*${numPerpage}")
	List<Map> selectFriendList(Map param);
		
	@Select("SELECT COUNT(*) FROM FRIEND WHERE MEMBER_FOLLOWING_NO=#{loginMemberNo}")
	int selectFriendCount(int loginMemberNo);
	
	//친구검색
	@Select("SELECT * FROM (SELECT * FROM MEMBER M WHERE MEMBER_NAME LIKE '%${keyword}%')M LEFT JOIN FRIEND ON(MEMBER_FOLLOWING_NO=#{loginMemberNo} AND MEMBER_FOLLOWER_NO=M.MEMBER_NO OR MEMBER_FOLLOWER_NO=#{loginMemberNo} AND MEMBER_FOLLOWING_NO=M.MEMBER_NO)")
	List<Map> friendSearch(String keyword, int loginMemberNo);
	
	//친구신청
	@Insert("INSERT INTO FRIEND VALUES(#{loginMemberNo},#{memberNo},'S')")
	int insertFriend(int loginMemberNo, int memberNo);
	
	//친구신청취소
	@Delete("DELETE FROM FRIEND WHERE MEMBER_FOLLOWING_NO=#{loginMemberNo} AND MEMBER_FOLLOWER_NO=#{memberNo}")
	int cancleFriend(int loginMemberNo, int memberNo);
	
	//친구수락
	@Update("UPDATE FRIEND SET ACCEPT_YN='Y' WHERE MEMBER_FOLLOWING_NO=#{memberNo} AND MEMBER_FOLLOWER_NO=#{loginMemberNo}")
	int acceptFriend(int loginMemberNo, int memberNo);
	
	//친구신청수
	@Select("SELECT COUNT(*)AS \"COUNT\" FROM FRIEND WHERE MEMBER_FOLLOWER_NO=${loginMemberNo} AND ACCEPT_YN='S'")
	int friendCount(int loginMemberNo);
	
	//친구삭제
	@Delete("DELETE FROM FRIEND WHERE (MEMBER_FOLLOWING_NO=#{loginMemberNo} AND MEMBER_FOLLOWER_NO=#{friendMemberNO}) OR (MEMBER_FOLLOWING_NO=#{friendMemberNO} AND MEMBER_FOLLOWER_NO=#{loginMemberNo})")
	int deleteFriend(int loginMemberNo, int friendMemberNO);
	
	//친구삭제 시 채팅방 삭제
	@Delete("DELETE FROM ENTERCHAT WHERE PERSONAL_CHATROOM_NO=(SELECT PERSONAL_CHATROOM_NO FROM(SELECT * FROM ENTERCHAT WHERE MEMBER_NO=#{loginMemberNo}) JOIN (SELECT * FROM ENTERCHAT WHERE MEMBER_NO=#{friendMemberNO}) USING (PERSONAL_CHATROOM_NO))")
	int deleteEnterchat(int loginMemberNo, int friendMemberNO);
}
