package com.web.cafe.gongji.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface GongjiFileService {
	
	// 파일 경로
	public static final String IMAGE_REPO = "C:\\B_Spring\\img_repo";
	
	// 알림 창
	public String getMessage(HttpServletRequest request, String msg, String url);
	
	// 이미지 파일 저장
	public String saveFile(MultipartFile file);
	
	// 이미지 파일 제거
	public void deleteImage(String originalFileName);
}
