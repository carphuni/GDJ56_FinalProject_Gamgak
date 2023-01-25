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
</head>
<body>
    <div id="basic-wrapper">
        <!-- Side NavBar -->
        <aside id="sidebar-wrapper" class="col-sm-3">
            <div id="sidebar" class="col-sm-3">
                <img id="logo-img" src="${path }/resources/images/로고.png"/>
                <nav class="nav flex-column">
                    <a class="nav-link active" aria-current="page" href="#">
                        <i class="fa-solid fa-circle-user"></i>
                        <span>프로필 홈</span>
                    </a><a class="nav-link active" aria-current="page" href="#">
                        <i class="fa-solid fa-magnifying-glass-chart"></i>
                        <span>인기 맛집 및 검색</span>
                    </a><a class="nav-link active" aria-current="page" href="${path }meetting/meettinglist.do">
                        <i class="fa-solid fa-people-group"></i>
                        <span>모임</span>
                    </a><a class="nav-link active" aria-current="page" href="#">
                        <i class="fa-solid fa-user-group position-relative">
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="font-size: 0.3rem;">
                                99+
                                <span class="visually-hidden">unread messages</span>
                            </span>
                        </i>
                        <span>친구</span>
                    </a><a class="nav-link active" aria-current="page" href="#">
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
        <!-- Article -->
        <article id="main-wrapper">
            <!-- Main -->
            <section>