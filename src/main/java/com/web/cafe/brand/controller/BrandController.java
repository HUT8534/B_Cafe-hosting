package com.web.cafe.brand.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("brand")
public class BrandController {
	
	// 브랜드 소개
	@GetMapping("introduce")
	public String introduce() {
		return "brand/introduce";
	}
	
	// 브랜드 연혁
	@GetMapping("history")
	public String history() {
		return "brand/history";
	}
	
	// 찾아오시는 길
	@GetMapping("direction")
	public String direction() {
		return "brand/direction";
	}
	
	
	

}
