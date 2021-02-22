package com.dogcutie.shop.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogcutie.shop.mapper.product.CartMapper;
import com.dogcutie.shop.vo.Cart_Tbl;

import lombok.Setter;

@Service

public class CartServiceImple implements CartService {

	@Setter(onMethod_ = @Autowired)
	private CartMapper mapper;

	@Override
	public List<Cart_Tbl> getUserCart(String u_id) {
		return mapper.getUserCart(u_id);
	}

	@Override
	public int addCart(Cart_Tbl cart) {
		//System.out.println("addCartService 호출");
		int count = 0;
		try {
			count = mapper.countCart(cart.getU_id(),cart.getPno());//상품이 장바구니에 들어있는지 체크
		}catch(Exception e) {
			System.out.println("addCart 속 에러 : " + e);
		}
		
		System.out.println("count : " + count);
		
		int result = 0;
		if(count == 0) {
			System.out.println("addCart 호출");
			result = mapper.addCart(cart);
		}else {
			result = mapper.update(cart);
		}
		
		
		return result;
	}

	@Override
	public List<Cart_Tbl> cartMoney() {
		// TODO Auto-generated method stub
		return mapper.cartMoney();
	}

	
	
	@Override
	public int countCart(String u_id, int p_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateCart(Cart_Tbl vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public int modifyCart(Cart_Tbl cart) {
		
		return mapper.modifyCart(cart);
	}

	@Override
	public int delete(int pno, String u_id) {

		return mapper.delete(pno, u_id);
	}

	@Override
	public int deleteAll(String u_id) {
		
		 return mapper.deleteAll(u_id);
		
	}
	@Override
	public int insertCart(Cart_Tbl cart) {
		
		return mapper.insertCart(cart);
	}

	@Override
	public boolean quantityUpdate(int pno, String u_id, int quantity) {
		int result =  mapper.quantityUpdate(pno,u_id,quantity);
		return result == 1;
	}
	

}
