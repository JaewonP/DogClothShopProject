package com.dogcutie.shop.mapper.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dogcutie.shop.vo.Cart_Tbl;
import com.dogcutie.shop.vo.Order_Histroy_Tbl;
import com.dogcutie.shop.vo.User_Tbl;

@Mapper
public interface CheckOutMapper {


	public List<User_Tbl> userList(String u_id);
	public User_Tbl getUser(String u_id);
	public List<Cart_Tbl> cartList(String u_id);
	public void insertBuyList(Order_Histroy_Tbl order); 
	public void deleteCartList(String u_id);
	public User_Tbl isUser(String u_id);

}