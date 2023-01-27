<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>     
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
    <!-- jQuery library -->
    <script src="https:/code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<style>
    #logo-img{border-radius: 10%;width: 6rem;height: 6rem;}
</style>
<body>
    <div id="basic-wrapper">
        <!-- Side NavBar -->
        <aside id="sidebar-wrapper" class="col-sm-3">
            <div id="sidebar" class="col-sm-3">
                <a href="${path}/profile"><img id="logo-img" src="${path }/resources/images/로고.png"/></a>
                <nav class="nav flex-column">
                    <a class="nav-link active" aria-current="page" href="${path}/admin/">
                        <i class="fa-solid fa-circle-user"></i>
                        <span>프로필 홈</span>
                    </a><a class="nav-link active" aria-current="page" href="${path}/admin/report.do">
                        <i class="fa-solid fa-magnifying-glass-chart position-relative">
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="font-size: 0.3rem;">
                                2
                                <span class="visually-hidden">unread messages</span>
                            </span>
                        </i>
                        <span>신고 관리</span>
                    </a><a class="nav-link active" aria-current="page" href="${path}/admin/meeting.do">
                        <i class="fa-solid fa-people-group position-relative">
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="font-size: 0.3rem;">
                                1
                                <span class="visually-hidden">unread messages</span>
                            </span>
                        </i>
                        <span>모임 관리</span>
                    </a><a class="nav-link active" aria-current="page" href="${path}/admin/member.do">
                        <i class="fa-solid fa-user-group position-relative">
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="font-size: 0.3rem;">
                                4
                                <span class="visually-hidden">unread messages</span>
                            </span>
                        </i>
                        <span>회원 관리</span>
                    </a><a class="nav-link active" aria-current="page" href="#">
                        <i class="fa-solid fa-envelope position-relative">
                            <!-- <span class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-light rounded-circle" style="width: 0.5rem;">
                                <span class="visually-hidden">New alerts</span>
                            </span> -->
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