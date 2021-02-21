package com.dogcutie.shop.mapper.product;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.dogcutie.shop.vo.Prod_Tbl;

@Repository
@Mapper
public interface RegisterProductMapper {

	public void insertProduct(Prod_Tbl prod);
}
