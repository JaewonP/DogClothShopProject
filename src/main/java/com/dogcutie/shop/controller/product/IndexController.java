package com.dogcutie.shop.controller.product;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;

@Controller
@RequestMapping("/cutieshop/*")
public class IndexController {
	
	@SuppressWarnings("finally")
	@RequestMapping("/index")
	public String index(HttpSession session, HttpServletRequest req, Authentication auth, Principal principal) {
		
		String pr = null;
		
		try {
			HttpSession s = req.getSession();
			System.out.println("session id 확인 : " + req.getSession().getId());
			pr = principal.getName();
			System.out.println(pr);
		}catch(NullPointerException e) {
			pr = null;
		}finally {
			return "clothshop/index";
		}
	
	}

}