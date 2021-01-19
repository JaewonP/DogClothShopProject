package com.dogcutie.shop.vo;

import lombok.Data;

@Data
public class ReturnJoin_Tbl {
	private Return_Tbl return_tbl;
	private Order_Histroy_Tbl order_history_tbl;

}
