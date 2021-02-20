package com.dogcutie.shop.controller.product;

import java.security.Principal;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dogcutie.shop.service.product.ProductBuyService;
import com.dogcutie.shop.vo.Prod_Tbl;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/cutieshop/*")
@AllArgsConstructor
@Slf4j
public class ProductBuyController {
	@Setter(onMethod_=@Autowired)
	private ProductBuyService productBuyService;
//	@Setter(onMethod_=@Autowired)
//	private CartService cartService;
//	@Setter(onMethod_=@Autowired)
//	private LikeService likeService;
//	@Setter(onMethod_=@Autowired)
//	private CategoryService categoryService;
//	@Setter(onMethod_ = @Autowired)
//	private AskService askService;
//	@Setter(onMethod_ = @Autowired)
//	private ReplyService replyService;
	
	@GetMapping("/productList")
	public String list(Model model, HttpSession session, Principal principal) {
//		model.addAttribute("list", productBuyService.selectAllProd());
//		String getId = (String)session.getAttribute("id");
//		System.out.print("getId : " + getId);
//		String sessId = principal.getName();
//		System.out.print("sessId : " + sessId);
//		try {
//			
//			model.addAttribute("user",session.getAttribute("user"));
//			
//		}catch(Exception e) {
//			System.out.println("ProductBuyController : 세션정보 없음");
//		}
		Collection<SimpleGrantedAuthority> authorities = (Collection<SimpleGrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
        System.out.println(authorities + ": 역할");
		return "clothshop/productList";
	}
	
	
	@GetMapping("/product/details")
	public String detail(Model model,@Param("p_no") int p_no) {
	//public String detail(Model model,@Param("p_no") int p_no, HttpSession session) {
		System.out.println("1");
		model.addAttribute("product", productBuyService.getProductDetail(p_no));
		System.out.println("2");
		Collection<SimpleGrantedAuthority> authorities = (Collection<SimpleGrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
        System.out.println(authorities + ": 역할");
		// session 에 담겨있는 id 를 가져와서 model 에 담음
		
		return "clothshop/productdetails";
	}
	
	@ResponseBody
	@PostMapping("/productList")
	public List<Prod_Tbl> selcetlist(String size,String season,String color,String sorting) {
		System.out.println(size+ ", "+ season+ ", "+ color+ ", "+ sorting);
		return productBuyService.selectProd(size,season,color,sorting);
	}
	
	@ResponseBody
	@PostMapping("/searchList")
	public List<Prod_Tbl> filter(String p_name) {
		System.out.println("p_name : " + p_name);
		return productBuyService.filter(p_name);
	}
//	
//	@ResponseBody
//	@PostMapping("/product/addcart")
//	public boolean pushCart(int p_no, String u_id,int quantity) {
//	    return productBuyService.pushCart(p_no, u_id, quantity);
//	}  

}
