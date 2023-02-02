<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path}/resources/js/chattingCh.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- 모임 -->
<div id="meeting-wrapper">
	<div id="meeting-item">
		<a><img id="meeting-img" src="${path }/resources/images/플러스.png"></a>
		<p>모임 이름</p>
	</div>
	<div id="meeting-item">
		<a><img id="meeting-img" src="${path }/resources/images/임시 이미지03.jpg"></a>
		<p>모임 이름</p>
	</div>
</div>

<!-- 채팅방 목록 -->
<!-- 기능 구현 시 동적생성 해야함 -->
<div id="totalpage">
	<div id="msg_title">
		<b id="titletext">메세지 목록</b>
	</div>
	<div id="msgAll"></div>
	<!-- 친구목록 페이지 아직 없어서 대체 -->
	<!-- 1. 처음 채팅이라면 채팅방 생성  -->
	<!-- 2. 기존 채팅방 있다면 기존 채팅방 내용 불러오기 및 기존 채팅방 접속 -->
<%-- 		<div id="list">
			<div><img id="msg_profile" alt="" src="${path }/resources/images/프로필 기본 이미지.jpg"></div>
			<div id="name_msg">
				<div id="nickname"><b>차니니니니니</b></div>
			</div>
			<div id="msg_out_div"><button id="chattingstart" class="chat_modal" data-bs-toggle="modal" data-bs-target="#exampleModal">채팅</button></div>
		</div>


	<a href="#" class="chat_modal" data-bs-toggle="modal" data-bs-target="#exampleModal">
		<div id="list">
			<div id="divImg"><img id="msg_profile" alt="" src="${path }/resources/images/프로필 기본 이미지.jpg"></div>
			<div id="name_msg">
				<div id="nickname"><b>차니니니니니</b></div>
				<div id="msg_text"><p>ㅋㅋㅋㅋㅋㅋ</p></div>
			</div>
			<div id="count_time">
				<div id="div_span"><span id="msg_count"> 10 </span></div>
				<div id="msg_time"><p>17:52</p></div>
			</div>
			<div id="msg_out_div"><button id="msg_out_bt">나가기</button></div>
		</div>
	</a> --%>

</div>


<!-- 채팅방 -->
<!-- 기능 구현 시 동적생성 해야함 -->
  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content" id="modal-content1">
        <div class="modal-header">
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body" id="chat">

			<div id="modal_sender">
				<div id="modal_msg_text_r"><p>ㅋㅋㅋㅋㅋㅋ시작</p></div>
			</div>	
			<div id="modal_receiver">
				<div><img id="modal_msg_profile" alt="" src="${path }/resources/images/프로필 기본 이미지.jpg"></div>
				<div id="modal_name_msg">
					<div id="modal_nickname"><b>차니니니니니</b></div>
					<div id="modal_msg_text_s"><p>ㅋㅋㅋㅋㅋㅋ</p></div>
					<!-- 입력창 -->
				</div>
			</div>

			<div id="modal_sender">
				<div id="modal_msg_text_r"><p>ㅋㅋㅋㅋㅋㅋ</p></div>
			</div>	
			<div id="modal_receiver">
				<div><img id="modal_msg_profile" alt="" src="${path }/resources/images/프로필 기본 이미지.jpg"></div>
				<div id="modal_name_msg">
					<div id="modal_nickname"><b>차니니니니니</b></div>
					<div id="modal_msg_text_s"><p>ㅋㅋㅋㅋㅋㅋ</p></div>
					<!-- 입력창 -->
				</div>
			</div>

			<div id="modal_sender">
				<div id="modal_msg_text_r"><p>ㅋㅋㅋㅋㅋㅋ</p></div>
			</div>	
			<div id="modal_receiver">
				<div><img id="modal_msg_profile" alt="" src="${path }/resources/images/프로필 기본 이미지.jpg"></div>
				<div id="modal_name_msg">
					<div id="modal_nickname"><b>차니니니니니</b></div>
					<div id="modal_msg_text_s"><p>ㅋㅋㅋㅋㅋㅋ</p></div>
					<!-- 입력창 -->
				</div>
			</div>

			<div id="modal_sender">
				<div id="modal_msg_text_r"><p>ㅋㅋㅋㅋㅋㅋ</p></div>
			</div>	
			<div id="modal_receiver">
				<div><img id="modal_msg_profile" alt="" src="${path }/resources/images/프로필 기본 이미지.jpg"></div>
				<div id="modal_name_msg">
					<div id="modal_nickname"><b>차니니니니니</b></div>
					<div id="modal_msg_text_s"><p>ㅋㅋㅋㅋㅋㅋ</p></div>
					<!-- 입력창 -->
				</div>
			</div>

			<div id="modal_sender">
				<div id="modal_msg_text_r"><p>ㅋㅋㅋㅋㅋㅋ</p></div>
			</div>	
			<div id="modal_receiver">
				<div><img id="modal_msg_profile" alt="" src="${path }/resources/images/프로필 기본 이미지.jpg"></div>
				<div id="modal_name_msg">
					<div id="modal_nickname"><b>차니니니니니</b></div>
					<div id="modal_msg_text_s"><p>ㅋㅋㅋㅋㅋㅋ</p></div>
					<!-- 입력창 -->
				</div>
			</div>

			<div id="modal_sender">
				<div id="modal_msg_text_r"><p>ㅋㅋㅋㅋㅋㅋ</p></div>
			</div>	
			<div id="modal_receiver">
				<div><img id="modal_msg_profile" alt="" src="${path }/resources/images/프로필 기본 이미지.jpg"></div>
				<div id="modal_name_msg">
					<div id="modal_nickname"><b>차니니니니니</b></div>
					<div id="modal_msg_text_s"><p>ㅋㅋㅋㅋㅋㅋ끝</p></div>
					<!-- 입력창 -->
				</div>
			</div>
							


		</div>
		<!-- <div class="modal-footer" id="footerr"> -->
					<div id="modal_msg">
						<div id="modal_msg_text">
							<input type="text" class="msg_text" placeholder="내용을 입력해주세요">
						</div>    
						<div id="modal_msg_bt">
							<button id="modal_msg_send">입력</button>
						</div>
			    	</div>					
				<!-- </div> -->
    </div>
  </div>
  </div>
  
