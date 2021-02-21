package com.dogcutie.shop.service.product;

import java.util.List;

import com.dogcutie.shop.vo.Cart_Tbl;
import com.dogcutie.shop.vo.Order_Histroy_Tbl;
import com.dogcutie.shop.vo.User_Tbl;

public interface CheckOutService {

	public List<User_Tbl> userList(String u_id);
	public List<Cart_Tbl> cartList(String u_id); 
	public boolean insertBuyList(Order_Histroy_Tbl order, String u_id);
	public void deleteCartList(String u_id);

}
 