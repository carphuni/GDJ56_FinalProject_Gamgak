package com.gamgak.psh.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.type.JdbcType;

import com.gamgak.psh.admin.vo.Member;
import com.gamgak.psh.admin.vo.Myres;

@Mapper
public interface AdminMemberDao{

	@Select("select count(*) from ${table} where ${yn}='${ynval}'")
	int selectCount(Map param);
	
	@Select("select count(*) from ${table} where ${tableN}=${no} and ${yn}='${ynval}'")
	int selectCountNo(Map param);
	
	@Select("select * from member where member_no=${no}")
	Member selectMember(int no);
	
	@Select("select * from (select rownum as rnum, data.* from(select m.*,cnt.myres_cnt,rcnt.report_cnt from member m join(select a.member_no,count(myres_no) myres_cnt from member a left join myres b on a.member_no=b.member_no group by a.member_no)cnt on m.member_no=cnt.member_no left join (select member_no,count(report_no) report_cnt from userreport group by member_no) rcnt on rcnt.member_no=m.member_no order by m.member_no)data where ${yn}='${ynval}') where rnum between (${cPage}-1)*${numPerpage}+1 and ${cPage}*${numPerpage}")
	List<Map> selectMemberData(Map param);
	
	@Select("select * from(select rownum as rnum,data.* from (select * from myres my left join (select myres_no,count(mr.report_no) report_cnt from myresreport mr left join report r on mr.report_no=r.report_no where r.solve_yn='N' group by myres_no)report_cnt on report_cnt.myres_no=my.myres_no where member_no=${no} and del_yn='N')data)where rnum between (${cPage}-1)*${numPerpage}+1 and ${cPage}*${numPerpage}")
	@Results({
		@Result(property="MYRES_MEMO", column="MYRES_MEMO",jdbcType = JdbcType.CLOB, javaType = String.class)
	})
	List<Map> selectMyresList(Map param);
	
	@Select("select * from(select rownum as rnum, data.* from(select * from meeting mt left join (select count(report_no)mtr_cnt,meeting_no from meetingreport group by meeting_no)mt_cnt on mt.meeting_no=mt_cnt.meeting_no)data where ${yn}='${ynval}') where rnum between (${cPage}-1)*${numPerpage}+1 and ${cPage}*${numPerpage}")
	@Results({
		@Result(property="MEETING_DATE", column="MEETING_DATE",jdbcType = JdbcType.TIMESTAMP, javaType = String.class)
		})
	List<Map> selectMeetingList(Map param);
	
	@Select("select * from(select rownum as rnum,data.*from(select * from ${tableN} t left join report r on r.report_no=t.report_no order by r.report_no)data where ${yn}='N') where rnum between (${cPage}-1)*${numPerpage}+1 and ${cPage}*${numPerpage}")
	@Results({
			@Result(property="REPORT_REASON", column="REPORT_REASON",jdbcType = JdbcType.CLOB, javaType = String.class)
	})
	List<Map> selectReportList(Map param);
	
	@Update("update ${tableN} set ${yn}='Y' where ${columnN}=${no}")
	int deleteData(int no,String tableN,String columnN,String yn);
}
