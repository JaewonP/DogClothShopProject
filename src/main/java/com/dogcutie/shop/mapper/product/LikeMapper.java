package com.dogcutie.shop.mapper.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.dogcutie.shop.vo.Like_Tbl;

@Mapper
public interface LikeMapper {
	public int addLike(Like_Tbl like);
	public Like_Tbl getUserLikeProduct(@Param("p_no")int p_no,@Param("u_id")String u_id);
	public int deleteLike(@Param("p_no")int p_no,@Param("u_id")String u_id);
	
/*
	 * public int insertCart(Like_Tbl like); // cart 담기
	 */	
	public List<Like_Tbl> getCartUpdate(String u_id);
	// 유저 네임을 가지고 like 출력 
	
	public int deleteAll(String u_id); // like 비우기 
	public int delete(@Param("p_no")int p_no,@Param("u_id")String u_id); //
	
	
	//public int delete(int p_no, String u_id);
	//public List<Prod_Tbl> prodList(String s_id);
	//public List<Like_Tbl> getUserLikedList(String u_id);
	
	
}
