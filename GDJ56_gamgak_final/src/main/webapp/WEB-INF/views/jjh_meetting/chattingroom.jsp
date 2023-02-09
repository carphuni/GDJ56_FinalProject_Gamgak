<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- jQuery library -->
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- 부트스트랩 css/js -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/chatting.js"></script>
<div style="display: flex;">
	<div>
         <div id="chattingRoom" class="chattingRoom" style="border: 5px black solid; width: 750px; height: 600px; overflow-y: scroll;">
             
             
  
         
        </div>
        <div id="chatting input" style="display: flex; border: 1px black solid; width: 750px; height: 90px;  background-color: rgb(204, 205, 204);" >
            <div style="margin: auto;">
                <input id="inputmsg" type="text" style="width: 550px; height: 50px;border: 1px white solid; border-radius: 5px;" placeholder="내용을 입력하세요">
                 <button id="sendBtn" class="btn btn-danger">전송</button>
			</div>
            

        
        </div>
    
    </div>
    <div>

    </div>
    
    


<!-- <script type="text/javascript">
	var ws;

	function wsOpen(){
		ws = new WebSocket("ws://" + location.host + "/jjh_meetting/chattingroom");
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 초기화 세팅하기
		}
		
		ws.onmessage = function(data) {
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				$("#chattingRoom").append("<p>" + msg + "</p>");
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

	function chatName(){
		var userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			$("#yourName").hide();
		}
	}

	function send() {
		var uN = $("#userName").val();
		var msg = $("#inputmsg").val();
		ws.send(uN+" : "+msg);
		$('#inputmsg').val("");
	}
