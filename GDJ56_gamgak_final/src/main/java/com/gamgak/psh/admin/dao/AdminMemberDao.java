package com.gamgak.psh.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.gamgak.psh.admin.vo.Member;
import com.gamgak.psh.admin.vo.Myres;

@Mapper
public interface AdminMemberDao{

	@Select("select * from member m join (select a.member_no,count(myres_no) myres_cnt from member a left join myres b on a.member_no=b.member_no group by a.member_no)cnt on m.member_no=cnt.member_no order by m.member_no")
	List<Map> selectMemberData();
	
	@Select("select * from myres where member_no=${no}")
	List<Map> selectMyresList(long no);
	
	@Select("select * from meeting")
	List<Map> selectMeetingList();
	
	@Select("select * from report")
	List<Map> selectReportList();
}
