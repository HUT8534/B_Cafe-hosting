package com.web.cafe.menu.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("menu")
public class MenuController {
	
	//메뉴 추천 페이지
	@GetMapping("menuRecommend")
	public String menuRecommend() {
		return "menu/menuRecommend";
	}
	
}
