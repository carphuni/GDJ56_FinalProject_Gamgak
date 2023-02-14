function addMsgSystemCh(msg){
	const $p=$("<p>").css({"textAlign":"center","color":"gray","font-size":"13px"}).text(msg.msg);
	$("#chat").append($p);
	$('#chat').scrollTop($('#chat')[0].scrollHeight);
}

//실시간 채팅 출력
function printMsgCh(myId,msg){
	console.log(msg.profileOriname)
    const $p=$("<p>");
    //대화내용
    $p.text(`${msg.chattingContent}`);
    //시간
    let chattingEnrollDate=msg.chattingEnrollDate
    console.log(chattingEnrollDate);
    if(myId==msg.memberSender){
		const $divRr=$("<div>").attr("id","modal_sender");
		const $divR=$("<div>").attr("id","modal_msg_text_r");
		const $divTr=$("<div>").attr("id","modal_msg_time_r");
		const $divRead=$("<div>").attr("id","modal_msg_read_r");		
		$divR.append($p);
		if(msg.chattingUnreadCnt==1){
			$divRead.text(msg.chattingUnreadCnt);
		}		
		$divTr.text(chattingEnrollDate.substr(11,5));
		$divRr.append($divRead);
		$divRr.append($divTr);
		$divRr.append($divR);
		$("#chat").append($divRr);

	}else{
		const $div=$("<div>").attr("id","chat_img");
		const $divSs=$("<div>").attr("id","modal_receiver");
		const $img=$("<img>").attr("id","modal_msg_profile");
		const $aimg=$("<a>").attr("href","/GDJ56_gamgak_final/profile/user?memberNo="+msg.memberReceiver);
		const $divmsg=$("<div>").attr("id","modal_name_msg");
	    const $divN=$("<div>").attr("id","modal_nickname");
	    const $divS=$("<div>").attr("id","modal_msg_text_s");
	    const $divTs=$("<div>").attr("id","modal_msg_time_s");
	    const $divT=$("<div>").attr("id","modal_msg_t");
	    const $divReadS=$("<div>").attr("id","modal_msg_read_s");
	    const $divTR=$("<div>").attr("id","modal_msg_TR_s");
	    const $b=$("<b>");
		$b.text(`${msg.memberSender}`);
		$divN.append($b);
		$divS.append($p);
		$divTs.text(chattingEnrollDate.substr(11,5));
		$divTR.append($divReadS);
		$divTR.append($divTs);	
		$divT.append($divS);
		$divT.append($divTR);			
		$divmsg.append($divN);
		$divmsg.append($divT);
		if(msg.profileRename!='없음'){
			$img.attr("src","/GDJ56_gamgak_final/resources/images/"+msg.profileRename);
		}else if(msg.profileOriname!='없음'){
			$img.attr("src","/GDJ56_gamgak_final/resources/images/"+msg.profileOriname);
		}else{
			$img.attr("src","/GDJ56_gamgak_final/resources/images/프로필 기본 이미지.jpg");
		}	
		$aimg.append($img);
		$div.append($aimg);
		$divSs.append($div);
		$divSs.append($divmsg);
		$("#chat").append($divSs);
	}
	$('#chat').scrollTop($('#chat')[0].scrollHeight);
}

//채팅 목록 출력
function selectMsgList(data,loginMemberNo){
	console.log(data)
	data.list.forEach(v => {
		console.log(v)
		let chattingEnrollDate=v.CHATTING_ENROLL_DATE
		const $b=$("<b>");
		const $pText=$("<p>").attr("id","pText");
		const $pTime=$("<p>").attr("id","pTime");
		const $a=$("<a href='#'>").attr({class:"chat_modal","id":v.PERSONAL_CHATROOM_NO,"data-bs-toggle":"modal","data-bs-target":"#exampleModal"});
		const $divList=$("<div>").attr("id","list");
		const $divImg=$("<div>").attr("id","divImg");
		const $img=$("<img>").attr("id","modal_msg_profile");
		const $divNmct=$("<div>").attr("id","nmct");
		const $divNameMsg=$("<div>").attr("id","name_msg");
		const $divNickname=$("<div>").attr("id","nickname");
		const $divMsgText=$("<div>").attr("id","msg_text");
		const $divCountTime=$("<div>").attr("id","count_time");
		const $divSpan=$("<div>").attr("id","div_span");
		const $span=$("<span>").attr("class","badge rounded-pill text-bg-danger");
		const $divMsgTime=$("<div>").attr("id","msg_time");
		const $divMsgOut=$("<div>").attr("id","msg_out_div");
		const $msgOutBt=$("<button>").attr({"class":"msg_out_bt","value":v.PERSONAL_CHATROOM_NO,"data-bs-toggle":"modal","data-bs-target":"#outChatCheck"});
		const $hidden=$("<input>").attr({"type":"hidden","class":"hidden"});
		
		$divImg.append($img);
		//로그인회원 : 메세지 보낸사람이면 받는사람의 닉네임 출력
		if(loginMemberNo!=v.MEMBER_RECEIVER_NO){
			$b.text(v.MEMBER_NICKNAME_R);
			//상대방의 프로필 없으면 기본이미지 출력
			if(v.PROFILE_RENAME_R!='없음'){
				$img.attr("src","/GDJ56_gamgak_final/resources/images/"+v.PROFILE_RENAME_R);
			}else if(v.PROFILE_ORINAME_R!='없음'){
				$img.attr("src","/GDJ56_gamgak_final/resources/images/"+v.PROFILE_ORINAME_R);
			}else{
				$img.attr("src","/GDJ56_gamgak_final/resources/images/프로필 기본 이미지.jpg");
			}				
		//받는사람이면 보낸사람의 닉네임 출력
		}else{
			$b.text(v.MEMBER_NICKNAME_S);
			//상대방의 프로필 없으면 기본이미지 출력
			if(v.PROFILE_RENAME_S!='없음'){
				$img.attr("src","/GDJ56_gamgak_final/resources/images/"+v.PROFILE_RENAME_S);
			}else if(v.PROFILE_ORINAME_S!='없음'){
				$img.attr("src","/GDJ56_gamgak_final/resources/images/"+v.PROFILE_ORINAME_S);
			}else{
				$img.attr("src","/GDJ56_gamgak_final/resources/images/프로필 기본 이미지.jpg");
			}			
		}
		$divNickname.append($b);
		$pText.text(v.CHATTING_CONTENT);
		$divMsgText.append($pText);
		$divNameMsg.append($divNickname);
		$divNameMsg.append($divMsgText);
		if(v.UNREAD!=null){
			$span.text(v.UNREAD);
		}
		$divSpan.append($span);
		$pTime.text(chattingEnrollDate.substr(0,10));
		$divMsgTime.append($pTime);
		$divCountTime.append($divSpan);
		$divCountTime.append($divMsgTime);
		//관리자가 보낸 메세지는 나갈 수 없음
		if(v.MEMBER_NO_S!=1){
			$msgOutBt.text("나가기");
			$divMsgOut.append($msgOutBt);			
		}
		$a.append($divImg);
		$divNmct.append($divNameMsg);
		$divNmct.append($divCountTime);		
		$a.append($divNmct);
		$hidden.text(v.PERSONAL_CHATROOM_NO);
		$a.append($hidden);
		$divList.append($a);
		$divList.append($divMsgOut);
		$("#msgAll").append($divList);
		$("#totalpage").append($("#msgAll"));
	});
	const $pageBar=$("<div>").attr("id","pageBar");
	$pageBar.append(data.pageBar);
	$("#totalpage").append($pageBar);
	msgPrint();
	$('#chat').scrollTop($('#chat')[0].scrollHeight);
}


