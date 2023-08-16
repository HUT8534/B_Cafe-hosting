

package com.web.cafe.qna.dto;

import java.sql.Timestamp;



public class QnaRepDTO {
	
	private int replySeq;
	private String userId;
	private String qnaReContent;
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
	public String getQnaReContent() {
		return qnaReContent;
	}
	public void setQnaReContent(String qnaReContent) {
		this.qnaReContent = qnaReContent;
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




































