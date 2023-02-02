<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<div id="modalClick">
	<p>user09</p>
	<button onclick="chatStartx()">채팅</button>
	<input type="hidden" id="memberNo10" value="10">
</div>

<!-- 채팅창 -->
<a href="#" class="chat_modal" id="openChat" data-bs-toggle="modal" data-bs-target="#exampleModal"></a>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content" id="modal-content1">
        <div class="modal-header">
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body" id="chat"></div>
        <div id="modal_msg">
			<div id="modal_msg_text">
				<input type="text" class="msg_text" placeholder="내용을 입력해주세요">
			</div>    
			<div id="modal_msg_bt">
				<button id="modal_msg_send">입력</button>
			</div>
		</div>					
    </div>
  </div>
</div>

<script>
	const chatStartx=()=>{
		const memberNo10=$("#memberNo10").val();
		$.ajax({
			url:"${path}/msg/chatroomCheck/do",
			data:{
				"loginMember":${loginMember.memberNo},
				"memberNo":memberNo10
			},
			success:data=>{
				console.log(data);
				console.log(data.data==null);
				
				if(data.data==null){
					//data가 없으면 채팅방 생성! (PERSONALCHATROOM)
 					$.ajax({
						url:"${path}/msg/personalChatRoomInsert.do",
						data:{
						},
						success:data=>{
							console.log(data);
							
							//생성된 채팅방번호 가져오기
							$.ajax({
								url:"${path}/msg/personalChatRoomNo.do",
								data:{
								},
								success:result=>{
									console.log(result);
									
									//로그인회원 대화방참여 추가 (ENTERCHAT)
				 					$.ajax({
										url:"${path}/msg/enterchatInsert.do",
										data:{
											"loginMemberNo":${loginMember.memberNo},
											"chatRoomNo":result
										},
										success:data=>{
											console.log(data);
											
											//친구 대화방참여 추가 (ENTERCHAT)
											$.ajax({
												url:"${path}/msg/enterchatFriend.do",
												data:{
													"memberNo":memberNo10,
													"chatRoomNo":result
												},
												success:data=>{
													console.log($("#openChat"));
													$("#openChat")[0].click();
													
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
													
													//메세지 입력버튼
													$("#modal_msg_send").click(e=>{
														//const personalChatroomNo=$("#personalChatroomNo").text(); 
														const msg=$(".msg_text").val();
														console.log("채팅내용 : "+msg);
														
														//같은 방에 있는 회원정보 가져와서 서버로 보내주기
														$.ajax({
															url:"${path}/msg/chatroomMember.do",
															data:{
																"personalChatroomNo":result,
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
																		"personalChatroomNo":result,
																		"receiverNo":memberNo10,
																		"senderNo":${loginMember.memberNo},
																		"content":msg
																	},
																	success:data=>{
																	}  
														  		})
															}
														})
													});
												}
											})
										}
									}) 
								}
							})
						}
					}) 
				}else{
					//data가 있으면 채팅창 오픈!	
					$("#openChat")[0].click();
					const personalChatroomNo=data.data.PERSONAL_CHATROOM_NO; //채팅방번호
					const loginMemberNo=${loginMember.memberNo}
					//기존 채팅내역 출력
 					$.ajax({
						url:"${path}/msg/selectChatList.do",
						data:{
							"personalChatroomNo":personalChatroomNo,
							"loginMemberNo":${loginMember.memberNo}
						},
						success:data=>{
							msgRead(data,loginMemberNo,personalChatroomNo);
						}
					}) 
				}
			}
		})
	}
	
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