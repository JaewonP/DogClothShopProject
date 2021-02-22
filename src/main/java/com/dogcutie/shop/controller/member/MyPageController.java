package com.dogcutie.shop.controller.member;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dogcutie.shop.service.member.MyPageService;
import com.dogcutie.shop.vo.All_User_Tbl;
import com.dogcutie.shop.vo.Order_Histroy_Tbl;
import com.dogcutie.shop.vo.Prod_Tbl;

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
		Collection<SimpleGrantedAuthority> authorities = (Collection<SimpleGrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		model.addAttribute("bestpord", service.hitList(p.getName()));
		System.out.println(authorities + ": 역할");
		String userName = p.getName();
		model.addAttribute("username", userName);
		//db에서 role 가져와야함 
		if((service.isRole(p.getName()).getRole_name()).equals("USER")) {
			System.out.println("user mypage");

			List<Order_Histroy_Tbl> odrList = new ArrayList<Order_Histroy_Tbl>();
			odrList = service.returnLists(userName);
			for(Order_Histroy_Tbl j : odrList) {
				j.setDiscribe(j.getDiscribe().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", ""));
			}
			model.addAttribute("list", odrList);
			return "clothshop/userMypage";
		}
		else if((service.isRole(p.getName()).getRole_name()).equals("SELLER")) {
			try {
				
				System.out.println(service.sellist(p.getName()).get(0).getDiscribe().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", ""));
				List<Prod_Tbl> productList = new ArrayList<Prod_Tbl>();
				productList = service.sellist(p.getName());
				for(Prod_Tbl i : productList) {
					i.setDiscribe(i.getDiscribe().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", ""));
					System.out.println(i.getDiscribe());
				}
				model.addAttribute("list", productList);
				
			}catch(IndexOutOfBoundsException ex) {
				ex.getMessage();
			}
			
			
			return "clothshop/sellerMypage";
		}else {
			return "clothshop/login";
		}
		
	}
	
	
	@GetMapping("/seller/salelist")
	public String saleList(Principal p, All_User_Tbl all, Model model) {
		
		model.addAttribute("salelist", service.sellist(p.getName()));
		
		return "clothshop/salelist";
	}
	

}
