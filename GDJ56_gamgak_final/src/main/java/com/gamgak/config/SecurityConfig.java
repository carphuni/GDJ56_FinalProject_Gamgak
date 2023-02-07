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
	public SecurityFilterChain authenticationPath(HttpSecurity security) throws Exception {
		return security.csrf().disable()
				.formLogin()
					.successForwardUrl("/loginsuccess")
					.and()
				.authorizeHttpRequests()
					//간보기패킷 cors에러여부를 확인하는 패킷
					.requestMatchers(CorsUtils::isPreFlightRequest).permitAll()
					.antMatchers("/resources/**").permitAll()
					.antMatchers("/").permitAll()
					.antMatchers("/logout").permitAll()
					.antMatchers("/**").hasAnyAuthority("USER")
					.and()
				.logout()
					.logoutUrl("/logout")
					.and()
				.authenticationProvider(provider)
				.build();
	}
	
}
