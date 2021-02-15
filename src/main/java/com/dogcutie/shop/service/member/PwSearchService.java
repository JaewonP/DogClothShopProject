package com.dogcutie.shop.service.member;

import java.util.List;

import com.dogcutie.shop.vo.All_User_Tbl;
import com.dogcutie.shop.vo.Seller_Tbl;
import com.dogcutie.shop.vo.User_Tbl;

public interface PwSearchService {
	
	public List<All_User_Tbl> emailReturn(String email);
	public boolean emailEx(String email); //전체 유저 db에서 이메일 확인 
	public void updateAllUser (String pw, String id); //전체 유저 db에 일반유저인지, 판매자 유저인지 구분 (재원/21.02.03)
	public void updateAllSeller (String pw, String id); //전체 유저 db에 일반유저인지, 판매자 유저인지 구분 (재원/21.02.03)
}
