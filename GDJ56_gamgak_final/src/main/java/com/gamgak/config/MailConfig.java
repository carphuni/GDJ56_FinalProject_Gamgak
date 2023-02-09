package com.gamgak.config;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
@PropertySource("classpath:application.yml")
public class MailConfig {
	
	@Value("${spring.mail.username}")
    private String id;
    @Value("${spring.mail.password}")
    private String password;
    @Value("${spring.mail.host}")
    private String host;
    @Value("${spring.mail.port}")
    private int port;

    @Bean
    public JavaMailSender javaMailService() {
        JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();

        javaMailSender.setHost(host); // smtp 서버 주소
        javaMailSender.setUsername(id); // 설정(발신) 메일 아이디
        javaMailSender.setPassword(password); // 설정(발신) 메일 패스워드
        javaMailSender.setPort(port); //smtp port
        javaMailSender.setJavaMailProperties(getMailProperties()); // 메일 인증서버 정보 가져온다.
        javaMailSender.setDefaultEncoding("UTF-8");
        return javaMailSender;
    }

	private Properties getMailProperties() {
//		Properties prop=new Properties();
//			prop.setProperty("mail.transport.protocol", "smtp"); // 프로토콜 설정
//			//prop.setProperty("mail.smtp.protocols", "TLSv1.2");
//			prop.setProperty("mail.smtp.auth", "true");// smtp 인증
//			//prop.setProperty("mail.smtp.enable", "true");//stmp
//			prop.setProperty("mail.smtp.starttls.enable", "true"); // smtp strattles 사용
//			prop.setProperty("mail.debug", "true"); // 디버그 사용
//			prop.setProperty("mail.smtp.ssl.trust",host); // ssl 인증 서버는 smtp.naver.com
//			prop.setProperty("mail.smtp.ssl.enable","true"); // ssl 사용
		Properties prop=System.getProperties();
			prop.put("mail.stmp.host",host);
			prop.put("mail.stmp.port",port);
			prop.put("mail.stmp.auth","true");
			prop.put("mail.stmp.ssl.enable","true");
			prop.put("mail.stmp.ssl.trust",host);
	        return prop;
	}
}
