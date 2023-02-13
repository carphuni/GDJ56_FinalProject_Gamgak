<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="loginMember" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/>
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
		</div> --%>


	
<%-- 		<div id="list">
			<a href="#" class="chat_modal" data-bs-toggle="modal" data-bs-target="#exampleModal">
				<div id="divImg"><img id="msg_profile" alt="" src="${path }/resources/images/프로필 기본 이미지.jpg"></div>
				<div id="nmct">
					<div id="name_msg">
						<div id="nickname"><b>차니니니니니</b></div>
						<div id="msg_text"><p>ㅋㅋㅋㅋㅋㅋ</p></div>
					</div>
					<div id="count_time">
						<!-- <div id="div_span"><span id="msg_count"> 1 </span></div> -->
						<div id="div_span"><span class="badge rounded-pill text-bg-danger">10</span></div>
						<div id="msg_time"><p>17:52</p></div>
					</div>
				</div>
			</a>
			<div id="msg_out_div"><button class="msg_out_bt">나가기</button></div>
		</div> --%>
	

</div>

<!-- 나가기 확인창 -->
  <div class="modal fade" id="outChatCheck" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <br>채팅방을 나가시겠습니까?<br>
          (기존 대화 목록은 삭제됩니다.)<br><br>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="updateChat">
          	예
          </button>        
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="modalFN">아니오</button>
        </div>
      </div>
    </div>
  </div>


<!-- 채팅방 -->
<!-- 기능 구현 시 동적생성 해야함 -->
  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content" id="modal-content1">
        <div class="modal-header" id="chatHeader">
        <!-- <button class="reportF">신고</button> -->
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body" id="chat">

