package com.gamgak.csk.member.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gamgak.csk.member.model.entity.Member;
import com.gamgak.csk.member.model.service.MailService;
import com.gamgak.csk.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class MemberController {
   private MemberService service;
   private MailService mailservice;
   private BCryptPasswordEncoder passwordEncoder;

   @Autowired 
   public MemberController(MemberService service, MailService mailservice, BCryptPasswordEncoder passwordEncoder) {
      super();
      this.service = service;
      this.mailservice = mailservice;
      this.passwordEncoder = passwordEncoder;
   }
   
//   @RequestMapping("/login")
////   @ResponseBody
//   public String login(Member m, Model model, HttpSession session) {
//      Member loginMember=service.selectMemberById(m);
//      if(loginMember!=null&&loginMember.getMemberPassword().equals(m.getMemberPassword())) {
//         session.setAttribute("loginMember", loginMember);
//      }
//      return "redirect:/profile/";
//   }
   
   
//	@RequestMapping("/error.do")
//	public String loginFail() {
//		//인증실패 후 실행되는 메소드
//		throw new AdminAccessException("로그인실패");
//	}
//	@RequestMapping("/login")
//	public String successLogin(Model m) {
//		//인증 후 실행되는 메소드
//		Object o=SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		m.addAttribute("loginMember",(Member)o);
//		return "redirect:/profile/";
//	}

//   @RequestMapping("/login.do")
//   public String loginurl() {
//	   return "ldh_profile/profile";
//   }
   
   @RequestMapping("/enroll")
   public String enroll() {
	   return "csk_member/enrollMember";
   }
   @RequestMapping("/enroll/mailAuthEnd")
   public String mailAuthEnd(Member m, Model model, HttpServletRequest request) {
	   model.addAttribute("member",m);
	   log.debug("첫번재 이메일인증 전 {}",m);
	   return "csk_member/enrollAuthentication";
   }
   @RequestMapping("/enroll/enrollEnd")
   public ModelAndView enrollEnd(Member member, ModelAndView mv, String emailCode, HttpSession session) {
	   int result=0;
	   log.debug("코드 입력값 {}",emailCode);
	   log.debug("세션 member : {}",member);
	   String code=(String)session.getAttribute("code");
	   log.debug("코드값 {}",code);
	   String encodePassword=passwordEncoder.encode(member.getPassword());
	   member.setMemberPassword(encodePassword);
	   if(emailCode.equals(code)) {
		   result=service.insertMember(member);
	   }
	   if(result>0) {
		   mv.addObject("enrollMessage","가입을 축하드립니다.");
		   mv.setViewName("index");
	   } else {
		   mv.addObject("member",member);
		   mv.addObject("enrollMessage","회원가입에 실패했습니다. 다시 시도해주세요.");
		   mv.setViewName("csk_member/enrollAuthentication");
	   }
      return mv;
   }
   @RequestMapping("/member/myinfo")
   public String myPage() {
      return "csk_member/myInfo";
   }
   @RequestMapping("/enroll/duplicateEmail")
   @ResponseBody
   public boolean duplicateEmail(String memberEmail, HttpServletResponse response) throws IOException{
	   Member m=service.selectMemberById(Member.builder().memberEmail(memberEmail).build());
	   log.debug("이메일"+"{}"+m);
	   return m==null?false:true;
   }
   
   @RequestMapping("/enroll/duplicateNickName")
   @ResponseBody
   public boolean duplicateNickName(String memberNickName, HttpServletResponse response) throws IOException{
	   Member m=service.selectMemberByNickName(Member.builder().memberNickName(memberNickName).build());
	   log.debug("닉네임"+"{}"+m);
	   return m==null?false:true;
   }
   
   @PostMapping("/enroll/mailAuth")
   @ResponseBody
   public String mailConfirm(HttpSession session, @RequestParam("memberEmail") String memberEmail) throws Exception{
	   String code=mailservice.sendSimpleMessage(memberEmail);
	   session.setAttribute("code", code);
	   System.err.println("인증코드 : "+code);
	   return code;
   }
   
   @RequestMapping("/member/update")
   public ModelAndView updateMember(@RequestParam Map param, ModelAndView mv) {
//	   Map<String,Object> param=Map.of("memberNickName",memberNickName,"introduce",introduce,"memberAge",memberAge,"memberGender",memberGender);
	   int result = service.updateMember(param);
	   
	   if(result>0) {
		   mv.addObject("updateMessage","회원정보를 변경했습니다. 다시 로그인해 주세요.");
		   mv.setViewName("index");
	   } else {
		   mv.addObject("updateMessage","회원정보를 변경하는데 실패했습니다. 다시 시도해주세요.");
		   mv.setViewName("csk_member/myInfo");
	   }
	   System.err.println(param);
	   
	   
	   return mv;
   }

}
