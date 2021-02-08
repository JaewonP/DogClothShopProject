package com.dogcutie.shop.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.dogcutie.shop.vo.All_User_Tbl_Principal;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private UserDetailsService userde;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		// TODO Auto-generated method stub
		String name = (String) authentication.getPrincipal();
		String password = authentication.getCredentials().toString();
		
		All_User_Tbl_Principal user = (All_User_Tbl_Principal) userde.loadUserByUsername(name);
		
		if(!passwordEncoder.matches(password, user.getPassword())){
			throw new BadCredentialsException(name);
		}
		
		
		
		return new UsernamePasswordAuthenticationToken(name, password, user.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return true;
	}
	
	

}
