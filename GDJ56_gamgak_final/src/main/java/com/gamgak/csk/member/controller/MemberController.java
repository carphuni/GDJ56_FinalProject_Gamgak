package com.gamgak.csk.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gamgak.csk.member.model.entity.Member;
import com.gamgak.csk.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;
//@SessionAttributes({"loginMember"})
@Slf4j
@Controller
public class MemberController {
   private MemberService service;

   @Autowired 
   public MemberController(MemberService service) {
      super();
      this.service = service;
   }
   
   @RequestMapping("/login")
//   @ResponseBody
   public String login(Member m, HttpSession session, Model model) {
      Member loginMember=service.selectMemberById(m);
      if(loginMember!=null&&loginMember.getMemberPassword().equals(m.getMemberPassword())) {
         session.setAttribute("loginMember", loginMember);
      }
      return "redirect:/profile";
   }
   
   @RequestMapping("/enroll")
   public String enroll() {
      return "csk_member/enrollMember";
   }
   @RequestMapping("enrollEnd")
   public String enrollEnd() {
      return "csk_member/enrollAuthentication";
   }
   @RequestMapping("myinfo")
   public String myPage() {
      return "csk_member/myInfo";
   }

}
