package com.dogcutie.shop.controller.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	public String list(Model model) {
		model.addAttribute("list", productBuyService.selectAllProd());
//		String getId = (String)session.getAttribute("id");
//		try {
//			
//			model.addAttribute("user",session.getAttribute("user"));
//			
//		}catch(Exception e) {
//			System.out.println("ProductBuyController : 세션정보 없음");
//		}
		
		return "clothshop/productList";
	}
	
	/*
	@GetMapping("/product/details")
	public String detail(Model model,@Param("p_no") int p_no) {
	//public String detail(Model model,@Param("p_no") int p_no, HttpSession session) {
		model.addAttribute("product", productBuyService.getProductDetails(p_no));
		// session 에 담겨있는 id 를 가져와서 model 에 담음
		model.addAttribute("askList",askService.ask(p_no));
		
		//임시로 user 객체 생성
		All_User_Tbl testuser = new All_User_Tbl();
		testuser.setId("seller1");
		
//		model.addAttribute("user",session.getAttribute("user"));
		model.addAttribute("user",testuser);
		model.addAttribute("replyList",replyService.replyList(p_no));
		System.out.println("유저는 : " +testuser);
		
		List<Reply_Tbl> list = replyService.replyList(p_no);
		List<String[]> array = new ArrayList<String[]>();
		model.addAttribute("imgArray",array );

		
		return "carshop/productdetails";
	}*/
	
	@ResponseBody
	@PostMapping("/productList")
	public List<Prod_Tbl> selcetlist(String size,String season,String color,String sorting) {
		System.out.println(size+ ", "+ season+ ", "+ color+ ", "+ sorting);
		return productBuyService.selectProd(size,season,color,sorting);
	}
	
	/*
	
//	@ResponseBody
//	@PostMapping("/product/selectCategoryDetail")
//	public List<ProductCategoryJoin> selcetDetailList(@Param("categoryNum")Integer categoryNum,String object,String direction) {
//		System.out.println("ditails : " + categoryNum + object + direction+"");
//		return productBuyService.getProductCategory(null,categoryNum,object,direction);
//	}
	@ResponseBody
	@PostMapping("/product/addcart")
	public boolean pushCart(int p_no, String u_id,int quantity) {
	    return productBuyService.pushCart(p_no, u_id, quantity);
	}  

	@ResponseBody
	@PostMapping("/product/addlike")
	public boolean addLike(int p_no, String u_id) {
		
		return productBuyService.addLike(p_no, u_id);
	}
//	@ResponseBody
//	@PostMapping("/product/checkLiked")
//	public boolean checkLiked(@Param("p_no")int p_no,@Param("u_id")String u_id) {
//		
//		return likeService.getUserLikeProduct(p_no, u_id);
//	}
//	@ResponseBody
//	@PostMapping("/product/removeLiked")
//	public int checkOutLiked(int p_no,String u_id) {
//
//		return likeService.deleteLike(p_no, u_id);
//	}
//	@ResponseBody
//	@PostMapping("/product/sort")
//	public List<Prod_Tbl> sort(String object,String direction) {
//		
//		return productBuyService.getSortProduct(object,direction);
//	}
	
	*/
}
