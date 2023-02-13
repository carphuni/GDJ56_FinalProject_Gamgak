<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="loginMember" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/>
<script src="${path}/resources/js/chattingCh.js"></script>
<script src="${path}/resources/js/friend.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@alphardex/aqua.css/dist/aqua.min.css" >
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

<div id="profile-wrapper">
   <div id="modalClick">
<!--       <p>user09</p>
      <button onclick="chatStartx()">채팅</button>
      <input type="hidden" id="memberNo10" value="23"> -->
      
      <div id="searchFriend">
         <div id="friendTotal"><h4 id="h4Title">친구목록</h4></div>
         <div id="searchbox">
              <!-- <button id="friendSearchBt" data-bs-toggle="modal" data-bs-target="#searchFriendBt">친구검색</button> -->

        <button class="btn btn-primary btn-circle" id="friendSearchBt" data-bs-toggle="modal" data-bs-target="#searchFriendBt">
          <i class="search-icon"></i>
        </button>

</span>
            </div>
         </div>
         
<%--       <div id="friendListTotal">
         <div id="friendprofile">
            <img alt="" id="msg_profile" src="${path }/resources/images/프로필 기본 이미지.jpg">
         </div>
         <div id="friendNic">
            <b>차니니니니니</b>
         </div>
         <div id="freindChat">
            <button onclick="chatStartx()">채팅</button>
         </div>
      </div>
      <div id="friendRow"></div> --%>
      
      
   </div>
   <div id="friendListAll"></div>
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

<!-- 친구검색 -->
  <div class="modal fade" id="searchFriendBt" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body" id="divIdSearch">
          <input type="text" id="idSearch" placeholder="검색">
          <div id="searchResult"></div>
        </div>
        <div class="modal-footer">
        </div>
      </div>
    </div>
  </div>

<!-- 친구삭제확인 -->
  <div class="modal fade" id="outChatCheck" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <br>친구를 삭제하시겠습니까?<br><br>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="deleteF">
             예
          </button>        
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="modalFN">아니오</button>
        </div>
      </div>
    </div>
  </div>
