package com.dogcutie.shop.vo;

import org.apache.ibatis.session.SqlSession;

import lombok.Data;

@Data
public class Cart_Tbl {
	
	private String cart_id,u_id,pname,color,size,coupon_name;
	private int pno,quantity,total;
	// amount 총금액

	
	  @Override
	    public String toString() {
	        return "Cart_Tbl [u_id=" + u_id + ", pname=" + pname + ", pno=" + pno + ", quantity=" + quantity +  "]";
	    }
	  
	  // 오버라이드 
	
}
