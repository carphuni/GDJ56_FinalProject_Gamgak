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
//				.loginPage("/login")
				.loginProcessingUrl("/login.do")
//				.successForwardUrl("/profile/") //얘는 주소를 바꿔주지는 않고 로그인시 연결된 주소와 매핑이되서 profile로만 연결 -> 성공시 찍히는 주소 /login.do
				.defaultSuccessUrl("/profile/") //애는 매핑 주소와 로그이닛 연결된 주소와 연결 -> 성공시 찍히는 주소 /profile/
				.and()
			.authorizeHttpRequests()
				//간보기패킷 cors에러여부를 확인하는 패킷
				.requestMatchers(CorsUtils::isPreFlightRequest).permitAll()
				.antMatchers("/","/resources/**","/enroll/**").permitAll()
				.antMatchers("/login").permitAll()
				.antMatchers("/profile/").permitAll()
				.antMatchers("/admin/**").hasAnyAuthority("ADMIN")
				.anyRequest().hasAnyAuthority("USER","ADMIN")
				.and()
			.logout()
				.logoutUrl("/logout.do")
				.and()
			.authenticationProvider(provider)
			.build();

	}
	
}
