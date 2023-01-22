//package com.gamgak.psh.admin_vo;
//
//import java.util.Date;
//
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.SequenceGenerator;
//
//import lombok.AllArgsConstructor;
//import lombok.Builder;
//import lombok.Data;
//import lombok.NoArgsConstructor;
//
//@Data
//@AllArgsConstructor
//@NoArgsConstructor
//@Builder
//@Entity
//@SequenceGenerator(name = "seq_memberno",sequenceName = "seq_memberno",allocationSize = 1)
//public class Member {
//
//	@Id
//	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "seq_memberno")
//	private long memberno;
//	private String membername;
//	private String email;//아이디
//	private String password;
//	private String gender;
//	private String nickname;
//	private String introduce;
//	private String profileoriname;
//	private String profilerename;
//	private Date enrolldate;
//}
