package com.gamgak.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {

	@Bean
	public JavaMailSender MailService() {
		JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
		javaMailSender.setHost("smtp.naver.com");
		javaMailSender.setUsername("kiya7005@naver.com");
		javaMailSender.setPassword("HZ438NYYJ4LZ");
		javaMailSender.setPort(465);
		javaMailSender.setJavaMailProperties(getMailProperties());
		javaMailSender.setDefaultEncoding("utf-8");
		return javaMailSender;
	}
	private Properties getMailProperties() {
		Properties prop=new Properties();
			prop.setProperty("mail.transport.protocol", "smtp"); // 프로토콜 설정
			prop.setProperty("mail.smtp.auth", "true"); // smtp 인증
			prop.setProperty("mail.smtp.starttls.enable", "true"); // smtp strattles 사용
			prop.setProperty("mail.debug", "true"); // 디버그 사용
			prop.setProperty("mail.smtp.ssl.trust","smtp.naver.com"); // ssl 인증 서버는 smtp.naver.com
			prop.setProperty("mail.smtp.ssl.enable","true"); // ssl 사용
	        return prop;
	}
}
