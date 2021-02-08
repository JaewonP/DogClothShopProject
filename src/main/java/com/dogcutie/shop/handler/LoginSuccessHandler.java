package com.dogcutie.shop.handler;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Service;

@Service
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		//IP, 세션 ID
		WebAuthenticationDetails web = (WebAuthenticationDetails) authentication.getDetails();
		
		System.out.println("IP :" + web.getRemoteAddress());
		System.out.println("Session ID : " + web.getSessionId());
		
		//인증 ID 
		System.out.println("name : " + authentication.getName());
		
		//권한 리스트 
		String auth = "";
		List<GrantedAuthority> authlist = (List<GrantedAuthority>) authentication.getAuthorities();
		System.out.println("권한 : ");
		
		for(int i =0; i<authlist.size(); i++) {
			System.out.println(authlist.get(i).getAuthority() + " ");
			auth = authlist.get(i).getAuthority();
			
		}
		
		if(auth.equals("USER") || auth.equals("SELLER")) {
			response.sendRedirect("/cutieshop/index");
		}
		else if(auth.equals("ADMIN")){
			response.sendRedirect("/cutieshop/index");
		}
		else {
			clearAuthenticationAttributes(request);
			response.sendRedirect("/cutieshop/login");
		}
	}
	
	protected void clearAuthenticationAttributes(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		if(session == null) return;
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}

}
