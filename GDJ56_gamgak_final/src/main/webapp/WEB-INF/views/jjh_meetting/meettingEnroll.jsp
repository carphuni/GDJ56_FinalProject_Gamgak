<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="loginMember" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
                <div id="meeting-wrapper">
                    <div id="meeting-item">
                        <a><img id="meeting-img" src="${path }/resources/images/플러스.png"></a>
                        <p>모임 이름</p>
                    </div>
                    <div id="meeting-item">
                        <a href="" onclick="window.open('${path}/meetting/meettingchat.do','채팅방','_blank, resizable=no,width=1000px,height=720px,scrollbars=no')"><img id="meeting-img" src="${path }/resources/images/임시 이미지03.jpg"></a>
                        <p>모임 이름</p>
                    </div>

                </div>
                <div id="profile-wrapper" style="text-align: center; display: flex;;">
                
                <H3 style="font-weight: bolder;">모임 생성하기</H3>
                <div style="margin: auto;">
                	<form action="${path}/meetting/enrollmeettingEnd.do" id="subheader-wrapper" method="post" style="padding: 10px;" onsubmit="return enrollmeetting_check();" enctype="multipart/form-data">
                	<input type="hidden" name="memberLeaderNo" value="${loginMember.memberNo}" >
                        <div style="display: flex; flex-direction: column; width: 550px; padding: 10px;">
                            <span style=" text-align: center; background-color: #dc3545; color: white; border: 3px #dc3545 solid; border-radius: 10px; padding: 5px;">모임 제목</span>
                            <input name="meetingTitle" id="meettingTitle" type="text" style="border: 1px #a89e9f solid; border-radius: 5px; height: 40px;" placeholder="제목을 입력해주세요" />
                            <div class="check_font" id="title_check"></div>
                            
                        </div>
                		<div style="display: flex; flex-direction: column;  width: 550px; padding: 10px;">
                            <span style=" text-align: center; background-color: #dc3545; color: white; border: 3px #dc3545 solid; border-radius: 10px; padding: 5px;">모임 나이</span>
                                <div style="display: flex; justify-content: space-around;">
                                    <div >
                                        <span class="col-6">최소</span>
                                        <input value=1  name="meetingMinAge" id="minAge" type="number" style="border: 1px #a89e9f solid; border-radius: 5px; height: 40px; width: 100px;" placeholder="최소" />
                                          <div class="check_font" id="minAge_check" ></div>
                                    </div>
                                    <div>
                                        <span class="col-6">최대</span>
                                        <input value=99 name="meetingMaxAge" id="maxAge" type="number" style="border: 1px #a89e9f solid; border-radius: 5px; height: 40px; width: 100px;" placeholder="최대" />
                                          <div class="check_font" id="maxAge_check" ></div>
                                    </div>
                                </div>
                                <div class="check_font" id="Age_check" style="color: #dc3545; font-weight: bolder;" >1 ~ 99이면 나이대 무관입니다.</div>
                                
                            
                        </div>
                		<div style="display: flex; flex-direction: column;  width: 550px; padding: 10px;">
                            <span style=" text-align: center; background-color: #dc3545; color: white; border: 3px #dc3545 solid; border-radius: 10px; padding: 5px;">
                                모임 모집 성별
                            </span>
                            <div style="display: flex; flex-direction: column;  width: 550px; padding: 10px;">
                                <div style="display: flex; justify-content: space-between; padding: 1px 40px 1px 40px;">
                                    <div >
                                        남성 <input  type="radio" id="gender" name="meetingGender" value="남자"/>
                                    </div>
                                    <div>
                                        여자 <input type="radio" id="gender" name="meetingGender" value="여자"/>
                                    </div>
                                    <div>
                                        무관 <input type="radio" id="gender" name="meetingGender" value="무관"/>
                                    </div>
                                </div>
                                <div class="check_font" id="gender_check"></div>
                            </div>
                        </div>
                		<div style="display: flex; flex-direction: column;  width: 550px; padding: 10px;">
                            <span style=" text-align: center; background-color: #dc3545; color: white; border: 3px #dc3545 solid; border-radius: 10px; padding: 5px;">모임 만나는 날짜</span>
                            <div style="display: flex; justify-content: space-around;">
                                <input name="meetingDate" id="meetingDate" type="datetime-local" style="border: 1px #a89e9f solid; border-radius: 5px; height: 40px; margin: auto;" />
                                <div style="margin: auto;">
                                    <input id="dateCKbox" name="dateCKbox" type="checkbox"><span>미정</span>
                                </div>
                            </div>
                            <div id="date_check"></div>
                            
                        </div>
                		<div style="display: flex; flex-direction: column;  width: 550px; padding: 10px;">
                            <span style=" text-align: center; background-color: #dc3545; color: white; border: 3px #dc3545 solid; border-radius: 10px; padding: 5px;">모집 인원수</span>
                            <input id="peopleNum" name="meetingPeopleNum" type="number" style="border: 1px #a89e9f solid; border-radius: 5px; height: 40px;" placeholder="인원수"/>
                            <div class="check_font" id="peopleNum_check"></div>
                        </div>
                        <div style="display: flex; flex-direction: column;  width: 550px; padding: 10px;">
                            <span style=" text-align: center; background-color: #dc3545; color: white; border: 3px #dc3545 solid; border-radius: 10px; padding: 5px;">모임 지역</span>
                            <select id="meetingArea" name="meetingArea" style="border: 1px #a89e9f solid; border-radius: 5px; height: 40px; text-align: center;">
                                <option value="지역선택">================지역 선택================</option>
                                <option value="경기도">경기도</option>
                                <option value="강원도">강원도</option>
                                <option value="서울특별시">서울특별시</option>
                                <option value="충청남도">충청남도</option>
                                <option value="충청북도">충청북도</option>
                                <option value="전라남도">전라남도</option>
                                <option value="전라남도">전라북도</option>
                                <option value="경상남도">경상남도</option>
                                <option value="경상북도">경상북도</option>
                                <option value="제주도">제주도</option>
                                <option value="인천광역시">인천광역시</option>
                                <option value="울산광역시">울산광역시</option>
                                <option value="부산광역시">부산광역시</option>
                                <option value="광주광역시">광주광역시</option>
                                <option value="대전광역시">대전광역시</option>
                            </select>
                            <div class="check_font" id="area_check" style="color: #dc3545; font-weight: bolder;"></div>
                        </div>
                		<div style="display: flex; flex-direction: column;  width: 550px; padding: 10px;">
                            <span style=" text-align: center; background-color: #dc3545; color: white; border: 3px #dc3545 solid; border-radius: 10px; padding: 5px;">모임 상세 위치</span>
                            <input name="meetingDetailAddr" type="text" placeholder="모임 상세 위치를 입력해주세요" style="border: 1px #a89e9f solid; border-radius: 5px; height: 40px;"/>
                            <div class="check_font" id="areaDetail_check" style="color: #dc3545; font-weight: bolder;">추후에 수정 가능! 미작성 가능</div>
                        </div>
                       <!--  <input type="file" name="fileupload"> -->
                        <div class="filebox preview-image" >
                        	<!-- <input type="file" name="meetingOriname"> -->
                             <span style=" text-align: center; background-color: #dc3545; color: white; border: 3px #dc3545 solid; border-radius: 10px; padding: 5px;">파일선택</span>
                             <input name="fileup1" class="upload-name" placeholder="채팅방 썸네일 사진" disabled="disabled" style="width: 300px;">
                          
                             <label name="fileup2" for="input-file" style="background-color: #dc3545; color: white;">업로드</label> 
                             <input  name="fileupload" style="text-align: center; background-color: #dc3545; color: white; border: 3px #dc3545 solid; border-radius: 10px; padding: 5px;" type="file" id="input-file" class="upload-hidden"> 
                            <div class="check_font" id="file_check" style="color: #dc3545; font-weight: bolder; "></div> 
                        </div>
                        <div style="display: flex; justify-content: space-between; margin: 10px;" >
                            <input type="submit" style="text-align: center; background-color: #dc3545; color: white; border: 3px #dc3545 solid; border-radius: 10px; padding: 5px;" value="생성하기">
                            <input type="reset" value="취소하기" style="text-align: center; background-color: #dc3545; color: white; border: 3px #dc3545 solid; border-radius: 10px; padding: 5px;">

                        </div>
                        
                        
                	</form>
                	
                </div>
                    
                   
                    
                </div>
              
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>



