


package com.web.cafe.qna.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.cafe.qna.service.QnaService;

@Controller
@RequestMapping("qna")
public class QnaController {
	
	@Autowired
	QnaService qs;
	
	// QnA 목록 가져오기
	@GetMapping("qnaList")
	public String qnaList(Model model, @RequestParam(value="num", required=false, defaultValue="1")int num ){
		qs.qnaList(model, num);
		return "qna/qnaList";	
	}
	
	// QnA 검색
	@GetMapping("qnaSearch")
	public String qnaSearch(Model model, @RequestParam(value="type") String type,
	@RequestParam("search") String search,
	@RequestParam(value="num", required=false, defaultValue="1") int num) {
		qs.qnaSearch(model, type, search, num);
		return "qna/qnaSearch";
	}
	
	// QnA 글작성폼
	@RequestMapping("qnaWriteForm")
	public String qnaWriteForm(){
		return "qna/qnaWriteForm";
	}
	
	// QnA 글등록
	@PostMapping("writeSave")
	public void writeSave(MultipartHttpServletRequest mul, HttpServletRequest request, HttpServletResponse response)throws IOException {
		String message = qs.writeSave(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	// QnA 글보기
	@GetMapping("qnacontentView")
	public String qnacontentView(@RequestParam("qnaNum") int qnaNum, Model model) {
		qs.qnacontentView(qnaNum, model);
		return "qna/qnacontentView";
	}
	
	// QnA 글수정폼
	@GetMapping("QnAmodifyForm")
	public String QnAmodifyForm(@RequestParam int qnaNum, Model model) {
		qs.qnacontentView(qnaNum, model);
		return "qna/QnAmodifyForm";
	}
	
	// QnA 글수정
	@PostMapping("QnAmodify")
	public void QnAmodify(MultipartHttpServletRequest mul, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String message = qs.QnAmodify(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	// QnA 글삭제
	@GetMapping("delete")
	public void delete(@RequestParam int qnaNum, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String message = qs.QnADelete(qnaNum, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	

}
