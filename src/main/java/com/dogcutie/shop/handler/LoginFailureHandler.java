package com.dogcutie.shop.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;

@Service
public class LoginFailureHandler implements AuthenticationFailureHandler {

	private final String DEFAULT_FAILURE_URL ="/cutieshop/login";
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub
			String errorMessage = null;
			if(exception instanceof BadCredentialsException || exception instanceof UsernameNotFoundException) {
				errorMessage = "아이디 혹은 비밀번호가 맞지 않습니다.";
			}
			else {
				errorMessage = "알 수 없는 이유로 로그인에 실패하였습니다.";
			}
			System.out.println("여기는 오냐");
			
			request.setAttribute("errorMessage", errorMessage);
			request.getRequestDispatcher(DEFAULT_FAILURE_URL).forward(request, response);
	
	}

}
