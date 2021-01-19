package com.dogcutie.shop.vo;

import lombok.Data;

@Data
public class Report_Tbl {

	private String u_id, s_id, date, content;
	int p_no;  //pno를 int로 수정 -성연 20.01.12
}