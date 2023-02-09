<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
                <div id="meeting-wrapper">
                    <div id="meeting-item">
                        <a><img id="meeting-img" src="${path }/resources/images/플러스.png"></a>
                        <p>모임 이름</p>
                    </div>
                    <div id="meeting-item">
                        <a><img id="meeting-img" src="${path }/resources/images/임시 이미지03.jpg"></a>
                        <p>모임 이름</p>
                    </div>

                </div>
                <div id="profile-wrapper">
                    <div id="info-container">
                        <a><img id="profile-img" src="${path }/resources/images/프로필 기본 이미지.jpg" data-bs-toggle="modal" data-bs-target="#imgModal"/></a>
                        <!-- Modal -->
                        <div class="modal fade" id="imgModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div id="imgModal-dialog" class="modal-dialog modal-dialog-centered">
	                            <div class="modal-content">
	                                <div id="img-modal-list" class="list-group">
									  <div class="list-group-item list-group-item-action" style="padding: 1.5rem">프로필 사진 바꾸기</div>
									  <a href="#" class="list-group-item list-group-item-action" style="color: #0d6efd">사진 업로드</a>
									  <a href="#" class="list-group-item list-group-item-action" style="color:#dc3545">현재 사진 삭제</a>
									  <a href="#" class="list-group-item list-group-item-action" data-bs-dismiss="modal">취소</a>
									</div>
	                            </div>
                            </div>
                        </div>
                        
                        <div id="info">
                            <div id="info-1">
                                <span><c:out value="${loginMember.memberEmail }"/></span>
                                <button id="edit-profile" type="button" class="btn btn-danger">프로필 편집</button>
                                
                            </div>
                            <div id="info-2" >
                                <div><span>내 맛집 기록</span><span id="res-num"><c:out value="${myResCount}"/></span></div>
                                <div id="colLine"></div>
                                <a><span>친구</span><span id="fri-num"><c:out value="${friendCount}"/></span></a>
                                <div id="colLine"></div>
  								<a data-bs-toggle="modal" data-bs-target="#meetingList"><span>모임</span><span id="fri-num"><c:out value="${meetingCount}"/></span></a>
                                
                                 <!-- jj의 모달!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                                
                           <div class="modal fade" id="meetingList" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                             <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
                               <div class="modal-content">
                                 <div class="modal-header">
                                   <h5 class="modal-title">My 모임 리스트</h5>
                                   <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                 </div>
                                 <div class="modal-body">
									<c:forEach var="m" items="${meetinginfo }">
                                              
		                                 <a>
		                                    <div  style="border: 3.5px #dc3545 solid; display: flex; border-radius: 1rem; padding: 1rem; justify-content: space-between; margin: 1rem">
		                                     	<div style="display: flex;">
		                                     	
		                                     	
		                                          <img src="${path }/resources/upload/meeting/${m.meetingRename}" style="border: 1px black solid; border-radius: 100%; height: 100px; width: 100px;">
		                                          <div style="display: flex; flex-direction: column; padding: 0px 0px 0px 10px; text-align: left;">
		                                             <div>
		                                                <label>${m.meetingTitle }</label>
                                                    	<label style="display: none;" id="memberLeaderNo" >${m.memberLeaderNo}</label>
                                                   		<label style="display: none;" id="meetingNo">${m.meetingNo}</label>
		                                                <span>[ ${ m.meetingCurrentCount} /</span><span> ${m.meetingPeopleNum } ]</span>
		                                             </div>
			                                             <c:if test="${m.meetingMinAge==1 && m.meetingMaxAge==99 }">
			                                             	<span>나이대 : 나이대 무관</span>
			                                             </c:if>
			                                             <c:if test="${m.meetingMinAge!=1 && m.meetingMaxAge!=99 }">
			                                                <span>나이대 : ${m.meetingMinAge}세 ~ ${m.meetingMaxAge }세</span>
			                                             	
			                                             </c:if>
		                                             <div>
		                                             	<c:if test="${m.meetingGender=='무관' }">
		                                             		<span>성별 : 무관 </span>
		                                             	</c:if>
		                                             	<c:if test="${m.meetingGender!='무관' }">
		                                             		<span>성별 : ${m.meetingGender } </span>
		                                             	</c:if>
		                                               
		                                                
		                                             </div>
		                                             <div>
		                                             	<c:if test="${m.meetingDetailAddr==null }">
		                                             		<span>모임 장소 : 미정 </span>
		                                             	</c:if>
		                                             	<c:if test="${m.meetingDetailAddr!=null }">
		                                             		<span>모임 장소 : ${m.meetingDetailAddr } </span>
		                                             	</c:if>
		                                             </div>
		                                             <div>
		                                             	<c:if test="${m.meetingDate==null }">
		                                             		<span>모임 시간 : 미정 </span>
		                                             	</c:if>
		                                             	<c:if test="${m.meetingDate!=null }">
		                                             		<span>모임 시간 : ${m.meetingDate } </span>
		                                             	</c:if>
		                                             </div>

		   
		                                       </div>
		                                       </div>
		                                       <div style="display: flex; flex-direction: column;">
		                                       		<c:if test="${m.memberLeaderNo==loginMember.memberNo }">
			                                          <button id="signupmeetingList" onclick="signupmeetingList('${m.memberNo}','${m.meetingNo}')" class="btn btn-danger" type="button" style="margin: 0px 0px 5px 0px; width: 130px" data-bs-target="#applymeetingList" data-bs-toggle="modal">신청현황</button>
			                                          <button class="btn btn-danger" onclick="location.assign('${path}/meetting/updatemeetting.do?memberNo=${m.memberNo }&meetingNo=${m.meetingNo }')" type="button" style="margin: 0px 0px 5px 0px">수정하기</button>
			                                          <button class="btn btn-danger" type="button">삭제하기</button>	
		                                       		</c:if>
		                                       		<c:if test="${m.memberLeaderNo!=loginMember.memberNo }">
			                                          <button class="btn btn-danger" type="button" style="margin: 0px 0px 5px 0px; width: 130px">채팅방가기</button>
			                                          <button class="btn btn-danger" type="button">나가기</button>	
		                                       		</c:if>
		                                       		
		                                       </div>
		                                   
                                        </div>
		                        
		
		                                 </a>
                                     
	                                 </c:forEach>
                                   </div>
                                   <script type="text/javascript">
                                      function signupmeetingList(a,b){
                                        console.log(a,b);


                                        $.ajax({
                                          type : "get",
                                          url : "meeting/signuplist.do",
                                          data :{
                                            "memberNo" : a,
                                            "meetingNo" : b
                                          },
										  dataType : "html",
										  
										 
                                          success : function(res){
											 console.log(res);
											

												
											// }
											console.log("ajax"+b);
												$("#signAtag").html(res)
											//res.meetingsignlist.forEach((el)=>{
												// $("#signAtag").empty();
												

											
											

                                          },
                                            error :function(){
                                              alert("참여내역을 불러올 수 없습니다.")
                                            }
                                        })
                                      }


                                    </script>
                                   
                                 
                                 
                                 <div class="modal-footer">
                                   <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                  <!--  <button type="button" class="btn btn-primary">Save changes</button> -->
                                 </div>
                               </div>
                             </div>
                           </div>        

                           <div class="modal fade" id="applymeetingList" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                              <div class="modal-dialog modal-lg  modal-dialog-centered modal-dialog-scrollable">
                                <div class="modal-content">
                                 <div class="modal-header">
                                   <h5 class="modal-title">모임 신청 현황</h5>
                                   <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                 </div>
                                 <div id="signmodal" class="modal-body">
									             
									 <a id="signAtag">
										<!--<div id="maindiv" style="border: 3.5px #dc3545 solid; display: flex; border-radius: 1rem; padding: 1rem; justify-content: space-between;">
										   <div id="signinfo" style="display: flex; ">
											  <img style="border: 1px black solid; border-radius: 100%; height: 60px; width: 60px;">
											  <div id="nickage" style="display: flex; flex-direction: column; padding: 0px 0px 0px 10px;">
													 <label>닉네임 : dsfdfdf</label>
													 <label>나이 : 27살</label>
											  </div>
											  <div id="genrep" style="display: flex; flex-direction: column; padding: 0px 0px 0px 10px;">
												   <label>성별 : 남자</label>
												   <label>신고 횟수 : 0회</label>
											  </div>

											  
											</div>
											<div id="btnGroup" style="display: flex; flex-direction: column;">
											  <button class="btn btn-danger" type="button" style="margin: 0px 0px 5px 0px">신청 수락</button>
											  <button class="btn btn-danger" type="button" style="margin: 0px 0px 5px 0px">신청 거부</button>
										   </div>
									   </div>-->
								   
								   
								  </a>
                               </div>
                                  
  
                                  
                                 <div class="modal-footer">
                                   <button type="button" class="btn btn-primary" data-bs-target="#meetingList" data-bs-toggle="modal">모임리스트</button>
                                   <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                 </div>

                                </div>
                             </div>
                            </div>
                              
                             
                             
                             
                                    
                              <!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->               
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                

                            </div>
                            <div id="info-3"><c:out value="${loginMember.memberNickName }"/></div>
                            <div id="info-d4">
                                <span><c:out value="${loginMember.introduce }"/></span>
                            </div>
                        </div>
                        <a><i class="fa-solid fa-gear fa-lg" data-bs-toggle="modal" data-bs-target="#settingModal"></i></a>
                        <!-- Modal -->
                        <div class="modal fade" id="settingModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div id="settingModal-dialog" class="modal-dialog modal-dialog-centered">
	                            <div class="modal-content">
	                                <div id="setting-modal-list" class="list-group">
									  <a href="#" class="list-group-item list-group-item-action">비밀번호 변경</a>
									  <a href="#" class="list-group-item list-group-item-action">프로필 편집</a>
									  <a href="#" class="list-group-item list-group-item-action">로그아웃</a>
									  <a href="#" class="list-group-item list-group-item-action" data-bs-dismiss="modal">취소</a>
									</div>
	                            </div>
                            </div>
                        </div>
                    </div>
                    <div id="rowLine"></div>
                    <div id="search">
	                    <div id="search-container">
	                        <span id="show-click" style="border-bottom: 2px #dc3545 solid;">내 맛집</span>
	                        <div id="colLine"></div>
	                        <span id="area-click" >지역별</span>
	                        <div id="colLine"></div>
	                        <span id="title-click">검색</span>
	                    </div>
	                    <div id="search-item">
		                    <button id="show-search" type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#insertModal">새 맛집 기록</button>
		                    <select id="area-search" class="form-select" >
							  <option selected>지역 선택</option>
							  <option value="서울">서울특별시</option>
							  <option value="경기">경기도</option>
							  <option value="인천">인천</option>
							  <option value="강원">강원도</option>
							  <option value="전북">전라북도</option>
							  <option value="전남">전라남도</option>
							  <option value="충북">충청북도</option>
							  <option value="충남">충청남도</option>
							  <option value="대전">대전</option>
							  <option value="경북">경상북도</option>
							  <option value="경남">경상남도</option>
							  <option value="부산">부산</option>
							  <option value="대구">대구</option>
							  <option value="부산">울산</option>
							  <option value="제주특별자치도">제주도</option>
							</select>
							<div id="title-search">
								<form>
									<input class="form-control" type="text" placeholder="제목, 카테고리 검색">
									<button class="btn btn-danger col-sm-3" type="submit">검색</button>
								</form>
							</div>
	                    </div>
                    </div>
                    <div id="card-container">
	                    <c:forEach var="myres" items="${myResList }">
	                        <div class="card">
	                            <img src="${not empty myres.myPic? "/resources/upload/myres/"+=myres.myPic.myPicReName:''}" class="card-img-top" onerror="this.src='${path }/resources/images/이미지 없음.jpg'">
	                            <div class="card-body">
	                                <span id="card-title">${myres.restaurant.resName }</span>
	                                <span id="card-category">${myres.restaurant.resCategory }</span>
	                                <span id="card-address">${myres.restaurant.resAddress }</span>
	                                <span id="card-memo">${fn:substring(myres.myResMemo,0,10)}...</span>
	                            </div>
	                        </div>
	                    </c:forEach>
                       
                    </div> 
                    <div class="d-flex justify-content-center" >
						<div id="profileLoading" class="spinner-border text-danger" role="status" style="display: none">
						  <span class="visually-hidden">Loading...</span>
						</div>
					</div>
                </div>
