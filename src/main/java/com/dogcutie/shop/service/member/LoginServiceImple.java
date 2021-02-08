package com.dogcutie.shop.service.member;

import java.awt.FlowLayout;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.dogcutie.shop.mapper.member.LoginMapper;
import com.dogcutie.shop.vo.All_User_Tbl;
import com.dogcutie.shop.vo.All_User_Tbl_Principal;

import javax.swing.JButton;
import javax.swing.JFrame;
import java.awt.FlowLayout;

import lombok.Setter;

@Service
public class LoginServiceImple implements LoginService, UserDetailsService{

	@Autowired
	private LoginMapper mapper;
	
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		
		//최종적으로 리턴해야할 객체 => userdetail = all_user_tbl principal 
		All_User_Tbl_Principal allPrincipal = new All_User_Tbl_Principal();
		
		//DB로부터 회원정보를 가져온다. 
		List<All_User_Tbl> userAuths = mapper.findByUserId(id);
		
		if(userAuths.size() == 0) {
			throw new UsernameNotFoundException("User" + id + "Not Found!");
		}else {
			allPrincipal.setUserVO(userAuths);
			
			//사용자의 권한 select 하고 받아온 List<String>객체 주입 
		}
		
		return allPrincipal; //userDetails 클래스를 상속받은 principalVo를 리턴한다. 
	}
	

}
