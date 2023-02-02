package com.gamgak.jjh.meeting.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gamgak.jjh.meeting.model.service.MeetingService;
import com.gamgak.jjh.meeting.model.vo.Meeting;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MeetingController {
	private MeetingService service;
	
	@Autowired
	public MeetingController(MeetingService service) {
		super();
		this.service=service;
	}
	
	@RequestMapping("/meetting/meettinglist.do")
	public ModelAndView meetingMainview(ModelAndView mv) {
		List<Meeting> mee =service.selectMeetingList();
		for(int i=0; i<mee.size();i++) {
			System.out.println(mee.get(i));
		}
		mv.addObject("meeting",mee);
		
		mv.setViewName("/jjh_meetting/meettinglist");
		return mv;
	}
	@RequestMapping("/meetting/meettingjoin.do")
	public ModelAndView meetingjoin(ModelAndView mv ,@RequestParam Map m ) {
		log.debug("테스트 {}",m);
		System.out.println("joinmeeting"+m);

		int result =service.meetingjoin(m);
		mv.addObject("msg",result>0?"모임 참여 신청 성공":"모임 참여 신청 실패");
		mv.addObject("loc","/meetting/meettinglist.do");
		mv.setViewName("/jjh_meetting/msg");
		
		return mv;
	}
	
	
	@RequestMapping("/meetting/enrollmeettingEnd.do")
	public ModelAndView meetingenrollEnd(Meeting mee,ModelAndView mv, HttpSession session, MultipartFile[] fileupload ) {
		System.out.println(mee);
		System.out.println(fileupload);
		String meeDate=mee.getMeetingDate();
		meeDate=meeDate.replace("T", " ");
		meeDate=meeDate.replace("-", "/");
		//LocalDateTime localDateTime = LocalDateTime.parse(meeDate);
		mee.setMeetingDate(meeDate);
		System.out.println(meeDate);
		
		if(mee.getMeetingGender()=="M") {
			mee.setMeetingGender("남자");
		}else if(mee.getMeetingGender()=="F") {
			mee.setMeetingGender("여자");
		}else {
			
		}
		
		mee.setMeetingGender(meeDate);
		
		//파일업로드하기
		 // 저장위치가져오기
		String path=session.getServletContext().getRealPath("/resources/upload/meeting/");
		//폴더있는지 확인하고 폴더를 생성해주기
		File dir= new File(path);
		if(!dir.exists()) dir.mkdir();
		List<Meeting> files=new ArrayList<>();
		for(MultipartFile f : fileupload) {
			//리네임 규칙을 생성하기
			if(!f.isEmpty()) {
				//전송된 파일이 있다면 
				//파일 리네임처리 직접하기
				String originalFileName=f.getOriginalFilename();
				String ext=originalFileName.substring(originalFileName.lastIndexOf("."));
				//중복되지않는 이름 설정하는 값 지정하기
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rnd=(int)(Math.random()*10000)+1;
				String renameFile=sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
				
				//파일 업로드하기
				try {
					//MultipartFile클래스가 제공해주는 메소드 이용해서 저장처리
					
					f.transferTo(new File(path+renameFile));
					mee.setMeetingOriname(f.getOriginalFilename());
					mee.setMeetingRename(renameFile);
					
//					files.add(Meeting.builder()
//							.meetingOriname(f.getOriginalFilename())
//							.meetingRename(renameFile).build());
					
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
			}
		int result =service.insertMeeting(mee);
		System.out.println("insert data : "+mee);
		mv.addObject("msg",result>0?"모임 생성 성공":"모임 생성 실패");
		mv.addObject("loc","/meetting/meettinglist.do");
		mv.setViewName("/jjh_meetting/msg");
		
		//mv.setViewName("redirect:/meetting/meettinglist.do");
		return mv;
			
		}
		
		
		
		
	
	
	@RequestMapping("/meetting/meettingenroll.do")
	public ModelAndView meetingEnroll(ModelAndView mv) {
		mv.setViewName("/jjh_meetting/meettingEnroll");
		return mv;
	}
	
	@RequestMapping("/meetting/meettingmanage.do")
	public ModelAndView meetingManage(ModelAndView mv) {
		mv.setViewName("/jjh_meetting/meettingmanage");
		return mv;
	}
	
	@RequestMapping("/meetting/invitemeetting.do")
	public ModelAndView meetingInvite(ModelAndView mv) {
		mv.setViewName("/jjh_meetting/meettinginvite");
		return mv;
	}
	@RequestMapping("/meetting/updatemeetting.do")
	public ModelAndView meetingUpdate(ModelAndView mv) {
		mv.setViewName("/jjh_meetting/meettingUpdate");
		return mv;
	}
	
	@RequestMapping("/meetting/meettingchat.do")
	public ModelAndView meetingCaht(ModelAndView mv, HttpSession session) {
		mv.setViewName("/jjh_meetting/chattingroom");
		mv.addObject("loginMember", session.getAttribute("loginMember"));
		System.out.println("JJH_controller "+session.getAttribute("loginMember"));
		return mv;
	}

}
