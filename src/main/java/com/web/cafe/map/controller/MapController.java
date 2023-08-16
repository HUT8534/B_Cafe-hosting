package com.web.cafe.map.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("map")
public class MapController {
	
	// 매장 찾기
	@GetMapping("findShop")
	public String testMap() {
		return "map/findShop";
	}
	
}
