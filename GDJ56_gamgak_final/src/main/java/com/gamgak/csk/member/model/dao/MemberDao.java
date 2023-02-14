package com.gamgak.csk.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gamgak.csk.member.model.entity.Member;


@Repository
public class MemberDao {
	//public interface MemberDao extends JpaRepository<Member, Long>{
	public Member selectMemberById(SqlSessionTemplate session,Member m){
		return session.selectOne("member.selectMemberById",m);
	}
	public Member selectMemberByEmail(SqlSessionTemplate session,String memberEmail){
		return session.selectOne("member.selectMemberByEmail",memberEmail);
	}
	public Member selectMemberByNickName(SqlSessionTemplate session, Member m) {
		return session.selectOne("member.selectMemberByNickName",m);
	}
	public int insertMember(SqlSessionTemplate session, Member m) {
		return session.insert("member.insertMember",m);
	}
	public int updateMember(SqlSessionTemplate session, Map param) {
		return session.update("member.updateMember", param);
	}
	public String checkPassword(SqlSessionTemplate session, int memberNo) {
		return session.selectOne("member.checkPassword",memberNo);
	}
	public int updatePassword(SqlSessionTemplate session, Member m) {
		return session.update("member.updatePassword", m);
	}
	public int updateProfileImg(SqlSessionTemplate session, Map param) {
		return session.update("member.updateProfileImg",param);
	}
	public String selectFileReName(SqlSessionTemplate session, int memberNo) {
		return session.selectOne("member.selectFileReName", memberNo);
	}
	public int deleteProfileImg(SqlSessionTemplate session, Map param) {
		return session.delete("member.deleteProfileImg",param);
	}
	public int resetProfileImg(SqlSessionTemplate session, int memberNo) {
		return session.update("member.resetProfileImg", memberNo);
	}

}
