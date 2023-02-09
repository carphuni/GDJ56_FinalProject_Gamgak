package com.gamgak.jjh.meeting.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.hibernate.annotations.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default;
import com.gamgak.csk.member.model.entity.Member;
import com.gamgak.jjh.meeting.model.service.MeetingService;
import com.gamgak.jjh.meeting.model.vo.EnterChat;
import com.gamgak.jjh.meeting.model.vo.Meeting;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MeetingController {
	private MeetingService service;
	private final HttpSession httpSession;
	
	@Autowired
	public MeetingController(MeetingService service,HttpSession httpSession) {
		super();
		this.service=service;
		this.httpSession=httpSession;
	}
	
	@RequestMapping("/meetting/meettinglist.do")
	public ModelAndView meetingMainview(ModelAndView mv) {
		
		int memberNo =((Member)httpSession.getAttribute("loginMember")).getMemberNo();
		List<Map> logmee=service.selectLoginUserMeetingList(memberNo);
		for(int i=0; i<logmee.size();i++) {
			System.out.println("joinmeetinglist"+logmee.get(i));
		}
		mv.addObject("joinmeetinglist", logmee);
		System.out.println(memberNo);
		List<Meeting> mee =service.selectMeetingList();
		for(int i=0; i<mee.size();i++) {
			System.out.println("전체모임리스트"+mee.get(i));
		}
		mv.addObject("meeting",mee);
		
		
		mv.setViewName("/jjh_meetting/meettinglist");
		return mv;
	}
	//tk
	@RequestMapping("/meetting/meettingjoin.do")
	public ModelAndView meetingjoin(ModelAndView mv ,@RequestParam Map m ) {
		
		int result=0;
		EnterChat enter=service.SelctenterchatList(m);
		System.out.println("enterchat에 넘어가는 정보"+m);
		System.out.println("enter 값 "+enter);
		if(enter==null) {
			result =service.meetingjoin(m);
			mv.addObject("msg",result>0?"모임 참여 신청 성공":"모임 참여 신청 실패");
			mv.addObject("loc","/meetting/meettinglist.do");
			mv.setViewName("/jjh_meetting/msg");
		}
		else if(enter.getMeetingYN().equals("Y")) {
			mv.addObject("msg","이미 참여된 모임입니다.");
			mv.addObject("loc","/meetting/meettinglist.do");
			mv.setViewName("/jjh_meetting/msg");
		}
		else if(enter.getMeetingYN().equals("S")) {
			mv.addObject("msg","참여신청 대기중인 모임입니다.");
			mv.addObject("loc","/meetting/meettinglist.do");
			mv.setViewName("/jjh_meetting/msg");
		}
		else if(enter.getMeetingYN().equals("N")) {
			mv.addObject("msg","이용하지 못하는 모임입니다.");
			mv.addObject("loc","/meetting/meettinglist.do");
			mv.setViewName("/jjh_meetting/msg");
		}
		else if(enter.getMeetingYN().equals("NN")) {
			mv.addObject("msg","이미 나간 모임이라서 다시 참가할 수 없습니다.");
			mv.addObject("loc","/meetting/meettinglist.do");
			mv.setViewName("/jjh_meetting/msg");
		}
		
		
		//int result =service.meetingjoin(m);
		//mv.addObject("msg",result>0?"모임 참여 신청 성공":"모임 참여 신청 실패");
		//mv.addObject("loc","/meetting/meettinglist.do");
		//mv.setViewName("/jjh_meetting/msg");
		
		return mv;
	}
	
	//모임등록
	@RequestMapping("/meetting/enrollmeettingEnd.do")
	public ModelAndView meetingenrollEnd(Map m,Meeting mee,ModelAndView mv, HttpSession session, MultipartFile[] fileupload ) {
		
		
		System.out.println(mee);
		System.out.println(fileupload);
		String meeDate=mee.getMeetingDate();
		meeDate=meeDate.replace("T", " ");
		meeDate=meeDate.replace("-", "/");
		//LocalDateTime localDateTime = LocalDateTime.parse(meeDate);
		mee.setMeetingDate(meeDate);
		System.out.println(meeDate);
		
//		
		
		//mee.setMeetingGender(meeDate);
		
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
		System.out.println("insert 전 데이터"+mee);
		int result =service.insertMeeting(mee);
		System.out.println("insert data : "+mee);
		mv.addObject("msg",result>0?"모임 생성 성공":"모임 생성 실패");
		mv.addObject("loc","/meetting/meettinglist.do");
		mv.setViewName("/jjh_meetting/msg");
		
		//int result=service.meetingCnt(m);
		
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
	//모임 정보 수정 화면
	@RequestMapping("/meetting/updatemeetting.do")
	public ModelAndView meetingUpdate(ModelAndView mv, @RequestParam Map m){
		System.out.println(m);
		Meeting mee =service.selectMeeting(m);
		System.out.println("수정데이터 : "+mee);
		mv.addObject("updateList",mee);
		mv.setViewName("/jjh_meetting/meettingUpdate");
		return mv;
	}
//	모임 정보 수정 기능
	@RequestMapping("/meetting/updatemeetingEnd.do")
	public ModelAndView updatemeetingEnd(HttpSession session, Map<String,Integer> m,ModelAndView mv,Meeting mee,MultipartFile[] fileupload) {
		m.put("meetingNo", mee.getMeetingNo());
		System.out.println("모임정보"+mee.getMeetingNo());
		m.put("memberNo", mee.getMemberLeaderNo());
		System.out.println("리더정보"+mee.getMemberLeaderNo());
		Meeting beforemee =service.selectMeeting(m);
		//파일업로드하기
		 // 저장위치가져오기
		String path=session.getServletContext().getRealPath("/resources/upload/meeting/");
		//폴더있는지 확인하고 폴더를 생성해주기
		File dir= new File(path);
		for(MultipartFile f : fileupload) {
			if(f.getOriginalFilename().equals("")) {
				System.out.println("공백");
				mee.setMeetingOriname(beforemee.getMeetingOriname());
				mee.setMeetingRename(beforemee.getMeetingRename());
			}else {
				f.getOriginalFilename();
				System.out.println("파일이름"+f.getOriginalFilename());
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
					//mee.setMeetingOriname(beforemee.getMeetingOriname());
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
		//if(beforemee.getMeetingOriname())
		System.out.println("before"+beforemee);
		System.out.println("수정전 데이터 : "+mee);
		for(int i=0; i<fileupload.length;i++) {
			System.out.println("파일 반복문"+fileupload[i]);
		}
		System.out.println("수정할 사진 파일 데이터"+fileupload);
		System.out.println("update data : "+mee);
		
		int result =service.updateMeeting(mee);
		
		mv.addObject("msg",result>0?"모임 수정 성공":"모임 수정 실패");
		mv.addObject("loc","/meetting/meettinglist.do");
		mv.setViewName("/jjh_meetting/msg");
		
		return mv;
	}
	
	//채팅방정보
	@RequestMapping("/meetting/meettingchat.do")
	public ModelAndView meetingCaht(ModelAndView mv, HttpSession session,@RequestParam Map m) {
		
		System.out.println("채팅방으로 넘어온 정보"+m);
		List<Map> chatinfo=service.selectChattingRoomInfo(m);
		for(int i=0 ;i<chatinfo.size();i++) {
			System.out.println("채팅방 정보"+chatinfo.get(i));
		}
		List<Map> chatmemberlist= service.selectchatmemberlist(m);
		for(int i=0 ;i<chatmemberlist.size();i++) {
			System.out.println("채팅방 유저리스트"+chatmemberlist.get(i));
		}
		mv.addObject("chatmemberlist",chatmemberlist);
		mv.addObject("chatRoominfo", chatinfo);
		mv.setViewName("/jjh_meetting/chattingroom");
		mv.addObject("loginMember", session.getAttribute("loginMember"));
		System.out.println("JJH_controller "+session.getAttribute("loginMember"));
		return mv;
	}
	//모임장이 모임 신청수락
	@RequestMapping("/meetting/meettingjoinEndY.do")
	@ResponseBody
	public ModelAndView meettingjoinEndY(ModelAndView mv, @RequestParam Map<String,Object> m) {
		System.out.println("신청자 번호랑 모인번호"+m);
		int result=service.updateMeetingy(m);
		//mv.addObject("updateMeetingy",result);
		//int result=service.meettingjoinEnd(m);
		mv.addObject("msg",result>0?"모임신청 수락":"모임신청 실패");
		mv.addObject("loc","/meetting/meettinglist.do");
		mv.setViewName("/jjh_meetting/signuplist");
		//mv.setViewName("jsonView");
		
		return mv;
	}
	//모임장이 모임 신청거절
		@RequestMapping("/meetting/meettingjoinEndN.do")
		public ModelAndView meettingjoinEndN(ModelAndView mv, @RequestParam Map<String,Object> m) {
			System.out.println("신청자 번호랑 모인번호"+m);
			int result=service.updateMeetingn(m);
			mv.addObject("updateMeetingN",result);
			//int result=service.meettingjoinEnd(m);
//			mv.addObject("msg",result>0?"모임신청 거절":"모임신청 거절실패");
//			mv.addObject("loc","/meetting/meettinglist.do");
//			mv.setViewName("/jjh_meetting/msg");
			
			return mv;
		}

}
