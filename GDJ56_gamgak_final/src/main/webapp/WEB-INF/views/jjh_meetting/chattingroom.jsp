<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
    <!-- jQuery library -->
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!-- path -->
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	<!-- 부트스트랩 css/js -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!--시큐리티 로그인 세션-->
	<c:set var="loginMember" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/>
	<!--css-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/jjh_css/chatRoom.css" >   
	  

  
    <!-- <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
	 -->
	 <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	 



<script src="${pageContext.request.contextPath }/resources/js/chatting.js"></script>
<div style="display: flex;">
	<div id="aa">
         <div id="chattingRoom" class="chattingRoom" style="border: 5px black solid; width: 750px; height: 600px; overflow-y: scroll;">
			 <!-- <div id="chat" style="border: 1px #dc3545 solid;">
	
			
			</div> 
			 <div id="chatStroy" style="border: 1px blue solid;">
			
			</div>  -->
	
			
            
        </div>
        <div id="chatting input" style="display: flex; border: 1px black solid; width: 750px; height: 90px;  background-color: rgb(204, 205, 204);" >
            <div style="margin: auto;">
                <input id="inputmsg" type="text" style="width: 550px; height: 50px;border: 1px white solid; border-radius: 5px;" placeholder="내용을 입력하세요">
                 <button id="sendBtn" class="btn btn-danger">전송</button>
			</div>
            

        
        </div>
    
    </div>


    
    <div>
        <style>
            #chatInfo{
                border: 1px black solid;
            }
        </style>
        <c:choose>
        	<c:when test="${empty chatRoominfo}">
        		<div>정보가 없습니다.</div>
        	</c:when>
        <c:otherwise>
        	<c:forEach var="m" items="${chatRoominfo}">
		        <div id="chattinginfo" style="border: 5px #dc3545  solid; width: 220px; height: 690px;">
		            <div style="border: 5px #dc3545 solid; height: 360px; display: flex; flex-direction: column; text-align: center; font-size: 20px; font-weight: bolder; overflow-y: scroll;" >
		                <span id="chatInfo" style="border: 5px #dc3545 solid; ">감각</span>
		                <span id="chatInfo">${m.MEETING_TITLE }</span>
		                <span id="chatInfo">${m.MEETING_DETAILED_ADDR }</span>
		                <c:if test="${m.MEETING_GENDER=='무관' }">
		                	<span id="chatInfo">성별무관</span>
		                </c:if>
		                <c:if test="${m.MEETING_GENDER!='무관' }">
		                	<span id="chatInfo">${m.MEETING_GENDER}모임</span>
		                </c:if>
		                <c:if test="${m.MEETING_MINAGE==1 && m.MEETING_MAXAGE==99}">
		                	<span id="chatInfo">나이대 무관</span>
		                </c:if>
		                <c:if test="${m.MEETING_MINAGE!=1 && m.MEETING_MAXAGE!=99}">
		                	<span id="chatInfo">${m.MEETING_MINAGE}세 ~ ${m.MEETING_MAXAGE }세</span>
		                </c:if>
		                <div id="chatInfo" style="display: flex; flex-direction: column;">
		                <c:if test="${m.MEETING_DATE==NULL}">
		                	<span>모임시간 미정</span>
		                </c:if>
		               	<c:if test="${m.MEETING_DATE!=NULL}">
		                	<span>${m.MEETING_DATE}</span>
		                </c:if>
		                </div>
						

		                
		                <div id="chatInfo">
		                	<span>인원수</span>
		                    <span>[ ${m.MEETING_CURRENT_COUNT} / ${m.MEETING_PEOPLENUM} ]</span>
		                    
		                </div>
		            </div>
		            <c:if test="${loginMember.memberNo==m.MEMBER_LEADER_NO}">
			            <div style="margin: 5px; display: flex;">
			                <button class="btn btn-danger" style="width: 90px; height: 30px; font-size: 15px; margin: auto;" onclick="location.assign('${path}/meetting/updatemeetting.do?memberNo=${m.MEMBER_LEADER_NO }&meetingNo=${m.MEETING_NO}')">수정하기</button>
			            </div>	
		            </c:if>
		            <c:if test="${loginMember.memberNo!=m.MEMBER_LEADER_NO}">
			            <div style="margin: 5px; display: flex;">
			                <button class="btn btn-danger" style="width: 120px; height: 30px; font-size: 15px; margin: auto;" data-bs-toggle="modal" data-bs-target="#meettingreport">모임신고하기</button>
			            </div>	
		            </c:if>
		            

		
		            <div style=" height: 298px; display: flex; flex-direction: column; text-align: center;">
		                <h3 style="border: 5px #dc3545 solid; color: black; font-weight: bolder;">멤버리스트</h3>
		            <c:choose>
		              <c:when test="${empty chatmemberlist }">
		              	 <div style="display: flex; flex-direction: column; overflow-y: scroll; height: 200px; border: 5px #dc3545 solid;">
		                    <div >
		                        <img style="border: 5px #dc3545 solid solid; width: 20px; height: 20px; border-radius: 100%; background-color: #dc3545;">
		                        <span>리스트없습니다.</span>
		                    </div>
		                    

		                </div>
		                		
		              </c:when>
		              <c:otherwise>
		              		<div style="display: flex; flex-direction: column; overflow-y: scroll; height: 200px; ">
		              	<c:forEach var="s" items="${chatmemberlist }">
		                    	<div style=" display: flex; justify-content: space-between; margin: 0px 0px 20px 0px">
		                    		<div>
			                        	<img src="${path}/resources/upload/meeting/${s.MEETING_ORINAME}" style="border: 5px #dc3545 solid solid; width: 40px; height: 40px; border-radius: 100%; background-color: #dc3545;">
			                        	<span>${s.MEMBER_NICKNAME}</span>
		                    		
		                    		</div>
		                        	<c:if test="${loginMember.memberNickName!=s.MEMBER_NICKNAME}">
										<button style="border: #dc3545 1px solid; background: #dc3545; border-radius: 5px; color: white; font-size: 12px; " data-bs-toggle="modal" data-bs-target="#userreport" onclick="fun_userInfo('${s.MEMBER_NO}' ,'${s.MEMBER_NICKNAME}');">신고하기</button>
		                        		
		                        	</c:if>
		                        	<c:if test="${loginMember.memberNickName==s.MEMBER_NICKNAME}">
		                        		
		                        	</c:if>
		                        
		                    	</div>
		                    

		              	</c:forEach>
		                	</div>
		              		
		              </c:otherwise>
		            </c:choose>

		                
		                <div style="margin: 2px;">
		                	<c:if test="${loginMember.memberNickName == 'admin' || loginMember.memberNo == m.MEMBER_LEADER_NO }">
			                    <button type="button" onclick="meetingDelete(${m.MEETING_NO })"  style="border: #dc3545 1px solid; background: #dc3545; border-radius: 5px; color: white; font-size: 12px;">모임 삭제하기</button>
		                	</c:if>
		                	<c:if test="${loginMember.memberNickName != 'admin' && loginMember.memberNo != m.MEMBER_LEADER_NO }">
			                    <!-- <button onclick="location.assign('${path}/meetting/meettingjoinEndNN.do?memberNo=${loginMember.memberNo }&meetingNo=${m.MEETING_NO }')" type="button"  style="border: #dc3545 1px solid; background: #dc3545; border-radius: 5px; color: white; font-size: 12px;">나가기</button> -->
			                    <button onclick="meetingNN(${m.MEETING_NO })" type="button"  style="border: #dc3545 1px solid; background: #dc3545; border-radius: 5px; color: white; font-size: 12px;">나가기</button>

							</c:if>
		                    
		                </div>
		            </div>
		            
		            
		            
		    
		        </div>
        		
        	</c:forEach>
        </c:otherwise>
    </c:choose>
    </div>

