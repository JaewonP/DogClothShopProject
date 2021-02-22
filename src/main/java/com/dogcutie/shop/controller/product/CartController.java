package com.dogcutie.shop.controller.product;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dogcutie.shop.service.product.CartService;
import com.dogcutie.shop.service.product.ProductBuyService;
import com.dogcutie.shop.vo.Cart_Tbl;
import com.dogcutie.shop.vo.Prod_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/cutieshop/*")
@Slf4j

public class CartController {

	@Setter(onMethod_ = @Autowired)
	private CartService cartService;
	@Setter(onMethod_ = @Autowired)
	private ProductBuyService productService;

	
	@RequestMapping("/user/cart")
	public String cart(Model model, HttpSession session, Principal principal) {
		String userId = principal.getName();
		model.addAttribute("userId", userId);
		List<Cart_Tbl> cartList = cartService.getUserCart(userId);
		model.addAttribute("cartList", cartList);
		model.addAttribute("u_id", userId);
		// 특정
		
		return "clothshop/cart";

	}
	@RequestMapping("/user/cart_delete")
	public String delete(@Param("pno") int pno,@Param("u_id") String u_id, HttpSession session,Principal principal) {
		System.out.println("id는" + u_id + "pno는" + pno);
		cartService.delete(pno, u_id);
		
		return "redirect:/cutieshop/user/cart";
		
		
	}
	
	// 장바구니 전체 삭제
	
	@RequestMapping("/user/cart_deleteAll")
	public String deleteAll(@Param("u_id") String u_id) {
		
		System.out.println(u_id + "님이 cart_controller 들어 왔습니다.");
		cartService.deleteAll(u_id);
		return "redirect:/cutieshop/user/cart";
	}

	
	@ResponseBody
	@PostMapping("/user/quantityUpdate")
	public boolean update(@Param("quantity") int quantity,@Param("pno") int pno,@Param("u_id") String u_id, HttpSession session,Principal principal) {
	
	    return cartService.quantityUpdate(pno, u_id, quantity);
	}
	

}

