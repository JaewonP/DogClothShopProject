package com.dogcutie.shop;

import javax.servlet.Filter;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfiguration;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	
	// 스프링 시큐리티 사용자 인증 방법 객체 	
	@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		auth.authenticationProvider(authenticationProvider());
		//auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);
	}
	
	private AuthenticationProvider authenticationProvider() {
		// TODO Auto-generated method stub
		return new CustomAuthenticationProvider();
	}

	//스프링 시큐리티 룰을 무시하게 하는 url 규칙 (여기 등록하면 규칙 적용하지 않음) 
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/css/**", "/js/**", "/img/**", "/lib/**", "/resources/**", "/vendor/**", "/favicon/**", "/img/**");
		
	}
	
	//스프링 시큐리티 규칙 
	@Override
	public void configure(HttpSecurity http) throws Exception {
		/*
		 * http.authorizeRequests()//보호된 리소스 URI에 접근 권한설정
		 * .antMatchers("/cutieshop/login").permitAll() //전체 접근 허용
		 * //.antMatchers("/logout/**").permitAll() //전체 접근 허용
		 * //.antMatchers("/myPage").hasRole("ADMIN") //admin이라는 룰을 가진 사용자만 접근 허용
		 * .anyRequest().authenticated() .and().logout() .logoutUrl("/logout")
		 * .logoutSuccessHandler(logoutSuccessHandler()) .and().csrf().disable() //보안
		 * 설정을 비활성화 해당 기능 사용을 위해서는 csrf토큰을 프론트 단에서 보내줘야 함 .cors().disable() .formLogin()
		 * .loginPage("/cutieshop/login") //.loginProcessingUrl("/dologin") //login form
		 * 에 action //.usernameParameter("id") //.passwordParameter("pw")
		 * //.successHandler(new MyLoginSuccessHandler())
		 * //.addFilter(jwtAuthenticationFilter()) //Form Login에 사용되는 custom
		 * AuthenticationFilter 구현체를 등록 //.addFilter(jwtAutorizationFilter()) //header
		 * 인증에 사용되는 BasicAuthenticationFilter 구현체를 등록 .and().exceptionHandling()
		 * .accessDeniedHandler(accessDeniedHandler())
		 * .authenticationEntryPoint(authenticationEntryPoint())
		 * .and().headers().frameOptions().disable();
		 */
	}
	
	
	
	//successHandler bean register

	
	
	private AuthenticationEntryPoint authenticationEntryPoint() {
		// TODO Auto-generated method stub
		return null;
	}

	private AccessDeniedHandler accessDeniedHandler() {
		// TODO Auto-generated method stub
		return null;
	}

	private Filter jwtAutorizationFilter() {
		// TODO Auto-generated method stub
		return null;
	}

	private Filter jwtAuthenticationFilter() {
		// TODO Auto-generated method stub
		return null;
	}

	private LogoutSuccessHandler logoutSuccessHandler() {
		// TODO Auto-generated method stub
		return null;
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
