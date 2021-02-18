package com.dogcutie.shop.vo;

import lombok.Data;

@Data
public class Order_Histroy_Tbl {
	private String u_id, pay,color, size,coupon_name, order_date, pname, seller, img, discribe; //이미지, 설명 추가
	private int ono, pno, quantity, total;


}
