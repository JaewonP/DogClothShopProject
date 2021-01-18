package com.dogcutie.shop.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

	@RequestMapping("/hello")
	public String hello() {
		return "hello 스피링 부트";
	}
	
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
}
