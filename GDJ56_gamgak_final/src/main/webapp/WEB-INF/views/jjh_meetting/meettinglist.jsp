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
                        <a href="" onclick="window.open('${path}/meetting/meettingchat.do','채팅방','_blank, resizable=no,width=1000px,height=720px,scrollbars=no')"><img id="meeting-img" src="${path }/resources/images/임시 이미지03.jpg"></a>
                        <p>모임 이름</p>
                    </div>

                </div>
                <div id="profile-wrapper">
                    <div id="subheader-wrapper" style="display: flex; justify-content: space-between;">
                        <select style="border: 1px #a89e9f solid; border-radius: 5px; height: 40px; width: 200px;">
                            <option value="경기도">경기도</option>
                            <option value="강원도">강원도</option>
                            <option value="서울특별시">서울특별시</option>
                            <option value="충청남도">충청남도</option>
                            <option value="충청북도">충청북도</option>
                            <option value="전라남도">전라남도</option>
                            <option>전라북도</option>
                            <option>경상남도</option>
                            <option>경상북도</option>
                            <option>제주도</option>
                            <option>인천광역시</option>
                            <option>울산광역시</option>
                            <option>부산광역시</option>
                            <option>광주광역시</option>
                            <option>대전광역시</option>
                        </select>

                        <button class="btn btn-danger" onclick="location.assign('${path}/meetting/meettingenroll.do')">모임생성</button>
                    </div>
                    <br>
                    <div style="display: flex; border: 5px #dc3545 solid; border-radius: 1rem; padding: 1rem" >
                        <div style="display: flex; flex-direction: column;" class="col-10">
                            <span style="font-weight: bolder;">모집중</span>
                            <span style="font-weight: bolder; font-size: 18px;">치킨먹으면서 축구 보실분 구해요</span>
                            <div style="font-weight: bolder;">
                                <img src="${path }/resources/images/사람들.png" style="height: 30; width: 30;"/>
                                <span>
                                    누구나 참여 가능 [
                                    <span id="curNum">
                                        4
                                    </span>
                                        /
                                    <span id="maxNum">
                                        6
                                    </span>]</span>
                            </div>
                            <span style="font-weight: bolder;">시간미정</span>
                        </div>
                        <div style="text-align: end; display: flex; flex-direction: column; justify-content: space-between;" class="col-2 " >
                            
                                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#meettingjoin" >신청하기</button><br>
                                <span style="font-weight: bolder; font-size: 23px;" >경기도</span>
                        </div>
                       


                    </div>
                    <div>
                        <button class="btn btn-danger" onclick="location.assign('${path}/meetting/meettingmanage.do')">관리</button>

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
            <button type="button" class="btn btn-danger" z>참여하기</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
         
        </div>
      </div>
    </div>
  </div>
                    
                   
                    
                </div>
               
              
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


<script>
    function chat(){
        url : "${path}/"
    }

</script>