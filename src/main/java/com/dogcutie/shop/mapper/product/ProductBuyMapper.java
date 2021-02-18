package com.dogcutie.shop.mapper.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.dogcutie.shop.vo.Prod_Tbl;
import com.dogcutie.shop.vo.ProductCategoryJoin;

@Mapper
public interface ProductBuyMapper {

	public List<Prod_Tbl> selectAllProd();
	public List<Prod_Tbl> selectProd(@Param("size") String size,@Param("season") String season,@Param("color") String color,@Param("sorting") String sorting);
	public Prod_Tbl getProductDetail(@Param("p_no")int p_no);
	
}
