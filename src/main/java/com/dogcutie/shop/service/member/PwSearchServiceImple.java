package com.dogcutie.shop.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.dogcutie.shop.mapper.member.PwSearchMapper;
import com.dogcutie.shop.mapper.member.RegisterMapper;
import com.dogcutie.shop.vo.All_User_Tbl;
import com.dogcutie.shop.vo.Seller_Tbl;
import com.dogcutie.shop.vo.User_Tbl;

import lombok.Setter;

@Service
public class PwSearchServiceImple implements PwSearchService{
	
	@Setter(onMethod_ = @Autowired)
	private PwSearchMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder passwordEncoder;

	@Override
	public boolean emailEx(String email) {
		// TODO Auto-generated method stub
		List<All_User_Tbl> list = mapper.emailEx(email);
		System.out.println(list.size());
		if(list.isEmpty()) {
			return false;
		}
		else {
			return true;
		}

	}

	@Override
	public void updateAllUser(String pw, String id) {
		// TODO Auto-generated method stub
		System.out.println("들어오는지?");
		System.out.println(pw);
		System.out.println(id);
		String password = passwordEncoder.encode(pw);
		System.out.println(password);
		mapper.updateAllUser(password, id);
	}

	@Override
	public void updateAllSeller(String pw, String id) {
		// TODO Auto-generated method stub
		System.out.println("들어오는지?seller");
		
		String password = passwordEncoder.encode(pw);
		System.out.println(password);
		mapper.updateAllSeller(password, id);
	}

	@Override
	public List<All_User_Tbl> emailReturn(String email) {
		// TODO Auto-generated method stub
		List<All_User_Tbl> list = mapper.emailEx(email);
		
		if(list.isEmpty()) {
			return null;
		}
		else {
			return mapper.emailEx(email);
		}
		
	
	} 
	
	
	
}
