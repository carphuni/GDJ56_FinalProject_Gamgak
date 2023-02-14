<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- jQuery -->
   <script src = "${path }/resources/js/jquery-3.6.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="loginMember" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/>
	<c:choose>
		<c:when test="${empty meetingsignlist }">
			<div>없습니다.</div>
		</c:when>
		<c:otherwise>
			<c:forEach var="m" items="${meetingsignlist }">
				<div id="maindiv" style="border: 3.5px #dc3545 solid; display: flex; border-radius: 1rem; padding: 1rem; justify-content: space-between;">
					<div id="signinfo" style="display: flex; ">
						<img style="border: 1px black solid; border-radius: 100%; height: 60px; width: 60px;">
						<div id="nickage" style="display: flex; flex-direction: column; padding: 0px 0px 0px 10px;">
							<label>닉네임 : ${m.MEMBER_NICKNAME }</label>
							<label>나이 : ${m.MEMBER_AGE }</label>
						</div>
						<div id="genrep" style="display: flex; flex-direction: column; padding: 0px 0px 0px 10px;">
							<label>성별 : ${m.MEMBER_GENDER }</label>
							<label>신고 횟수 : 0회</label>
						</div>
			
														  
						</div>
						<div id="btnGroup" style="display: flex; flex-direction: column;">
							<button id="acceptmeeting" class="btn btn-danger" type="button" style="margin: 0px 0px 5px 0px" onclick="acceptmeetingY('${m.MEMBER_NO }','${m.MEETING_NO}')">신청 수락</button>
							<button class="btn btn-danger" type="button" style="margin: 0px 0px 5px 0px" onclick="acceptmeetingN('${m.MEMBER_NO }','${m.MEETING_NO}')">신청 거부</button>
						</div>
				</div>							
			</c:forEach>
		</c:otherwise>
	</c:choose>
	
	<script type="text/javascript">
		function acceptmeetingY(a,b) {
			console.log(a,b);
			$.ajax({
				type : "get",
				url : "/meetting/meettingjoinEndY.do",
				data :{
				 "memberNo" : a,
                 "meetingNo" : b
					
				},
				dataType : "html",
				success : function(res){
					console.log("신청참여"+res);
					alert("참여를 수락했습니다.");
					$("#signAtag").html(res);	
					
					
					
				},
				error :function(){
					alert("참여를 실패했습니다.");
					console.log("신청참여 실패"+res);
                }
			})
			
		}
		
		function acceptmeetingN() {
			console.log(a,b);
			$.ajax({
				type : "get",
				url : "/meetting/meettingjoinEndN.do",
				data :{
				 "memberNo" : a,
                 "meetingNo" : b
					
				},
				dataType : "html",
				success : function(res){
					alert("참여를 거부했습니다.")
					
				},
				error :function(){
                   
                  }
			})
			
		}
		
	</script>