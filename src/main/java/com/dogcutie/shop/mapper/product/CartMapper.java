package com.dogcutie.shop.mapper.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.dogcutie.shop.vo.Cart_Tbl;
import com.dogcutie.shop.vo.Prod_Tbl;

@Mapper
public interface CartMapper {

	public List<Cart_Tbl> getUserCart(String u_id); 
	public int addCart(Cart_Tbl cart);
	
	// insert 
	
	public List<Cart_Tbl> cartMoney(); // 장바구니 total
	public List<Cart_Tbl> listCart(String u_id); // 장바구니 목록
	
	
	public int insertCart(Cart_Tbl cart); // 카트 담기
	
	public int delete(@Param("pno") int pno,@Param("u_id") String u_id); // 장바구니 개별 삭제
	
	public int deleteAll(String u_id); // 장바구니 모두 삭제
	//public String deleteAll(String u_id); // 장바구니 모두 삭제
	
	
	public int update(Cart_Tbl cart); // 장바구니 업데이트 
	public int modifyCart(Cart_Tbl car);
	//public int update(int p_no); // 장바구니 업데이트 
	
	

	public int quantityUpdate(@Param("pno") int pno,@Param("u_id") String u_id,@Param("quantity") int quantity);
	
	public int sumTotal(String u_id); // 장바구니 total
	public Integer countCart(@Param("u_id")String u_id, @Param("pno")int pno); // 장바구니 상품 개수
	public int updateCart(Cart_Tbl cart); // 장바구니 수정
}
