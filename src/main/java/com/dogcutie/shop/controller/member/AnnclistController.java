package com.dogcutie.shop.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/cutieshop/*")
@Slf4j
public class AnnclistController {

	@RequestMapping("/annclist")
	public String annclist() {
		return "clothshop/annclist";
	}

}
