<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
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
                	<form action="" id="subheader-wrapper" style="padding: 10px;">
                        <div style="display: flex; flex-direction: column; width: 550px; padding: 10px;">
                            <span style=" text-align: center; background-color: #dc3545; color: white; border: 3px #dc3545 solid; border-radius: 10px; padding: 5px;">제목</span>
                            <input type="text" style="border: 1px #a89e9f solid; border-radius: 5px; height: 40px;" placeholder="제목을 입력해주세요"/>
                            
                        </div>
                		<div style="display: flex; flex-direction: column;  width: 550px; padding: 10px;">
                            <span style=" text-align: center; background-color: #dc3545; color: white; border: 3px #dc3545 solid; border-radius: 10px; padding: 5px;">나이</span>
                                <div>
                                    <span class="col-6">
                                        최소
                                    </span>
                                    <input type="number" style="border: 1px #a89e9f solid; border-radius: 5px; height: 40px;" placeholder="최소"/>
                                    <span class="col-6">
                                        최대
                                    </span>
                                    <input type="number" style="border: 1px #a89e9f solid; border-radius: 5px; height: 40px;" placeholder="최대"/>
                                </div>
                            
                        </div>
                		<div style="display: flex; flex-direction: column;  width: 550px; padding: 10px;">
                            <span style=" text-align: center; background-color: #dc3545; color: white; border: 3px #dc3545 solid; border-radius: 10px; padding: 5px;">
                                성별
                            </span>
                            <div style="display: flex; flex-direction: column;  width: 550px; padding: 10px;">
                                <div style="display: flex; justify-content: space-between;">
                                    남자<input type="radio" name="gender" value="M"/>
                                    여자<input type="radio" name="gender" value="M"/>
                                    무관<input type="radio" name="gender" value="무관"/>
                                </div>
                            </div>
                        </div>
                		<div style="display: flex; flex-direction: column;  width: 550px; padding: 10px; padding: 10px;">
                            <span style=" text-align: center; background-color: #dc3545; color: white; border: 3px #dc3545 solid; border-radius: 10px; padding: 5px;">날짜</span>
                            <div>
                                <input type="datetime-local" style="border: 1px #a89e9f solid; border-radius: 5px; height: 40px;" placeholder="모임 제목을 입력해주세요"/>
                                <input type="checkbox" value="미정">미정 
                            </div>
                            
                        </div>
                		<div style="display: flex; flex-direction: column;  width: 550px; padding: 10px;">
                            <span style=" text-align: center; background-color: #dc3545; color: white; border: 3px #dc3545 solid; border-radius: 10px; padding: 5px;">인원수</span>
                            <input type="number" style="border: 1px #a89e9f solid; border-radius: 5px; height: 40px;" placeholder="인원수"/>
                            
                        </div>
                        <div style="display: flex; flex-direction: column;  width: 550px; padding: 10px;">
                            <span style=" text-align: center; background-color: #dc3545; color: white; border: 3px #dc3545 solid; border-radius: 10px; padding: 5px;">모임 지역</span>
                            <select style="border: 1px #a89e9f solid; border-radius: 5px; height: 40px;">
                                <option value="경기도">경기도</option>
                                <option value="강원도">강원도</option>
                                <option value="서울특별시">서울특별시</option>
                                <option value="충청남도">충청남도</option>
                                <option value="충청북도">충청북도</option>
                                <option value="전라남도">전라남도</option>
                                <option>전라북도</option>
                                <option>경상남도</option>
                                <option>경상북도</option>
                                <option>제주도</option>
                                <option>인천광역시</option>
                                <option>울산광역시</option>
                                <option>부산광역시</option>
                                <option>광주광역시</option>
                                <option>대전광역시</option>
                            </select>
                        </div>
                		<div style="display: flex; flex-direction: column;  width: 550px; padding: 10px;">
                            <span style=" text-align: center; background-color: #dc3545; color: white; border: 3px #dc3545 solid; border-radius: 10px; padding: 5px;">모임 상세 위치</span>
                            <input type="text" placeholder="모임 상세 위치를 입력해주세요" style="border: 1px #a89e9f solid; border-radius: 5px; height: 40px;"/>
                            
                        </div>
                        <div class="filebox preview-image" >
                            <span style=" text-align: center; background-color: #dc3545; color: white; border: 3px #dc3545 solid; border-radius: 10px; padding: 5px;">파일선택</span>
                            <input class="upload-name" value="채팅방 썸네일 사진" disabled="disabled" style="width: 300px;">
                          
                            <label for="input-file" style="background-color: #dc3545; color: white;">업로드</label> 
                            <input style="text-align: center; background-color: #dc3545; color: white; border: 3px #dc3545 solid; border-radius: 10px; padding: 5px;" type="file" id="input-file" class="upload-hidden"> 
                        </div>
                        <div style="display: flex; justify-content: space-between; margin: 10px;" >
                            <input type="submit" style="text-align: center; background-color: #dc3545; color: white; border: 3px #dc3545 solid; border-radius: 10px; padding: 5px;" value="생성하기">
                            <input type="reset" value="취소하기" style="text-align: center; background-color: #dc3545; color: white; border: 3px #dc3545 solid; border-radius: 10px; padding: 5px;">

                        </div>
                        
                        
                	</form>
                	
                </div>
                    
                   
                    
                </div>
              
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

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

<script>
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