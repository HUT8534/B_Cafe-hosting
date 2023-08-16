package com.web.cafe.gongji.dto;

/*
userId VARCHAR2(20) NOT NULL,           -- 유저 아이디(관리자) 
gongjiNum NUMBER(10),                   -- 공지사항 번호
gongjiTitle VARCHAR2(30) NOT NULL,      -- 공지사항 제목
gongjiContent VARCHAR2(1000) NOT NULL,  -- 공지사항 내용 
regdate DATE DEFAULT SYSDATE,           -- 생성일자
CONSTRAINT cafe_gongji_PK PRIMARY KEY(gongjiNum),
CONSTRAINT cafe_gongji_cafe_user_FK FOREIGN KEY(userId) REFERENCES cafe_user(userId)
*/
public class GongjiDTO {
	
//	유저 아이디
	private String userId;
	
//	공지 번호
	private int gongjiNum;
	
//	공지 제목
	private String gongjiTitle;
	
//	공지 내용
	private String gongjiContent;
	
//	공지 등록 날짜
	private String regdate;
	
//	공지 파일 이름
	private String imageFileName;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getGongjiNum() {
		return gongjiNum;
	}
	public void setGongjiNum(int gongjiNum) {
		this.gongjiNum = gongjiNum;
	}
	public String getGongjiTitle() {
		return gongjiTitle;
	}
	public void setGongjiTitle(String gongjiTitle) {
		this.gongjiTitle = gongjiTitle;
	}
	public String getGongjiContent() {
		return gongjiContent;
	}
	public void setGongjiContent(String gongjiContent) {
		this.gongjiContent = gongjiContent;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	@Override
	public String toString() {
		return "GongjiDTO [userId=" + userId + ", gongjiNum=" + gongjiNum + ", gongjiTitle=" + gongjiTitle
				+ ", gongjiContent=" + gongjiContent + ", regdate=" + regdate + ", imageFileName=" + imageFileName
				+ "]";
	}
	
}
