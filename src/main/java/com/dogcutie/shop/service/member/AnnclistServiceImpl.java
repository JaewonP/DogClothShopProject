package com.dogcutie.shop.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogcutie.shop.mapper.member.AnnclistMapper;
import com.dogcutie.shop.vo.Admin_Tbl;
import com.dogcutie.shop.vo.Annc_Tbl;

import lombok.Setter;

@Service
public class AnnclistServiceImpl implements AnnclistService {

	@Setter(onMethod_ = @Autowired)
	private AnnclistMapper mapper;
	
	
	@Override
	public List<Annc_Tbl> selectall() {
		// TODO Auto-generated method stub
		return mapper.selectall();
	}


	@Override
	public void insetAnnclist(Annc_Tbl annc) {
		// TODO Auto-generated method stub
		mapper.insetAnnclist(annc);
	}



}
