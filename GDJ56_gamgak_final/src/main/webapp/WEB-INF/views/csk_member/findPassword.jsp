<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<div id="home">
	<a href="${path}/">
		<img id="logo-img" src="${path }/resources/images/로고.png" ><h3>감:각</h3>
	</a>
</div>

<div id="findPassword-wrapper">
	<div id="password-form">
		<form action="${path }/sendPasswordEmail" name="sendPasswordEmail" method="post">
			<h1>🔒</h1>
			<p>로그인에 문제가 있나요?<br> 가입시 입력한 이메일로 임시 비밀번호가 전송됩니다.<br>
			로그인 후 마이페이지에서 비밀번호를 변경 해주세요.</p>
			<div id="text-form">
				<input type="email" class="form-control" id="memberEmail" name="memberEmail" placeholder="이메일을 입력하세요" required/><br>
			</div>
			<input type="submit" id="sendEmail" class="btn btn-danger" value="비밀번호 발송"/>
		</form>
		<div id="orLine">
			<hr id="hrLine"><span>또는</span><hr id="hrLine">
		</div>
			<a href="${path}/enroll">새 계정 만들기</a>
	</div>

</div>

	<script>
		$("#sendEmail").click(()=>{
			$.ajax({
				type: "post",
			    url: "${path}/enroll/duplicateEmail",
			    data: {memberEmail: $("#memberEmail").val()},
			    success: data=>{
			        if(data){
			            alert("임시비밀번호를 전송 했습니다.");
			        	document.forms["sendPasswordEmail"].submit();
			        }else {
			            alert("가입되지 않은 이메일입니다.");
			        }
			    }
			});			
		});
			
				
		
			
		
	}

</script>
</html>