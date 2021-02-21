package com.dogcutie.shop.mapper.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.dogcutie.shop.vo.Order_Histroy_Tbl;

@Mapper
public interface ConfirmationMapper {

	public List<Order_Histroy_Tbl> orderList(String u_id);

}
