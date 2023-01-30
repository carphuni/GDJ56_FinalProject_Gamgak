package com.gamgak.psh.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.type.JdbcType;

import com.gamgak.psh.admin.vo.Member;
import com.gamgak.psh.admin.vo.Myres;

@Mapper
public interface AdminMemberDao{

	@Select("select count(*) from ${table}")
	int selectCount(String table);
	
	@Select("select * from (select rownum as rnum, data.*from(select m.*,cnt.myres_cnt,rcnt.report_cnt from member m join(select a.member_no,count(myres_no) myres_cnt from member a left join myres b on a.member_no=b.member_no group by a.member_no)cnt on m.member_no=cnt.member_no left join (select member_no,count(report_no) report_cnt from userreport group by member_no) rcnt on rcnt.member_no=m.member_no order by m.member_no) data) where rnum between (${cPage}-1)*${numPerpage}+1 and ${cPage}*${numPerpage}")
	List<Map> selectMemberData(Map param);
	
	@Select("select * from myres where member_no=${no}")
	@Results({
		@Result(property="MYRES_MEMO", column="MYRES_MEMO",jdbcType = JdbcType.CLOB, javaType = String.class)
	})
	List<Map> selectMyresList(long no);
	
	@Select("select * from meeting")
	@Results({
		@Result(property="MEETING_DATE", column="MEETING_DATE",jdbcType = JdbcType.TIMESTAMP, javaType = String.class)
		})
	List<Map> selectMeetingList();
	
	@Select("select * from ${tableN} t left join report r on r.report_no=t.report_no order by r.report_no")
	@Results({
			@Result(property="REPORT_REASON", column="REPORT_REASON",jdbcType = JdbcType.CLOB, javaType = String.class)
	})
	List<Map> selectReportList(String table);
}
