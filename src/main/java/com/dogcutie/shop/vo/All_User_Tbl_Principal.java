package com.dogcutie.shop.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class All_User_Tbl_Principal implements UserDetails{

	private List<All_User_Tbl> userVO;
	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		// 계정이 갖고 있는 권한 목록을 리턴한다. 
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		for(int x=0; x<userVO.size(); x++) {
			authorities.add(new SimpleGrantedAuthority(userVO.get(x).getRole_name()));
		}
		
		return authorities;
	}

	@Override
	public String getPassword() { //유저 비밀번호를 리턴한다. 
		// TODO Auto-generated method stub
		userVO.stream().forEach(s -> System.out.println(s.getPw()));
		return userVO.get(0).getPw();
	}

	@Override
	public String getUsername() { //유저 이름 혹은 아이디
		// TODO Auto-generated method stub
		userVO.stream().forEach(s -> System.out.println(s.getId()));
		return userVO.get(0).getId();
	}

	@Override
	public boolean isAccountNonExpired() { //유저 아이디 만료 (true:만료 안됨)
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() { //유저 아이디가 Lock 걸렸는지 (true:잠기지 않음)
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() { //비밀번호가 만료되었는지 (true:만료안됨)
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() { //계정이 활성화 되었는지 (true:활성화)
		// TODO Auto-generated method stub
		return true;
	}
	

}
