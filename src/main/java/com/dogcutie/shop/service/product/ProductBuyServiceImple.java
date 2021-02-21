package com.dogcutie.shop.service.product;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogcutie.shop.mapper.product.ProductBuyMapper;
import com.dogcutie.shop.vo.Prod_Tbl;
import com.dogcutie.shop.mapper.member.MyPageMapper;
import com.dogcutie.shop.mapper.product.CartMapper;
import com.dogcutie.shop.mapper.product.LikeMapper;
import com.dogcutie.shop.service.product.CartService;
import com.dogcutie.shop.vo.Cart_Tbl;
import com.dogcutie.shop.vo.Like_Tbl;
import com.dogcutie.shop.vo.ProductCategoryJoin;
import com.dogcutie.shop.vo.User_Tbl;

import lombok.Setter;

@Service
public class ProductBuyServiceImple implements ProductBuyService {

	@Setter(onMethod_ = @Autowired)
	private ProductBuyMapper mapper;
//	@Setter(onMethod_ = @Autowired)
//	private CartMapper cartMapper;
//	@Setter(onMethod_ = @Autowired)
//	private LikeMapper likeMapper;
//	@Setter(onMethod_ = @Autowired)
//	private MyPageMapper mypageMapper;
	@Setter(onMethod_ = @Autowired)
	private CartService cartService;
	
	@Override
	public List<Prod_Tbl> selectAllProd(){
		return mapper.selectAllProd();
	}
//	@Override
//	public Prod_Tbl getProduct(int p_no) {
//		return mapper.getProduct(p_no);
//	}

	@Override
	public List<Prod_Tbl> selectProd(String size,String season,String color,String sorting) {
		// TODO Auto-generated method stub
		//System.out.println(" service 부모 카테고리 : " + categoryParents + ", 자식 카테고리 : " +  categoryDetails + "direction :  " + direction);
		return mapper.selectProd(size,season,color,sorting);
	}

	@Override
	public Prod_Tbl getProductDetail(int p_no) {
		return mapper.getProductDetail(p_no);
	}
	@Override
	public List<Prod_Tbl> filter(String p_name) {
		return mapper.filter(p_name);
	}

	@Override
	public boolean pushCart(int p_no, String u_id,int quantity) {
		Prod_Tbl product = getProduct(p_no);
		Cart_Tbl cart = new Cart_Tbl();
		System.out.println("product Name : " + product.getP_name());
		cart.setPno(product.getP_no());
		cart.setU_id(u_id);
		cart.setQuantity(quantity);
		cart.setPname(product.getP_name());
		cart.setColor(product.getColor());
		cart.setSize(product.getSize());
		cart.setAmount(product.getAmount());
		cart.setTotal(quantity * product.getAmount());
		System.out.println("cart : " + cart);
		int addCartBoolean =  cartService.addCart(cart);
		return addCartBoolean == 1;
	}
	@Override
	public Prod_Tbl getProduct(int p_no) {
		return mapper.getProduct(p_no);
	}

//	@Override
//	public User_Tbl getUser(String u_id) {
//		
//		return mypageMapper.getuser(u_id);
//	}

}
