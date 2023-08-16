
package com.web.cafe.community.controller;

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

import com.web.cafe.community.service.CommunityService;

@Controller
@RequestMapping("community")
public class communityController {
	
	@Autowired
	CommunityService cs;

	@GetMapping("communityAllList")
	public String community(Model model,@RequestParam(value="num", required=false, defaultValue="1")int num ) {
		cs.communityAllList(model, num);
		return "community/communityAllList";
	}
	
	// 커뮤니티 검색
	@GetMapping("searchList")
	public String searchList(Model model,
	                         @RequestParam(value="type", required=true) String type,
	                         @RequestParam("search") String search,
	                         @RequestParam(value="num", required=false, defaultValue="1") int num) {
	    cs.searchList(model, type, search, num);
	    return "community/searchList";
	}	

	@RequestMapping("communityWriteForm")
	public String communityWriteForm() {
		return "community/communityWriteForm";
	}
	
	@RequestMapping("modifyForm")
	public String modifyForm() {
		return "community/modifyForm";
	}
	
	@PostMapping("writeSave")
	public void writeSave(MultipartHttpServletRequest mul, 
						  HttpServletRequest request, 
					      HttpServletResponse response)throws IOException {

		String message = cs.writeSave(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	@GetMapping("contentView")
	public String contentView(@RequestParam("communityNum") int communityNum, Model model) {	  
	        cs.contentView(communityNum, model);
	        cs.communityRepList(model, communityNum);
	    return "community/contentView";
	}

	
	@GetMapping("modifyForm")
	public String modifyForm(@RequestParam int communityNum,Model model) {
		cs.contentView(communityNum, model);
		return "community/modifyForm";
	}
	 
	@PostMapping("modify")
	public void modify(MultipartHttpServletRequest mul, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String message = cs.modify(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	
	@GetMapping("delete")
	public void delete(@RequestParam int communityNum, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String message = cs.communityDelete(communityNum,  request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	 
	
	
}













