package com.dogcutie.shop.vo;


import java.util.List;

import lombok.Data;

@Data

public class Prod_Tbl {
	private int p_no, amount, quantity,like_count, hit;

	private String s_id, p_name,color,size,season,c_name, discribe, new_date, update_date,img1,img2,img3;
	private List<String> imgList;
	



	

}
