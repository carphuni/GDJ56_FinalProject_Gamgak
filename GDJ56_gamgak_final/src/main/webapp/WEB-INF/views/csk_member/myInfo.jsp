<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="loginMember" value=" ${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
#profile-menu {
    
}
#profileInfo-wrapper{
	margin-top: 1rem;
    width: 50rem;
    background-color: white;
    padding: 1rem;
    border-radius: 0.5rem;
    border: 1px solid rgb(177, 177, 177);
    display: flex;
}
#verticalLine{
    margin-left: 5%;
    border-left : thick solid #dc3545;
    /* border: 1px solid #dc3545; */
}
</style>
<!-- <p>
    시큐리티에 적용된 세션값 가져오기 
        세션 : ${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username }
        세션 : ${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.memberAge}
        세션 : ${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.memberEmail}
        
    </p>  -->
        세션 : ${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }
      Object principal=SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	      Member user=(Member)principal;
	      user;
	      console.log
	<div id="profileInfo-wrapper">
		<div id="profile-menu">
            <div><button>프로필 편집</button></div>
            <div><button>비밀번호 변경</button></div>
            <div><button>모임 관리</button></div>    
        </div>
        <div id="verticalLine"></div>
        <div id="profile-contents">
            <div>
	            <div><h3>공개정보</h3></div>
	            <div>이름 <input type="text" id="memberName" value="" readonly="readonly"/></div>
	            <div>닉네임 <input type="text" id="memberNickName" value="${loginMember.memberNickName}"/></div>
	            <div>소개 <input type="text" id="memberIntroduce" value="" placeholder="자신을 소개해 보세요"/></div>
            </div>
            <div>
	            <div><h3>개인 정보</h3></div>
	            <sub>회원님의 개인정보를 입력하세요. 이 정보는 공개 프로필에 포함되지 않습니다.</sub>
	            <div>이메일 <input type="textarea" id="memberEmail" value=""/></div>
	            <!--  <div>전화번호 <input type="text" id="memberName" value=""/></div> -->
	            <div>성별 <input type="radio" id="memberGender" value="여성"/><input type="radio" id="memberName" value="남성"/></div>
        	</div>
        	<input type="submit" value="제출">
        </div>
    </div>                  
                
                
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>