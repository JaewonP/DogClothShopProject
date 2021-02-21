package com.dogcutie.shop.service.product;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dogcutie.shop.vo.Cart_Tbl;

@Service
public interface CartService {

	public List<Cart_Tbl> getUserCart(String u_id); 
	public int addCart(Cart_Tbl cart); // 장바구니 추가 보군님, 혜정 
	
	
	
	public int countCart(String u_id, int p_no); // 장바구니 상품 개수

	public int insertCart(Cart_Tbl cart); // 카트 담기 혜정  1 14 
	
	
	// void insertLikeList(Cart_Tbl cart, String u_id); // like 정보를 받아오기

	// 서비스에서 인트나 보이드 여야 한다. 딜리트의 디폴드값은 0이나 1이기때문이다.
	public int delete(int pno, String u_id); // 장바구니 개별 삭제
	// 칼럼 타입수정 2020/01/08 yun.hj
	// public String deleteAll(String u_id); // 장바구니 모두 삭제
	
	public int deleteAll(String u_id); // 장바구니 모두 삭제

	public boolean quantityUpdate(int pno,String u_id,int quantity);
	
	public List<Cart_Tbl> cartMoney(); // 장바구니 total 혜정
	public void updateCart(Cart_Tbl vo); // 장바구니 수량 수정
	public int modifyCart(Cart_Tbl car);
	
	
	
	// public int update(int p_no); // 장바구니 업데이트
	// public int update(Cart_Tbl cart); // 장바구니 수량 업데이트
	
	
	
	//public int sumTotal(String u_id); // 장바구니 total
	//public List<Cart_Tbl> listCart(String u_id); // 장바구니 목록 혜정
	
}
