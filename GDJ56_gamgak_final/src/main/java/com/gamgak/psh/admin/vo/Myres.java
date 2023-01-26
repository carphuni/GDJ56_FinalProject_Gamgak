package com.gamgak.psh.admin.vo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(name = "seq_myresno",sequenceName = "seq_myresno",allocationSize = 1)
public class Myres{

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "seq_myresno")
	private Long myres_no; 
	@ManyToOne
	@JoinColumn(name = "member")
	private Member member;
	
	private Long res_no;
	private Date myres_save_date;
	private String myres_memo;
	private String myres_yn;
	
	
}
