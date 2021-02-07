package com.dogcutie.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.dogcutie.shop.vo.All_User_Tbl;

public class CustomUserDetailService implements UserDetailsService{

	@Autowired
	private All_User_Tbl al;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		
		
		
		return null;
	}

}
