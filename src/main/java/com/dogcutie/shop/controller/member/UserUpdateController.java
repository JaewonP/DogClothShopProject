package com.dogcutie.shop.controller.member;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dogcutie.shop.service.member.MyPageService;
import com.dogcutie.shop.service.member.UserUpdateService;
import com.dogcutie.shop.vo.Seller_Tbl;
import com.dogcutie.shop.vo.User_Tbl;

import lombok.Setter;

@RequestMapping("/cutieshop/*")
@Controller
public class UserUpdateController { //회원정보수정

	@Setter(onMethod_ = @Autowired)
	private UserUpdateService service;
	
	@Setter(onMethod_ = @Autowired)
	private MyPageService myService;
	
	
	@GetMapping("/user/userupdateform")
	public String userupdateFom(Principal p, Model model) {
			String userName = p.getName();
			model.addAttribute("user", service.getAccount(userName));
			return "clothshop/updateUserAccount";

	}
	
	@PostMapping("/user/user_updateok")
	public String userupdateOk(User_Tbl user) {
		service.updateUser(user);
		return "redirect:/cutieshop/user/userupdateform";
	}
	
	@GetMapping("/seller/userupdateform")
	public String userupdateFomSeller(Principal p, Model model) {
			String userName = p.getName();
			model.addAttribute("user", service.getSellerAccount(userName));
			return "clothshop/updateSellerAccount";

	}
	
	@PostMapping("/seller/user_updateok")
	public String sellerupdateOk(Seller_Tbl seller) {
		service.updateSeller(seller);
		return "redirect:/cutieshop/seller/userupdateform";
	}

}
