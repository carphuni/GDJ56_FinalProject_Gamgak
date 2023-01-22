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
                        <a><img id="meeting-img" src="${path }/resources/images/임시 이미지03.jpg"></a>
                        <p>모임 이름</p>
                    </div>

                </div>
                <div id="profile-wrapper">
                    <div id="info-container">
                        <a><img id="profile-img" src="${path }/resources/images/프로필 기본 이미지.jpg"/></a>
                        <div id="info">
                            <div id="info-1">
                                <span>gnsl2808@naver.com</span>
                                <button id="edit-profile" type="button" class="btn btn-danger">프로필 편집</button>
                                
                            </div>
                            <div id="info-2" >
                                <div><span>내 맛집 기록</span><span id="res-num">193</span></div>
                                <div id="colLine"></div>
                                <a><span>친구</span><span id="fri-num">0</span></a>
                                <div id="colLine"></div>
                                <a><span>모임</span><span id="fri-num">3</span></a>
                            </div>
                            <div id="info-3">존잘 이동훈</div>
                            <div id="info-d4">
                                <span>나는 미친 사람 ㅎㅎㅎ</span>
                            </div>
                        </div>
                        <a><i class="fa-solid fa-gear fa-lg" data-bs-toggle="modal" data-bs-target="#exampleModal"></i></a>
                       
                        
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                            <div class="modal-content">
                                <ul class="list-group">
                                    <li class="list-group-item">An item</li>
                                    <li class="list-group-item">A second item</li>
                                    <li class="list-group-item">A third item</li>
                                    <li class="list-group-item">A fourth item</li>
                                    <li class="list-group-item">And a fifth one</li>
                                  </ul>
                            </div>
                            </div>
                        </div>
                    </div>
                    <div id="rowLine"></div>
                    <div id="search-container">
                        <a><span style="border-bottom: 2px #dc3545 solid;">내 맛집</span></a>
                        <div id="colLine"></div>
                        <a><span>지역별</span></a>
                        <div id="colLine"></div>
                        <a><span>검색</span></a>
                    </div>
                    <div id="card-container">
                        <div class="card">
                            <img src="${path }/resources/images/임시 이미지03.jpg" class="card-img-top" onerror="this.src='./img/이미지 없음.jpg'">
                            <div class="card-body">
                                <span id="card-title">동훈이네 치킨</span>
                                <span id="card-category">치킨 / 호프</span>
                                <span id="card-address">서울시 금천구 독산동 1009-1</span>
                            </div>
                        </div>
                       
                    </div> 
                    
                </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>