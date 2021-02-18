package com.dogcutie.shop.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dogcutie.shop.mapper.member.UserUpdateMapper;
import com.dogcutie.shop.vo.Seller_Tbl;
import com.dogcutie.shop.vo.User_Tbl;

import lombok.Setter;

@Service
public class UserUpdateServiceImpl implements UserUpdateService {

	
	@Setter(onMethod_ = @Autowired)
	private UserUpdateMapper mapper;
	
	@Override
	public User_Tbl getAccount(String u_id) {
		// TODO Auto-generated method stub
		return mapper.getAccount(u_id);
	}

	@Override
	public Seller_Tbl getSellerAccount(String u_id) {
		// TODO Auto-generated method stub
		return mapper.getSellerAccount(u_id);
	}

	@Override
	public void updateUser(User_Tbl user) {
		// TODO Auto-generated method stub
		mapper.updateUser(user);
	}

	@Override
	public void updateSeller(Seller_Tbl seller) {
		// TODO Auto-generated method stub
		mapper.updateSeller(seller);
	}



}
