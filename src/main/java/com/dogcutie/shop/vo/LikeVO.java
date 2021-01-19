package com.dogcutie.shop.vo;

import lombok.Data;


@Data
public class LikeVO {

	private int p_no, amount;
	private String u_id, p_name ;

	//  like_tbl과 prod_tbl join으로 인한 LileVO 생성 2021/01/14 YHJ
}
