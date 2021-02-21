package com.dogcutie.shop.mapper.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.dogcutie.shop.vo.Admin_Tbl;
import com.dogcutie.shop.vo.Annc_Tbl;

@Repository
@Mapper
public interface AnnclistMapper {

	public List<Annc_Tbl> selectall(); //질문답변 전체
	public void insetAnnclist(Annc_Tbl annc);
}
