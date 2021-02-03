package com.dogcutie.shop.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dogcutie.shop.mapper.member.RegisterMapper;
import com.dogcutie.shop.vo.All_User_Tbl;
import com.dogcutie.shop.vo.Seller_Tbl;
import com.dogcutie.shop.vo.User_Tbl;

import lombok.Setter;

@Service
public class RegisterServiceImple implements RegisterService {

	@Setter(onMethod_ = @Autowired)
	private RegisterMapper mapper;
	
	


	@Override
	public void insertUser(User_Tbl user) {
		// TODO Auto-generated method stub
		
		mapper.insertUser(user);
		
		
	}

	@Override
	public void insertSeller(Seller_Tbl seller) {
		// TODO Auto-generated method stub
		mapper.insertSeller(seller);
	}

	@Override
	public boolean equalId(String id) {
		// TODO Auto-generated method stub
		List<All_User_Tbl> list = mapper.equalId(id);
		if(list.isEmpty()) {
			return true;
		}
		else {
			return false;
		}
		
	}

	@Override
	public boolean equalEmail(String email) {
		// TODO Auto-generated method stub
		List<All_User_Tbl> list = mapper.equalEmail(email);
		if(list.isEmpty()) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public void addAllUser(User_Tbl user) {
		// TODO Auto-generated method stub
		mapper.addAllUser(user);
	}

	@Override
	public void addAllSeller(Seller_Tbl sellertbl) {
		// TODO Auto-generated method stub
		mapper.addAllSeller(sellertbl);
	}




	
}
