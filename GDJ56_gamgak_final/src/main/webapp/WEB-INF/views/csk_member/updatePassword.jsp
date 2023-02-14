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
		<div id="updatePassword-contents">
			<form action="${path }/member/updateNewPw" id="updatePassword" method="post" onsubmit="">
				<h1>🔒</h1>
						<p>비밀번호 변경<br> 가입시 입력한 이메일로 임시 비밀번호가 전송됩니다.<br>
						로그인 후 마이페이지에서 비밀번호를 변경 해주세요.</p>
						<div id="text-form">
				    		<label class="form-label">현재 비밀번호</label>
							<input type="password" id="memberPassword" name="memberPassword" placeholder="현재 비밀번호를 입력하세요" required/><br>
					    	<span id="oripasswordError" class="guide error">*비밀번호가 틀렸습니다.</span><br>
					    	<label class="form-label">신규 비밀번호</label>
							<input type="password" id="memberNewPassword" name="memberNewPassword" placeholder="신규 비밀번호를 영문/숫자/특수문자 조합 8자 이상" required/><br>
							<span id="passwordError" class="guide error">*8자 이상, 영문자, 숫자, 특수기호 혼합하여 입력해주세요.</span>
					    	<label class="form-label">신규 비밀번호 확인</label>
							<input type="password" id="memberNewPasswordCk" name="memberNewPasswordCk" placeholder="신규 비밀번호를 재입력하세요" required/><br>
							<span id="passwordErrorCk" class="guide error">*비밀번호가 일치하지않습니다.</span>
							<span id="passwordOk" class="guide ok">비밀번호가 일치합니다.</span>
						</div>
						<input type="button" id="updatePassword" class="btn btn-danger" value="변경하기" onclick="fn_password();"/>
					</form>
				</div>
				
			</div>	        
	        <input type="hidden" name="updateMessage" id="updateMessage" value="${updatePasswordMessage}">
	    </div>
    </div>   
    
    <script>
		$(()=>{
			$("#memberNewPasswordCk").blur(e=>{
				const pw=$("#memberNewPassword").val();
				const pwck=$(e.target).val();
				if(pw==pwck && pw!=''){
					$("#passwordOk").show();
					$("#passwordErrorCk").hide();
				} else if(pw!=pwck){
					$("#memberNewPassword").focus();
					$("#passwordErrorCk").show();
					$("#passwordOk").hide();
				} 
			});
		});
		$(()=>{
			$("#memberPassword").keyup(e=>{
				$("#oripasswordError").hide();
			});
		});
		$(()=>{
			$("#memberNewPassword").keyup(e=>{
				$("#passwordErrorCk").hide();
				$("#passwordOk").hide();
			});
		});
		const fn_password=()=>{
			let result=false;
			
			if($("#memberPassword").val==""){
				alert("현재 비밀번호를 입력해주세요");
				$("#memberPassword").focus();
				result=false;
			}
			if($("#memberNewPassword").val==""){
				alert("신규 비밀번호를 입력해주세요");
				$("#memberNewPassword").focus();
				result=false;
			}
			if($("#memberNewPasswordCk").val==""){
				alert("비밀번호 확인칸을 입력해주세요");
				$("#memberNewPasswordCk").focus();
				result=false;
			}
			
			const pw=$("#memberNewPassword").val().trim();
			const pwReg=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()])[A-Za-z\d!@#$%^&*()]{8,}$/;
			if(!pwReg.test(pw)){
				$("#passwordError").show();
				$("#passwordOk").hide();
				result=false;
				
			} else{
				$("#passwordError").hide();
				$("#passwordOk").show();
				result=true;
			}
			
			if(result==true){
				$.ajax({
					url : "${path}/member/checkPassword",
					type : "post",
					data : {memberPassword: $("#memberPassword").val()},
					async:false,
					success: data=>{
						if(!data){
							$("#oripasswordError").show();
							$("#passwordOk").hide();
							result=false;
						}else{
							if(confirm("변경하시겠습니까?")){
								$("#updatePassword").submit();
								alert("비밀번호 변경이 정상처리 되었습니다. 다시 로그인해 주세요.");
								result=true;
							}else{
								alert("비밀번호 변경을 취소하였습니다.");
								result=false;
							}
							
						}
					}
				});
			}
    	
		
		
		
		return result;
	}
	

    </script>               
                
                
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>