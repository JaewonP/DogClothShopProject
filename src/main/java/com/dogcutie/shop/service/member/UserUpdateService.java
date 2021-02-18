package com.dogcutie.shop.service.member;

import java.util.List;

import com.dogcutie.shop.vo.Seller_Tbl;
import com.dogcutie.shop.vo.User_Tbl;

public interface UserUpdateService {

	
	public User_Tbl getAccount(String u_id); //유저 명시
	public Seller_Tbl getSellerAccount(String u_id); //유저 명시
	public void updateUser(User_Tbl user); //유저 정보 업데이트
	public void updateSeller(Seller_Tbl seller); //판매자 정보 업데이트
	
}
