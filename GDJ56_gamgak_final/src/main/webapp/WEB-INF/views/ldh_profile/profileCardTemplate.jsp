<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="loginMember" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/>
<input type=hidden name="myresNos" value="${myResNos}"/>
<input type=hidden name="cPage" value="${cPage}"/>
<input type=hidden name="x" value="<c:forEach var='i' begin='0' end='${fn:length(myResList)>0?fn:length(myResList)-1:0}'>${i==0?myResList[i].restaurant.resLon : ','+=myResList[i].restaurant.resLon}</c:forEach>"/>
<input type=hidden name="y" value="<c:forEach var='i' begin='0' end='${fn:length(myResList)>0?fn:length(myResList)-1:0}'>${i==0?myResList[i].restaurant.resLat : ','+=myResList[i].restaurant.resLat}</c:forEach>"/>
<c:forEach var="myres" items="${myResList }">
    <div id="myresCard${myres.myResNo }" class="card" data-bs-toggle="modal" data-bs-target="#myresCardModal${myres.myResNo }">
        <img src="${not empty myres.myPic? path+="/resources/upload/myres/"+=myres.myPic.myPicReName:''}" class="card-img-top" onerror="this.src='${path }/resources/images/이미지 없음.jpg'">
        <div class="card-body">
            <span id="card-title">${myres.restaurant.resName }</span>
            <span id="card-category">${myres.restaurant.resCategory }</span>
            <span id="card-address">${myres.restaurant.resAddress }</span>
            <span id="card-memo">${fn:substring(myres.myResMemo,0,10)}...</span>
        </div>
    </div>
    <!-- 내 맛집 저장 Modal -->
	<div class="modal fade" id="myresCardModal${myres.myResNo }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div id="myresModal-dialog" class="modal-dialog modal-xl modal-dialog-centered">
			<div class="modal-content" >
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">${myres.restaurant.resName }</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div id="myresModal-body" class="modal-body">
					<div id="insertMap"></div>
					<div id="myresMap${myres.myResNo }" class="col-sm-12"></div>
					<div id="insert_menu_wrap" class="bg_white col-sm-6" style="display: none;">
						<div class="insert_option">
							<form onsubmit="dhsearchPlaces(); return false;" style="display: flex;width: 100%">
								<input id="insert_keyword" class="form-control" type="text" placeholder="식당 검색">
								<button type="submit" class="btn btn-danger">검색하기</button> 
							</form>
						</div>
						<hr>
						<ul id="insert_placesList"></ul>
						<hr>
						<div id="insert_pagination"></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#myresCardModalNext${myres.myResNo }">다음</button>
				</div>
			</div>
		</div>
	</div>   								
	<div class="modal fade" id="myresCardModalNext${myres.myResNo }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div  id="myresModal-dialog" class="modal-dialog modal-xl modal-dialog-centered">
			<div class="modal-content" >
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">${myres.restaurant.resName }</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<form id="insertModal-body" class="modal-body" action="${path }/profile/insertmyres.do" enctype="multipart/form-data" method="post">
					<!-- 캐러셀 -->
					<div id="mypicInfo-carousel${myres.myResNo }" class="carousel slide col-sm-6" data-bs-ride="carousel" style="height:100%;">
						<div id="mypic-inner" class="carousel-inner" style="height:100%;">
							<c:if test="${fn:length(myPicList)!=0 }">
								<c:forEach var='i' begin='0' end='${fn:length(myPicList)-1}'>
									<c:if test="${myPicList[i].myResNo==myres.myResNo }">
										<c:forEach var="j" begin='0' end="${fn:length(myPicList[i].myPicList)-1}">
											<div class="carousel-item ${j==0?'active':'' }" >
										      <img src="${path}/resources/upload/myres/${myPicList[i].myPicList[j].myPicReName}" class="d-block w-100" alt="..." style="height:100%;">
										    </div>
									    </c:forEach>
								    </c:if>
								    <c:if test="${myres.myPic.myPicReName==null&&i==fn:length(myPicList)-1}">
								    	<div class="carousel-item active">
									      <img src="${path}/resources/images/이미지 없음.jpg" class="d-block w-100" alt="..." style="height:100%;">
									    </div>
								    </c:if>
							    </c:forEach>
						    </c:if>
						    <c:if test="${fn:length(myPicList)==0 }">
						    	<div class="carousel-item active">
							      <img src="${path}/resources/images/이미지 없음.jpg" class="d-block w-100" alt="..." style="height:100%;">
							    </div>
						    </c:if>
						</div>
						<button class="carousel-control-prev" type="button" data-bs-target="#mypicInfo-carousel${myres.myResNo }" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#mypicInfo-carousel${myres.myResNo }" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
					
					<div id="insertMyResInfo" class="col-sm-6">
						<div id="myResProfile">
						   <img id="profile-img" src="${path }/resources/images/프로필 기본 이미지.jpg" data-bs-toggle="modal" data-bs-target="#imgModal"/>
						<span><c:out value="${loginMember.memberEmail}"/></span>
						</div>
						<textarea name="myres_memo" rows="10rem" class="col-sm-12" placeholder="내용이 없습니다" maxlength="2199" readonly>${myres.myResMemo}</textarea>
						<div id="textNum" style="">
							<span>${fn:length(myres.myResMemo)}</span>/2200
						</div>
						<hr>
						<div id="insertLocation">
							<span>${myres.restaurant.resName }</span>
							<i class="fa-solid fa-location-dot"></i>
						</div>
						<hr>
						<div id="insertShare">
							<span>공유 여부</span>
							<div class="form-check form-switch">
								<input name="myres_yn" class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault" ${myres.myResYn=='Y'?'checked':'' } disabled>
							</div>
						</div>
						<hr>
					</div>
					<input type="hidden" name="restaurant"/>
				</form>   
				<div class="modal-footer" style="display: flex; justify-content: space-between;">
					<c:if test="${memberNo==loginMember.memberNo}">
						<button id="deleteMyres" class="btn btn-danger" value="${myres.myResNo }">삭제</button>
					</c:if>
					<c:if test="${memberNo!=loginMember.memberNo}">
						<button id="myresreport" id="myresreport" data-bs-toggle="modal" data-bs-target="#myresreport" onclick="fun_myresreport('${myres.myResNo }','${myres }');" class="btn btn-danger">신고</button>
					</c:if>
					<div>
						<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#myresCardModal${myres.myResNo }">이전</button>
						<button class="btn btn-danger" data-bs-dismiss="modal">확인</button>
					</div>
	           </div>
			</div>
		</div>
	</div>
