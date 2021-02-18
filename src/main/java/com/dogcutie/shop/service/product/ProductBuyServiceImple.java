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
//	@Setter(onMethod_ = @Autowired)
//	private CartService cartService;
	
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

	/*
//	@Override
//	public boolean pushCart(int p_no, String u_id,int quantity) {
//		Prod_Tbl product = getProduct(p_no);
//		Cart_Tbl cart = new Cart_Tbl();
//		System.out.println("product Name : " + product.getP_name());
//		cart.setP_no(product.getP_no()); //vo 객체 수정으로 (pno -> p_no) setPno => setP_no 수정 (재원/20.12.29)
//		cart.setU_id(u_id);
//		cart.setQuantity(quantity);
//		cart.setPname(product.getP_name());
//		cart.setAmount(product.getAmount());
//		cart.setTotal(quantity * product.getAmount());
//		int addCartBoolean =  cartService.addCart(cart);
//		return addCartBoolean == 1;
//	}
//
//	@Override
//	
//	public boolean addLike(int p_no, String u_id) {
//		Like_Tbl like = new Like_Tbl();
//		like.setU_id(u_id);
//		like.setP_no(p_no);
//		int addLikeBoolean = likeMapper.addLike(like);
//		return addLikeBoolean == 1;
//	}
//
//	@Override
//	public User_Tbl getUser(String u_id) {
//		
//		return mypageMapper.getuser(u_id);
//	}

	@Override
	public boolean pushCart(int p_no, String u_id, int quantity) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addLike(int p_no, String u_id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User_Tbl getUser(String u_id) {
		// TODO Auto-generated method stub
		return null;
	}
	*/
}