<script>
	// 유효성검사
    const enrollmeetting_check=()=>{
        
        const gender=$('input[name=meetingGender]').is(':checked');
        var titleJ=/^\s+|\s+$/g;
        var timeDATE=/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01]) (0[1-9]|1[0-9]|2[0-4]):(0[1-9]|[1-5][0-9]):(0[1-9]|[1-5][0-9])$/;
        var date=$('#meettingdate').val(); 
        console.log(date)


        var age=/^\d{1,2}$/;
        // 모임 제목 유효성검사
        if ($("#meettingTitle").val().trim()=="") {
            $('#title_check').css('color', '#dc3545').text("제목을 입력해주세요");
            $("#meettingTitle").focus();
            return false;

		}else{
            $('#title_check').text("");
        }


        // 모임 나이 제한 유효성 검사
    
        	
	        if (!age.test($("#minAge").val()) || !age.test($("#maxAge").val())) {
	
	            $('#Age_check').css('color', '#dc3545').text('나이를 입력해주세요');
	
	            if(!age.test($("#minAge").val())){
	                $('#Age_check').css('color', '#dc3545').text('최소나이를 입력해주세요');
	                $("#minAge").focus();
	               
	            }
	            else if(!age.test($("#maxAge").val())){
	                $('#Age_check').css('color', '#dc3545').text('최대나이를 입력해주세요');
	                $("#maxAge").focus();
	              
	                
	            }else{
	                $('#Age_check').text('');
	            }
	            return false;
	            
	        }else if($("#maxAge").val()<=$("#minAge").val()){
	               
	            $('#Age_check').text('최소나이가 최대 나이보다 큽니다.');
	            $('#Age_check').css('color', '#dc3545');
	            $("#maxAge").focus();
	            return false;
	        }else{
	            $('#Age_check').text('');
	            
	        }
        
        	
        
        
        
        
        // return false;
        
        // 모임 성별 유효성 검사
        console.log($('input[name=gender]').is(':checked'));
        if(!gender){
            alert("성별을 체크하세요");
            $('#gender_check').text('성별을 체크하세요');
            $('#gender_check').css('color', '#dc3545');
            //alert("성별을 체크하세요");
            return false;
         }else{
            $('#gender_check').text('');
         }


        //모임 날짜 유효성 검사
         const dateckbox=$('#dateCKbox').is(':checked');
         console.log(dateckbox);
         const meetingDate=$("#meetingDate").val();
         console.log(meetingDate);
         if(!dateckbox && !meetingDate){
            $('#date_check').text('모임날짜를 입력해주세요');
            $('#date_check').css('color', '#dc3545');
            $("#meetingDate").focus();
            
                return false;

         
         }else{
        	 var dateTimeFormatted = meetingDate.format('{yyyy}-{MM}-{dd} {HH}:{mm}:{ss}'); // 2014-01-01 00:00:01
            $('#date_check').text('');
         }

         

         //모임의 인원수 유효성검사
         if(!age.test($("#peopleNum").val())){
            $('#peopleNum_check').text('인원수를 입력하세요');
            $('#peopleNum_check').css('color', '#dc3545');
            return false;
         }else{
            $('#peopleNum_check').text('');
         }

         
        const meetingArea=$("select[name=meetingArea]").val();
        console.log("지역"+meetingArea)
       
         //모임지역 유효성 검사
         if(meetingArea=="지역선택"){
            $('#area_check').text('모임 지역을 선택해주세요');
            $('#area_check').css('color', '#dc3545');
            return false;
         }else{
            $('#area_check').text('');
         }
         
       
        

        //모임의 상세 위치 유효성 검사

        //파일 유효성 검사
        var imgFile1=$("input[name=fileupload]").val(); // 파일값
        var imgFile2=$("input[name=fileup1]").val(); // 파일값
        var imgFile3=$("input[name=fileup2]").val(); // 파일값
        console.log("file1"+imgFile1);
        console.log(imgFile2=="");
        console.log("file3"+imgFile3);
       // var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
       // var maxSize = 5 * 1024 * 1024;  
       // var fileSize = $(".upload-name")[0].files[0].size;

        if(imgFile2=="") {
           // console.log("들ㄷ어옴?");
            $('#file_check').text('썸네일 파일을 업로드하세요');
            return false;
	       
    
//         if(!imgFile2.match(fileForm)) {
//     	    alert("이미지 파일만 업로드 가능");
//             return false; 

// }


        }
       

    }
    


    
