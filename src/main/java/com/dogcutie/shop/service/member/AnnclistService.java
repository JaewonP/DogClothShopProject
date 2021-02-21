package com.dogcutie.shop.service.member;

import java.util.List;

import com.dogcutie.shop.vo.Admin_Tbl;
import com.dogcutie.shop.vo.Annc_Tbl;

public interface AnnclistService {
	public List<Annc_Tbl> selectall(); 
	public void insetAnnclist(Annc_Tbl annc);

}
