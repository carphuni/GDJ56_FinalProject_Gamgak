<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
 <link rel="stylesheet" type="text/css" href="${path }/resources/css/jjh_css/meetinglist.css" >     
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 부트스트랩 css/js -->
    <link rel="stylesheet" type="text/css" href="${path }/resources/css/bootstrap.min.css" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- jQuery -->
   <script src = "${path }/resources/js/jquery-3.6.1.min.js"></script>
    <!-- Font Awesome icons (free version)-->
    <script src="https://kit.fontawesome.com/d87d902b0c.js" crossorigin="anonymous"></script>
    <!-- 카카오 지도 API -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ee03448a6bf04aae4a0e4b0695cff05a&libraries=services"></script>
    <!-- 찬희 css -->
    <link rel="stylesheet" type="text/css" href="${path }/resources/css/kch.css" >
    <!-- 지도 css -->
    <link rel="stylesheet" type="text/css" href="${path }/resources/css/map.css" >
    <!-- Main css -->
    <link rel="stylesheet" type="text/css" href="${path }/resources/css/mainProfile.css" >
</head>
<body>
    <div id="basic-wrapper">
        <!-- Side NavBar -->
        <aside id="sidebar-wrapper" class="col-sm-3">
            <div id="sidebar" class="col-sm-3">
                <img id="logo-img" src="${path }/resources/images/로고.png" class="col-1"/>
                <nav class="nav flex-column">
                    <a class="nav-link active" aria-current="page" href="${path }/profile/">
                        <i class="fa-solid fa-circle-user"></i>
                        <span>프로필 홈</span>
                    </a>
                    <a class="nav-link active" aria-current="page" data-bs-toggle="modal" data-bs-target="#insertModal">
                        <i class="fa-solid fa-plus"></i>
                        <span>새 맛집 기록</span>
                    </a>
                    <a class="nav-link active" aria-current="page" href="${path }/ranking">
                        <i class="fa-solid fa-magnifying-glass-chart"></i>
                        <span>인기 맛집 및 검색</span>
                    </a>
                    <a class="nav-link active" aria-current="page" href="${path }/meetting/meettinglist.do">

                        <i class="fa-solid fa-people-group"></i>
                        <span>모임</span>
                    </a>
                    <a class="nav-link active" aria-current="page" href="#">
                        <i class="fa-solid fa-user-group position-relative">
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="font-size: 0.3rem;">
                                99+
                                <span class="visually-hidden">unread messages</span>
                            </span>
                        </i>
                        <span>친구</span>
                    </a>
                    <a class="nav-link active" aria-current="page" href="${path }/msg/msgList.do">
                        <i class="fa-solid fa-envelope position-relative">
                            <span class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-light rounded-circle" style="width: 0.5rem;">
                                <span class="visually-hidden">New alerts</span>
                            </span>
                        </i>
                        <span>메세지</span>
                    </a>
                </nav>
                <div class="dropup">
                    <div data-bs-toggle="dropdown">
                        <i class="fa-solid fa-bars"></i><span>더 보기</span>
                    </div>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="#">설정</a></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><a class="dropdown-item" href="#">로그아웃</a></li>
                    </ul>
                </div>
        </aside>
        
        <!-- Modal -->
        <div class="modal fade" id="insertModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div  id="insertModal-dialog" class="modal-dialog modal-xl modal-dialog-centered">
          <div class="modal-content" >
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">새 맛집 기록</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div id="insertModal-body" class="modal-body">
             <div id="insertMap" class="col-sm-6"></div>
             <div id="insert_menu_wrap" class="bg_white col-sm-6">
                 <div class="insert_option">
                      <form onsubmit="dhsearchPlaces(); return false;" style="display: flex;width: 100%">
                          <input id="insert_keyword" class="form-control" type="text" placeholder="식당 검색">
                          <button type="submit" class="btn btn-danger">검색하기</button> 
                      </form>
                 </div>
                 <hr>
                 <ul id="insert_placesList"></ul>
                 <hr>
                 <div id="insert_pagination"></div>
             </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#insertModal2">다음</button>
            </div>
          </div>
        </div>
      </div>   
      <div class="modal fade" id="insertModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div  id="insertModal-dialog" class="modal-dialog modal-xl modal-dialog-centered">
          <div class="modal-content" >
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">새 맛집 기록</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="insertModal-body" class="modal-body" action="${path }/profile/insertmyres.do" enctype="multipart/form-data" method="post">
               <a id="insertMyResImage" onclick="$('#mypic').click();" class="col-sm-6">
                  <div>
                     <img src="${path }/resources/images/이미지 추가.png" style="width: 5rem"/>
                     <p style="">클릭하여 이미지 추가</p>
                  </div>
               </a>
               <!-- 캐러셀 -->
               <div id="mypic-carousel" class="carousel slide col-sm-6" data-bs-ride="carousel" style="display:none;height:100%;">
			 	 <div id="mypic-inner" class="carousel-inner">
				  </div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#mypic-carousel" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#mypic-carousel" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
				</div>
               <input type="file" id="mypic" name="upFile" multiple style="display: none;"/>
               <div id="insertMyResInfo" class="col-sm-6">
                  <div id="myResProfile">
                     <img id="profile-img" src="${path }/resources/images/프로필 기본 이미지.jpg" data-bs-toggle="modal" data-bs-target="#imgModal"/>
                     <span><c:out value="${loginMember.memberEmail}"/></span>
                  </div>
                  <textarea name="myres_memo" rows="10rem" class="col-sm-12" placeholder="문구 입력.." maxlength="2199"></textarea>
                  <div id="textNum" style="">
                     <span>0</span>/2200
                  </div>
                  <hr>
                  <div id="insertLocation">
                     <span>위치를 설정해주세요</span>
                     <i class="fa-solid fa-location-dot"></i>
                  </div>
                  <hr>
                  <div id="insertShare">
                     <span>공유 여부</span>
                     <div class="form-check form-switch">
                        <input name="myres_yn" class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                     </div>
                  </div>
                  <hr>
               </div>
               <input type="hidden" name="restaurant"/>
            </form>   
              <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#insertModal">이전</button>
              <button id="myResSave" class="btn btn-danger">저장하기</button>
            </div>
          </div>
        </div>
      </div>
      
             
         
        <!-- Article -->
        <article id="main-wrapper">
            <!-- Main -->
            <section>