<script>
	let cPage;
	let loginMemberNo;
	(() => {
		cPage=1
		loginMemberNo=${loginMember.memberNo},
	    friendList(cPage,loginMemberNo)
	})();
	
	//친구 목록 출력
	function friendList(cPage,loginMemberNo){
		$("#friendListAll").empty();
		$("#pageBar").remove();
		
		$.ajax({
			url:"${path}/friend/friendList.do",
			data:{
	          loginMemberNo:loginMemberNo,
	          cPage:cPage,
	          functionN:"friendList"
			},
			success:data=>{
				console.log(data);
				selectFriendList(data,loginMemberNo);
			}
		})
	}
	
	//검색기능
	$("#idSearch").keyup(function(){
		console.log($("#idSearch").val());
		//검색어가 없을 때 (조건 없으면 전체 불러옴)
		if($("#idSearch").val()==""){
			$("#searchResult").empty();
		}else{
			$("#searchResult").empty();
			$.ajax({
				url:"${path}/friend/friendSearch.do",
				data:{
					keyword:$("#idSearch").val(),
					loginMemberNo:loginMemberNo
				},
				success:data=>{
					console.log(data);
					$("#idSearch").empty();
					friendSearch(data,loginMemberNo);
				}
			})
		}
	})

	//친구추가
	$(document).on("click",".insertFriend",function(e){
		const memberNo=e.target.nextSibling.defaultValue;
		console.log(e)
		$.ajax({
			url:"${path}/friend/insertFriend.do",
			data:{
				loginMemberNo:${loginMember.memberNo},
				memberNo:memberNo
			},
			success:data=>{
				//친구추가 완료되면 신청대기 버튼으로 바꾸기
				$(e.target).text("신청대기");
				$(e.target).attr("class","cancleF");
			}
		})
	});

	
	//검색창 닫으면 신청대기버튼 class명 바꾸기
    $('#searchFriendBt').on('hidden.bs.modal', function () {
    	$(".cancleF").attr("class","cancleFa");
   }) 
	
	//신청취소 (친구목록)
	$(document).on("click",".cancleFa",function(e){
		const memberNo=e.target.nextSibling.defaultValue;
		$.ajax({
			url:"${path}/friend/cancleFriend.do",
			data:{
				loginMemberNo:${loginMember.memberNo},
				memberNo:memberNo				
			},
			success:data=>{
				location.reload();
			}
		})
	});
	
	//신청취소 (검색화면)
	$(document).on("click",".cancleF",function(e){
		const memberNo=e.target.nextSibling.defaultValue;
		$.ajax({
			url:"${path}/friend/cancleFriend.do",
			data:{
				loginMemberNo:${loginMember.memberNo},
				memberNo:memberNo				
			},
			success:data=>{
				$(e.target).text("친구추가");
				$(e.target).attr("class","insertFriend");				
			}
		})
	});
	
	//친구수락
	$(document).on("click",".acceptF",function(e){
		console.log(e.target.nextSibling.defaultValue);
		const memberNo=e.target.nextSibling.defaultValue;
		$.ajax({
			url:"${path}/friend/acceptFriend.do",
			data:{
				loginMemberNo:${loginMember.memberNo},
				memberNo:memberNo				
			},
			success:data=>{
				$(e.target).text("채팅");
				$(e.target).attr("class","chatF");		
				location.reload();
			}
		})
	});
	
    //x 버튼 누르면 예 버튼에 친구 번호 hidden으로 넣어주기
    $(document).on("click",".deleteF",function(e){
       const friendMemberNO=e.target.attributes.value.textContent; //채팅방번호
       const $deleteHidden=$("<input>").attr({"type":"hidden","id":"deleteHidden"});
       $deleteHidden.text(friendMemberNO);
       $("#deleteF").append($deleteHidden);
    })
   
   //예 -> friend에서 삭제
   $(document).on("click","#deleteF",function(e){
      const friendMemberNO=$("#deleteHidden").text();
      $.ajax({
         url:"${path}/friend/deleteFriend.do",
         data:{
            loginMemberNo:${loginMember.memberNo},
            friendMemberNO:friendMemberNO
         },
         success:data=>{
            location.reload();
         }
      })
   });
   
    //검색창 닫으면 목록 새로고침
    $('#searchFriendBt').on('hidden.bs.modal', function () {
    	location.reload();
   }) 

   //채팅창 닫으면 목록 새로고침
    $('#exampleModal').on('hidden.bs.modal', function () {
       //friendList(cPage,loginMemberNo)
       location.reload();
   }) 
   
   //채팅버튼클릭
   $(document).on("click",".chatF",function(e){
       console.log(e.currentTarget.nextSibling.defaultValue); //친구번호
      const friendMemberNO=e.currentTarget.nextSibling.defaultValue;
       //기존 채팅방 있는지 확인
      $.ajax({
         url:"${path}/msg/chatroomCheck/do",
         data:{
            "loginMember":${loginMember.memberNo},
            "memberNo":friendMemberNO
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
                                       "memberNo":friendMemberNO,
                                       "chatRoomNo":result
                                    },
                                    success:data=>{
                                       console.log($("#openChat"));
                                       $("#openChat")[0].click();
                                       
                                       // ---------- 채팅 ---------- 
                                       
                                       var today = new Date();

                                       const servername1="wss://gd1class.iptime.org:8844/GDJ56_gamgak_final/chatting_Server"
                                          //ws://gd1class.iptime.org:9999/GDJ56_gamgak_final/chatting_Server
                                          const servername="ws://localhost:9090/GDJ56_gamgak_final/chatting_Server"
                                          const websocket=new WebSocket(servername);
                                       
                                       websocket.onopen=(data)=>{
                                          console.log(data);
                                          
                                          websocket.send(JSON.stringify(new Chat("open","",result,"",'${loginMember.memberNickName}',"",today,"")))
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
                                          //메세지 내용 없으면 안보냄
                                          if(msg==""){
                                             
                                          }else{
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
                                                   const sendData=new Chat("msgCh","",data.data.PERSONAL_CHATROOM_NO,data.data.MEMBER_NICKNAME,'${loginMember.memberNickName}',msg,today,1,data.data.PROFILE_ORINAME,data.data.PROFILE_RENAME);
                                                   console.log(sendData);
                                                   websocket.send(JSON.stringify(sendData));
                                                   $(".msg_text").val('');
                                                   $(".msg_text").attr("placeholder","내용을 입력해주세요");               
                                                   
                                                   //보낸 메세지 DB에 저장하기
                                                     $.ajax({
                                                      url:"${path}/msg/insertMsg.do",
                                                      data:{
                                                         "personalChatroomNo":result,
                                                         "receiverNo":friendMemberNO,
                                                         "senderNo":${loginMember.memberNo},
                                                         "content":msg
                                                      },
                                                      success:data=>{
                                                      }  
                                                     })
                                                }
                                             })
                                          }
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
               //기존 채팅내역 출력
               $("#chat").empty();
               $("#personalChatroomNo").remove();               
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
               
               // ---------- 채팅 ---------- 
               
               var today = new Date();

               const servername1="wss://gd1class.iptime.org:8844/GDJ56_gamgak_final/chatting_Server"
                  //ws://gd1class.iptime.org:9999/GDJ56_gamgak_final/chatting_Server
                  const servername="ws://localhost:9090/GDJ56_gamgak_final/chatting_Server"
                  const websocket=new WebSocket(servername);
               
               websocket.onopen=(data)=>{
                  console.log(data);
                  
                  websocket.send(JSON.stringify(new Chat("open","",personalChatroomNo,"",'${loginMember.memberNickName}',"",today,"")))
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
                           console.log(data.data.PROFILE_ORINAME);
                           // 서버로 메세지 보내기
                           const sendData=new Chat("msgCh","",data.data.PERSONAL_CHATROOM_NO,data.data.MEMBER_NICKNAME,'${loginMember.memberNickName}',msg,today,1,data.data.PROFILE_ORINAME,data.data.PROFILE_RENAME);
                           console.log(sendData);
                           websocket.send(JSON.stringify(sendData));
                           $(".msg_text").val('');
                           $(".msg_text").attr("placeholder","내용을 입력해주세요");               
                           
                           //보낸 메세지 DB에 저장하기
                             $.ajax({
                              url:"${path}/msg/insertMsg.do",
                              data:{
                                 "personalChatroomNo":personalChatroomNo,
                                 "receiverNo":friendMemberNO,
                                 "senderNo":${loginMember.memberNo},
                                 "content":msg
                              },
                              success:data=>{
                              }  
                             })
                             
                             //해당 방에서 로그인 한 회원의 enterchat정보
                                $.ajax({
                                   url:"${path}/msg/chatroomLoginMember.do",
                                data:{
                                   "personalChatroomNo":personalChatroomNo,
                                 "loginMemberNo":${loginMember.memberNo}
                                },
                                success:result=>{
                                   console.log(result.data.CHAT_OUT_YN);
                                 //상대방이 채팅방을 나갔다면
                                  if(data.data.CHAT_OUT_YN=="Y"){
                                    //상대방의 ENTERCHAT OUT을 null로 수정
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
                                 //로그인한 본인이 나갔다면   
                                 }else if(result.data.CHAT_OUT_YN=="Y"){
                                    //로그인 회원 ENTERCHAT OUT을 null로 수정
                                      $.ajax({
                                       url:"${path}/msg/updateLoginMemberChatOut.do",
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
                     })
                  }
               });
            }
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