<script>
	let cPage;
	let loginMemberNo;
	
    (() => {
		cPage=1,
		loginMemberNo=${loginMember.memberNo}
        msgList(cPage,loginMemberNo)
        
    })();
	
    //채팅방 목록 출력
	function msgList(cPage,loginMemberNo){
		$("#msgAll").empty();
		$("#pageBar").remove();

	    $.ajax({
	       url:"${path}/msg/selectMsgList.do",
	       data:{
	          loginMemberNo:${loginMember.memberNo},
	          cPage:cPage
	       },
	       success:data=>{
	    	  console.log("데이터 보내기")
	          console.log(loginMemberNo);
	          selectMsgList(data,loginMemberNo);
	       }
	    })		
	}
    
    //채팅방 닫으면 목록 새로고침
 	$('#exampleModal').on('hidden.bs.modal', function () {
 		msgList(cPage,loginMemberNo)
	}) 
	
	//처음 채팅방 들어갔을 때 채팅 대화 목록 출력
 	function msgPrint(){
		
		$(".chat_modal").click(e=>{
			$("#chat").empty();
			$("#personalChatroomNo").remove();
			const personalChatroomNo=e.delegateTarget.lastChild.lastElementChild.firstChild.data //클릭한 채팅방 번호
			console.log(e);
			//console.log(test1.lastChild.lastElementChild.firstChild.data);
			$.ajax({
				url:"${path}/msg/selectChatList.do",
				data:{
					"personalChatroomNo":personalChatroomNo,
					loginMemberNo:loginMemberNo
				},
				success:data=>{
					console.log(data);
					console.log(loginMemberNo);
					console.log(personalChatroomNo);
					msgRead(data,loginMemberNo,personalChatroomNo);
				}
			})
		}); 
	}	

	// ---------- 채팅 ---------- 
	
	var today = new Date();

	const websocket=new WebSocket("ws://localhost:9090/chatting_Server");
	
	websocket.onopen=(data)=>{
		console.log(data);
		
		websocket.send(JSON.stringify(new Chat("open","",1,"",'${loginMember.memberNickName}',"",today,"")))
	}
	
	websocket.onmessage=(response)=>{
		console.log("onmassage-response"+response);
		const msg=JSON.parse(response.data);
		console.log("onmassage-msg"+msg);
		switch(msg.type){
			case "system" : addMsgSystemCh(msg);break; 
			case "msgCh" : printMsgCh('${loginMember.memberNickName}',msg);break;
		}
	}
	
	$("#modal_msg_send").click(e=>{
		const personalChatroomNo=$("#personalChatroomNo").text(); 
		const msg=$(".msg_text").val();
		console.log("채팅내용 : "+msg);
		
		//같은 방에 있는 회원정보 가져와서 서버로 보내주기
		$.ajax({
			url:"${path}/msg/chatroomMember.do",
			data:{
				"personalChatroomNo":personalChatroomNo,
				"loginMemberNo":${loginMember.memberNo}
			},
			success:data=>{
				console.log(data.data);
				// 서버로 메세지 보내기
				const sendData=new Chat("msgCh","",data.data.PERSONAL_CHATROOM_NO,data.data.MEMBER_NICKNAME,'${loginMember.memberNickName}',msg,today,1);
				console.log(sendData);
				websocket.send(JSON.stringify(sendData));
				$(".msg_text").val('');
				$(".msg_text").attr("placeholder","내용을 입력해주세요");					
				
				//보낸 메세지 DB에 저장하기
		  		$.ajax({
					url:"${path}/msg/insertMsg.do",
					data:{
						"personalChatroomNo":personalChatroomNo,
						"receiverNo":data.data.MEMBER_NO,
						"senderNo":${loginMember.memberNo},
						"content":msg
					},
					success:data=>{
					}  
		  		})
			}
		})
		//msgList(cPage,loginMemberNo)
	});
	

	
	class Chat{
		constructor(type, meetingNo, personalChatroomNo, memberReceiver,memberSender,chattingContent,chattingEnrollDate,chattingUnreadCnt){
			this.type=type;
			this.meetingNo=meetingNo;
			this.personalChatroomNo=personalChatroomNo;
			this.memberReceiver=memberReceiver;
			this.memberSender=memberSender;
			this.chattingContent=chattingContent;
			this.chattingEnrollDate=chattingEnrollDate;
			this.chattingUnreadCnt=chattingUnreadCnt;
		}
	}
</script>
  

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>