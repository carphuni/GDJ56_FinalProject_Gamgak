<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- jQuery library -->
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${path }/resources/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/chatting.js"></script>
<div style="display: flex;">
	<div>
         <div id="chattingRoom" class="chattingRoom" style="border: 5px black solid; width: 750px; height: 600px; overflow-y: scroll;">
             
             
  
         
        </div>
        <div id="chatting input" style="display: flex; border: 1px black solid; width: 750px; height: 90px;  background-color: rgb(204, 205, 204);" >
            <div style="margin: auto;">
                <input id="inputmsg" type="text" style="width: 550px; height: 50px;border: 1px white solid; border-radius: 5px;" placeholder="내용을 입력하세요">
                <!-- <input type="submit" class="btn btn-danger" value="입력"> -->
				<!-- <div id="yourName">
					<table class="inputTable">
						<tr>
							<th>사용자명</th>
							<th><input type="text" name="userName" id="userName"></th>
							<th><button onclick="chatName()" id="startBtn">이름 등록</button></th>
						</tr>
					</table>
				</div> -->
               <!--  <button id="sendBtn" onclick="send()" class="btn btn-danger">전송</button> -->
                 <button id="sendBtn" class="btn btn-danger">전송</button>
			</div>
            

        
        </div>
    
    </div>
    <div>

    </div>
    
    
	<!-- <title>Chating</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		.container{
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		.container h1{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #FFBB00;
			border-left: 3px solid #FFBB00;
			margin-bottom: 20px;
		}
		.chating{
			background-color: #000;
			width: 500px;
			height: 500px;
			overflow: auto;
		}
		.chating p{
			color: #fff;
			text-align: left;
		}
		input{
			width: 330px;
			height: 25px;
		}
		#yourMsg{
			display: none;
		}
	</style>