</div>

<!--채팅 js-->

 <script>


 function meetingDelete(a){
		if (!confirm("모임을 삭제하시겠습니까?")) {
			alert("취소(아니오)를 누르셨습니다.");
			
     } else {
     	if(confirm("정말로 삭제하시겠습니까?")){
     		location.assign('${path}/meetting/meettingDelete.do?memberNo=${loginMember.memberNo }&meetingNo='+a)
     	}
			
			
     }

	}
 
 
	function meetingNN(a){
		if (!confirm("모임에 나가시겠습니까?")) {
			alert("취소(아니오)를 누르셨습니다.");
			
        } else {
        	if(confirm("다시는 모임에 참여할수업습니다.")){
        		location.assign('${path}/meetting/meettingjoinEndNN.do?memberNo=${loginMember.memberNo }&meetingNo='+a)
        	}
			
			
        }

	}
	


	// 모임 정보
 	var chatMeetngNo="${chatRoominfo[0].MEETING_NO}";
	console.log(chatMeetngNo);
	

 	
		var today = new Date();
		const servername1="wss://gd1class.iptime.org:8844/GDJ56_gamgak_final/chatting_Server"
			//ws://gd1class.iptime.org:9999/GDJ56_gamgak_final/chatting_Server
			const servername="ws://localhost:9090/GDJ56_gamgak_final/jjh_chatting_Server"
			const websocket=new WebSocket(servername);
	
		//const websocket=new WebSocket("ws://localhost:9090/chatting_Server");
		//소켓을 만드는 역활
		
		websocket.onopen=(data)=>{
			//연결이 되었을때 발생함
			console.log("소켓연결"+data);
			//websocket.send(JSON.stringify(new Message("open",'${loginMember.memberNickName}',"","","")));
			websocket.send(JSON.stringify(new Chat("open",chatMeetngNo,0,"",'${loginMember.memberNickName}',"",today,0)))
			
		}
		
		websocket.onmessage=(response)=>{
			//데이터를 수신하였을때 발생함.
			console.log("onmassage-response"+response);
			const msg=JSON.parse(response.data);
			console.log("onmassage-msg"+msg);
			switch(msg.type){
				case "system" : addMsgSystem(msg);break; 
				case "msg" : printMsg('${loginMember.memberNickName}',msg);break;
			}
		}

		// 메세지 받아오기
	 $.ajax({
		type : "POST",
		url : '${path}/meeting/chatList.do',
		async : false,
		data : {
			meetingNo : chatMeetngNo
		},
		success : function(data){
			console.log(data);
			console.log("채팅방 채팅정보 불러오기");
			$("#chattingRoom").html(data);
			
		},
		error : function(error){
			console.log("채팅방 채팅정보 불러오기 실패");

		},
	}) 
	
	
		
		
		 $("#sendBtn").click(e=>{ 
			const msg=$("#inputmsg").val();
			$("#inputmsg").val('');
			//const sendData=new Message("msg",'${loginMember.memberNickName}',"",msg,"");
			 const sendData=new Chat("msg",chatMeetngNo,null,"",'${loginMember.memberNickName}',msg,today,null);
			//타입, 모임 번호, 개인방번호, 리시버, 샌더, msg, 날짜 읽은 사람숫자
			//websocket.send(JSON.stringify(sendData));
			$("#inputmsg").val(''); 
			console.log(chatMeetngNo,"${loginMember.memberNo}",msg,today)

			$.ajax({
				url : '${path}/meeting/msginsert.do',
				type : "POST",
				data : {
					meetingNo : chatMeetngNo,
					sender :"${loginMember.memberNo}",
					msg : msg,
					enrollerChat : today 
				},
				success : function(data){
					console.log("성공");
	  				//타입, 모임 번호, 개인방번호, 리시버, 샌더, msg, 날짜 읽은 사람숫자
					//const sendData=new Chat("msg",chatMeetngNo,null,"",'${loginMember.memberNickName}',msg,today,null);
	  				websocket.send(JSON.stringify(sendData));
	  				$("#inputmsg").val('');
	  				$("#inputmsg").attr("placeholder","내용을 입력해주세요");
				
					


					
					
					




				},
				error : function(error){
					console.log("실패");
				}

			})



	})

	




		
		class Message{
			constructor(type,sender,reciever,msg,room){
				this.type=type;
				this.sender=sender;
				this.reciever=reciever;
				this.msg=msg;
				this.room=room;
			}
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

<c:set var="today" value="<%=new java.util.Date()%>" />
<!-- 현재날짜 -->
<%-- <c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy/MM/dd hh:mm:ss" /></c:set>  --%>
 <c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy/MM/dd" /></c:set>  


  <!-- meeting Modal-->
 <div class="modal fade" id="meettingreport" data-bs-backdrop="static" tabindex="-1" aria-labelledby="#meettingreport" aria-hidden="true" >
    <div class="modal-dialog">
      <div class="modal-content">
		<form action="${path}/report/report.do" onsubmit="return report();" method="post">
			<input name="type" type="hidden" value="meeting">
        	<div class="modal-header" style="display: flex; flex-direction: column;">
        		<div>
					<input id="reprotTitle" name="reprotTitle" type="text" style="border: 3px #dc3545 solid; border-radius: 5px; height: 40px; width: 300px;" placeholder="신고제목을 입력하세요">
					<select name="reportKind" style="border: 3px #dc3545 solid; border-radius: 5px; height: 40px; width: 150px;">
						<option value="신고 분류 선택">신고 분류 선택</option>
                    	<option value="상업적/홍보성">상업적/홍보성</option>
                   		<option value="음란/선정성">음란/선정성</option>
                    	<option value="불법정보">불법정보</option>
                    	<option value="욕설/인신공격">욕설/인신공격</option>
                    	<option value="기타">기타</option>
                	</select>
        		
        		</div>
                <div style="display: flex; flex-direction: column; font-weight: bolder; margin: 15px 0px 0px 0px;">
                    <span id="reportMeetingtitle" name="reportMeetingtitle" style="margin: auto;"></span>
					<input type="hidden" id="reportMeetingtitleH" name="reportMeetingNo">
                    <span name="reportTime" style="margin: auto;">신고시간 : <c:out value="${date}" /></span>
					<input name="reportTime" type="hidden" value="${date}">
					<span id="onsubmit_report" style="margin: auto; font-weight: bolder; font-size: 20px;"></span>
                </div>
        	</div>
            <div class="modal-body">
                <textarea name="reportContent" id="reportContent" style="border: 3px #dc3545 solid; height: 300px; width: 470px;" placeholder="내용을 입력하시오" maxlength="2000"></textarea>
            </div>
			<div style="display: flex; justify-content: right; padding: 0px 10px 10px 0px;"><p class="textCount">0</pclass="textTotal"><p>/1500자</p></div>
            <div class="modal-footer">
                <input class="btn btn-danger" type="submit" value="신고하기">
                <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
             
            </div>

    	</form>
      </div>
    </div>
  </div>


    <!-- user Modal -->
    <div class="modal fade" id="userreport" data-bs-backdrop="static" tabindex="-1" aria-labelledby="#userreport" aria-hidden="true" >
    <div class="modal-dialog">
      <div class="modal-content">
		 <form action="${path}/report/report.do" onsubmit="return report_user();" method="post">
			<input name="type" type="hidden" value="user">
        	<div class="modal-header" style="display: flex; flex-direction: column;">
        	<input id="reportMemberNo" type="hidden" name="memberNo">
				<div>

					<input id="reprotTitle_user" name="reprotTitle" type="text" style="border: 3px #dc3545 solid; border-radius: 5px; height: 40px; width: 300px;" placeholder="신고제목을 입력하세요">
						<select id="reportKind_user" name="reportKind_user" style="border: 3px #dc3545 solid; border-radius: 5px; height: 40px; width: 150px;">
						<option value="신고 분류 선택">신고 분류 선택</option>
						<option value="상업적/홍보성">상업적/홍보성</option>
						<option value="음란/선정성">음란/선정성</option>
						<option value="불법정보">불법정보</option>
						<option value="욕설/인신공격">욕설/인신공격</option>
						<option value="기타">기타</option>
					</select>
				</div>
                <div style="display: flex; flex-direction: column; font-weight: bolder; margin: 15px 0px 0px 0px;">
                    <span id="reportUserNickName" name="reportUserNickName" style="margin: auto;"></span>
                    <span name="reportTime" style="margin: auto;">신고시간 : <c:out value="${date}" /></span>
					<input name="reportTime" type="hidden" value="${date}">
					<span id="onsubmit_report_user" style="margin: auto; font-weight: bolder; font-size: 20px;"></span>
                </div>
            </div>
            <div class="modal-body">
                <textarea name="reportContent" id="reportContent_user" style="border: 3px #dc3545 solid; height: 300px; width: 470px;" placeholder="내용을 입력하시오"></textarea>
            </div>
            <div style="display: flex; justify-content: right; padding: 0px 10px 10px 0px;"><p class="textCount">0</pclass="textTotal"><p>/1500자</p></div>
            <div class="modal-footer">
                <input class="btn btn-danger" type="submit" value="신고하기">
                <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
             
            </div>

        </form>
      </div>
    </div>
  </div> 
           

<!-- 모달 분기처리 -->
  <script>
  var reportMemberNo=0;
  function fun_userInfo(a,b) {
	console.log("userNo : "+a);
	console.log("nickName : "+b);
	reportMemberNo=a;
  $("#reportMemberNo").val(a);
  $("#reportUserNickName").text("신고할 유저 닉네임 :"+b)
}

	// 모임 정보
	var chatMeetngTitle="${chatRoominfo[0].MEETING_TITLE}";
	console.log(chatMeetngTitle);

	$("#reportMeetingtitle").text("신고할 모임명 : "+chatMeetngTitle);
	$("#reportMeetingtitleH").val(chatMeetngNo);
	



	$('#reportContent').keyup(function (e) {
	let content = $(this).val();
    
    // 글자수 세기
    if (content.length == 0 || content == '') {
    	$('.textCount').text('0자');
    } else {
    	$('.textCount').text(content.length + '자');
    }
    
    // 글자수 제한
    if (content.length > 1499) {
    	// 200자 부터는 타이핑 되지 않도록
        $(this).val($(this).val().substring(0, 1500));
        // 200자 넘으면 알림창 뜨도록
        alert('신고내용은 1500자까지만 입력할 수 있습니다.');
    };
});


$('#reportContent_user').keyup(function (e) {
	let content = $(this).val();
    
    // 글자수 세기
    if (content.length == 0 || content == '') {
    	$('.textCount').text('0자');
    } else {
    	$('.textCount').text(content.length + '자');
    }
    
    // 글자수 제한
    if (content.length > 1499) {
    	// 200자 부터는 타이핑 되지 않도록
        $(this).val($(this).val().substring(0, 1500));
        // 200자 넘으면 알림창 뜨도록
        alert('신고내용은 1500자까지만 입력할 수 있습니다.');
    };
});



	$("#reprotTitle").val()

	const report=()=>{

		//신고 제목 유효성 검사
		if ($("#reprotTitle").val().trim()=="") {
			$('#onsubmit_report').css('color', '#dc3545').text("신고제목을 입력해주세요");
			$("#reprotTitle").focus();
			return false;
	 	}
		else{
			$('#onsubmit_report').text("");
		}

		const reportKind=$("select[name=reportKind]").val();
        console.log("신고"+reportKind)
       
         //신고분류 유효성 검사
        if(reportKind=="신고 분류 선택"){
            $('#onsubmit_report').text('신고분류를 선택해주세요');
            $('#onsubmit_report').css('color', '#dc3545');
            return false;
        }else{
            $('#onsubmit_report').text('');
        }

		//신고사유 유효성검사
		if ($("#reportContent").val().trim()=="") {
			$('#onsubmit_report').css('color', '#dc3545').text("신고 내용을 입력해주세요");
			$("#reportContent").focus();
			return false;
	 	}
		else{
			$('#onsubmit_report').text("");
		}


	}

	const report_user=()=>{
		//신고 제목 유효성 검사
		if ($("#reprotTitle_user").val().trim()=="") {
			$('#onsubmit_report_user').css('color', '#dc3545').text("신고제목을 입력해주세요");
			$("#reprotTitle_user").focus();
			return false;
		}
		else{
			$('#onsubmit_report_user').text("");
		}

		const reportKind_user=$("select[name=reportKind_user]").val();
		console.log(reportKind_user)
	

		//신고분류 유효성 검사
		if(reportKind_user=="신고 분류 선택"){
			$('#onsubmit_report_user').text('신고분류를 선택해주세요');
			$('#onsubmit_report_user').css('color', '#dc3545');
			return false;
		}else{
			$('#onsubmit_report_user').text('');
		}

		//신고사유 유효성검사
		if ($("#reportContent_user").val().trim()=="") {
			$('#onsubmit_report_user').css('color', '#dc3545').text("신고 내용을 입력해주세요");
			$("#reportContent_user").focus();
			return false;
		}
		else{
			$('#onsubmit_report_user').text("");
		}


		}



  </script>
