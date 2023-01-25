<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 부트스트랩 css/js -->
    <link rel="stylesheet" type="text/css" href="${path }/resources/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Main css -->
    <link rel="stylesheet" type="text/css" href="${path }/resources/css/index.css">
    <!-- Font Awesome icons (free version)-->
    <script src="https://kit.fontawesome.com/d87d902b0c.js" crossorigin="anonymous"></script>
</head>
<body>
    <div id="basic-wrapper">
        <!-- MainImageCarousel -->
        <div id="carouselExampleCaptions" class="carousel slide col-sm-6" data-bs-ride="false">
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="${path }/resources/images/메인 이미지.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                  <h5>First slide label</h5>
                  <p>Some representative placeholder content for the first slide.</p>
                </div>
              </div>
              <div class="carousel-item">
                <img src="${path }/resources/images/메인 이미지.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                  <h5>Second slide label</h5>
                  <p>Some representative placeholder content for the second slide.</p>
                </div>
              </div>
              <div class="carousel-item">
                <img src="${path }/resources/images/메인 이미지.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                  <h5>Third slide label</h5>
                  <p>Some representative placeholder content for the third slide.</p>
                </div>
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
          <!-- Login -->
        <div id="login-wrapper" class="col-sm-6">
            <img id="logo-img" src="${path }/resources/images/로고.png" >
            <h3>감:각</h3>
            <h6>나만의 맛집 기록</h6>
            
            <form action="${path }/login" method="post">
	            <div id="loginInput">
	                <div id="rowLine"></div>
	                <div id="inputId" class="form-floating mb-3">
	                    <input type="email" class="form-control" name="memberEmail" id="floatingInput" placeholder="name@example.com">
	                    <label for="floatingInput">Email address</label>
	                </div>
	                <div class="form-floating">
	                    <input type="password" class="form-control" name="memberPassword" id="floatingPassword" placeholder="Password">
	                    <label for="floatingPassword">Password</label>
	                </div>
	                <button id="loginButton" type="submit" class="btn btn-danger">로그인</button>
                </form>
                
                <a><img id="kakaologin" src="${path }/resources/images/카카오 로그인.png"/></a>
                <div id="loginEtc">
                    <a><span>회원가입</span></a>
                    <div id="colLine"></div>
                    <a><span>아이디 찾기</span></a>
                    <div id="colLine"></div>
                    <a><span>비밀번호 찾기</span></a>
                </div>
                <div id="rowLine"></div>
            </div>


            <!-- Footer -->
            <footer>
                <div>
                    <span>메뉴</span>
                    <span>메뉴</span>
                    <span>메뉴</span>
                    <span>메뉴</span>
                    <span>메뉴</span>
                    <span>메뉴</span>
                    <span>메뉴</span>
                </div>
                <p>
                    &copy;2023 Gamgak from LDH
                </p>
            </footer>
        </div>
     </div>
</body>
</html>