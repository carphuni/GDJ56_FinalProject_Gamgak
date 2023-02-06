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
    <!-- jQuery -->
    <script src = "${path }/resources/js/jquery-3.6.1.min.js"></script>
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
            <form action="${path}/enrollEnd" method="post">
	            <div id="loginInput">
	                
	                <div style="display:flex; justify-content:center;flex-direction: column; align-items: center;">
	                	
	                	<div>
	                		<h3>이메일 본인인증</h3>
	                		<p>
	                			${member.memberEmail} 으로 인증번호가 전송되었습니다.<br>
	                			받는 메일서버의 상호아에 따라 최대 5분 정도 소요됩니다.<br>
	                			인증번호를 하단에 입력하세요. (다시 시도하려면 뒤로가기를 눌러주세요.)
	                		</p>
	                	</div>
	                	<div>
			            	<input type="text" class="" name="emailCode" id="" placeholder="인증번호 입력" style="width: 300px; height:50px;" value="">
			            </div>
	                	
	                </div>
	              	<button id="loginButton" type="submit" class="btn btn-danger">회원가입</button>
	        	</div>
	        	<div>
 	        		<input type="hidden" class="" name="memberEmail" id="" style="width: 300px; height:50px;" value="${member.memberEmail}">
	        		<input type="hidden" class="" name="memberNickName" id="" style="width: 300px; height:50px;" value="${member.memberNickName}">
	        		<input type="hidden" class="" name="memberName" id="" style="width: 300px; height:50px;" value="${member.memberName}">
	        		<input type="hidden" class="" name="memberPassword" id="" style="width: 300px; height:50px;" value="${member.memberPassword}">
					${member}
					${enrollMessage}
	        		<input type="hidden" class="" name="enrollMessage" id="" style="width: 300px; height:50px;" value="${enrollMessage}">
	        	</div>
           	</form>
          </div>
	</div>
 	<script>
		if($("input[name=enrollMessage]").val()!="") alert($("input[name=enrollMessage]").val());
	</script>

</body>
</html>