package com.web.cafe.coffee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("coffee")
public class CoffeeController {
	
	@GetMapping("recommend")
	public String recommend() {
		return "coffee/recommend";
	}

}