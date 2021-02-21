package com.dogcutie.shop.service.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogcutie.shop.mapper.product.RegisterProductMapper;
import com.dogcutie.shop.vo.Prod_Tbl;

import lombok.Setter;

@Service
public class RegisterProductServiceImple implements RegisterProductService{

	@Setter(onMethod_ = @Autowired)
	private RegisterProductMapper mapper;
	
	
	@Override
	public void insertProduct(Prod_Tbl prod) {
		// TODO Auto-generated method stub
		mapper.insertProduct(prod);
	}


}
