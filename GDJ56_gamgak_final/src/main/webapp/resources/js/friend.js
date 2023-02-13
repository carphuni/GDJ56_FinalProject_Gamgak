//친구목록 출력
function selectFriendList(data, loginMemberNo){
	data.list.forEach(v => {
		const $divFLT=$("<div>").attr("id","friendListTotal");
		const $divFP=$("<div>").attr("id","friendprofile");
		const $imgMP=$("<img>").attr("id","msg_profile")
		const $aimg=$("<a>").attr("href","/GDJ56_gamgak_final/profile/user?memberNo="+v.MEMBER_NO);
		const $divFN=$("<div>").attr("id","friendNic");
		const $bFN=$("<b>")
		const $divFC=$("<div>").attr("id","freindChat");
		const $btChat=$("<button>").attr("class","chatF");
		const $btA=$("<button>");
		const $btB=$("<button>");
		const $divbtB=$("<div>").attr("id","deleteDiv");
		const $inputH=$("<input>").attr({"type":"hidden","id":"friendMemberNO","value":v.MEMBER_NO});
		const $inputB=$("<input>").attr({"type":"hidden","id":"friendMemberNO","value":v.MEMBER_NO});
		const $divFR=$("<div>").attr("id","friendRow");
		
		if(v.PROFILE_RENAME!='없음'){
			$imgMP.attr("src","/GDJ56_gamgak_final/resources/images/"+v.PROFILE_RENAME);
		}else if(v.PROFILE_ORINAME!='없음'){
			$imgMP.attr("src","/GDJ56_gamgak_final/resources/images/"+v.PROFILE_ORINAME);
		}else{
			$imgMP.attr("src","/GDJ56_gamgak_final/resources/images/프로필 기본 이미지.jpg");
		}
		$aimg.append($imgMP);
		$divFP.append($aimg);
		$bFN.text(v.MEMBER_NICKNAME);
		$divFN.append($bFN);
		//친구면 채팅버튼
		if(v.ACCEPT_YN=='Y'){
			$btChat.text("채팅");
			$divFC.append($btChat);
			$btB.attr({"class":"deleteF","value":v.MEMBER_NO,"data-bs-toggle":"modal","data-bs-target":"#outChatCheck"});
			$btB.text("x");
			$divbtB.append($btB);
		//친구요청했으면
		}else if(v.MEMBER_FOLLOWING_NO==loginMemberNo&&v.ACCEPT_YN=='S'){
			$btA.attr("class","cancleFa");
			$btA.text("신청대기");
			$divFC.append($btA);
		//친구요청왔으면	
		}else if(v.MEMBER_FOLLOWER_NO==loginMemberNo&&v.ACCEPT_YN=='S'){
			$btA.attr("class","acceptF");
			$btA.text("친구수락");
			$divFC.append($btA);
			$btB.attr({"class":"deleteF","value":v.MEMBER_NO,"data-bs-toggle":"modal","data-bs-target":"#outChatCheck"});
			$btB.text("x");	
			$divbtB.append($btB);
		}
		$divbtB.append($inputB);
		$divFC.append($inputH);
		$divFLT.append($divFP);
		$divFLT.append($divFN);
		$divFLT.append($divFC);
		$divFLT.append($divbtB);		
		$("#friendListAll").append($divFLT);
		$("#friendListAll").append($divFR);
	});
	const $pageBar=$("<div>").attr("id","pageBar");
	$pageBar.append(data.pageBar);
	$("#friendListAll").append($pageBar);	
}

//검색
function friendSearch(data,loginMemberNo){
	data.forEach(v => {
		//본인은 검색 결과에 안나오게
		if(v.MEMBER_NO==loginMemberNo){
			
		}else{
			const $divFLT=$("<div>").attr("id","friendSearchTotal");
			const $divI=$("<div>").attr("id","friendSearchInfo");
			const $divFP=$("<div>").attr("id","friendprofile");
			const $imgMP=$("<img>").attr("id","msg_profile").attr("src","/resources/images/프로필 기본 이미지.jpg");
			const $divFN=$("<div>").attr("id","friendNicS");
			const $bFN=$("<b>")
			const $divFC=$("<div>").attr("id","freindChatS");
			const $btChat=$("<button>");
			const $inputH=$("<input>").attr({"type":"hidden","id":"friendMemberNO","value":v.MEMBER_NO})

			if(v.PROFILE_RENAME!='없음'){
				$imgMP.attr("src","/GDJ56_gamgak_final/resources/images/"+v.PROFILE_RENAME);
			}else if(v.PROFILE_ORINAME!='없음'){
				$imgMP.attr("src","/GDJ56_gamgak_final/resources/images/"+v.PROFILE_ORINAME);
			}else{
				$imgMP.attr("src","/GDJ56_gamgak_final/resources/images/프로필 기본 이미지.jpg");
			}				
			$divFP.append($imgMP);
			$bFN.text(v.MEMBER_NAME+' ( '+v.MEMBER_NICKNAME+' )');
			$divFN.append($bFN);
			//로그인 회원과 친구라면 친구추가버튼 X
			if((v.MEMBER_FOLLOWING_NO==loginMemberNo||v.MEMBER_FOLLOWER_NO==loginMemberNo)&&v.ACCEPT_YN=='Y'){
	
			//로그인 회원이 친구신청을 했다면 대기버튼
			}else if(v.MEMBER_FOLLOWING_NO==loginMemberNo&&v.ACCEPT_YN=='S'){
				$btChat.attr("class","cancleF");
				$btChat.text("신청대기");
				$divFC.append($btChat);		
			//로그인 회원이 친구신청을 받았다면 수락버튼	
			}else if(v.MEMBER_FOLLOWER_NO==loginMemberNo&&v.ACCEPT_YN=='S'){
				$btChat.attr("class","acceptF");
				$btChat.text("친구수락");
				$divFC.append($btChat);					
			//아무 관계가 아니라면 추가버튼
			}else{
				$btChat.attr("class","insertFriend");
				$btChat.text("친구추가");
				$divFC.append($btChat);			
			}
			$divFC.append($inputH);
			$divI.append($divFP);
			$divI.append($divFN);
			$divFLT.append($divI);
			$divFLT.append($divFC);
			$("#searchResult").append($divFLT);
		}
	});
}