<%-- 			<div id="modal_sender">
				<div id="modal_msg_read_r">1</div>	
				<div id="modal_msg_time_r">19:20</div>			
				<div id="modal_msg_text_r"><p>ㅋㅋㅋㅋㅋㅋ시작</p></div>
			</div>	
			<div id="modal_receiver">
				<div><img id="modal_msg_profile" alt="" src="${path }/resources/images/프로필 기본 이미지.jpg"></div>
				<div id="modal_name_msg">
					<div id="modal_nickname"><b>차니니니니니</b></div>
					<div id="modal_msg_text_s"><p>ㅋㅋㅋㅋㅋㅋ</p></div>
					<!-- 입력창 -->
				</div>
			</div> --%>

							


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
	          cPage:cPage,
	          functionN:"msgList"
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
 		//msgList(cPage,loginMemberNo)
 		location.reload();
	}) 
	
	//채팅방 클릭 시
 	function msgPrint(){
		$(".chat_modal").click(e=>{
			const personalChatroomNo=e.delegateTarget.lastChild.firstChild.data //클릭한 채팅방 번호
			//안읽은 메세지 리스트 가져오기
			$.ajax({
				url:"${path}/msg/unreadList.do",
				data:{
					"personalChatroomNo":personalChatroomNo,
					loginMemberNo:loginMemberNo
				},
				success:data=>{
					//안읽은 메세지가 있다면
					if(data.data!=null){
						//읽음처리하기
						console.log(data);
						console.log(data.data.MIN);
						$.ajax({
							url:"${path}/msg/updateReadcount.do",
							data:{
								"min":data.data.MIN,
								"max":data.data.MAX,
								"personalChatroomNo":personalChatroomNo
							},
							success:data=>{
							}
						})
					}
				}
			})
			//기존 대화 목록 출력
			$("#chat").empty();
			$("#personalChatroomNo").remove();
			//console.log(e.delegateTarget.lastChild.firstChild.data);
			
			$.ajax({
				url:"${path}/msg/selectChatList.do",
				data:{
					"personalChatroomNo":personalChatroomNo,
					loginMemberNo:loginMemberNo
				},
				success:data=>{
					console.log(data[0]);
					console.log(loginMemberNo);
					console.log(personalChatroomNo);
					msgRead(data,loginMemberNo,personalChatroomNo);
					//메세지를 보낸 사람이 관리자일 경우 채팅 막기
					if(data[0].MEMBER_SENDER_NO==1){
						$(".msg_text").attr({"disabled":"true","placeholder":"관리자와 채팅할 수 없습니다."});
					}
					// ---------- 채팅 ---------- 
					
					var today = new Date();
					
					const servername1="wss://gd1class.iptime.org:8844/GDJ56_gamgak_final/chatting_Server"
					//ws://gd1class.iptime.org:9999/GDJ56_gamgak_final/chatting_Server
					const servername="ws://localhost:9090/GDJ56_gamgak_final/chatting_Server"
					const websocket=new WebSocket(servername);
					
					websocket.onopen=(data)=>{
						console.log(data);
						//const sendData2=new Chat("open","",personalChatroomNo,"",'${loginMember.memberNickName}',"",today,"");
						websocket.send(JSON.stringify(new Chat("open","",personalChatroomNo,"user04",'${loginMember.memberNickName}',"",today,"")))
						//websocket.send(JSON.stringify(sendData2));
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
					//$(document).on("click","#modal_msg_send",function(e){
						const personalChatroomNo=$("#personalChatroomNo").text(); 
						console.log(personalChatroomNo);
						const msg=$(".msg_text").val();
						console.log("채팅내용 : "+msg);
						//메세지 내용 없으면 안보냄
						if(msg==""){
							
						}else{
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
									const sendData=new Chat("msgCh","",data.data.PERSONAL_CHATROOM_NO,data.data.MEMBER_NICKNAME,'${loginMember.memberNickName}',msg,today,1,data.data.PROFILE_ORINAME,data.data.PROFILE_RENAME);
									console.log(sendData);
									console.log(data.data.PROFILE_ORINAME);
									
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
									//상대방이 채팅방을 나갔다면
									if(data.data.CHAT_OUT_YN=="Y"){
										//ENTERCHAT OUT을 null로 수정
								  		$.ajax({
											url:"${path}/msg/updateChatOut.do",
											data:{
												"personalChatroomNo":personalChatroomNo,
												"loginMemberNo":${loginMember.memberNo}
											},
											success:data=>{
												console.log(data);
											}
										})  
									}
								}
							})
						}
					});
				}
			})
		}); 
	}	
    
    //나가기 버튼 누르면 예 버튼에 채팅방 번호 hidden으로 넣어주기
 	$(document).on("click",".msg_out_bt",function(e){
 		const personalChatroomNo=e.target.attributes.value.textContent; //채팅방번호
 		const $updateHidden=$("<input>").attr({"type":"hidden","id":"updateChatHidden"});
 		$updateHidden.text(personalChatroomNo);
 		$("#updateChat").append($updateHidden);
 	})
    
    //나가기 버튼 -> modal -> 예 -> enterchat에서 삭제
   	$("#updateChat").click(e=>{
		const personalChatroomNo=$("#updateChatHidden").text();
		console.log(personalChatroomNo);
   		$.ajax({
			url:"${path}/msg/updateChatroom.do",
			data:{
				"personalChatroomNo":personalChatroomNo,
				loginMemberNo:loginMemberNo
			},
			success:data=>{
				console.log(data);
				//closeModal();
				//msgList(cPage,loginMemberNo);
				location.reload();
			}
		})   
	});
	class Chat{
		constructor(type, meetingNo, personalChatroomNo, memberReceiver,memberSender,chattingContent,chattingEnrollDate,chattingUnreadCnt,profileOriname,profileRename){
			this.type=type;
			this.meetingNo=meetingNo;
			this.personalChatroomNo=personalChatroomNo;
			this.memberReceiver=memberReceiver;
			this.memberSender=memberSender;
			this.chattingContent=chattingContent;
			this.chattingEnrollDate=chattingEnrollDate;
			this.chattingUnreadCnt=chattingUnreadCnt;
  			this.profileOriname=profileOriname;
			this.profileRename=profileRename;  
		}
	}
</script>
  
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>