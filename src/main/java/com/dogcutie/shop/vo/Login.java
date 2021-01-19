package com.dogcutie.shop.vo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Login {

	private String id;
	private String pw;
	private String email;
	private String pw1;   // bomi 2021.01.03 변수추가
	private String pw2;   // bomi 2021.01.03 변수추가

}
