package com.dogcutie.shop.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogcutie.shop.mapper.product.ConfirmationMapper;
import com.dogcutie.shop.vo.Order_Histroy_Tbl;

import lombok.Setter;

@Service
public class ConfirmationServiceImple implements ConfirmationService{


	@Setter(onMethod_ = @Autowired)
	private ConfirmationMapper mapper;
	
	@Override
	public List<Order_Histroy_Tbl> orderList(String u_id) {
		return mapper.orderList(u_id);
	}
}
