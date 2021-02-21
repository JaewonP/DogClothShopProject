package com.dogcutie.shop.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dogcutie.shop.service.member.AnnclistService;
import com.dogcutie.shop.vo.Annc_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/cutieshop/*")
@Slf4j
public class AnnclistController {

	@Setter(onMethod_ = @Autowired)
	private AnnclistService service;
	
	@RequestMapping("/FAQ")
	public String annclist(Model model) {
		model.addAttribute("list", service.selectall());
		return "clothshop/FAQ";
	}
	
	@GetMapping("/admin/updateFAQ")
	public String annclistUpdate() {
		return "clothshop/FAQupdate";
	}
	
	@PostMapping("/admin/updateFAQ")
	public String annclistUpdatePost(Annc_Tbl annc) {
		
		service.insetAnnclist(annc);
		
		return "redirect:/cutieshop/FAQ";
	}

}
