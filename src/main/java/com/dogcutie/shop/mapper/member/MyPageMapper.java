package com.dogcutie.shop.mapper.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.dogcutie.shop.vo.All_User_Tbl;


@Repository
@Mapper
public interface MyPageMapper {
	public All_User_Tbl isRole(String id); //역할 찾기 

}
