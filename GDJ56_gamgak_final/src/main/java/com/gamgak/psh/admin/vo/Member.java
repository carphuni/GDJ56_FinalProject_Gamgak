package com.gamgak.psh.admin.vo;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@SequenceGenerator(name = "seq_memberno",sequenceName = "seq_memberno",allocationSize = 1)
public class Member {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "seq_memberno")
	private Long member_no;
	private String member_name;
	private String member_email;//아이디
	private String member_password;
	private String member_gender;
	private String member_nickname;
	private String introduce;
	private String profile_oriname;
	private String profile_rename;
	private Date member_enrolldate;
	
//	@OneToMany(mappedBy = "member")
//	private List<Myres> myResList;
	
	
	
	
	
}
