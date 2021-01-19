package com.dogcutie.shop.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int startNum;  //mysql's grammer is different from Oracle's -SungYeon 20.12.23
	private int amount;
	private int pageNum;
	
	public Criteria() {
		this(1, 10, 0); //default constructor -SungYeon 20.12.23
	}
	
	public Criteria(int pageNum, int amount, int startNum) {  //can manipualte when creating constructor -SungYeon 20.12.23
		
		this.pageNum = pageNum;
		this.startNum = (pageNum-1)*amount; //if page is 1, start from 0 -SungYeon 20.12.23
		this.amount = amount;
	}
	


}
