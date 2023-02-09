package com.gamgak.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsUtils;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	private Provider provider;

	@Autowired
	public SecurityConfig(Provider provider) {
		super();
		this.provider = provider;
	}
	
	@Bean
	public SecurityFilterChain authenticationPath(HttpSecurity http) throws Exception {
		return http.csrf().disable() //CSRF 공격에 대한 방어 해제
			.formLogin()
				.usernameParameter("memberEmail")
				.passwordParameter("memberPassword")
				.loginPage("/login")
				.loginProcessingUrl("/login.do")
				.successForwardUrl("/profile/")
				//.defaultSuccessUrl("/profile/")
				.and()
			.authorizeHttpRequests()
				//간보기패킷 cors에러여부를 확인하는 패킷
				.requestMatchers(CorsUtils::isPreFlightRequest).permitAll()
				.antMatchers("/","/resources/**","/enroll/**").permitAll()
				//.antMatchers("/login.do").permitAll()
				.antMatchers("/profile/").hasAnyAuthority("USER")
				.antMatchers("/admin/**").hasAnyAuthority("ADMIN")
				.and()
			.logout()
				.logoutUrl("/logout.do")
				.and()
			.authenticationProvider(provider)
			.build();

	}
	
}
