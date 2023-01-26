package com.gamgak.psh.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.data.jpa.repository.JpaRepository;

import com.gamgak.psh.admin.vo.Member;
import com.gamgak.psh.admin.vo.Myres;

@Mapper
public interface MemberDao{

	@Select("select * from member m join (select a.member_no,count(myres_no) myres_cnt from member a left join myres b on a.member_no=b.member_no group by a.member_no)cnt on m.member_no=cnt.member_no order by m.member_no")
	List<Member> selectMemberData();
}
