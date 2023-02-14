<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="loginMember" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/member.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div id="profileInfo-wrapper">
		<div id="profile-menu">
            <div><button onclick="location.assign('${path }/member/myinfo')">프로필 편집</button></div>
	        <div><button onclick="location.assign('${path }/member/passwordUpdate')">비밀번호 변경</button></div>
        </div>
        <div id="verticalLine"></div>
	    <div id="profile-wrapper-contents">
	        <div id="profile-contents">
		    	<div><h3>계정 변경하기</h3></div>
        		<form action="${path }/member/update" id="formtag" method="post" onsubmit="nickName_invalidate();">
		            <div class="inputbox">이메일<input type="text" class="form-control" name="memberEmail" id="memberEmail" value="${loginMember.memberEmail }" readonly="readonly"/></div>
		            <div class="inputbox">이름 <input type="text" class="form-control" name="memberName" id="memberName" value="${loginMember.memberName}" readonly="readonly"/></div>
		            <div class="inputbox">닉네임 <input type="text" class="form-control" name="memberNickName" id="memberNickName" value="${loginMember.memberNickName}"/></div>
		            <span id="nickNamError" class="guide error">*사용중인 별칭입니다.</span>
		            <div class="inputbox">나이 <input type="text" class="form-control" name="memberAge" id="memberAge" value="${loginMember.memberAge }"/></div>
		            <div class="inputbox">소개 <textarea class="form-control" name="introduce" id="introduce" value="${loginMember.introduce }" maxlength="10" placeholder="자신을 소개해 보세요"></textarea></div>
		            <div class="inputbox">성별 
		            	<div><input type="radio" name="memberGender" id="genderF" value="F" ${loginMember.memberGender=="F"?'checked':'' }/>여성</div>
		            	<div><input type="radio" name="memberGender" id="genderM" value="M" ${loginMember.memberGender=="M"?'checked':'' }/>남성</div>
		            </div>
	        		<div class="inputbox"><input type="submit" id="submit" class="btn btn-danger" value="제출"/></div>
        		</form>
	        </div>
	    </div>    
	    
    </div>
    <div id="withdrawal-content">
		<input type="button" value="탈퇴하기"/>
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
 		
  		function moveMenu(url){
 	        // ajax option
 	        $.ajax({
 	        	url : url,
 	            async : true,
 	            type : "POST",
 	            
 	            cache : false
 	        }).done(function(data){
 	            // Contents 영역 삭제
 	            $('#profileInfo-wrapper').children().remove();
 	            // Contents 영역 교체
 	            $('#updatePassword-contents').html(data);
 	        });
 	    } 
 	    
    </script>               
                
                
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>