<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
                <div id="meeting-wrapper">
                    <div id="meeting-item">
                        <a onclick="location.assign('${path}/meetting/meettingenroll.do')"><img id="meeting-img" src="${path }/resources/images/플러스.png"></a>
                        <p>모임추가</p>
                    </div>
                    <c:choose>
                    	<c:when test="${empty joinmeetinglist}">
                    		<div id="meeting-item">
                        		<a href="" onclick="window.open('${path}/meetting/meettingchat.do','채팅방','_blank, resizable=no,width=1000px,height=720px,scrollbars=no')"><img id="meeting-img" src="${path }/resources/images/임시 이미지03.jpg"></a>
                        		<p>모임이 없습니다.</p>
                   			</div>
                    	</c:when>
                    	<c:otherwise>
                    		<c:forEach var="l" items="${joinmeetinglist}">
                    			<div id="meeting-item">
                        			<a href="" onclick="window.open('${path}/meetting/meettingchat.do?memberNo=${loginMember.memberNo}&meetingNo=${l.MEETING_NO } ','채팅방','_blank, resizable=no,width=1000px,height=720px,scrollbars=no')"><img id="meeting-img"  src="${path }/resources/upload/meeting/${l.MEETNG_RENAME}"></a>
                        			<p>${l.MEETING_TITLE }</p>
                   				 </div>
                    		
                    		</c:forEach>
                    	</c:otherwise>
                    </c:choose>
                    

                </div>
                <div id="profile-wrapper">
                    <div id="subheader-wrapper" style="display: flex; justify-content: space-between;">
                        <select style="border: 1px #a89e9f solid; border-radius: 5px; height: 40px; width: 200px;text-align: center; ">
                           <option selected>====지역 선택====</option>
                                <option value="경기도">경기도</option>
                                <option value="강원도">강원도</option>
                                <option value="서울특별시">서울특별시</option>
                                <option value="충청남도">충청남도</option>
                                <option value="충청북도">충청북도</option>
                                <option value="전라남도">전라남도</option>
                                <option value="전라남도">전라북도</option>
                                <option value="경상남도">경상남도</option>
                                <option value="경상북도">경상북도</option>
                                <option value="제주도">제주도</option>
                                <option value="인천광역시">인천광역시</option>
                                <option value="울산광역시">울산광역시</option>
                                <option value="부산광역시">부산광역시</option>
                                <option value="광주광역시">광주광역시</option>
                                <option value="대전광역시">대전광역시</option>
                        </select>

                        <button class="btn btn-danger" onclick="location.assign('${path}/meetting/meettingenroll.do')">모임생성</button>
                    </div>
                    <br>
                    <c:choose>
                    	<c:when test="${empty meeting}">
                    		<div>조회된 게시물이 없습니다.</div>
                    	</c:when>
                    	<c:otherwise>
                    		<c:forEach var="m" items="${meeting }">
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
			                                			<span>성별 무관 | </span> <span>${m.meetingMinAge }~${m.meetingMaxAge }세</span>
			                                			 
			                                		</c:when>
			                                		 <c:when test="${m.meetingGender eq '무관' || m.meetingMinAge eq 1 && m.meetingMaxAge eq 99}">
			                                			<span>누구나 참여 가능</span>
			                                			 <%-- <span>${m.meetingMinAge}</span> 
			                                			 <span>${m.meetingMaxAge} </span> 
			                                			 <span>성별 ${m.meetingGender}</span>  --%>
			                                		</c:when>
			                                		<%-- <c:when test="${m.meetingMinAge  eq 1 && m.meetingMaxAge eq 99}">
			                        
			                                			<span>${m.meetingGender}모임 |</span><span> 나이대 무관</span>
			                                			 -
			                                		</c:when>  --%>
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
                    <div>
                        <%-- <button class="btn btn-danger" onclick="location.assign('${path}/meetting/meettingmanage.do')">관리</button> --%>

                    </div>
                    <script type="text/javascript">

						var jo_memberNo=0;
						var jo_membertingNo=0
                    	function f_meettingjoin(a,b) {
                    		jo_memberNo=a;
                    		jo_membertingNo=b

							
							
							
                    		 
								
							}
							function f_finalmeetingjoin() {
								// var jo_meetingNo=$("meetingNo").val();
								// var jo_memberNo=$("memberNo").val();
								// console.log(jo_meetingNo);
								// console.log(jo_memberNo);
								console.log("마지막 값"+jo_memberNo);
								console.log("마지막 값"+jo_membertingNo);

                    			window.location.replace("/meetting/meettingjoin.do?memberNo="+jo_memberNo+"&meetingNo="+jo_membertingNo);

                    		} 
						
                    		
							
						
                    </script>

                    <!-- Button trigger modal -->
  
  
                    
                   
                    
                </div>
         
               
              
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


<script>
    function chat(){
        url : "${path}/"
    }

</script>