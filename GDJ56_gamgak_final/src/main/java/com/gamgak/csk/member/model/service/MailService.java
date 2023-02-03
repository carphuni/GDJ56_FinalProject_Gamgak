package com.gamgak.csk.member.model.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;
import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
@Service
public class MailService {
	
	@Autowired
	JavaMailSender mailSender;
	
	private String pw;
	public MimeMessage createMessage(String to) throws MessagingException, UnsupportedEncodingException {
		System.out.println("to : " + to);
		System.out.println("pw : " + pw);
		MimeMessage msg=mailSender.createMimeMessage();
		msg.addRecipients(RecipientType.TO, to);
		msg.setSubject("감각 회원가입 이메일 인증"); //이메일 제목
		String mailMsg="";
		mailMsg += "<div style='margin:100px;'>";
		mailMsg += "<h1> 안녕하세요</h1>";
		mailMsg += "<h1> 나만의 맛집찾기 : 감각 입니다.</h1>";
		mailMsg += "<br>";
		mailMsg += "<p>아래 코드를 회원가입 창으로 돌아가 입력해주세요<p>";
		mailMsg += "<br>";
		mailMsg += "<p>당신의 맛집을 저장해보세요. 감사합니다.<p>";
		mailMsg += "<br>";
		mailMsg += "<div align='center' style='border:1px solid black; font-family:verdana';>";
		mailMsg += "<h3 style='color:blue;'>회원가입 인증 코드입니다.</h3>";
		mailMsg += "<div style='font-size:130%'>";
		mailMsg += "CODE : <strong>";
		mailMsg += pw + "</strong><div><br/> "; // 메일에 인증번호 넣기
		mailMsg += "</div>";
		msg.setText(mailMsg, "utf-8", "html");// 내용, charset 타입, subtype
		// 보내는 사람의 이메일 주소, 보내는 사람 이름
		msg.setFrom(new InternetAddress("kiya7005@naver.com", "GAMGAK_ADMIN"));// 보내는 사람
		return msg;
	}
	//랜덤 인증 코드 생성
	public String createKey() {
		StringBuffer key = new StringBuffer();
		Random rnd = new Random();
		for (int i=0; i<10; i++) { // 인증코드 10자리
			int index=rnd.nextInt(3); // 0~2 까지 랜덤, rnd 값에 따라서 아래 switch 문이 실행됨
			switch (index) {
			case 0:
				key.append((char) ((int) (rnd.nextInt(26)) + 97));
				// a~z (ex. 1+97=98 => (char)98 = 'b')
				break;
			case 1:
				key.append((char) ((int) (rnd.nextInt(26)) + 65));
				// A~Z
				break;
			case 2:
				key.append((rnd.nextInt(10)));
				// 0~9
				break;
			}
		}
		return key.toString();
	}
	
	// 메일 발송
	// sendSimpleMessage 의 매개변수로 들어온 to 는 곧 이메일 주소가 되고,
	// MimeMessage 객체 안에 내가 전송할 메일의 내용을 담는다.
	// 그리고 bean 으로 등록해둔 javaMail 객체를 사용해서 이메일 send!!
	public String sendSimpleMessage(String to) throws Exception {
		pw=createKey(); // 랜덤 인증번호 생성
		MimeMessage message = createMessage(to); // 메일 발송
		try {// 예외처리
			mailSender.send(message);
		} catch (MailException e) {
			e.printStackTrace();
			throw new IllegalArgumentException();
		}
		return pw;
	}
}
