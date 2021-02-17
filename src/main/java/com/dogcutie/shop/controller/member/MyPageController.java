package com.dogcutie.shop.controller.member;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dogcutie.shop.service.member.MyPageService;
import com.dogcutie.shop.vo.All_User_Tbl;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/cutieshop/*")
@AllArgsConstructor
public class MyPageController {
	
	@Setter(onMethod_ = @Autowired)
	private MyPageService service;
	
	
	@GetMapping("/mypage")
	public String mypage(Principal p, All_User_Tbl all, Model model) {
		System.out.println(service.isRole(p.getName()).getRole_name());
		System.out.println(p.getName());
		//db에서 role 가져와야함 
		if((service.isRole(p.getName()).getRole_name()).equals("USER")) {
			System.out.println("user mypage");
			String userName = p.getName();
			model.addAttribute("username", userName);
			model.addAttribute("list", service.returnLists(p.getName()));
			return "clothshop/userMypage";
		}
		else if((service.isRole(p.getName()).getRole_name()).equals("SELLER")) {
			return "clothshop/sellerMypage";
		}else {
			return "clothshop/login";
		}
		
	}
	

}
