package com.dogcutie.shop.service.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogcutie.shop.mapper.member.MyPageMapper;
import com.dogcutie.shop.vo.All_User_Tbl;
import com.dogcutie.shop.vo.Order_Histroy_Tbl;
import com.dogcutie.shop.vo.Prod_Tbl;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class MyPageServiceImple implements MyPageService{
	
	@Setter(onMethod_ = @Autowired)
	private MyPageMapper mapper;
	
	@Override
	public All_User_Tbl isRole(String id) {
		// TODO Auto-generated method stub
		return mapper.isRole(id);
	}

	@Override
	public List<Order_Histroy_Tbl> returnLists(String u_id) {
		// TODO Auto-generated method stub
		return mapper.returnLists(u_id);
	}

	@Override
	public List<Prod_Tbl> sellist(String s_id) {
		// TODO Auto-generated method stub;
		
		return mapper.sellist(s_id);
	}

	@Override
	public List<Prod_Tbl> hitList(String s_id) {
		// TODO Auto-generated method stub
		return mapper.hitList(s_id);
	}
	

}
