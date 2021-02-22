package com.dogcutie.shop.config;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.dogcutie.shop.handler.LoginFailureHandler;
import com.dogcutie.shop.handler.LoginSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	
	@Autowired
	private CustomAuthenticationProvider authProvider;
	
	@Autowired
	private LoginSuccessHandler loginSuccessHandler;
	
	@Autowired
	private LoginFailureHandler loginFailureHandler;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception{
		//실제 인증을 진행할 Provider. DB로부터 아이디, 비번이 맞는지 해당 유저가 어떤 권한을 가지는지 체크한다. 
		//UserDetailsService 인터페이스를 상속받은 클래스가 있다면 그 클래스에서 인증을 시도하면됨.
		auth.authenticationProvider(authProvider);
	}



	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/css/**", "/js/**", "/img/**", "/lib/**", "/resources/**", "/vendor/**", "/favicon/**", "/img/**");
		//해당 파일들의 접근을 가능케 하거나 무시하게 한다. 
	}
	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		//Http 관련 보안 설정. URL별 권한설정, 로그인, 세션 등등 
		http
			.csrf().disable()
			.authorizeRequests()
			 .antMatchers("/cutieshop/login","/cutieshop/register","/cutieshop/register_seller","/cutieshop/isIdOk","/cutieshop/isEmailOk", "/cutieshop/isEmail","/cutieshop/pwsearch","/cutieshop/pwchange/**",
					 "/cutieshop/index","/cutieshop/headerAjax","/loginProcess","/cutieshop/productList", "/cutieshop/product/**", "/cutieshop/FAQ").permitAll()
			 .antMatchers("/cutieshop/mypage").hasAnyAuthority("USER", "SELLER")
			 .antMatchers("/cutieshop/user/**", "/cutieshop/cart", "/cutieshop/confirmation").hasAuthority("USER")
			 .antMatchers("/cutieshop/seller/**").hasAuthority("SELLER")
			 .antMatchers("/cutieshop/admin/**").hasAuthority("ADMIN")
			 .anyRequest().authenticated()
			.and().formLogin()
				.loginPage("/cutieshop/login")
				.loginProcessingUrl("/loginProcess")
				.usernameParameter("id")
				.passwordParameter("pw")
				.failureHandler(loginFailureHandler)
				.successHandler(loginSuccessHandler)
			.and().logout()
				.logoutUrl("/logoutProcess")
				.logoutSuccessUrl("/cutieshop/login")
				.invalidateHttpSession(true)
			.and().exceptionHandling()
				.accessDeniedPage("/cutieshop/accessDenied"); //접근금지 페이지 만들 것 (재원/21.02.09)

	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
