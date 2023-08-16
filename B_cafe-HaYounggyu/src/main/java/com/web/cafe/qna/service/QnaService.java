package com.web.cafe.qna.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.cafe.qna.dto.QnaRepDTO;

public interface QnaService {
	
	public void qnaList(Model model, int num); 
	
	public void qnaSearch(Model model, String type, String search, int num);
	
	public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public void qnacontentView(int qnaNum, Model model);
	
	public String QnAmodify(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public String QnADelete(int qnaNum, HttpServletRequest request);
	
	public void addReply(QnaRepDTO dto);
	
	public List<QnaRepDTO> getRepList(int replyNum);
	
	
}
