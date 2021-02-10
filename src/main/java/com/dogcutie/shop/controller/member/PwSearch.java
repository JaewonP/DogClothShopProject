package com.dogcutie.shop.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cutieshop/*")
public class PwSearch {
	
	@GetMapping("/pwsearch")
	public String pwsearch() {
		return "clothshop/pwsearch";
	}
	
}
