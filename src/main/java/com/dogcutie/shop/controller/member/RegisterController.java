package com.dogcutie.shop.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dogcutie.shop.service.member.RegisterService;
import com.dogcutie.shop.vo.All_User_Tbl;
import com.dogcutie.shop.vo.Seller_Tbl;
import com.dogcutie.shop.vo.User_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/cutieshop/*")
@Slf4j
public class RegisterController { //회원가입

 @Setter(onMethod_ = @Autowired )
 private RegisterService service;
	
 @GetMapping("/register")
 public String userRegister() {
	 return "clothshop/register_user";
 }
 
 @PostMapping("/register")
 public String userRegister(User_Tbl user, All_User_Tbl all, Seller_Tbl sellertbl) {
	 service.insertUser(user);
	 service.addAllUser(user);
	 return "redirect:/cutieshop/login";
 }
 
 
 @GetMapping("/register_seller")
 public String sellerRegister() {
	 return "clothshop/register_seller";
 }
 
 @PostMapping("/register_seller")
 public String sellerRegister(Seller_Tbl sellertbl, All_User_Tbl all, User_Tbl user) {
	 service.insertSeller(sellertbl);
	 service.addAllSeller(sellertbl);
	 
	 return "redirect:/cutieshop/login";
 }
	
 
 @PostMapping("/isIdOk")
 @ResponseBody
 public boolean idOk(@RequestParam("id") String id) {
	 return service.equalId(id);
 }
 
 @PostMapping("/isEmailOk")
 @ResponseBody
 public boolean emailOk (@RequestParam("email") String email) {
	 return service.equalEmail(email);
 }
 
}