$('#dateCKbox').click(()=>{
    if($('#dateCKbox').is(':checked')){
        $("#meetingDate").val("");
    }
})

$('#meetingDate').click(()=>{
    $('#dateCKbox').prop('checked',false);
})


    












    // 사진 미리보기

    $(document).ready(function(){
    var fileTarget = $('.filebox .upload-hidden');

    fileTarget.on('change', function(){  // 값이 변경되면
        if(window.FileReader){  // modern browser
        var filename = $(this)[0].files[0].name;
        } 
        else {  // old IE
        var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
        }
        
        // 추출한 파일명 삽입
        $(this).siblings('.upload-name').val(filename);
    });
    }); 





    //preview image 
    var imgTarget = $('.preview-image .upload-hidden');

    imgTarget.on('change', function(){
        var parent = $(this).parent();
        parent.children('.upload-display').remove();

        if(window.FileReader){
            //image 파일만
            if (!$(this)[0].files[0].type.match(/image\//)) return;
            
            var reader = new FileReader();
            reader.onload = function(e){
                var src = e.target.result;
                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
            }
            reader.readAsDataURL($(this)[0].files[0]);
        }

        else {
            $(this)[0].select();
            $(this)[0].blur();
            var imgSrc = document.selection.createRange().text;
            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

            var img = $(this).siblings('.upload-display').find('img');
            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
        }
    });


</script>



<style>
    .filebox input[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
    }

    .filebox label {
    display: inline-block;
    padding: .5em .75em;
    color: #999;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
    }

    /* named upload */
    .filebox .upload-name {
    display: inline-block;
    padding: .5em .75em;  /* label의 패딩값과 일치 */
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: white;
    border: 1px solid #a89e9f;
    border-bottom-color: #a89e9f;
    border-radius: .25em;
    -webkit-appearance: none; /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
    }






        /* imaged preview */
    .filebox .upload-display {  /* 이미지가 표시될 지역 */
    margin-bottom: 5px;
    }

    @media(min-width: 768px) { 
    .filebox .upload-display {
        display: inline-block;
        margin-right: 5px;
        margin-bottom: 0;
    }
    }

    .filebox .upload-thumb-wrap {  /* 추가될 이미지를 감싸는 요소 */
    display: inline-block;
    width: 54px;
    padding: 2px;
    vertical-align: middle;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #fff;
    }

    .filebox .upload-display img {  /* 추가될 이미지 */
    display: block;
    max-width: 100%;
    width: 100% \9;
    height: auto;
    }

</style>