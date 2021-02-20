package com.dogcutie.shop.service.product;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.dogcutie.shop.vo.Prod_Tbl;
import com.dogcutie.shop.vo.ProductCategoryJoin;
import com.dogcutie.shop.vo.User_Tbl;


@Service
public interface ProductBuyService {
	public List<Prod_Tbl> selectAllProd();
	public List<Prod_Tbl> selectProd(String size,String season,String color,String sorting);
	public List<Prod_Tbl> filter(String p_name);
	public Prod_Tbl getProductDetail(int p_no);
//	public boolean pushCart(int p_no,String u_id,int quantity);
//	public User_Tbl getUser(String u_id);
}
