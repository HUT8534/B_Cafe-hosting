package com.web.cafe.gongji.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.cafe.gongji.dto.GongjiDTO;
import com.web.cafe.mybatis.gongji.GongjiMapper;

@Service
public class GongjiServiceImpl implements GongjiService {
	
	@Autowired
	GongjiMapper gm;
	
	@Autowired
	GongjiFileService gfs;
	
	// 공지 목록 가져오기
	@Override
	public void gongjiList(Model model, int num) {
		int pageLetter = 10; // 한 페이지당 글목록 수
		int allCount = gm.selectGongjiCount(); // 전체 글수
		int repeat = allCount/pageLetter; // 마지막 페이지 번호
		if(allCount % pageLetter != 0)
			repeat += 1;	// 전체 페이징 수
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat", repeat);
		model.addAttribute("gongjiList",gm.gongjiList(start, end));
	}
	
	// 공지 검색하기
	@Override
	public void gongjiSearch(Model model, String type, String search, int num) {
		int pageLetter = 10; // 한 페이지당  글목록 수
		int allCount = gm.selectSearchCount(type, search); // 검색된 전체 글수
		int repeat = allCount/pageLetter; // 마지막 페이지 번호
		if(allCount % pageLetter != 0)
			repeat += 1;	// 전체 페이징 수
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat", repeat);
		model.addAttribute("gongjiSearch",gm.gongjiSearch(start, end, type, search));
	}

	// 공지 등록하기
	@Override
	public String gongjiWriteSave(MultipartHttpServletRequest mul, HttpServletRequest request) {

		GongjiDTO dto = new GongjiDTO();
		dto.setUserId(mul.getParameter("userId"));
		dto.setGongjiTitle(mul.getParameter("gongjiTitle"));
		dto.setGongjiContent(mul.getParameter("gongjiContent"));
		MultipartFile file = mul.getFile("imageFileName");
		
		if(file.getSize()!=0) {
			dto.setImageFileName(gfs.saveFile(file));
		} else {
			dto.setImageFileName("nan");
		}
		
		int result = 0;
		try {
			result = gm.gongjiWriteSave(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		gm.gongjiUpdateNum(); // 글번호 재정렬
		String msg, url;
		if(result == 1) {
			msg = "새 공지가 등록되었습니다";
			url = "/gongji/gongjiList";
		} else {
			msg = "공지 등록 실패";
			url = "/gongji/gongjiWriteForm";
		}
		return gfs.getMessage(request, msg, url);
	}

	// 공지 내용 가져오기
	@Override
	public void gongjiView(int gongjiNum, Model model) {
		model.addAttribute("data", gm.gongjiView(gongjiNum));
		model.addAttribute("lastNum", gm.selectGongjiCount());
	}
	
	@Override
	public void gongjiModifyForm(int gongjiNum, Model model) {
		// TODO Auto-generated method stub
		
	}

	// 공지 수정하기
	@Override
	public String gongjiModify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		int gongjiNum = Integer.parseInt(mul.getParameter("gongjiNum"));
		
		GongjiDTO dto_img = gm.gongjiView(gongjiNum);
		GongjiDTO dto = new GongjiDTO();
		
		dto.setGongjiTitle(mul.getParameter("gongjiTitle"));
		dto.setGongjiContent(mul.getParameter("gongjiContent"));
		dto.setGongjiNum(gongjiNum);
		MultipartFile file = mul.getFile("imageFileName");
		if(file.getSize()!=0) {
			gfs.deleteImage(dto_img.getImageFileName());
			dto.setImageFileName(gfs.saveFile(file));
		} else {
			dto.setImageFileName("nan");
		}
		
		int result = 0;
		try {
			result = gm.gongjiModify(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String msg, url;
		if(result == 1) {
			msg = "공지가 수정되었습니다";
			url = "/gongji/gongjiView?gongjiNum="+mul.getParameter("gongjiNum");
		} else {
			msg = "공지 수정 실패";
			url = "/gongji/gongjiModifyForm?gongjiNum="+mul.getParameter("gongjiNum");
		}
		return gfs.getMessage(request, msg, url);
		
	}
	
	// 공지 삭제하기
	@Override
	public String gongjiDelete(int gongjiNum, String imageFileName, HttpServletRequest request) {
		
		int result = gm.gongjiDelete(gongjiNum); // 테이블 gongjiNum에 해당하는 row 삭제
		String msg = null;
		String url = null;
		
		gm.gongjiUpdateNum(); // 글번호 재정렬
		gfs.deleteImage(imageFileName); // 파일 삭제

		if(result == 1) {
			msg = "글이 삭제되었습니다";
			url = "/gongji/gongjiList";
		} else {
			msg = "글 삭제 실패";
			url = "/gongji/gongjiView?gongjiNum="+gongjiNum;
		}
		return gfs.getMessage(request, msg, url);
	}
	
}
