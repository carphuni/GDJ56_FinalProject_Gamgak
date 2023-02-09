package com.gamgak.ldh.profile.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gamgak.csk.member.model.entity.Member;
import com.gamgak.jjh.meeting.model.vo.Meeting;
import com.gamgak.ldh.profile.model.service.ProfileService;
import com.gamgak.ldh.profile.model.vo.MyPic;
import com.gamgak.ldh.profile.model.vo.MyRes;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/profile")
public class ProfileController {

	private ProfileService service;
	private final HttpSession httpSession;

	@Autowired
	public ProfileController(ProfileService service, HttpSession httpSession) {
		super();
		this.service = service;
		this.httpSession = httpSession;
	}


	//프로필 화면
	@RequestMapping("/")
	public ModelAndView profile(ModelAndView mv) {
		//Session에 저장된 회원 pk 가져오기
		int memberNo=((Member)httpSession.getAttribute("loginMember")).getMemberNo();
		//저장한 맛집 카운트 가져오기
		mv.addObject("myResCount", service.selectMyResCount(memberNo));
		//친구 카운트 가져오기
		mv.addObject("friendCount", service.selectFriendCount(memberNo));
		//모임 카운트 가져오기
		mv.addObject("meetingCount", service.selectMeetingCount(memberNo));
		
		//페이지 관련 변수 선언
		int cPage=1;
		int numPerpage=8;
		//내 맛집 조회
		mv.addObject("myResList", service.selectMyResAll(Map.of("memberNo",memberNo,"cPage",cPage,"numPerpage",numPerpage)));
		
		//로그인한 모임 정보 가져오기-jjh
		mv.addObject("meetinginfo",service.selectMeetingInfo(memberNo));
		List<Meeting> mee =service.selectMeetingInfo(memberNo);
		System.out.println(mee);
		
		//프로필 화면 jsp
   	 	mv.setViewName("ldh_profile/profile");
   	 	
		return mv;
	}
	
	//모임 참여 신청 리스트 불러오기 --jjh
	@RequestMapping("meeting/signuplist.do")
	@ResponseBody
	public ModelAndView signupMeeting(ModelAndView mv, @RequestParam Map<String,Object> m) {
		List<Map<String,Object>> sign=service.signupMeeting(m);
		//Map<String,Object> mq=Map.of("meetingsignlist",sign);
		System.out.println("mq 모임참가 신청내역"+sign);
		mv.addObject("meetingsignlist",sign);
		mv.setViewName("/jjh_meetting/signuplist");
		return mv;
	}
	
	
	@RequestMapping("/scrollselectMyresAll")
	@ResponseBody
	public Map scrollselectMyresAll(int cPage) {
		//Session에 저장된 회원 pk 가져오기
		int memberNo=((Member)httpSession.getAttribute("loginMember")).getMemberNo();
		//numPerpage 설정
		int numPerpage=8;
		Map m=Map.of("myResList", service.selectMyResAll(Map.of("memberNo",memberNo,"cPage",cPage,"numPerpage",numPerpage)));
		return m;
   	 	
	}
	
	//맛집 저장
	@RequestMapping("/insertmyres.do")
	public String insertMyRes(@RequestParam Map param, MultipartFile[] upFile) {
		
		//Session에 저장된 회원 pk 가져오기
		int memberNo=((Member)httpSession.getAttribute("loginMember")).getMemberNo();
		param.put("memberNo", memberNo);
		
		//공유 여부 parse처리
		String flag=param.get("myres_yn")==null?"N":"Y";
		param.put("myres_yn", flag);
		
		log.debug("form태그 데이터 : {}",param);
		log.debug("업로드 파일 데이터 : {}",upFile);
		
		//String처리된 restaurent json파일 json으로 parse처리
		ObjectMapper mapper = new ObjectMapper();
		try {
			Map<String, String> res = mapper.readValue((String)param.get("restaurant"), Map.class);
			param.put("restaurant", res);
			log.debug("식당 데이터 : {}",res);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		//파일 업로드
		//업로드 경로 선언
		String path=httpSession.getServletContext().getRealPath("/resources/upload/myres/");
		//폴더 존재 여부 확인 후 폴더 생성
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs();
		
		//업로드 후 파일 담을 리스트
		List<MyPic> files=new ArrayList<MyPic>();
		
		//리네임
		for(MultipartFile f : upFile) {
			//전송파일이 있으면...
			if(!f.isEmpty()) {
				//파일 리네임 처리
				String oriFileName=f.getOriginalFilename();
				String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rnd=(int)(Math.random()*10000)+1;
				String reFileName=sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
				
				//파일 업로드 처리하기
				try {
					f.transferTo(new File(path+reFileName));
					files.add(new MyPic().builder()
							.myPicOriName(oriFileName)
							.myPicReName(reFileName)
							.build());
				}catch(IOException e) {
					e.printStackTrace();
				}
				
			}
		}
		
		param.put("files", files);
		
		//db에 저장
		service.insertMyRes(param);
		
 		return "redirect:/profile/";
	}

	
}
