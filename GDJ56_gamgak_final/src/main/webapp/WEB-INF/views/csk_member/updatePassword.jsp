<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="loginMember" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/member.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<div id="profileInfo-wrapper">
		<div id="profile-menu">
            <div><button>프로필 편집</button></div>
            <div><button>비밀번호 변경</button></div>
    
        </div>
        <div id="verticalLine"></div>
		<div id="updatePassword-contents">
			<form action="${path }/member/updatepw" method="post" onsubmit="">
				<h1>🔒</h1>
						<p>로그인에 문제가 있나요?<br> 가입시 입력한 이메일로 임시 비밀번호가 전송됩니다.<br>
						로그인 후 마이페이지에서 비밀번호를 변경 해주세요.</p>
						<div id="text-form">
				    		<label class="form-label">이름</label>
							<input type="text" id="memberName" name="memberName" placeholder="이름을 입력하세요" required/><br>
					    	<label class="form-label">이메일</label>
							<input type="email" id="memberEmail" name="memberEmail" placeholder="이메일을 입력하세요" required/><br>
						</div>
						<input type="submit" id="sendEmail" class="btn btn-danger" value="비밀번호 발송"/>
					</form>
				</div>
				
			</div>	        
	        <input type="hidden" name="updateMessage" id="updateMessage" value="${updateMessage}">
	    </div>
    </div>   
    
    <script>
 		

    </script>               
                
                
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>