</script> -->

    
    
    
    
    
    

    
    

    
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
		            <c:if test="${loginMember.memberNo!=s.MEMBER_LEADER_NO}">
			            <div style="margin: 5px; display: flex;">
			                <button class="btn btn-danger" style="width: 90px; height: 30px; font-size: 15px; margin: auto;" onclick="window.open('${path}/meetting/meettingmanage.do','채팅방','_blank, resizable=no,width=1000px,height=720px,scrollbars=no')">수정하기</button>
			            </div>	
		            </c:if>
		            <c:if test="${loginMember.memberNo==s.MEMBER_LEADER_NO}">
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
		                        <button style="border: #dc3545 1px solid; background: #dc3545; border-radius: 5px; color: white; font-size: 12px; " data-bs-toggle="modal" data-bs-target="#userreport">신고하기</button>
		                    </div>
		                    

		                </div>
		                		
		              </c:when>
		              <c:otherwise>
		              	<c:forEach var="s" items="${chatmemberlist }">
		              		<div style="display: flex; flex-direction: column; overflow-y: scroll; height: 200px; border: 5px #dc3545 solid;">
		                    	<div >
		                        	<img src="${path}/resources/upload/meeting/${s.MEETING_ORINAME}" style="border: 5px #dc3545 solid solid; width: 20px; height: 20px; border-radius: 100%; background-color: #dc3545;">
		                        	<span>${s.MEMBER_NICKNAME}</span>
		                        	<c:if test="${loginMember.memberNo==s.MEMBER_NO}">
		                        		
		                        	</c:if>
		                        	<c:if test="${loginMember.memberNo!=s.MEMBER_NO}">
				                        <button style="border: #dc3545 1px solid; background: #dc3545; border-radius: 5px; color: white; font-size: 12px; " data-bs-toggle="modal" data-bs-target="#userreport">신고하기</button>
		                        		
		                        	</c:if>
		                        	<c:if test="${loginMember.memberNo!=s.MEMBER_NO}">
				                        <button style="border: #dc3545 1px solid; background: #dc3545; border-radius: 5px; color: white; font-size: 12px; " data-bs-toggle="modal" data-bs-target="#userreport">신고하기</button>
		                        		
		                        	</c:if>
		                    	</div>
		                    

		                	</div>
		              		
		              	</c:forEach>
		              </c:otherwise>
		            </c:choose>

		                
		                <div style="margin: 2px;">
		                	<c:if test="${loginMember.memberNickName != 'admin' || loginMember.memberNo != s.MEMBER_LEADER_NO }">
			                    <button type="button"  style="border: #dc3545 1px solid; background: #dc3545; border-radius: 5px; color: white; font-size: 12px;" data-bs-toggle="modal" data-bs-target="#meettingreport">모임 삭제하기</button>
		                	</c:if>
		                	<%-- <c:if test="${loginMember.memberNickName != 'admin' }">
			                    <button type="button"  style="border: #dc3545 1px solid; background: #dc3545; border-radius: 5px; color: white; font-size: 12px;" data-bs-toggle="modal" data-bs-target="#meettingreport">모임신고하기</button>
		                	</c:if> --%>
		                	<c:if test="${loginMember.memberNickName == 'admin' && loginMember.memberNo == s.MEMBER_LEADER_NO }">
			                    <button type="button"  style="border: #dc3545 1px solid; background: #dc3545; border-radius: 5px; color: white; font-size: 12px;">나가기</button>
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
			websocket.send(JSON.stringify(new Chat("open",0,"",'${loginMember.memberNickName}',"",today,0)))
			
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
		
		
		
		$("#sendBtn").click(e=>{
			const msg=$("#inputmsg").val();
			//const sendData=new Message("msg",'${loginMember.memberNickName}',"",msg,"");
			const sendData=new Chat("msg",0,"",'${loginMember.memberNickName}',msg,today,0);
			websocket.send(JSON.stringify(sendData));
			$("#inputmsg").val('');
		});
		
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
			constructor(type, meetingNo, memberReceuver,memberSender,chattingContent,chattingEnrollDate,chattingUnreadCnt){
				this.type=type;
				this.meetingNo=meetingNo;
				this.memberReceuver=memberReceuver;
				this.memberSender=memberSender;
				this.chattingContent=chattingContent;
				this.chattingEnrollDate=chattingEnrollDate;
				this.chattingUnreadCnt=chattingUnreadCnt;
			}
		}
		
		
	</script>	 











 <!-- <script>
 		var today=new Date();
		const websocket=new WebSocket("ws://localhost:9090/jjh_meetting/chattingroom");
		
		websocket.onopen=(data)=>{
			console.log(data)
			websocket.send(JSON.stringify(new Chat(1,10,4,20,msg,today,3,"open")));
		}
		
		websocket.onmessage=(response)=>{
			console.log(response);
			const msg=JSON.parse(response.data);
			console.log(msg);
			switch(msg.type){
				case "system" : addMsgSystem(msg);break; 
				case "msg" : printMsg(10,msg);break; 
			}
		}
		
		$("#sendBtn").click(e=>{
			const msg=$("#msg").val();
			const sendData=new Chat(1,10,4,20,msg,today,3,"open");
			websocket.send(JSON.stringify(sendData));
		});
		
		class Chat{
			constructor(chatNo,meetingNo,memberReceuverNo,
					memberSenderNo,chattingContent,
					chattingEnrollDate,chattingUnreadCnt,Type){
				this.chatNo=chatNo;
				this.meetingNo=meetingNo;
				this.memberReceuverNo=memberReceuverNo;
				this.memberSenderNo=memberSenderNo;
				this.chattingContent=chattingContent;
				this.chattingEnrollDate=chattingEnrollDate;
				this.chattingUnreadCnt=chattingUnreadCnt;
				this.Type=Type;
			}
		}
	</script> -->
























  <!-- meeting Modal-->
 <div class="modal fade" id="meettingreport" tabindex="-1" aria-labelledby="#meettingreport" aria-hidden="true" >
    <div class="modal-dialog">
      <div class="modal-content">
		<form>
        	<div class="modal-header">
				<input type="text" style="border: 3px #dc3545 solid; border-radius: 5px; height: 40px; width: 300px;" placeholder="신고제목을 입력하세요">
					<select style="border: 3px #dc3545 solid; border-radius: 5px; height: 40px; width: 150px;">
                    	<option value="상업적/홍보성">상업적/홍보성</option>
                   		<option value="음란/선정성">음란/선정성</option>
                    	<option value="불법정보">불법정보</option>
                    	<option value="욕설/인신공격">욕설/인신공격</option>
                    	<option value="기타">기타</option>
                	</select>
                <div style="display: flex; flex-direction: column; display: flex; font-weight: bolder; margin: 15px 0px 0px 0px;">
                    <span style="margin: auto;">신고자 아이디 : 00000</span>
                    <span style="margin: auto;">신고시간 : 00000000</span>
                </div>
        	</div>
            <div class="modal-body">
                <textarea style="border: 3px #dc3545 solid; height: 300px; width: 470px;" placeholder="내용을 입력하시오"></textarea>
            </div>
            <div class="modal-footer">
                <input class="btn btn-danger" type="submit" value="신고하기">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
             
            </div>

    	</form>
      </div>
    </div>
  </div>


   <!--user Modal -->
    <div class="modal fade" id="userreport" tabindex="-1" aria-labelledby="#userreport" aria-hidden="true" >
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
			<input type="text" style="border: 3px #dc3545 solid; border-radius: 5px; height: 40px; width: 300px;" placeholder="신고제목을 입력하세요">
			<select style="border: 3px #dc3545 solid; border-radius: 5px; height: 40px; width: 150px;">
				<form>
                    <option value="상업적/홍보성">상업적/홍보성</option>
                    <option value="음란/선정성">음란/선정성</option>
                    <option value="불법정보">불법정보</option>
                    <option value="욕설/인신공격">욕설/인신공격</option>
                    <option value="기타">기타</option>
                </select>
                <div style="display: flex; flex-direction: column; display: flex; font-weight: bolder; margin: 15px 0px 0px 0px;">
                    <span style="margin: auto;">신고자 아이디 : 00000</span>
                    <span style="margin: auto;">신고시간 : 00000000</span>
                </div>
            </div>
            <div class="modal-body">
                <textarea style="border: 3px #dc3545 solid; height: 300px; width: 470px;" placeholder="내용을 입력하시오"></textarea>
            </div>
            <div class="modal-footer">
                <input class="btn btn-danger" type="submit" value="참여하기">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
             
            </div>

            </form>
      </div>
    </div>
  </div>
           