</head> -->

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
        <div id="chattinginfo" style="border: 5px #dc3545  solid; width: 220px; height: 690px;">
            <div style="border: 5px #dc3545 solid; height: 360px; display: flex; flex-direction: column; text-align: center; font-size: 20px; font-weight: bolder; overflow-y: scroll;" >
                <span id="chatInfo" style="border: 5px #dc3545 solid; ">감각</span>
                <span id="chatInfo">치킨먹으면서 축구 볼사람@@</span>
                <span id="chatInfo">서울시 금천구 가산동 가산디지털1로 175</span>
                <span id="chatInfo">남성모임</span>
                <span id="chatInfo">20~30세</span>
                <div id="chatInfo" style="display: flex; flex-direction: column;">
                    <span>2020-01-23</span>
                    <span>PM 11:00</span>
                </div>
                
                <div id="chatInfo">
                    <span>[5/6]</span>
                    
                </div>
            </div>
            <div style="margin: 5px; display: flex;">
                <button class="btn btn-danger" style="width: 90px; height: 30px; font-size: 15px; margin: auto;" onclick="window.open('${path}/meetting/meettingmanage.do','채팅방','_blank, resizable=no,width=1000px,height=720px,scrollbars=no')">수정하기</button>
            </div>

            <div style=" height: 298px; display: flex; flex-direction: column; text-align: center;">
                <h3 style="border: 5px #dc3545 solid; color: black; font-weight: bolder;">멤버리스트</h3>
                <div style="display: flex; flex-direction: column; overflow-y: scroll; height: 200px; border: 5px #dc3545 solid;">
                    <div >
                        <img style="border: 5px #dc3545 solid solid; width: 20px; height: 20px; border-radius: 100%; background-color: #dc3545;">
                        <span>멤버리스트</span>
                        <button style="border: #dc3545 1px solid; background: #dc3545; border-radius: 5px; color: white; font-size: 12px; " data-bs-toggle="modal" data-bs-target="#userreport">신고하기</button>
                    </div>
                    <div >
                        <img style="border: 5px #dc3545 solid solid; width: 20px; height: 20px; border-radius: 100%; background-color: #dc3545;">
                        <span>멤버리스트</span>
                        <button style="border: #dc3545 1px solid; background: #dc3545; border-radius: 5px; color: white; font-size: 12px; " data-bs-toggle="modal" data-bs-target="#userreport">신고하기</button>
                    </div>
                    <div >
                        <img style="border: 5px #dc3545 solid solid; width: 20px; height: 20px; border-radius: 100%; background-color: #dc3545;">
                        <span>멤버리스트</span>
                        <button style="border: #dc3545 1px solid; background: #dc3545; border-radius: 5px; color: white; font-size: 12px; " data-bs-toggle="modal" data-bs-target="#userreport">신고하기</button>
                    </div>
                    <div >
                        <img style="border: 5px #dc3545 solid solid; width: 20px; height: 20px; border-radius: 100%; background-color: #dc3545;">
                        <span>멤버리스트</span>
                        <button style="border: #dc3545 1px solid; background: #dc3545; border-radius: 5px; color: white; font-size: 12px; " data-bs-toggle="modal" data-bs-target="#userreport">신고하기</button>
                    </div>
                    <div >
                        <img style="border: 5px #dc3545 solid solid; width: 20px; height: 20px; border-radius: 100%; background-color: #dc3545;">
                        <span>멤버리스트</span>
                        <button style="border: #dc3545 1px solid; background: #dc3545; border-radius: 5px; color: white; font-size: 12px; " data-bs-toggle="modal" data-bs-target="#userreport">신고하기</button>
                    </div>
                    <div >
                        <img style="border: 5px #dc3545 solid solid; width: 20px; height: 20px; border-radius: 100%; background-color: #dc3545;">
                        <span>멤버리스트</span>
                        <button style="border: #dc3545 1px solid; background: #dc3545; border-radius: 5px; color: white; font-size: 12px; " data-bs-toggle="modal" data-bs-target="#userreport">신고하기</button>
                    </div>
                    <div >
                        <img style="border: 5px #dc3545 solid solid; width: 20px; height: 20px; border-radius: 100%; background-color: #dc3545;">
                        <span>멤버리스트</span>
                        <button style="border: #dc3545 1px solid; background: #dc3545; border-radius: 5px; color: white; font-size: 12px; " data-bs-toggle="modal" data-bs-target="#userreport">신고하기</button>
                    </div>
                    <div >
                        <img style="border: 5px #dc3545 solid solid; width: 20px; height: 20px; border-radius: 100%; background-color: #dc3545;">
                        <span>멤버리스트</span>
                        <button style="border: #dc3545 1px solid; background: #dc3545; border-radius: 5px; color: white; font-size: 12px; " data-bs-toggle="modal" data-bs-target="#userreport">신고하기</button>
                    </div>
                    <div >
                        <img style="border: 5px #dc3545 solid solid; width: 20px; height: 20px; border-radius: 100%; background-color: #dc3545;">
                        <span>멤버리스트</span>
                        <button style="border: #dc3545 1px solid; background: #dc3545; border-radius: 5px; color: white; font-size: 12px; " data-bs-toggle="modal" data-bs-target="#userreport">신고하기</button>
                    </div>
                    
                   
                   
                </div>
                <div style="margin: 2px;">
                    <button type="button"  style="border: #dc3545 1px solid; background: #dc3545; border-radius: 5px; color: white; font-size: 12px;" data-bs-toggle="modal" data-bs-target="#meettingreport">모임신고하기</button>
                    <button type="button"  style="border: #dc3545 1px solid; background: #dc3545; border-radius: 5px; color: white; font-size: 12px;">나가기</button>
                </div>
            </div>
            
            
            
    
        </div>
    
    </div>

</div>

<!--채팅 js-->

<script>
		var today = new Date();
	
		const websocket=new WebSocket("ws://localhost:9090/jjh_meetting/chattingroom");
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
























  <!--meeting Modal -->
  <div class="modal fade" id="meettingreport" tabindex="-1" aria-labelledby="#meettingreport" aria-hidden="true" >
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
            <form>
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
                <input class="btn btn-danger" type="submit" value="참여하기">
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
            <form>
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
                <input class="btn btn-danger" type="submit" value="참여하기">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
             
            </div>

            </form>
      </div>
    </div>
  </div>
            
