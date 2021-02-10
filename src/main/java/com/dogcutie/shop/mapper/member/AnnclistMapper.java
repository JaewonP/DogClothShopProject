package com.dogcutie.shop.mapper.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.dogcutie.shop.vo.Admin_Tbl;

@Repository
@Mapper
public interface AnnclistMapper {

	public List<Admin_Tbl> selectall(); 
}
