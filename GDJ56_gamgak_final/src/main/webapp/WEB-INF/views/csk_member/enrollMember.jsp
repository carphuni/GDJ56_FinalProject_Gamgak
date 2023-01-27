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
    <link rel="stylesheet" type="text/css" href="${path }/resources/css/member.css">
    <!-- Font Awesome icons (free version)-->
    <script src="https://kit.fontawesome.com/d87d902b0c.js" crossorigin="anonymous"></script>
</head>

<style>
/* 	div#enroll-container{width:400px; margin:0 auto; text-align:center;}
	div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
	div#enroll-container form{display:relative;}*/
	div#login-wrapper span.guide{display:none;font-size:12px;
									position:relative;top:12px;right:10px;} 
	div#login-wrapper span.ok{color:green}
	div#enroll-container span.error{color:red}
</style>


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
          <!-- Sign Up -->
          <div id="login-wrapper" class="col-sm-6">
          	
          	<img id="logo-img" src="${path }/resources/images/로고.png" >
            <h3>감:각</h3>
          	<h6>나만의 맛집 기록</h6>
            <form action="${path }/enrollEnd" method="post" onsubmit="return fn_invalidate();">
	            <div id="loginInput">
		            <a><img id="kakaologin" src="${path }/resources/images/카카오 로그인.png"/></a>
            		<div id="orLine">
	                	<hr id="hrLine">
	                	<span>또는</span>
	                	<hr id="hrLine">
            		</div>
	                
	             	<div id="inputId" class="form-floating mb">
	                    <input type="email" class="form-control" name="memberEmail" id="floatingInput" placeholder="name@example.com" required>
	                    <label for="floatingInput">이메일 주소</label>
<!-- 	                    <span id="emailOk" class="ok">이메일 사용이 가능합니다.</span> class 중복가능 id 중복 불가능
						<span id="emailError" class="error">이메일 사용이 불가능합니다. 다른 이메일을 입력해주세요.</span> -->
	                </div>
	             	<div id="inputId" class="form-floating mb">
	                    <input type="email" class="form-control" name="memberName" id="floatingInput" maxlength="10" placeholder="Name" required>
	                    <label for="floatingInput">이름</label>
<!-- 	                    <span id="nameError" class="error">2자 이상 10자 이하 입력해주세요.</span>
    					<input type="hidden" id="nameCheck"/> 유효성 검사 -->
	                </div>
	             	<div id="inputId" class="form-floating mb">
	                    <input type="email" class="form-control" name="memberNickName" id="floatingInput" maxlength="10" placeholder="NickName" required>
	                    <label for="floatingInput">닉네임</label>
<!-- 						<span id="nickNamError" class="error">2자 이상 10자 이하 입력해주세요.</span> -->
	                </div>
	                <div class="form-floating mb-3">
	                    <input type="password" class="form-control" name="memberPassword" id="floatingPassword" minlength="8" placeholder="Password" required>
	                    <label for="floatingPassword">비밀번호</label>
 <!-- 						<span id="passwordError" class="guide error">8자 이상 입력해주세요.</span> -->
	                </div>
	                <div class="form-floating mb">
	                    <input type="password" class="form-control" name="memberPassword" id="floatingPassword" minlength="8" placeholder="Password Check" required autocomplete="off" required>
	                    <label for="floatingPasswordCk">비밀번호 확인</label>
<!-- 						<span id="passwordErrorCk" class="guide error">비밀번호가 다릅니다.</span>
						<span id="passwordOk" class="guide ok">비밀번호가 일치합니다.</span> -->
	                </div>
	                <button id="loginButton" type="submit" class="btn btn-danger" onclick="enroll_check">회원가입</button>
	        	</div>
        	</form>
    	</div>
	</div>
	
	<script>	
		const fn_invalidate=()=>{
			
		}
	</script>
</body>
</html>