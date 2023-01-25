<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${path }/resources/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/chatting.js"></script>
<div style="display: flex">
    <div>
        <div id="chattingRoom" style="display: flex; justify-content: space-between;  width: 750px; height: 600px; overflow-y: scroll;">
            <div id="my" style="border: 1px yellow solid; height: 65px; width: 400px;">
                <span>참_이슬언니</span>
                <div>
                    <img style="border: 1px saddlebrown solid; border-radius: 100%; width: 30px; height: 30px;">
                    <span>우와왕</span>
                </div>

            </div>
            <div id="other" style="border: 1px green solid; height: 65px; width: 400px; text-align: end;">
                <span>JJ</span>
                <div>
                    <span>우와왕</span>
                    <img style="border: 1px saddlebrown solid; border-radius: 100%; width: 30px; height: 30px;">
                </div>

            </div>
        
        </div>
        <div id="chatting input" style="display: flex; border: 1px black solid; width: 750px; height: 90px;  background-color: rgb(204, 205, 204);" >
            <form style="margin: auto;">
                <input id="msg" type="text" style="width: 550px; height: 50px;border: 1px white solid; border-radius: 5px;" placeholder="내용을 입력하세요">
                <!-- <input type="submit" class="btn btn-danger" value="입력"> -->
                <button id="sendBtn" class="btn btn-danger">전송</button>
            </form>
            

        
        </div>
    
    </div>
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
		const websocket=new WebSocket("ws://localhost:9090/jjh_meetting/chattingroom");
		
		websocket.onopen=(data)=>{
			console.log(data)
			websocket.send(JSON.stringify(new Chat(1,10,4,'${loginMember.memberEmail}',msg,"","3","open")));
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
			const sendData=new Chat("1","10","",'${loginMember.memberEmail}',msg,"","msg");
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
	</script>
























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
            