</c:forEach>
<script src="${path}/resources/js/profileCardTemplate.js"></script>
<script type="text/javascript">

function fun_myresreport(a,b) {
	console.log("게시물"+a)
	console.log("게시물"+b)
	$("#reportmyres").text("신고할 게시물 번호 : "+a);
	$("#reportmyresNo").val(a);
}

const report_myres=()=>{
	//신고 제목 유효성 검사
	if ($("#reprotTitle_myres").val().trim()=="") {
		$('#onsubmit_report_myres').css('color', '#dc3545').text("신고제목을 입력해주세요");
		$("#reprotTitle_myres").focus();
		return false;
	}
	else{
		$('#onsubmit_report_myres').text("");
	}

	const reportKind_user=$("select[name=reportKind_myres]").val();
	console.log(reportKind_myres)


	//신고분류 유효성 검사
	if(reportKind_user=="신고 분류 선택"){
		$('#onsubmit_report_myres').text('신고분류를 선택해주세요');
		$('#onsubmit_report_myres').css('color', '#dc3545');
		return false;
	}else{
		$('#onsubmit_report_myres').text('');
	}

	//신고사유 유효성검사
	if ($("#reportContent_myres").val().trim()=="") {
		$('#onsubmit_report_myres').css('color', '#dc3545').text("신고 내용을 입력해주세요");
		$("#reportContent_myres").focus();
		return false;
	}
	else{
		$('#onsubmit_report_myres').text("");
	}


	}
	
$('#reportContent_myres').keyup(function (e) {
		let content = $(this).val();
	    
	    // 글자수 세기
	    if (content.length == 0 || content == '') {
	    	$('.textCount').text('0자');
	    } else {
	    	$('.textCount').text(content.length + '자');
	    }
	    
	    // 글자수 제한
	    if (content.length > 1499) {
	    	// 200자 부터는 타이핑 되지 않도록
	        $(this).val($(this).val().substring(0, 1500));
	        // 200자 넘으면 알림창 뜨도록
	        alert('신고내용은 1500자까지만 입력할 수 있습니다.');
	    };
	});
</script>
