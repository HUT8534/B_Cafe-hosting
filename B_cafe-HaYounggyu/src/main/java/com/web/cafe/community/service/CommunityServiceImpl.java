


package com.web.cafe.community.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.cafe.community.dto.CommunityDTO;
import com.web.cafe.community.dto.CommunityRepDTO;
import com.web.cafe.mybatis.community.CommunityMapper;

@Service
public class CommunityServiceImpl implements CommunityService{	

	@Autowired
	CommunityMapper mapper;

	@Autowired
	CommunityFileService cfs;
	
	// 커뮤니티 게시글 목록, 페이징
	@Override
	public void communityAllList(Model model, int num) {
		int pageLetter = 5; //한페이지당 글목록 수
		int allCount = mapper.selectBoardCount(); //전체 글수
		int repeat = allCount/pageLetter; //마지막 페이지 번호
		if(allCount % pageLetter != 0)
			repeat += 1;
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat", repeat);
		model.addAttribute("communityAllList", mapper.communityAllList(start, end));
	}	
	
	// 커뮤니티 검색하기
	@Override
	public void searchList(Model model, String type, String search, int num) {
	    int pageLetter = 15; // 한 페이지당 글목록 수
	    int allCount = mapper.selectSearchCount(); // 검색된 전체 글 수
	    int repeat = allCount / pageLetter; // 마지막 페이지 번호
	    if (allCount % pageLetter != 0)
	        repeat += 1;
	    int end = num * pageLetter;
	    int start = end + 1 - pageLetter;
	   
	    model.addAttribute("repeat", repeat);
	    model.addAttribute("searchList", mapper.searchList(start, end, type, search));
	}


	// 커뮤니티 답글
	@Override
	public void communityRepList(Model model,int communityNum) {		
		model.addAttribute("communityRepList", mapper.communityRepList(communityNum));
		
	}	
	// 커뮤니티 답글 리스트
	@Override
	public List<CommunityRepDTO> getRepList(int replyNum) {		
		return mapper.getRepList(replyNum);
	}

	// 커뮤니티 새 글 작성
	@Override
	public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		
		CommunityDTO dto = new CommunityDTO();
		dto.setUserId(mul.getParameter("userId"));
		dto.setCommunityTitle(mul.getParameter("communityTitle"));
		dto.setCommunityContent(mul.getParameter("communityContent"));
		
		int result = 0;
		try {
			result = mapper.writeSave(dto); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == 1) {
			msg = "새글이 등록 되었습니다..";
			url = "/community/communityAllList";
		} else {
			msg = "글등록 실패~";
			url = "/community/communityWriteForm";
		}
		
		return cfs.getMessage(request, msg, url);
	}
	
	// 커뮤니티 게시글 조회
	@Override
	public void contentView(int communityNum, Model model) {		
		model.addAttribute("data", mapper.contentView(communityNum));
		mapper.updateHit(communityNum); // 조회수 증가
		System.out.println("updateHit 호출 : "+ communityNum);
	}

	// 커뮤니티 조회수
	public void updateHit(int communityNum) {
		mapper.updateHit(communityNum);
		System.out.println("updateHit 호출 : "+ communityNum);
		
	}

	
	// 커뮤니티 글 수정
	@Override
	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		CommunityDTO dto = new CommunityDTO();
		dto.setCommunityNum(Integer.parseInt(mul.getParameter("communityNum")));
		dto.setCommunityTitle(mul.getParameter("communityTitle"));
		dto.setCommunityContent(mul.getParameter("communityContent"));
		
		int result = 0;
		try {
			result = mapper.modify(dto); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == 1) {
			msg = "게시글이 수정 되었습니다..";
			url = "/community/communityAllList";
		} else {
			msg = "글수정 실패~";
			url = "/community/modifyForm?communityNum="+dto.getCommunityNum();
		}
		
		return cfs.getMessage(request, msg, url);
	}

	@Override
	public String communityDelete(int communityNum, HttpServletRequest request) {
		int result = mapper.delete(communityNum);
		String msg, url;
		if(result == 1) {
			msg = "글이 삭제되었습니다..";
			url = "/community/communityAllList";
			
		} else {
			msg = "글삭제 실패";
			url = "/community/contentView?communityNum="+communityNum;
		}
		return cfs.getMessage(request, msg, url);	
	}


	@Override
	public void addReply(CommunityRepDTO dto) {
		mapper.addReply(dto);
		
	}




	
	

	
}


















