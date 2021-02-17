package com.dogcutie.shop.mapper.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.dogcutie.shop.vo.All_User_Tbl;
import com.dogcutie.shop.vo.Order_Histroy_Tbl;
import com.dogcutie.shop.vo.Prod_Tbl;
import com.dogcutie.shop.vo.Return_Tbl;


@Repository
@Mapper
public interface MyPageMapper {
	public All_User_Tbl isRole(String id); //역할 찾기 
	public List<Order_Histroy_Tbl> returnLists(String u_id); //구매상품 리스트 확인

}
