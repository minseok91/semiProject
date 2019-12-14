package com.kh.lp.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int memberNo;						//회원번호
	private String memberId;					//회원아이디
	private String memberPwd;					//회원비밀번호
	private String memberName;					//회원이름
	private String memberPhone;					//회원전화번호
	private String memberAddress;				//회원주소
	private String memberEmail;					//회원이메일
	private Date memberEnrollDate;				//회원가입일자
	private String memberStatus;				//회원 상태 M1,M2,M3

}
