<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="loginMember" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
div#profileInfo-wrapper span.guide{display:none;position:relative;} 
	.ok{color:green}
	.error{color:red}
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
	<div id="profileInfo-wrapper">
		<div id="profile-menu">
            <div><button>프로필 편집</button></div>
            <div><button>비밀번호 변경</button></div>
            <div><button>모임 관리</button></div>    
        </div>
        <div id="verticalLine"></div>
        <form action="${path }/member/update" method="post" onsubmit="nickName_invalidate();">
	        <div id="profile-contents">
	            <div>
		            <div><h3>공개정보</h3></div>
		            <div>이름 <input type="text" name="memberName" id="memberName" value="${loginMember.memberName}" readonly="readonly"/></div>
		            <div>닉네임 <input type="text" name="memberNickName" id="memberNickName" value="${loginMember.memberNickName}"/></div>
		            <span id="nickNamError" class="guide error">*사용중인 별칭입니다.</span>
		            <div>소개 <input type="text" name="introduce" id="introduce" value="${loginMember.introduce }" placeholder="자신을 소개해 보세요"/></div>
	            </div>
	            <div>
		            <div><h3>개인 정보</h3></div>
		            <sub>회원님의 개인정보를 입력하세요. 이 정보는 공개 프로필에 포함되지 않습니다.</sub>
		            <div>이메일 <input type="textarea" name="memberEmail" id="memberEmail" value="${loginMember.memberEmail }" readonly="readonly"/></div>
		            <div>나이 <input type="text" name="memberAge" id="memberAge" value="${loginMember.memberAge }"/></div>
		            <div>성별 
		            <input type="radio" name="memberGender" id="genderF" value="F"/>여성
		            <input type="radio" name="memberGender" id="genderM" value="M"/>남성
		            </div>
	        	</div>
	        	<input type="submit" value="제출"/><br><br>
	        	<input type="button" value="탈퇴하기"/>
	        	<input type="hidden" name="updateMessage" id="updateMessage" value="${updateMessage}">
	        </div>
        </form>
    </div>   
    
    <script>
 		
		$(()=>{
			$("#memberNickName").keyup(e=>{
				$("#nickNamError").hide();
			});
		});
		
 		const nickName_invalidate=()=>{
  	   		$.ajax({
 	   			url:"${path}/enroll/duplicateNickName",
 	   			data:{memberNickName:$("#memberNickName").val()},
 	   			async:false,
 	   			success:data=>{
 	 				if(!data){
 	 					$("#nickNamError").hide();
 	 				}else{
 	 					if(data.equals($("#memberNickName").val())){
		 					$("#nickNamError").hide();
 	 					}
 	 					$("#nickNamError").show();
 	 				}
 	   			}
 	   		}); 
 
		}
  	   	if($("#updateMessage").val()!="") alert($("#updateMessage").val());
    </script>               
                
                
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>