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
    
      <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/chatting.js"></script>
    
	<c:choose>
                    	<c:when test="${empty selectMeeting}">
                    		<div>조회된 게시물이 없습니다.</div>
                    	</c:when>
                    	<c:otherwise>
                    		<c:forEach var="m" items="${selectMeeting }">
			                    <div style="display: flex; border: 3.5px #dc3545 solid; border-radius: 1rem; padding: 1rem; margin: 0.5rem" >
			                        <div style="display: flex; flex-direction: column;" class="col-10">
			                        	<c:if test="${m.meetingPeopleNum eq m.meetingCurrentCount}">
			                        		<span style="font-weight: bolder; color: #C1BEBB">모집완료</span>
			                        	</c:if>
			                        	<c:if test="${m.meetingPeopleNum > m.meetingCurrentCount}">
			                        		<span style="font-weight: bolder; color: #F3921C">모집중</span>
			                        	</c:if>
			                   
			                            <span style="font-weight: bolder; font-size: 18px;">${m.meetingTitle }</span>
			                            <div style="font-weight: bolder;">
			                                <img src="${path }/resources/images/사람들.png" style="height: 30; width: 30;"/>
			                                <span>
			                   <c:choose>
			                                		
			                                	 	<c:when test="${ m.meetingGender eq '무관' }">
			                                			<span>성별 무관 || </span> <span>${m.meetingMinAge }~${m.meetingMaxAge }세</span>
			                                			 
			                                		</c:when>
			                                		 <c:when test="${m.meetingGender eq '무관' && m.meetingMinAge eq 1 && m.meetingMaxAge eq 99}">
			                                			<span>누구나 참여 가능</span>
			                                		</c:when>
			                                		<c:when test="${m.meetingMinAge eq 1 && m.meetingMaxAge eq 99 }">
			                                			<span>${m.meetingGender}모임 || 나이대 무관</span>
			                                		</c:when> 
			                                		<c:otherwise>
			                                			<span>${m.meetingGender}모임 | </span> <span> ${m.meetingMinAge }~${m.meetingMaxAge }세</span>
			                                		</c:otherwise>   
			                                		
			                                	</c:choose>  
			                                    <%-- <span>${m.meetingGender } 모임</span> <span>${m.meetingMinAge }~${m.meetingMaxAge }세</span>누구나 참여 가능 
			                                    [ --%>
			                                    <span id="curNum">
			                                        [ ${m.meetingCurrentCount }
			                                    </span>
			                                        /
			                                    <span id="maxNum">
			                                        ${m.meetingPeopleNum }
			                                    </span>]</span>
			                            </div>
			                            <c:choose>
			                            	<c:when test="${empty m.meetingDate }">
			                            		 <span style="font-weight: bolder;">날짜 미정</span>
			                            	</c:when>
			                            	<c:otherwise>
			                            		<span style="font-weight: bolder;">${m.meetingDate}</span>
			                            	</c:otherwise>
			                            </c:choose>
			                            
			                        </div>
			                        <div style="text-align: end; display: flex; flex-direction: column; justify-content: space-between;" class="col-2 " >
			                            	<%-- <c:if test="${loginMember.memberNo eq m.memberLeaderNo }">
			                                	<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#meettingjoin" >삭제하기</button><br>
			                                </c:if> --%>
			                                 <%--  <c:forEach var="l" items="${joinmeetinglist }"> 
			                                	 <c:if test="${loginMember.memberNo eq l.MEMBER_NO }">
			                                		<button type="button" class="btn btn-danger"
			                                		data-bs-toggle="modal" data-bs-target="#meettingjoin" 
			                                		disabled="disabled" style="background-color: #C1BEBB; border: 1px #C1BEBB solid; color: black">
			                                		<c:choose>
			                                			<c:when test="${l.MEETING_YN eq 'S'}">신청중</c:when>
			                                			<c:when test="${l.MEETING_YN eq 'Y'}">참여모임</c:when>
			                                		</c:choose>
			                                		</button><br>
			                                	</c:if>
			                                	<c:if test="${loginMember.memberNo eq joinmeetinglist.MEMBER_NO && joinmeetinglist.MEETING_YN eq 'Y' }">
			                                		<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#meettingjoin" disabled="disabled" style="background-color: #C1BEBB; border: 1px #C1BEBB solid; color: black">참여중</button><br>
			                                	</c:if> 
			                                </c:forEach>   --%>
			                                	<c:if test="${loginMember.memberNo!=m.memberLeaderNo && (m.meetingPeopleNum > m.meetingCurrentCount)}">
			                                		<button type="button"  class="btn btn-danger" data-bs-toggle="modal" onclick="f_meettingjoin('${loginMember.memberNo }','${m.meetingNo}')" data-bs-target="#meettingjoin" >신청하기</button><br>
													
			                                	</c:if>
			                                <c:if test="${(m.meetingPeopleNum eq m.meetingCurrentCount)}">
			                                	<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#meettingjoin" disabled="disabled" style="background-color: #C1BEBB; border: 1px #C1BEBB solid; color: black">모집완료</button><br>
			                                </c:if>
			                                <c:if test="${loginMember.memberNo==m.memberLeaderNo }">
			                                	<button type="button" class="btn btn-danger" data-bs-toggle="modal"  data-bs-target="#meettingjoin" disabled="disabled" style="background-color: #C1BEBB; border: 1px #C1BEBB solid; color: black">내 모임</button><br>
			                                </c:if>
			                                
			                                <span style="font-weight: bolder; font-size: 23px;" >${m.meetingArea}</span>
			                        </div>
			                       
			
			
			                    </div>
								                    			
                    		
			                    <!-- Modal -->
								  <div class="modal fade" id="meettingjoin" tabindex="-1" aria-labelledby="#meettingjoin" aria-hidden="true">
								    <div class="modal-dialog">
								      <div class="modal-content">
								        <div class="modal-header">
								            <h2 style="font-weight: bolder;">모임에 참여하시겠습니까?</h2>
								          <!-- <h1 class="modal-title fs-5" id="exampleModalLabel">모임에 참여하시겠습니까?</h1> -->
								          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								        </div>
								        <div class="modal-body">
								          <div>
											<div>${m.meetingArea}</div>
								            <p style="font-size: 18px; ">
								                모임에 참여하면 모임장의 승인 후<br>자동적으로 채팅방으로 이동이 됩니다.<br>
								                <span style="color: #dc3545;">
								                    그리고
								                </span>
								                사용자의 기본정보(이름, 나이, 성별, 신고내역)가 모임장에게 전송이 됩니다.</p>
								
								          </div>
								        </div>
								        <div class="modal-footer">
								        	
								            <button type="button" class="btn btn-danger" onclick="f_finalmeetingjoin('${loginMember.memberNo }','${m.meetingNo}')" >참여하기</button> 
											<!-- <button type="button" class="btn btn-danger" >참여하기</button> -->
								            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
								         
								        </div>
								      </div>
								    </div>
								  </div>
							</c:forEach>
                    	</c:otherwise>
                    </c:choose>