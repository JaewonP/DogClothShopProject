package com.dogcutie.shop.service.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.dogcutie.shop.vo.All_User_Tbl;
import com.dogcutie.shop.vo.Order_Histroy_Tbl;
import com.dogcutie.shop.vo.Prod_Tbl;

public interface MyPageService {
	public All_User_Tbl isRole(String id); //역할 찾기 
	public List<Order_Histroy_Tbl> returnLists(String u_id); //구매상품 리스트 확인
	public List<Prod_Tbl> sellist(String s_id); //판매중인 상품 리스트 확인 
	public List<Prod_Tbl> hitList(String s_id); //히트 수 확인 

}
