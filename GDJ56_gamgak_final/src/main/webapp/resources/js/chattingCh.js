function addMsgSystemCh(msg){
	const $p=$("<p>").css({"textAlign":"center","color":"gray","font-size":"13px"}).text(msg.msg);
	$("#chat").append($p);
}

//실시간 채팅 출력
function printMsgCh(myId,msg){
    const $p=$("<p>");
    $p.text(`${msg.chattingContent}`);
    if(myId==msg.memberSender){
		const $divRr=$("<div>").attr("id","modal_sender");
		const $divR=$("<div>").attr("id","modal_msg_text_r");
		$divR.append($p);
		$divRr.append($divR);
		$("#chat").append($divRr);

	}else{
		const $div=$("<div>").attr("id","chat_img");
		const $divSs=$("<div>").attr("id","modal_receiver");
	    const $img=$("<img>").attr("id","modal_msg_profile").attr("src","/resources/images/프로필 기본 이미지.jpg");
	    const $divmsg=$("<div>").attr("id","modal_name_msg");
	    const $divN=$("<div>").attr("id","modal_nickname");
	    const $divS=$("<div>").attr("id","modal_msg_text_s");
	    const $b=$("<b>");
		$b.text(`${msg.memberSender}`);
		$divN.append($b);
		$divS.append($p);
		$divmsg.append($divN);
		$divmsg.append($divS);
		$div.append($img);
		$divSs.append($div);
		$divSs.append($divmsg);
		$("#chat").append($divSs);
	}
	$('#chat').scrollTop($('#chat')[0].scrollHeight);
}

function selectMsgList(data){
	//console.log(data)
	data.list.forEach(v => {
		console.log(v)
		let chattingEnrollDate=v.CHATTING_ENROLL_DATE
		const $b=$("<b>");
		const $pText=$("<p>").attr("id","pText");
		const $pTime=$("<p>").attr("id","pTime");
		const $a=$("<a href='#'>").attr({class:"chat_modal","id":v.PERSONAL_CHATROOM_NO,"data-bs-toggle":"modal","data-bs-target":"#exampleModal"});
		const $divList=$("<div>").attr("id","list");
		const $divImg=$("<div>").attr("id","divImg");
		const $img=$("<img>").attr("id","modal_msg_profile").attr("src","/resources/images/프로필 기본 이미지.jpg");
		const $divNameMsg=$("<div>").attr("id","name_msg");
		const $divNickname=$("<div>").attr("id","nickname");
		const $divMsgText=$("<div>").attr("id","msg_text");
		const $divCountTime=$("<div>").attr("id","count_time");
		const $divSpan=$("<div>").attr("id","div_span");
		const $span=$("<span>").attr("id","msg_count");
		const $divMsgTime=$("<div>").attr("id","msg_time");
		const $divMsgOut=$("<div>").attr("id","msg_out_div");
		const $msgOutBt=$("<button>").attr("id","msg_out_bt");
		const $hidden=$("<input>").attr({"type":"hidden","class":"hidden"});
		
		
		$divImg.append($img);
		$b.text(v.MEMBER_NICKNAME);
		$divNickname.append($b);
		$pText.text(v.CHATTING_CONTENT);
		$divMsgText.append($pText);
		$divNameMsg.append($divNickname);
		$divNameMsg.append($divMsgText);
		$span.text("10");
		$divSpan.append($span);
		$pTime.text(chattingEnrollDate.substr(0,10));
		$divMsgTime.append($pTime);
		$divCountTime.append($divSpan);
		$divCountTime.append($divMsgTime);
		$msgOutBt.text("나가기");
		$divMsgOut.append($msgOutBt);
		$divList.append($divImg);
		$divList.append($divNameMsg);
		$divList.append($divCountTime);
		$divList.append($divMsgOut);
		$hidden.text(v.PERSONAL_CHATROOM_NO);
		$divList.append($hidden);
		$a.append($divList);
		$("#msgAll").append($a);
		$("#totalpage").append($("#msgAll"));
	});
	const $pageBar=$("<div>").attr("id","pageBar");
	$pageBar.append(data.pageBar);
	$("#totalpage").append($pageBar);
	
	msgPrint();
}


//채팅방 들어갔을 때 기존 채팅목록
function msgRead(data,loginMemberNo){
	data.forEach(v => {
		//대화내용
	    const $p=$("<p>");
	    $p.text(v.CHATTING_CONTENT);
	    //시간
	    let chattingEnrollDate=v.CHATTING_ENROLL_DATE
	    
	    if(loginMemberNo==v.MEMBER_RECEIVER_NO){
			const $divRr=$("<div>").attr("id","modal_sender");
			const $divR=$("<div>").attr("id","modal_msg_text_r");
			const $divTr=$("<div>").attr("id","modal_msg_time_r");
			$divR.append($p);
			$divTr.text(chattingEnrollDate.substr(11,5));
			$divRr.append($divTr);
			$divRr.append($divR);
			$("#chat").append($divRr);
	
		}else{
			const $div=$("<div>").attr("id","chat_img");
			const $divSs=$("<div>").attr("id","modal_receiver");
		    const $img=$("<img>").attr("id","modal_msg_profile").attr("src","/resources/images/프로필 기본 이미지.jpg");
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
			$div.append($img);
			$divSs.append($div);
			$divSs.append($divmsg);
			$("#chat").append($divSs);
		}

	});
	$('#chat').scrollTop($('#chat')[0].scrollHeight);
}