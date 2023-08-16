


package com.web.cafe.member.dto;

/*
 CREATE TABLE cafe_user(
   userId VARCHAR2(15),             -- 아이디
   userPw VARCHAR2(15) NOT NULL,    -- 비밀번호
   userName VARCHAR2(20) NOT NULL,  -- 이름
   userBirth VARCHAR2(10) NOT NULL, -- 생년월일
   userAddr VARCHAR2(300) NOT NULL, -- 주소
   userPhone VARCHAR2(20) NOT NULL, -- 핸드폰
   userEmail VARCHAR2(100) NOT NULL,-- 이메일
   regdate DATE DEFAULT SYSDATE,    -- 생성일자
   CONSTRAINT cafe_user_PK PRIMARY KEY(userId),  -- 아이디 프라이머리 키
   CONSTRAINT cafe_user_USEREMAIL_UNIQ UNIQUE(userEmail), -- 이메일 유니크 키
   CONSTRAINT cafe_user_USERPHONE_UNIQ UNIQUE(userPhone)  -- 핸드폰 유니크 키
);
 */

public class MemberDTO {

	private String userId;
	private String userPw;
	private String userName;
	private String userBirth;
	private String userAddr;
	private String userPhone;
	private String userEmail;
	private String regdate;
	
	
	
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberDTO(String userId, String userPw, String userName, String userBirth, String userAddr, String userPhone,
			String userEmail, String regdate) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userBirth = userBirth;
		this.userAddr = userAddr;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.regdate = regdate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "MemberDTO [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userBirth="
				+ userBirth + ", userAddr=" + userAddr + ", userPhone=" + userPhone + ", userEmail=" + userEmail
				+ ", regdate=" + regdate + "]";
	}
	
	
	
}
















































