package com.dogcutie.shop.vo;

import lombok.Data;

@Data
public class ProductCategoryJoin {
	private int p_no, c_no, amount, quantity, hit;
	private String s_id, p_name, discribe, compa, img1,img2,img3, new_date, update_date;
	private int c_parent;
	private String c_name;

}
