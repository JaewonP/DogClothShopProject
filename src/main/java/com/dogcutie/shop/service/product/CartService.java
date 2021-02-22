package com.dogcutie.shop.service.product;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dogcutie.shop.vo.Cart_Tbl;

@Service
public interface CartService {

	public List<Cart_Tbl> getUserCart(String u_id); 
	public int addCart(Cart_Tbl cart); 
	
	
	
	public int countCart(String u_id, int p_no); // 장바구니 상품 개수

	public int insertCart(Cart_Tbl cart);
	
	public int delete(int pno, String u_id);
	public int deleteAll(String u_id); // 장바구니 모두 삭제

	public boolean quantityUpdate(int pno,String u_id,int quantity);
	
	public List<Cart_Tbl> cartMoney();
	public void updateCart(Cart_Tbl vo);
	public int modifyCart(Cart_Tbl car);
	
	
}
