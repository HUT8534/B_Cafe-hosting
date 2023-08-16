package com.web.cafe.gongji.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.cafe.gongji.service.GongjiFileService;
import com.web.cafe.gongji.service.GongjiService;
import com.web.cafe.member.session.name.MemberSessionName;

@Controller
@RequestMapping("/gongji")
public class GongjiController implements MemberSessionName{
	
	@Autowired
	GongjiService gs;
	
	@Autowired
	GongjiFileService gfs;
	
	// 공지 목록 가져오기
	@RequestMapping("gongjiList")
	public String gongjiList(Model model, @RequestParam(value="num", required=false, defaultValue="1") int num) {
		gs.gongjiList(model, num);
		return "gongji/gongjiList";
	}
	
	// 공지 검색
	@GetMapping("gongjiSearch")
	public String gongjiSearch(Model model, HttpSession session,
											@RequestParam("type") String type,
											@RequestParam("search") String search,
											@RequestParam(value="num", required=false, defaultValue="1") int num) {
		if(type=="t"&&search==null) {
			session.removeAttribute("typeValue");
			session.removeAttribute("searchValue");
		} else {
			session.setAttribute("typeValue", type);
			session.setAttribute("searchValue", search);
		}
		gs.gongjiSearch(model, type, search, num);
		return "gongji/gongjiList";
	}
	
	// 공지 등록 페이지
	@RequestMapping("gongjiWriteForm")
	public String gongjiWrite() {
		return "gongji/gongjiWriteForm";
	}
	
	// 공지 등록하기
	@PostMapping("gongjiWriteSave")
	public void gongjiWriteSave(MultipartHttpServletRequest mul
			,HttpServletRequest request
			,HttpServletResponse response) throws IOException{
		String message = gs.gongjiWriteSave(mul, request);		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	// 매장 찾기
	@RequestMapping("findShop")
	public String findShop() {
		return "gongji/findShop";
	}
	
	// 공지 내용 가져오기
	@RequestMapping("gongjiView")
	public String gongjiView(@RequestParam int gongjiNum, Model model) {
		gs.gongjiView(gongjiNum, model);
		return "gongji/gongjiView";
	}
	// 공지 내용 이미지 가져오기
	@RequestMapping("download")
	public void download(@RequestParam("imageFileName") String imageFileName,
													HttpServletResponse response) throws IOException {
		if(imageFileName != "nan") {
			response.addHeader("Content-dispostion", "attachment; fileName="+URLEncoder.encode(imageFileName, "utf-8"));
				
			File file = new File(gfs.IMAGE_REPO+"\\"+imageFileName);
			FileInputStream in = new FileInputStream(file);
			FileCopyUtils.copy(in, response.getOutputStream());
			in.close();
		} else return;
	}
	
	// 공지 수정 페이지
	@RequestMapping("gongjiModifyForm")
	public String gonjiModifyForm(@RequestParam int gongjiNum, Model model) {
		gs.gongjiView(gongjiNum, model);
		return "gongji/gongjiModifyForm";
	}
	
	// 공지 수정하기
	@PostMapping("gongjiModify")
	public void gongjiModify(MultipartHttpServletRequest mul
								,HttpServletRequest request
								,HttpServletResponse response) throws IOException{
		String message = gs.gongjiModify(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	// 공지 삭제
	@RequestMapping("gongjiDelete")
	public void gongjiDelete(@RequestParam("gongjiNum") int gongjiNum, @RequestParam("imageFileName") String imageFileName,
													HttpServletRequest request,
													HttpServletResponse response) throws IOException{
		String message = gs.gongjiDelete(gongjiNum, imageFileName, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
}
