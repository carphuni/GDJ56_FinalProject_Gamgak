<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
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
					<div id="mypic-carousel" class="carousel slide col-sm-6" data-bs-ride="carousel" style="height:100%;">
						<div id="mypic-inner" class="carousel-inner">
							<c:forEach var='i' begin='0' end='1'>
								<div class="carousel-item ${i==0?'active':'' }">
							      <img src="/resources/upload/myres/" class="d-block w-100" alt="...">
							    </div>
						    </c:forEach>
						</div>
						<button class="carousel-control-prev" type="button" data-bs-target="#mypic-carousel" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#mypic-carousel" data-bs-slide="next">
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
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#myresCardModal${myres.myResNo }">이전</button>
					<button class="btn btn-danger" data-bs-dismiss="modal">확인</button>
	           </div>
			</div>
		</div>
	</div>
</c:forEach>
<script src="${path}/resources/js/profileCardTemplate.js"></script>