<script>
	let profileCPage=1;
	let profileURL="/profile/scrollselectMyresAll";
	$("#show-click").click(()=>{
		profileURL="/profile/scrollselectMyresAll";
		$(window).on("scroll",()=>{
			profileScroll();
		});
	})
	$("#area-click").click(()=>{
		profileURL="/profile/scrollselectMyresArea";
		$(window).on("scroll",()=>{
			profileScroll();
		});
	})
	$("#title-click").click(()=>{
		profileURL="/profile/scrollselectMyresTitle";
		$(window).on("scroll",()=>{
			profileScroll();
		});
	})
	
	//스크롤 시 페이징 처리
	function profileScroll() {
		 if (Math.round($(window).scrollTop())-16> $(document).height() - $(window).height()) {
			profileCPage++;
		    $("#profileLoading").show();
		    $.ajax({
		        type: "GET",
		        url: profileURL,
		       	data: {"cPage": profileCPage},
		        error: function() {
		          console.log('통신실패!!');
		        },
		        success: function(result) {
		        	result.myResList.forEach((el)=>{
		        		let cardDiv=$("<div>").addClass("card")
		        		let cardImg=$("<img>").addClass("card-img-top").attr("src", el.myPic.myPicReName!=null?"/resources/upload/myres/"+el.myPic.myPicReName:"").attr("onerror","this.src='/resources/images/이미지 없음.jpg'");
		        		let cardBobyDiv=$("<div>").addClass("card-body");
		        		
		        		let cardTitleSpan=$("<span>").attr("id","card-title").html(el.restaurant.resName);
		        		let cardCategorySpan=$("<span>").attr("id","card-category").html(el.restaurant.resCategory);
		        		let cardAddressSpan=$("<span>").attr("id","card-address").html(el.restaurant.resAddress);
		        		let cardMemoSpan=$("<span>").attr("id","card-memo").html(el.myResMemo);
		        		
		        		cardBobyDiv.append(cardTitleSpan);
		        		cardBobyDiv.append(cardCategorySpan);
		        		cardBobyDiv.append(cardAddressSpan);
		        		cardBobyDiv.append(cardMemoSpan);
		        		
		        		cardDiv.append(cardImg);
		        		cardDiv.append(cardBobyDiv);
		        		
		        		$("#card-container").append(cardDiv); 
		        	})
		        	$("#profileLoading").hide();
		        	if(result.myResList.length==0){
			        	$(window).off("scroll");
		        	}
		        }
			});   
		    
		 } 
		
	}
	
	
	$(window).scroll(()=>{
		profileScroll();
	});
</script> 
<script src="${path}/resources/js/mainProfile.js"></script>               
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>