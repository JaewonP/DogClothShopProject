package com.dogcutie.shop.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogcutie.shop.mapper.product.CheckOutMapper;
import com.dogcutie.shop.vo.Cart_Tbl;
import com.dogcutie.shop.vo.Order_Histroy_Tbl;
import com.dogcutie.shop.vo.User_Tbl;

import lombok.Setter;

@Service
public class CheckOutServiceImple implements CheckOutService{

	@Setter(onMethod_ =@Autowired)
	private CheckOutMapper mapper;

	@Override
	public List<User_Tbl> userList(String u_id) {
		return mapper.userList(u_id);
	}
	@Override
	public List<Cart_Tbl> cartList(String u_id) {
		return mapper.cartList(u_id);
	}

	@Override
	public void deleteCartList(String u_id) {
		mapper.deleteCartList(u_id);
		
	}

	@Override
	public boolean insertBuyList(Order_Histroy_Tbl order, String u_id) {
		List<Cart_Tbl> cartL = mapper.cartList(u_id);
		try {
			for(int i =0; i<cartL.size(); i++) {
				order.setU_id(cartL.get(i).getU_id());
				order.setColor(cartL.get(i).getColor());
				order.setSize(cartL.get(i).getSize());
				order.setTotal(cartL.get(i).getTotal());
				order.setQuantity(cartL.get(i).getQuantity());
				order.setPno(cartL.get(i).getPno());
				order.setPname(cartL.get(i).getPname());
				mapper.insertBuyList(order);
			}
			return true;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
}
