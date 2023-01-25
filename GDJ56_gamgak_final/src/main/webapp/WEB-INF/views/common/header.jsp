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
    <!-- Main css -->
    <link rel="stylesheet" type="text/css" href="${path }/resources/css/mainProfile.css" >
    <!-- Font Awesome icons (free version)-->
    <script src="https://kit.fontawesome.com/d87d902b0c.js" crossorigin="anonymous"></script>
    <!-- 카카오 지도 API -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ee03448a6bf04aae4a0e4b0695cff05a&libraries=services"></script>
    <!-- 찬희 css -->
    <link rel="stylesheet" type="text/css" href="${path }/resources/css/kch.css" >
    <!-- 지도 css -->
    <link rel="stylesheet" type="text/css" href="${path }/resources/css/map.css" >
    <!-- jQuery -->
	<script src = "${path }/resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
    <div id="basic-wrapper">
        <!-- Side NavBar -->
        <aside id="sidebar-wrapper" class="col-sm-3">
            <div id="sidebar" class="col-sm-3">
                <img id="logo-img" src="${path }/resources/images/로고.png"/>
                <nav class="nav flex-column">
                    <a class="nav-link active" aria-current="page" href="${path }/profile">
                        <i class="fa-solid fa-circle-user"></i>
                        <span>프로필 홈</span>
                    </a>
                    <a class="nav-link active" aria-current="page" data-bs-toggle="modal" data-bs-target="#insertModal">
                        <i class="fa-solid fa-plus"></i>
                        <span>맛집 기록</span>
                    </a>
                    <a class="nav-link active" aria-current="page" href="${path }/ranking">
                        <i class="fa-solid fa-magnifying-glass-chart"></i>
                        <span>인기 맛집 및 검색</span>
                    </a>
                    <a class="nav-link active" aria-current="page" href="${path }meetting/meettinglist.do">

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
                    <a class="nav-link active" aria-current="page" href="${path }/msg">
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
		  <div class="modal-dialog modal-xl modal-dialog-centered">
		    <div class="modal-content" >
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">새 맛집 기록</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        hthrhrhdfㅅ공ㅅㅇㅅㅅ요ㅗㅇㅅ곳곳ㄱㅇ송송ㄱ솟ㄱ옷ㅇ공ㅅ곳옹송송ㅅ옿ㅅㄱ옹ㄱ홍ㅎㅀ
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-danger">저장하기</button>
		      </div>
		    </div>
		  </div>
		</div>      
        <!-- Article -->
        <article id="main-wrapper">
            <!-- Main -->
            <section>