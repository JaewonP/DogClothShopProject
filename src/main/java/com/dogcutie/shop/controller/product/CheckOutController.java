package com.dogcutie.shop.controller.product;

import java.security.Principal;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dogcutie.shop.service.product.CartService;
import com.dogcutie.shop.service.product.CheckOutService;
import com.dogcutie.shop.vo.Cart_Tbl;
import com.dogcutie.shop.vo.Order_Histroy_Tbl;
import com.dogcutie.shop.vo.User_Tbl;

import lombok.Setter;

@Controller
@RequestMapping("/cutieshop/*")
public class CheckOutController {


	@Setter(onMethod_ = @Autowired)
	private CheckOutService checkoutservice;
	@Setter(onMethod_ = @Autowired)
	private CartService cartService;

	@GetMapping("/checkout")
	public String checkout(Model model, User_Tbl user, HttpSession session, Principal principal) {

		try {

			String getId = principal.getName();			
			
			String userList = "g";
			
			Collection<SimpleGrantedAuthority> authorities = (Collection<SimpleGrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
			System.out.println("checkOutController in : 유저인가 판매자인가 ? " + authorities);
			
			if(userList == null || userList.equals("") || userList.equals(null)) {
				return "redirect:/clothshop/error";
			}
			else { 
				user.setU_id(getId);
				model.addAttribute("pUser", checkoutservice.userList(user.getU_id()));
				List<Cart_Tbl> cartList = cartService.getUserCart(getId);
				model.addAttribute("cartList",cartList);

				return "clothshop/checkout";
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:/clothshop/error";
		}

		
	}


	@PostMapping("/checkout")
	public String checkout(Cart_Tbl cart, Order_Histroy_Tbl order, Model model, HttpSession session, Principal principal) {
		try {
			String getId = principal.getName();
			//주문이력 테이블에 결제한 상품들 넣기
			if(checkoutservice.insertBuyList(order, getId)) {
				//주문 후 장바구니 뭄품 삭제
				checkoutservice.deleteCartList(getId);	
				
			}

			
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:/cutieshop/error";
		}
		

		return "redirect:/cutieshop/confirmation";

	}
	
	
	
	 
}
