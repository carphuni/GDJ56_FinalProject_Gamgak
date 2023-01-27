<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
 
                <div id="profile-wrapper">
                    <div id="info-container">
                        <a><img id="profile-img" src="${path }/resources/images/프로필 기본 이미지.jpg" data-bs-toggle="modal" data-bs-target="#imgModal"/></a>
                        <!-- Modal -->
                        <div class="modal fade" id="imgModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
	                            <div class="modal-content">
	                                <div id="img-modal-list" class="list-group">
									  <div class="list-group-item list-group-item-action" style="padding: 1.5rem">프로필 사진 바꾸기</div>
									  <a href="#" class="list-group-item list-group-item-action" style="color: #0d6efd">사진 업로드</a>
									  <a href="#" class="list-group-item list-group-item-action" style="color:#dc3545">현재 사진 삭제</a>
									  <a href="#" class="list-group-item list-group-item-action" data-bs-dismiss="modal">취소</a>
									</div>
	                            </div>
                            </div>
                        </div>
                        
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
                        <a><i class="fa-solid fa-gear fa-lg" data-bs-toggle="modal" data-bs-target="#settingModal"></i></a>
                        <!-- Modal -->
                        <div class="modal fade" id="settingModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
	                            <div class="modal-content">
	                                <div id="setting-modal-list" class="list-group">
									  <a href="#" class="list-group-item list-group-item-action">비밀번호 변경</a>
									  <a href="#" class="list-group-item list-group-item-action">프로필 편집</a>
									  <a href="#" class="list-group-item list-group-item-action">로그아웃</a>
									  <a href="#" class="list-group-item list-group-item-action" data-bs-dismiss="modal">취소</a>
									</div>
	                            </div>
                            </div>
                        </div>
                    </div>
                    <div id="rowLine"></div>
                    <div id="search">
	                    <div id="search-container">
	                        <span id="show-click" style="border-bottom: 2px #dc3545 solid;">내 맛집</span>
	                        <div id="colLine"></div>
	                        <span id="area-click" >지역별</span>
	                        <div id="colLine"></div>
	                        <span id="title-click">검색</span>
	                    </div>
	                    <div id="search-item">
		                    <button id="show-search" type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#insertModal">맛집 기록</button>
		                    <select id="area-search" class="form-select" >
							  <option selected>지역 선택</option>
							  <option value="서울">서울특별시</option>
							  <option value="경기">경기도</option>
							  <option value="인천">인천</option>
							  <option value="강원">강원도</option>
							  <option value="전북">전라북도</option>
							  <option value="전남">전라남도</option>
							  <option value="충북">충청북도</option>
							  <option value="충남">충청남도</option>
							  <option value="대전">대전</option>
							  <option value="경북">경상북도</option>
							  <option value="경남">경상남도</option>
							  <option value="부산">부산</option>
							  <option value="대구">대구</option>
							  <option value="부산">울산</option>
							  <option value="제주특별자치도">제주도</option>
							</select>
							<div id="title-search">
								<form>
									<input class="form-control" type="text" placeholder="제목, 카테고리 검색">
									<button class="btn btn-danger col-sm-3" type="submit">검색</button>
								</form>
							</div>
	                    </div>
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