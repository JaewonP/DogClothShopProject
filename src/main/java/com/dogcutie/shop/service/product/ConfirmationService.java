package com.dogcutie.shop.service.product;

import java.util.List;

import com.dogcutie.shop.vo.Order_Histroy_Tbl;

public interface ConfirmationService {

	public List<Order_Histroy_Tbl> orderList(String u_id);
}
