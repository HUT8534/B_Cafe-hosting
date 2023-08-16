package com.web.cafe.gongji.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface GongjiService {
	
	// 공지 목록 가져오기
	public void gongjiList(Model model, int num);
	
	// 공지 검색하기
	public void gongjiSearch(Model model, String type, String search, int num);
	
	// 공지 내용 가져오기
	public void gongjiView(int gongjiNum, Model model);
	
	// 공지 등록하기
	public String gongjiWriteSave(MultipartHttpServletRequest mul ,HttpServletRequest request);
	
	// 공지 수정 페이지
	public void gongjiModifyForm(int gongjiNum, Model model);
	
	// 공지 수정하기
	public String gongjiModify(MultipartHttpServletRequest mul ,HttpServletRequest request);
	
	// 공지 삭제하기
	public String gongjiDelete(int gongjiNum, String imageFileName, HttpServletRequest request);
	
}
