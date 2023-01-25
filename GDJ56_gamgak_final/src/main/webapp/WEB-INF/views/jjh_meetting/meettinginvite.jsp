<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
                <div id="meeting-wrapper">
                    <div id="meeting-item">
                        <a><img id="meeting-img" src="${path }/resources/images/플러스.png"></a>
                        <p>모임 이름</p>
                    </div>
                    <div id="meeting-item">
                        <a href=""><img id="meeting-img" src="${path }/resources/images/임시 이미지03.jpg"></a>
                        <p>모임 이름</p>
                    </div>

                </div>
                <div id="profile-wrapper" style="text-align: center; display: flex;;">
                
                  <H3 style="font-weight: bolder;">모임 신청 내역</H3>

                    <div style="display: flex; border: 5px #dc3545 solid; border-radius: 1rem; padding: 1rem" >
                      <div style="display: flex; justify-content: space-between;">
                        <p style="font-weight: bolder; font-size: 19px;">
                          닉네임 : 
                          <span>동훈 간다</span>
                           나이 : 
                           <span>27살</span>
                           성별 : 
                           <span>남자</span>
                           신고 횟수 : 
                           <span>0회</span>
                        </p>
                      </div>
                      <div style="margin: 0px 0px 0px 35px;">
                        <button style="text-align: center; background-color: #ff7f00; color: white; border: 3px #ff7f00 solid; border-radius: 10px; padding: 5px;">신청거부</button>
                        <button style="text-align: center; background-color: #ff7f00; color: white; border: 3px #ff7f00 solid; border-radius: 10px; padding: 5px;">신청수락</button>
                      </div>
                       
                       


                    </div>
                    <div>
                        

                    </div>

                    <!-- Button trigger modal -->
  
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
            <p style="font-size: 18px; ">
                모임에 참여하면 모임장의 승인 후<br>자동적으로 채팅방으로 이동이 됩니다.<br>
                <span style="color: #dc3545;">
                    그리고
                </span>
                사용자의 기본정보(이름, 나이, 성별, 신고내역)가 모임장에게 전송이 됩니다.</p>

          </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-danger" onclick="location.assign('${path}/meetting/joinmeetting.do')">참여하기</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
         
        </div>
      </div>
    </div>
  </div>
                    
                   
                    
                </div>
               
              
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>