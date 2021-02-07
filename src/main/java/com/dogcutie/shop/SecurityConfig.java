package com.dogcutie.shop;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfiguration;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	@Override
	protected void configure(AuthenticationManagerBuilder auth) {
		//실제 인증을 진행할 Provider. DB로부터 아이디, 비번이 맞는지 해당 유저가 어떤 권한을 가지는지 체크한다. 
		//UserDetailsService 인터페이스를 상속받은 클래스가 있다면 그 클래스에서 인증을 시도하면됨.
	
	}
	
	
	private AuthenticationProvider authenticationProvider() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/css/**", "/js/**", "/img/**", "/lib/**", "/resources/**", "/vendor/**", "/favicon/**", "/img/**");
		//해당 파일들의 접근을 가능케 하거나 무시하게 한다. 
	}
	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		//Http 관련 보안 설정. URL별 권한설정, 로그인, 세션 등등 
	}
}
