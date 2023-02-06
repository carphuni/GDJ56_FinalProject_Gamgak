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
          <!-- Sign Up -->
          <div id="login-wrapper" class="col-sm-6">
          	
          	<img id="logo-img" src="${path }/resources/images/로고.png" >
            <h3>감:각</h3>
          	<h6>나만의 맛집 기록</h6>
            <form action="${path }/mailAuthEnd" method="post" onsubmit="return fn_invalidate();">
	            <div id="loginInput">
		            <a><img id="kakaologin" src="${path }/resources/images/카카오 로그인.png"/></a>
            		<div id="orLine">
	                	<hr id="hrLine">
	                	<span>또는</span>
	                	<hr id="hrLine">
            		</div>
	             	<div id="inputId" class="form-floating mb" style="flex">
	                    <input type="text" class="form-control" name="memberEmail" id="email" placeholder="name@example.com" required>
	                    <label for="email">이메일 주소</label>
 	                    <span id="emailOk" class="guide ok">이메일 사용이 가능합니다.</span>
						<span id="emailError" class="guide error">*이메일 사용이 불가능합니다. 다른 이메일을 입력해주세요.</span> 
	                </div>
	             	<div id="inputId" class="form-floating mb">
	                    <input type="text" class="form-control" name="memberNickName" id="nickName" minlength="2" maxlength="10" placeholder="NickName" required>
	                    <label for="nickName">닉네임 *2자 이상 10자 이하</label>
 						<span id="nickNamError" class="guide error">*사용중인 별칭입니다.</span>
	                </div>
	             	<div id="inputId" class="form-floating mb-3">
	                    <input type="text" class="form-control" name="memberName" id="name" placeholder="Name" required>
	                    <label for="name">이름 *2자 이상 10자 이하</label>
  	                    <span id="nameError" class="guide error">*한글 또는 영문이름만 입력가능합니다.</span>
	                </div>
	                <div class="form-floating mb-3">
	                    <input type="password" class="form-control" name="memberPassword" id="password" placeholder="Password" required>
	                    <label for="password">비밀번호 *8자 이상, 영문자, 숫자, 특수기호 포함</label>
  						<span id="passwordError" class="guide error">*8자 이상, 영문자, 숫자, 특수기호 혼합하여 입력해주세요.</span> 
	                </div>
	                <div class="form-floating mb">
	                    <input type="password" class="form-control" name="memberPasswordCk" id="passwordCk" placeholder="Password Check" autocomplete="off" required>
	                    <label for="passwordCk">비밀번호 확인</label>
  						<span id="passwordErrorCk" class="guide error">*비밀번호가 일치하지않습니다.</span>
						<span id="passwordOk" class="guide ok">비밀번호가 일치합니다.</span>
						<span id="pwresult"></span>

	                </div>
	                <button id="loginButton" type="submit" class="btn btn-danger">회원가입</button>
	        	</div>
        	</form>
    	</div>
	</div>
	
	<script>
		$(()=>{
			$("#passwordCk").blur(e=>{
				const pw=$("#password").val();
				const pwck=$(e.target).val();
				if(pw==pwck && pw!=''){
					$("#passwordOk").show();
					$("#passwordErrorCk").hide();
				} else if(pw!=pwck){
					$("#passwordErrorCk").show();
					$("#passwordOk").hide();
				} 
			});
		});
  		$(()=>{
			$("#password").keyup(e=>{
				$("#passwordErrorCk").hide();
				$("#passwordOk").hide();
			});
		}); 
		
 		const fn_invalidate=()=>{
 			
 			let idResult=false;
 			let nickResult=false;
 			let result=false;
 			
 			//이메일 중복검사
 	   		$.ajax({
 	 			url:"${path}/duplicateEmail",
 	 			data:{memberEmail:$("#email").val()},
 	 			async:false,
 	 			success:data=>{
 	 				if(!data){ 
 	 					$("#emailError").hide();
 	 					idResult=true;
 	 				}else{
 	 					$("#emailError").show();
 	 				}
 	 			}
 	 			
 	   		});
 			//닉네임 중복검사
  	   		$.ajax({
 	   			url:"${path}/duplicateNickName",
 	   			data:{memberNickName:$("input[name=memberNickName]").val()},
 	   			async:false,
 	   			success:data=>{
 	 				if(!data){
 	 					nickResult=true;
 	 				}else{
 	 					$("#nickNamError").show();
 	 				}
 	   			}
 	   		});
  			//이메일 인증 코드 보내기
 		   	$(()=>{
 		   		$.ajax({
 		   			type:"POST",
 		   			url:"${path}/enroll/mailAuth",
 		   			data:{memberEmail:$("#email").val()},
 		   			datatype:"script",
 		   			async:false,
  		   			success:data=>{
						$("#emailCode").script(data);	 		   			
 		   			}
 		   		});
 		   		
 		   	});	
 			
 			if(idResult!=true || nickResult!=true){
 				result = false;
 			}

 			else if(idResult==true&&nickResult==true){
				//정규표현식
				const email=$("input[name=memberEmail]").val().trim();
				const emailReg= /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; 
				if(!emailReg.test(email)){
					$("#emailError").show();
					result=false;
				} 	else {
					$("#emailError").hide();
					result=true;
				}		
	  			const membername=$("#name").val();
				let nameReg=/^[가-힣a-zA-Z]{2,10}$/;
				if(!nameReg.test(membername)){
					$("#nameError").show();
					result=false;
				} else{
					$("#nameError").hide();
					result=true;
					
				}
				const nickName=$("#nickName").val().trim();
				if(!nameReg.test(nickName)){
					$("#nickNamError").show();
					result=false;
				}else{
					$("#nickNamError").hide();
					result=true;
				}
		 	   	const password=$("#password").val().trim();
				const passwordReg=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()])[A-Za-z\d!@#$%^&*()]{8,}$/;
				if(!passwordReg.test(password)){
					$("#passwordError").show();
					$("#passwordOk").hide();
					result=false;
				} else{
					$("#passwordError").hide();
					$("#passwordOk").show();
					result=true;
				}
			}
			return result; 
		}

	</script>
	
</html>