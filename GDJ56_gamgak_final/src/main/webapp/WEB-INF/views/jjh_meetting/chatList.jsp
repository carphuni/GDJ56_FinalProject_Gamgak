<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <!-- jQuery library -->
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <!-- path -->
      <c:set var="path" value="${pageContext.request.contextPath }"/>
      <!-- 부트스트랩 css/js -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" >
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
      <!--시큐리티 로그인 세션-->
      <c:set var="loginMember" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/>
      <!--css-->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/jjh_css/chatRoom.css" >     
 <!--  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script> -->
    
      <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/chatting.js"></script>

    	<c:forEach var="ch" items="${chatList }">
    <c:choose>
	    	<c:when test="${loginMember.memberNo==ch.memberSenderNo }">
	    		<div id="myMsgwaf">
				
					<div id="myNameChat">
						<span id="mycheck">my</span>
						<p id="myp">${ch.chattingContent }</p>


					</div>
				</div> 
	    		
	    	</c:when>
	    	<c:otherwise>
				<div id="ontherMsgwaf">
					<img id="ontherImg">
					<div id="ontherNameChat" style="margin: 0px 0px 0px 10px;">
						<span id="ontherNickName">${ch.memberSenderNo}</span>
						<p id="ontherp">${ch.chattingContent }</p>
					</div>
		
				</div> 
	    	
	    	</c:otherwise>
    	
    </c:choose>
    	</c:forEach>
        
