package com.dogcutie.shop.controller.member;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/cutieshop/*")
@Slf4j
public class LoginController {
	
	@RequestMapping("/login")
	public String login() {
		return "clothshop/login";
	}
	
	
	@GetMapping("/headerAjax")
	@ResponseBody
	public boolean receive(HttpServletRequest request, HttpSession session, Principal principal) throws Exception{

		boolean result = false;
	//	HttpSession session1 = request.getSession(false);		//세션이 있다면 저장, 없다면 null반환 
		if(principal != null) {
			String sessId = principal.getName(); 	//세션에 저장된 아이디가 있는지를 확인하고자함
			System.out.println("sessId 세션에 저장된 아이디  = " + sessId);

			if(sessId != null) result = true;    					//로그인된상태 = "로그아웃버튼보이게"
			else result = false;
			return result;
		}
		else {
			return result;
		}
	}
	
	
	@GetMapping("/accessDenied")
	public String accessDenied() {
		return "clothshop/errorForbidden";
	}
	
}


