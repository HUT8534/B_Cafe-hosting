


package com.web.cafe.community.dto;


/*
 CREATE TABLE community(
   communityNum NUMBER(10),                       -- 커뮤니티 번호 
   communityTitle VARCHAR2(30) NOT NULL,          -- 커뮤니티 제목
   userId VARCHAR2(15) NOT NULL,                  -- 유저 아이디(일반회원)
   communityContent VARCHAR2(1000) NOT NULL,      -- 커뮤니티 내용 
   regdate DATE DEFAULT SYSDATE,                  -- 생성일자
   hit NUMBER(30),                               -- 조회수
   CONSTRAINT community_PK PRIMARY KEY(communityNum),
   CONSTRAINT community_cafe_user_FK FOREIGN KEY(userId) REFERENCES cafe_user(userId)
);
 */
public class CommunityDTO {

	private int communityNum;
	private String communityTitle;
	private String userId;
	private String communityContent;
	private int hit;
	private String regdate;
	
	public int getCommunityNum() {
		return communityNum;
	}
	public void setCommunityNum(int communityNum) {
		this.communityNum = communityNum;
	}
	public String getCommunityTitle() {
		return communityTitle;
	}
	public void setCommunityTitle(String communityTitle) {
		this.communityTitle = communityTitle;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
		
	
}