//채팅방 들어갔을 때 기존 대화 출력
function msgRead(data,loginMemberNo,personalChatroomNo){
	console.log(data)
	  data.forEach(v => {
		//대화내용
	    const $p=$("<p>");
	    $p.text(v.CHATTING_CONTENT);
	    //시간
	    let chattingEnrollDate=v.CHATTING_ENROLL_DATE
	    
	    if(loginMemberNo==v.MEMBER_SENDER_NO){
			const $divRr=$("<div>").attr("id","modal_sender");
			const $divR=$("<div>").attr("id","modal_msg_text_r");
			const $divTr=$("<div>").attr("id","modal_msg_time_r");
			const $divRead=$("<div>").attr("id","modal_msg_read_r");
			$divR.append($p);
			if(v.CHATTING_UNREAD_CNT==1){
				$divRead.text(v.CHATTING_UNREAD_CNT);
			}
			$divTr.text(chattingEnrollDate.substr(11,5));
			$divRr.append($divRead);
			$divRr.append($divTr);
			$divRr.append($divR);
			$("#chat").append($divRr);
		}else{
			const $div=$("<div>").attr("id","chat_img");
			const $divSs=$("<div>").attr("id","modal_receiver");
		    const $img=$("<img>").attr("id","modal_msg_profile");
		    const $aimg=$("<a>").attr("href","/GDJ56_gamgak_final/profile/user?memberNo="+v.MEMBER_SENDER_NO);
		    const $divmsg=$("<div>").attr("id","modal_name_msg");
		    const $divN=$("<div>").attr("id","modal_nickname");
		    const $divS=$("<div>").attr("id","modal_msg_text_s");
		    const $divTs=$("<div>").attr("id","modal_msg_time_s");
		    const $divT=$("<div>").attr("id","modal_msg_t");
		    const $divReadS=$("<div>").attr("id","modal_msg_read_s");
		    const $divTR=$("<div>").attr("id","modal_msg_TR_s");
		    const $b=$("<b>");
			$b.text(v.MEMBER_NICKNAME);
			$divN.append($b);
			$divS.append($p);
			$divTs.text(chattingEnrollDate.substr(11,5));
			$divTR.append($divReadS);
			$divTR.append($divTs);	
			$divT.append($divS);
			$divT.append($divTR);			
			$divmsg.append($divN);
			$divmsg.append($divT);
			if(v.PROFILE_RENAME!='없음'){
				$img.attr("src","/GDJ56_gamgak_final/resources/images/"+v.PROFILE_RENAME);
			}else if(v.PROFILE_ORINAME!='없음'){
				$img.attr("src","/GDJ56_gamgak_final/resources/images/"+v.PROFILE_ORINAME);
			}else{
				$img.attr("src","/GDJ56_gamgak_final/resources/images/프로필 기본 이미지.jpg");
			}	
			$aimg.append($img);
			$div.append($aimg);
			$divSs.append($div);
			$divSs.append($divmsg);
			$("#chat").append($divSs);
		}
		
		const $inputH=$("<input>").attr({"type":"hidden","id":"personalChatroomNo"});
		$inputH.text(personalChatroomNo);
		$("#modal_msg_send").append($inputH);
		
		
   			//$('#chat').scrollTop($('#chat')[0].scrollHeight);
		//$('#chat').scrollTop($('#chat').prop('scrollHeight'));
		
	});
	$('#chat').scrollTop($('#chat')[0].scrollHeight);

}

