package com.dogcutie.shop.service.member;

import java.util.List;

import com.dogcutie.shop.vo.All_User_Tbl;
import com.dogcutie.shop.vo.Seller_Tbl;
import com.dogcutie.shop.vo.User_Tbl;

public interface RegisterService {
	//public void insertIsUser (String seller, User_Tbl user, Seller_Tbl sellertbl); //전체 유저 db에 일반유저인지, 판매자 유저인지 구분 (재원/21.02.03)
	public void addAllUser (User_Tbl user); //전체 유저 db에 일반유저인지, 판매자 유저인지 구분 (재원/21.02.03)
	public void addAllSeller (Seller_Tbl sellertbl); //전체 유저 db에 일반유저인지, 판매자 유저인지 구분 (재원/21.02.03)
	public void insertUser (User_Tbl user); //일반유저를 추가 (재원/21.02.03)
	public void insertSeller (Seller_Tbl seller); //판매자를 추가 (재원/21.02.03)
	public boolean equalId (String id); //같은 아이디가 혹시 있는지 (재원/21.02.03)
	public boolean equalEmail (String email); //같은 이메일이 있는지 확인 (재원/21.02.03)
}
