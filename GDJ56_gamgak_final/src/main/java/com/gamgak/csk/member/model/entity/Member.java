package com.gamgak.csk.member.model.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
//@Entity
public class Member {
	//@Id
	private int memberNo;
	private String memberEmail;
	private String memberPassword;
	private String memberName;
	private String memberGender;
	private String memberNickName;
	private String introduce;
	@Temporal(TemporalType.DATE)
	private Date memberEnrollDate;
	private String profileOriName;
	private String profileReName;
	
}
