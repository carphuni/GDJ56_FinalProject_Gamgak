package com.gamgak.csk.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gamgak.csk.member.model.entity.Member;
import com.gamgak.csk.member.model.service.MailService;
import com.gamgak.csk.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class MemberController {
   private MemberService service;
   private MailService mailservice;

   @Autowired 
   public MemberController(MemberService service, MailService mailservice) {
      super();
      this.service = service;
      this.mailservice = mailservice;
   }
   
   @RequestMapping("/login")
//   @ResponseBody
   public String login(Member m, HttpSession session, Model model) {
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
   @RequestMapping("/enrollEnd")
   public String enrollEnd(Member m, Model model, HttpSession session, String emailCode) {
	   model.addAttribute("member",m);
	   log.debug("메일코드 ", session.getAttribute(emailCode)); //안오넹
	   return "csk_member/enrollAuthentication";
   }
//   @RequestMapping("/signup")
//   public ModelAndView enrollEnd(Member m, ModelAndView mv) {
//	   //받아야할 파라미터 : m, hidden으로 전달된 input emailPw
//	   log.debug("파라미터로 전달된 member : {}",m);
//	   int result=service.insertMember(m);
//	   log.debug("인서트 성공?"+result);
//	   if(result>0) {
//		   mv.addObject("msg","가입을 축하드립니다.");
//		   mv.addObject("loc","/member/info");
//	   } else {
//		   mv.addObject("msg","인증번호가 옳바르지 않습니다");
//		   mv.addObject("loc","/enrollEnd");
//	   }
//	   mv.setViewName("csk_member/msg");
//      return mv;
//   }
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
