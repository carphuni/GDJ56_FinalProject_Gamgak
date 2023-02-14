package com.gamgak.csk.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	//로그인 멤버의 멤버번호 가져오는 메소드
	private Member getMember() {
		Object principal=SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Member user=(Member)principal;
		return user;
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
		   SecurityContextHolder.getContext().setAuthentication(null); //로그인 세션 날리기
		   mv.setViewName("index");
	   } else {
		   mv.setViewName("csk_member/myInfo");
	   }
	   System.err.println(param);
	   
	   
	   return mv;
   }
   
   @RequestMapping("/findPasswordEmail")
   public String sendPwEmail(){
       
       return "csk_member/findPassword";
   }
   
	 @RequestMapping("/sendPasswordEmail")
	 public String sendPasswordEmail(@RequestParam("memberEmail") String memberEmail, Member member) throws Exception{
		   member=service.selectMemberByEmail(memberEmail);
		   log.debug("이메일찾은 m {}",member);
		   String passwordCode=mailservice.sendPasswordEmail(memberEmail);
		   System.err.println("인증코드 : "+passwordCode);
		   log.debug("임시비밀번호 m {}",member);
		   member.setMemberPassword(passwordCode);
		   int result=service.updatePassword(member);
		   String encodePassword=passwordEncoder.encode(member.getPassword());
		   member.setMemberPassword(encodePassword);
		   result=service.updatePassword(member);
		   log.debug("시큐리티 임시비밀번호 m {}",member);
		   return "redirect:/";
	 }
	 
	   @RequestMapping("/member/passwordUpdate")
	   public String updatepassword(){
	       return "csk_member/updatePassword";
	   }
	   
	   @RequestMapping("/member/checkPassword")
	   @ResponseBody
	   public boolean checkPassword(String memberPassword, Member member) {
		   String pw=service.checkPassword(getMember().getMemberNo());
		   log.debug("memberPassword : {}",memberPassword); 
		   log.debug("인코딩된 : {}",pw); 
		   log.debug("기존pw 체크 로그인 멤버 {}",getMember());
		   log.debug("memberPassword 인코딩 비교 {}",passwordEncoder.matches(memberPassword,pw));
			if(getMember()==null || !passwordEncoder.matches(memberPassword,pw)) {
				return false;
			}
			return true;
	   }
	  
	   @RequestMapping("/member/updateNewPw")
	   public ModelAndView updateNewPassword(@RequestParam("memberNewPassword") String memberNewPassword, Member member, ModelAndView mv) {
		   log.debug("memberNewPassword: {}",memberNewPassword);
		   String newPassword=passwordEncoder.encode(memberNewPassword);
		   member=getMember();
		   member.setMemberPassword(newPassword);
		   int result=service.updatePassword(member);
		   if(result>0) {
			   log.debug("비밀번호 변경 시 로그인 멤버 {}",member);
			   SecurityContextHolder.getContext().setAuthentication(null); //로그인 세션 날리기
			   mv.setViewName("index");
		   } else {
			   mv.setViewName("csk_member/updatePassword");
		   }
		   return mv;
	   }
	   
	   //프로필 이미지 업로드(update)
	   @RequestMapping("/member/changeProfileImg")
	   @ResponseBody
	   public Map changeProfileImg(HttpSession session, Map param , @RequestParam("profileOriName") MultipartFile file) {
		   int memberNo=getMember().getMemberNo();
		   param.put("memberNo", memberNo);
		   String path=session.getServletContext().getRealPath("/resources/upload/profileImg/");
		   File dir=new File(path);
		   if(!dir.exists()) dir.mkdirs();
		   
		   String profileReName=service.selectFileReName(memberNo);
		   String profileOriName="";
		   if(!profileReName.equals("없음")) {
			   //삭제하는 구문
			   File f=new File(path+profileReName);
				System.out.println(file);
				if(f.exists()) {
					f.delete();
				}
		   }
		   
			//업로드 후 파일 담을 리스트
			if(!file.isEmpty()) {
				profileOriName=file.getOriginalFilename();
				String ext = profileOriName.substring(profileOriName.lastIndexOf("."));
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rnd=(int)(Math.random()*10000)+1;
				profileReName=sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
				
				try {
					file.transferTo(new File(path+profileReName));
					param.put("profileOriName", profileOriName);
					param.put("profileReName", profileReName);
					log.debug("map {}",param);
					
					
					
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			int result=service.updateProfileImg(param);
			String msg="";
			if(result>0) {
				msg="프로필 사진을 변경했습니다.";
				getMember().setProfileOriName(profileOriName);
				getMember().setProfileReName(profileReName);
			}
				
			else msg="프로필 사진 변경을 실패했습니다.";
			Map data=Map.of("msg",msg,"profileReName",profileReName);
		   return data;
	   }
	   
	   @RequestMapping("/member/deleteProfileImg")
	   @ResponseBody
	   public String deleteProfileImg(HttpSession session, Map param) {
		   int memberNo=getMember().getMemberNo();
		   param.put("memberNo", memberNo); //1. 로그인한 멤버 pk 찾기
		   String path=session.getServletContext().getRealPath("/resources/upload/profileImg/");
		   
		   String profileReName=service.selectFileReName(memberNo); //pk의 프로필 이미지를 변수에 저장 -> delete
		   
		   
		   
		   File file=new File(path+profileReName);
		   if(file.exists()) {
			   file.delete(); //서버에서 파일 지우기 -> db에서 파일 지우고 -> '없음' 으로 업데이트!
		   }
		   
		   profileReName="없음";
		   param.put("profileReName", profileReName);
		   System.err.println("param" + param);
		   
		   
		   int result=service.resetProfileImg(memberNo);//dB에서 파일 지우기
		   System.err.println("db에서 파일 지우고난 후 result : " + result);
		   
			if(result>0) {
				getMember().setProfileOriName("없음");
				getMember().setProfileReName("없음");
				return "프로필 이미지를 초기화했습니다";
			}else{
				return "프로필 이미지 초기화에 실패했습니다";
			}
		   
	   
	   }

}
