package com.web.cafe.qna.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.cafe.mybatis.qna.QnaMapper;
import com.web.cafe.qna.dto.QnaDTO;
import com.web.cafe.qna.dto.QnaRepDTO;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	QnaMapper mapper;
	
	@Autowired
	QnaFileService qfs;

	@Override
	public void qnaList(Model model, int num) {
		int pageLetter = 5; //한페이지당 글목록 수
		int allCount = mapper.selectBoardCount(); //전체 글수
		int repeat = allCount/pageLetter; //마지막 페이지 번호
		if(allCount % pageLetter != 0)
			repeat += 1;
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat", repeat);
		model.addAttribute("qnaList", mapper.qnaList(start, end));
	}
	
	@Override
	public void qnaSearch(Model model, String type, String search, int num) {
		int pageLetter = 5; // 한 페이지당  글목록 수
		int allCount = mapper.selectSearchCount(); // 검색된 전체 글수
		int repeat = allCount/pageLetter; // 마지막 페이지 번호
		if(allCount % pageLetter != 0)
			repeat += 1;
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat", repeat);
		model.addAttribute("qnaSearch",mapper.qnaSearch(start, end, type, search));
		
	}

	@Override
	public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		QnaDTO dto = new QnaDTO();
		dto.setUserId(mul.getParameter("userId"));
		dto.setQnaTitle(mul.getParameter("qnaTitle"));
		dto.setQnaContent(mul.getParameter("qnaContent"));
		
		int result = 0;
		try {
			result = mapper.writeSave(dto); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == 1) {
			msg = "새글이 등록 되었습니다..";
			url = "/qna/qnaList";
		} else {
			msg = "글등록 실패~";
			url = "/qna/qnaWriteForm";
		}
		
		return qfs.getMessage(request, msg, url);
	}

	@Override
	public void qnacontentView(int qnaNum, Model model) {
		model.addAttribute("data", mapper.qnacontentView(qnaNum));
		
	}
	
	@Override
	public String QnAmodify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		QnaDTO dto = new QnaDTO();
		dto.setQnaNum(Integer.parseInt(mul.getParameter("qnaNum")));
		dto.setQnaTitle(mul.getParameter("qnaTitle"));
		dto.setQnaContent(mul.getParameter("qnaContent"));
		
		int result = mapper.modify(dto);
		String msg, url;
		if(result == 1) {
			msg = "글이 수정되었습니다!";
			url = "/qna/qnaList";
		} else {
			msg = "글수정 실패";
			url = "/qna/QnAmodifyForm?qnaNum="+dto.getQnaNum();
		}
		return qfs.getMessage(request, msg, url);
	}

	@Override
	public String QnADelete(int qnaNum, HttpServletRequest request) {
		int result = mapper.delete(qnaNum);
		String msg, url;
		if(result == 1) {
			msg = "글이 삭제되었습니다!";
			url = "/qna/qnaList";
		} else {
			msg = "글삭제 실패";
			url = "/qna/qnacontentView?qnaNum="+qnaNum;
		}
		return qfs.getMessage(request, msg, url);	
	}

	@Override
	public void addReply(QnaRepDTO dto) {
		mapper.addReply(dto);
		
	}

	@Override
	public List<QnaRepDTO> getRepList(int replyNum) {
		return mapper.getRepList(replyNum);
	}



	

	


	
	
	
	
	
}

	
	
	
	

