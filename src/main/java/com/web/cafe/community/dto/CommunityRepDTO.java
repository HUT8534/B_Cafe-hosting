package com.web.cafe.community.dto;

import java.sql.Timestamp;

/*
   CREATE TABLE community_reply(
   replyNum NUMBER(10),
   communityNum NUMBER(10) NOT NULL,
   communityContent VARCHAR2(3000) NOT NULL,
   userId VARCHAR2(20) NOT NULL,
   regdate DATE DEFAULT SYSDATE,
   CONSTRAINT community_reply_PK PRIMARY KEY(REPLYNUM),
   CONSTRAINT community_reply_cafe_user_FK FOREIGN KEY(userId) REFERENCES cafe_user(userId),
   CONSTRAINT community_reply_community_FK FOREIGN KEY(communityNum) REFERENCES community(communityNum)
);
*/

public class CommunityRepDTO {

	private int replySeq;
	private String userId;
	private String communityContent;
	private int replyNum;
	private Timestamp regdate;	

	public int getReplySeq() {
		return replySeq;
	}
	public void setReplySeq(int replySeq) {
		this.replySeq = replySeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCommunityContent() {
		return communityContent;
	}
	public void setCommunityContent(String communityContent) {
		this.communityContent = communityContent;
	}
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	
	
	
}
