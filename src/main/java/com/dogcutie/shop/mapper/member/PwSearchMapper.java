package com.dogcutie.shop.mapper.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.dogcutie.shop.vo.All_User_Tbl;
import com.dogcutie.shop.vo.Seller_Tbl;
import com.dogcutie.shop.vo.User_Tbl;

@Repository
@Mapper
public interface PwSearchMapper {
	
	public List<All_User_Tbl> emailEx(String email); //전체 유저 db에서 이메일 확인 
	public void updateAllUser (String pw, String id); //전체 유저 db에 일반유저인지, 판매자 유저인지 구분 (재원/21.02.03)
	public void updateAllSeller (String pw, String id); //전체 유저 db에 일반유저인지, 판매자 유저인지 구분 (재원/21.02.03)
	//join으로 여러개 업데이트 
}
