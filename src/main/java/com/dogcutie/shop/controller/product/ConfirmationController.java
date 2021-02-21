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
import org.springframework.web.bind.annotation.RequestMapping;

import com.dogcutie.shop.service.product.ConfirmationService;
import com.dogcutie.shop.vo.Order_Histroy_Tbl;
import com.dogcutie.shop.vo.User_Tbl;

import lombok.Setter;


@Controller
@RequestMapping("/cutieshop/*")
public class ConfirmationController {

	@Setter(onMethod_ = @Autowired)
	private ConfirmationService service;
	
	@GetMapping("/confirmation")
	public String getConfirmation(Model model, HttpSession session, Principal principal) {
		
		try {
			String getId = principal.getName();	

			Collection<SimpleGrantedAuthority> authorities = (Collection<SimpleGrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
			System.out.println("confirmationController in : 유저인가 판매자인가 ? " + authorities);
			
			String userList = "g";
			if(userList == null || userList.equals("") || userList.equals(null)) {
				return "carshop/errorForbidden";
			}
			else {
				List<Order_Histroy_Tbl> list = service.orderList(getId);
				System.out.println("get은 : " + list);
				model.addAttribute("buylist",  list);

				return "clothshop/confirmation";
				
			}	
			
		}
		catch(Exception e) {
			e.printStackTrace();
			return "clothshop/error";
		}
		
		
	}
	
}
