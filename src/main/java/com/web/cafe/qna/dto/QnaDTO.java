package com.web.cafe.qna.dto;

/*
CREATE TABLE qna(
   userId VARCHAR2(15) NOT NULL,            -- 유저 아이디(관리자) 
   qnaNum NUMBER(10),                       -- Q&A 번호
   qnaTitle VARCHAR2(30) NOT NULL,          -- Q&A 제목
   qnaContent VARCHAR2(1000) NOT NULL,      -- Q&A 내용 
   regdate DATE DEFAULT SYSDATE,            -- 생성일자
   CONSTRAINT qna_PK PRIMARY KEY(qnaNum),
   CONSTRAINT qna_cafe_user_FK FOREIGN KEY(userId) REFERENCES cafe_user(userId)
);
 */

public class QnaDTO {
	
	private String userId;
	private int qnaNum;
	private String qnaTitle;
	private String qnaContent;
	private String regdate;
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	

}
