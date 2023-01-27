<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- 모임 -->
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

<!-- 맛집 순위 -->
<!-- ajax 반영해야함 -->
<div id="totalpage">
   <div id="rankbox">
      <div id="title1">
         <b id="titletext">실시간 맛집 순위</b>
      </div>
      <div id="box">
         <div id="tag">
            <button id="tagbutton1">전체</button><br>
            <button id="tagbutton2">한식</button><br>
            <button id="tagbutton2">중식</button><br>
            <button id="tagbutton2">일식</button><br>
            <button id="tagbutton2">디저트</button>
         </div>
         <div id="ranking">
            <div id="toptenleft">
               <div id="topten">
                  <c:forEach var="i" begin="1" end="5">
                     <a>${i } 진순대</a>
                  </c:forEach>
               </div>
               <div id="change">
                  <c:forEach var="i" begin="1" end="5">
                     <a>▲ 3</a>
                  </c:forEach>               
               </div>
            </div>
            <div id="toptenright">
               <div id="topten">
                  <c:forEach var="i" begin="6" end="10">
                     <a>${i } 은희네 해장국</a>
                  </c:forEach>                              
               </div>
               <div id="change">
                  <c:forEach var="i" begin="1" end="5">
                     <a>▼ 2</a>
                  </c:forEach>               
               </div>   
            </div>         
         </div>
      </div>
   </div>
   
   <!-- 지도 -->
   <div id="title1">
      <b id="titletext">장소별 맛집 검색</b>
   </div>
   <div class="map_wrap">
       <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
   
       <div id="menu_wrap" class="bg_white">
           <div class="option">
               <div>
                   <form onsubmit="searchPlaces(); return false;">
                       키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15" autocomplete="off"> 
                       <button type="submit">검색하기</button> 
                   </form>
               </div>
           </div>
           <hr>
           <ul id="placesList"></ul>
           <div id="pagination"></div>
       </div>
   </div>
</div>

<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ee03448a6bf04aae4a0e4b0695cff05a&libraries=services"></script> -->
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {
   
    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')&&!keyword.equals("")) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}


//장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        var bounds = new kakao.maps.LatLngBounds();
        
        for ( var i=0; i<data.length; i++ ) {
            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(data[i].y, data[i].x);

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);

        }
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
        
        // 현재 지도 영역의 정보 얻어오기
        getInfo();
        
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;
        
    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}


//지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}


// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}


//---------- 여기까지 장소 검색해서 지도 이동하기 ----------


function getInfo() {
    // 지도의 현재 영역을 얻어옵니다 
    var bounds = map.getBounds();
    
    // 영역의 남서쪽 좌표를 얻어옵니다 
    var swLatLng = bounds.getSouthWest(); 
    
    // 영역의 북동쪽 좌표를 얻어옵니다 
    var neLatLng = bounds.getNorthEast(); 
    
    var listEl = document.getElementById('placesList'),   
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    //정보 ajax로 넘겨주기
    $.ajax({
       url:"${path}/map/searchRes",
       type:"post",
       dataType:"json",
       data:{
          "swLat":swLatLng.getLat(),
          "swLon":swLatLng.getLng(),
          "neLat":neLatLng.getLat(),
          "neLon":neLatLng.getLng()
       },
       success:data=>{
         // console.log(data);
          displayPlaces(data);
       }
    })
}


//마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37), // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            alt:title
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}


//검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {
    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '	<div id="places_info">' +
                '   	<h5 id="places_res_name">' + places.RES_NAME + '</h5>' +
                '			<h5 id="places_count">&nbsp; &nbsp; ♥ ' + places.COUNT + '</h5>' +
                '	</div>' +
				'	<span>' +  places.RES_ADDRESS  + '</span>' +
				'	<span class="tel">' + places.RES_PHONE  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}


//검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {
    var listEl = document.getElementById('placesList'),   
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].RES_LAT, places[i].RES_LON),
            marker = addMarker(placePosition, i,places[i].RES_NAME), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        (function(marker, title) {
            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });
            
        	// 마커 클릭 시 해당 식당 목록 맨위로 출력
            kakao.maps.event.addListener(marker, 'click', function() {
                const title=$(marker.ca).attr("alt");
              	$("#placesList>li").css("backgroundColor","");
                $("#placesList>li").each((i,e)=>{
                	if($(e).find("#places_res_name").text()==title){
                		$(e).parent().prepend(e);
                		$(e).css("backgroundColor","#FFC6C6");
                	}
                });
          	});

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].RES_NAME);

        fragment.appendChild(itemEl);
    }        


    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
   // map.setBounds(bounds);
    console.log(places);
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}


// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}


//---------- 여기까지 DB에 저장된 데이터 출력 ----------


kakao.maps.event.addListener(map, 'idle', function() {        
	//console.log('asdf');
	getInfo();
});
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>