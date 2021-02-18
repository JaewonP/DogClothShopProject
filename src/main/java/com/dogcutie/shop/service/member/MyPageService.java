package com.dogcutie.shop.service.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.dogcutie.shop.vo.All_User_Tbl;
import com.dogcutie.shop.vo.Order_Histroy_Tbl;

public interface MyPageService {
	public All_User_Tbl isRole(String id); //역할 찾기 
	public List<Order_Histroy_Tbl> returnLists(String u_id); //구매상품 리스트 확인


}
