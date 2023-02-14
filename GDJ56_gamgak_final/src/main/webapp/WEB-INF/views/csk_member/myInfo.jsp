<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="loginMember" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/member.css">

	<div id="profileInfo-wrapper">
		<div id="profile-menu">
            <div ><button onclick="loadPage('/member/info')">프로필 편집</button></div>
	        <div ><button onclick="loadPage('/member/passwordUpdate')">비밀번호 변경</button></div>    
        </div>
        <div id="verticalLine"></div>
        <form action="${path }/member/update" method="post" onsubmit="nickName_invalidate();">
	        <div id="profile-wrapper-contents">
		        <div><h3>계정 변경하기</h3></div>
	            <div id="profile-contents">
		            <div class="inputbox">이메일 <input type="textarea" name="memberEmail" id="memberEmail" value="${loginMember.memberEmail }" readonly="readonly"/></div>
		            <div class="inputbox">이름 <input type="text" name="memberName" id="memberName" value="${loginMember.memberName}" readonly="readonly"/></div>
		            <div class="inputbox">닉네임 <input type="text" name="memberNickName" id="memberNickName" value="${loginMember.memberNickName}"/></div>
		            <span id="nickNamError" class="guide error">*사용중인 별칭입니다.</span>
		            <div class="inputbox">나이 <input type="text" name="memberAge" id="memberAge" value="${loginMember.memberAge }"/></div>
		            <div class="inputbox">소개 <textarea name="introduce" id="introduce" value="${loginMember.introduce }" maxlength="10" placeholder="자신을 소개해 보세요"></textarea></div>
		            <div class="inputbox">성별 
		            	<div><input type="radio" name="memberGender" id="genderF" value="F" ${loginMember.memberGender=="F"?'checked':'' }/>여성</div>
		            	<div><input type="radio" name="memberGender" id="genderM" value="M" ${loginMember.memberGender=="M"?'checked':'' }/>남성</div>
		            </div>
	            </div>
	        	<input type="submit" class="btn btn-danger" value="제출"/>
	        </div>    
	        <div>
	        	<input type="hidden" name="updateMessage" id="updateMessage" value="${updateMessage}">
	        </div>
	        <div>
	        	<input type="button" class="btn btn-danger" value="탈퇴하기"/>
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
 			let result=false;
  	   		$.ajax({
 	   			url:"${path}/enroll/duplicateNickName",
 	   			data:{memberNickName:$("#memberNickName").val()},
 	   			async:false,
 	   			success:data=>{
 	 				if(!data){
 	 					$("#nickNamError").hide();
 	 					result=true;
 	 				}else{
 	 					if(data.equals($("#memberNickName").val())){
		 					$("#nickNamError").hide();
		 					result=true;
 	 					}else {
 	 						$("#nickNamError").show();
 	 						result=false;
 	 					}
 	 				}
 	   			}
 	   		});
  	   		if(result==true){
	  	   		if(confirm("회원 정보를 변경하시겠습니까?")){
					$("#updatePassword").submit();
					alert("회원정보를 변경했습니다. 다시 로그인해 주세요.");
					result=true;
				}else{
					alert("비밀번호 변경을 취소하였습니다.");
					result=false;
				}
  	   		}
 			return result;
		}
    </script>               
                
                
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>