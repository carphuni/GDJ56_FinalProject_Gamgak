package com.gamgak.csk.member.controller;

import java.io.IOException;

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
   
   @RequestMapping("/login")
//   @ResponseBody
   public String login(Member m, Model model, HttpSession session) {
      Member loginMember=service.selectMemberById(m);
      if(loginMember!=null&&loginMember.getMemberPassword().equals(m.getMemberPassword())) {
         session.setAttribute("loginMember", loginMember);
      }
      return "redirect:/profile/";
   }
   
   @RequestMapping("/enroll")
   public String enroll() {
	   return "csk_member/enrollMember";
   }
   @RequestMapping("/mailAuthEnd")
   public String mailAuthEnd(Member m, Model model, HttpServletRequest request) {
	   model.addAttribute("member",m);
	   log.debug("첫번재 이메일인증 전 {}",m);
	   return "csk_member/enrollAuthentication";
   }
   @RequestMapping("/enrollEnd")
   public ModelAndView enrollEnd(Member member, ModelAndView mv, String emailCode, HttpSession session) {
	   int result=0;
	   log.debug("코드 입력값 {}",emailCode);
	   log.debug("세션 member : {}",member);
	   String code=(String)session.getAttribute("code");
	   log.debug("코드값 {}",code);
	   
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
   @RequestMapping("/myinfo")
   public String myPage() {
      return "csk_member/myInfo";
   }
   @RequestMapping("/duplicateEmail")
   @ResponseBody
   public boolean duplicateEmail(String memberEmail, HttpServletResponse response) throws IOException{
	   Member m=service.selectMemberById(Member.builder().memberEmail(memberEmail).build());
	   log.debug("이메일"+"{}"+m);
	   return m==null?false:true;
   }
   
   @RequestMapping("/duplicateNickName")
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

}
