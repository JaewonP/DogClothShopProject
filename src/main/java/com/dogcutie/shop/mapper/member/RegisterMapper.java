package com.dogcutie.shop.mapper.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.dogcutie.shop.vo.All_User_Tbl;
import com.dogcutie.shop.vo.Seller_Tbl;
import com.dogcutie.shop.vo.User_Tbl;

@Repository
@Mapper
public interface RegisterMapper {
	
	public void addAllUser (User_Tbl user); //전체 유저 db에 일반유저인지, 판매자 유저인지 구분 (재원/21.02.03)
	public void addAllSeller (Seller_Tbl sellertbl); //전체 유저 db에 일반유저인지, 판매자 유저인지 구분 (재원/21.02.03)
	public void insertUser (User_Tbl user); //일반유저를 추가 (재원/21.02.03)
	public void insertSeller (Seller_Tbl seller); //판매자를 추가 (재원/21.02.03)
	public List<All_User_Tbl> equalId (String id); //같은 아이디가 혹시 있는지 (재원/21.02.03)
	public List<All_User_Tbl> equalEmail (String email); //같은 이메일이 있는지 확인 (재원/21.02.03)
}
