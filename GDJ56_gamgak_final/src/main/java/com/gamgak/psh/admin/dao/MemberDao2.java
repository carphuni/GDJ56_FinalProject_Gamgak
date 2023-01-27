package com.gamgak.psh.admin.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.gamgak.psh.admin.vo.Member;

//@Mapper
//public interface MemberDao2 extends JpaRepository<Object[], Long>,PagingAndSortingRepository<Object[],Long>{
//	@Select("select  *"
//			+ "from member m join (select a.member_no,count(myres_no) myres_cnt"
//			+ "from member a left join myres b on a.member_no=b.member_no"
//			+ "group by a.member_no)cnt on m.member_no=cnt.member_no"
//			+ "order by m.member_no")
//	List<Member> findAll(Pageable p);

//}
