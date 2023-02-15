<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="${path}/resources/js/ranking.js"></script>

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
            <button class="tagbutton1" value="">전체</button><br>
            <button class="tagbutton2" value="한식">한식</button><br>
            <button class="tagbutton2" value="양식">양식</button><br>
            <button class="tagbutton2" value="중식">중식</button><br>
            <button class="tagbutton2" value="일식">일식</button><br>
            <button class="tagbutton2" value="카페">카페</button>
         </div>
         <div id="ranking">
            <div id="toptenleft">
               <div id="topten1">
	               <!-- 순위 / 식당이름 -->
               </div>
               <div id="change1">
                  <c:forEach var="i" begin="1" end="5">
                     <a>▲ 3</a>
                  </c:forEach>               
               </div>
            </div>
            <div id="toptenright">
               <div id="topten2">
					<!-- 순위 / 식당이름 -->                         
               </div>
               <div id="change2">
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
       <div id="mapch" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
   
       <div id="menu_wrapch" class="bg_white">
           <div class="option">
               <div>
                   <form onsubmit="searchPlacesch(); return false;">
                       키워드 : <input type="text" value="이태원 맛집" id="keywordch" size="15" autocomplete="off"> 
                       <button type="submit">검색하기</button> 
                   </form>
               </div>
           </div>
           <hr>
           <ul id="placesListch"></ul>
           <div id="paginationch"></div>
       </div>
   </div>
</div>


<script>
//맛집 순위 자동실행
	(() => {
		$.ajax({
			url:"${path}/rankingCategory.do",
			data:{
			},
			success:data=>{
				rankingList(data);
			}
		})
	})();
	
	$("#tag>button").click(e=>{
		$(".tagbutton1").attr("class","tagbutton2");
		console.log(e);
		$(e.currentTarget).attr("class","tagbutton1");
		const tag=e.target.value;
		$.ajax({
			url:"${path}/rankingCategory.do",
			data:{
				"tag":tag
			},
			success:data=>{
				console.log(data);
				rankingList(data); //출력해주는 js
			}
		})
	})
	
 	//순위 리스트에서 식당 클릭 시
	$(document).on("click",".ranking_res_name",function(e){
		console.log(e);
		const resNo=e.target.attributes.value.textContent;
		$.ajax({
			url:"${path}/rankingListClick.do",
			data:{
				"resNo":resNo
			},
			success:data=>{
				console.log(data);
				rankingListClick(data);
			}
		})
	})
	
	function rankingListClick(data){
		var listElch = document.getElementById('placesListch'),   
	    menuElch = document.getElementById('menu_wrapch'),
	    fragmentch = document.createDocumentFragment(), 
	    boundsch = new kakao.maps.LatLngBounds(), 
	    listStrch = '';
		
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNodsch(listElch);
	
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarkerch();
		
	 	// 마커를 생성하고 지도에 표시합니다
	    var placePositionch = new kakao.maps.LatLng(data.data.RES_LAT, data.data.RES_LON);
		
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        boundsch.extend(placePositionch);
        
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        mapch.setBounds(boundsch);
    		

    }
	
	
	//--------------------------------------------------------------------------------------------------
	
	// 마커를 담을 배열입니다
	var markersch = [];
	
	var mapContainerch = document.getElementById('mapch'), // 지도를 표시할 div 
	    mapOptionch = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var mapch = new kakao.maps.Map(mapContainerch, mapOptionch); 
	
	// 장소 검색 객체를 생성합니다
	var psch = new kakao.maps.services.Places();  
	
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindowch = new kakao.maps.InfoWindow({zIndex:1});
	
	// 키워드로 장소를 검색합니다
	searchPlacesch();
	
	// 키워드 검색을 요청하는 함수입니다
	function searchPlacesch() {
	    var keywordch = document.getElementById('keywordch').value;
	
	    if (!keywordch.replace(/^\s+|\s+$/g, '')&&!keywordch.equals("")) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }
	
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    psch.keywordSearch( keywordch, placesSearchCBch); 
	}
	
	
	//장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCBch(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	        var boundsch = new kakao.maps.LatLngBounds();
	        
	        for ( var i=0; i<data.length; i++ ) {
	            // 마커를 생성하고 지도에 표시합니다
	            var placePositionch = new kakao.maps.LatLng(data[i].y, data[i].x);
	
	            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	            // LatLngBounds 객체에 좌표를 추가합니다
	            boundsch.extend(placePositionch);
	
	        }
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        mapch.setBounds(boundsch);
	        
	        // 현재 지도 영역의 정보 얻어오기
	        getInfoch();
	        
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	
	        alert('검색 결과가 존재하지 않습니다.');
	        return;
	        
	    } else if (status === kakao.maps.services.Status.ERROR) {
	
	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;
	
	    }
	}
	
	
	//지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarkerch() {
	    for ( var i = 0; i < markersch.length; i++ ) {
	        markersch[i].setMap(null);
	    }   
	    markersch = [];
	}
	
	
	// 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNodsch(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
	
	
	//---------- 여기까지 장소 검색해서 지도 이동하기 ----------
	
	
	function getInfoch() {
	    // 지도의 현재 영역을 얻어옵니다 
	    var boundsch = mapch.getBounds();
	    
	    // 영역의 남서쪽 좌표를 얻어옵니다 
	    var swLatLngch = boundsch.getSouthWest(); 
	    
	    // 영역의 북동쪽 좌표를 얻어옵니다 
	    var neLatLngch = boundsch.getNorthEast(); 
	    
	    var listElch = document.getElementById('placesListch'),   
	    menuElch = document.getElementById('menu_wrapch'),
	    fragmentch = document.createDocumentFragment(), 
	    boundsch = new kakao.maps.LatLngBounds(), 
	    listStrch = '';
	    
	    //정보 ajax로 넘겨주기
	    $.ajax({
	       url:"${path}/map/searchRes",
	       type:"post",
	       dataType:"json",
	       data:{
	          "swLat":swLatLngch.getLat(),
	          "swLon":swLatLngch.getLng(),
	          "neLat":neLatLngch.getLat(),
	          "neLon":neLatLngch.getLng()
	       },
	       success:data=>{
	          //console.log(data);
	          displayPlacesch(data);
	       }
	    })
	}
	
	
	//마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarkerch(position, idx, title) {
	    var imageSrcch = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSizech = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptionsch =  {
	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37), // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	            alt:title
	        },
	        markerImagech = new kakao.maps.MarkerImage(imageSrcch, imageSizech, imgOptionsch),
	            markerch = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImagech 
	        });
	
	    markerch.setMap(mapch); // 지도 위에 마커를 표출합니다
	    markersch.push(markerch);  // 배열에 생성된 마커를 추가합니다
	
	    return markerch;
	}
	
	
	//검색결과 항목을 Element로 반환하는 함수입니다
	function getListItemch(index, places) {
	    var elch = document.createElement('li'),
	    itemStrch = '<p id="list'+index+'">' +
	    		'<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '	<div id="places_info">';
 	                if(places.RES_NAME.length>8){
 	                	itemStrch+='   	<h5 id="places_res_name">' + places.RES_NAME.slice(0,8)+"..." + '</h5>' ;
	                }else{
	                	itemStrch+='   	<h5 id="places_res_name">' + places.RES_NAME + '</h5>' ;
	                } 
 	                itemStrch+=
 	            	'			<h5 id="places_count">&nbsp; &nbsp; ♥ ' + places.COUNT + '</h5>' +
	                '	</div>';
	                if(places.RES_ADDRESS!=null&&places.RES_PHONE!=null){
	                	itemStrch+=
	        				'	<span>' +  places.RES_ADDRESS  + '</span>' +
	        				'	<span class="tel">' + places.RES_PHONE  + '</span>' +
	                        '</div>'; 
	                }else if(places.RES_ADDRESS!=null){
	                	itemStrch+=
	                		'	<span>' +  places.RES_ADDRESS  + '</span>' +
	                		'</div>'; 
	                }else if(places.RES_PHONE!=null){
	                	itemStrch+=
	                		'	<span class="tel">' + places.RES_PHONE  + '</span>' +
	                		'</div>'; 
	                }
	                
	    elch.innerHTML = itemStrch;
	    elch.className = 'item';
	
	    return elch;
	}
	
	
	//검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlacesch(places) {
	    var listElch = document.getElementById('placesListch'),   
	    menuElch = document.getElementById('menu_wrapch'),
	    fragmentch = document.createDocumentFragment(), 
	    boundsch = new kakao.maps.LatLngBounds(), 
	    listStrch = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNodsch(listElch);
	
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarkerch();
	    
	    for ( var i=0; i<places.length; i++ ) {
	
	        // 마커를 생성하고 지도에 표시합니다
	        var placePositionch = new kakao.maps.LatLng(places[i].RES_LAT, places[i].RES_LON),
	            markerch = addMarkerch(placePositionch, i,places[i].RES_NAME), 
	            itemElch = getListItemch(i, places[i]); // 검색 결과 항목 Element를 생성합니다
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        boundsch.extend(placePositionch);
	
	        (function(marker, title) {
	            // 마커와 검색결과 항목에 mouseover 했을때
	            // 해당 장소에 인포윈도우에 장소명을 표시합니다
	            // mouseout 했을 때는 인포윈도우를 닫습니다
	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindowch(marker, title);
	            });
	
	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	                infowindowch.close();
	            });
	            
	        	// 마커 클릭 시 해당 식당 목록 맨위로 출력
	            kakao.maps.event.addListener(marker, 'click', function() {
	                const title=$(marker.ca).attr("alt");
	              	$("#placesListch>li").css("backgroundColor","");
	                $("#placesListch>li").each((i,e)=>{
	                	const name=$(e).find("#places_res_name").text().slice(0,4);
	                	if(title.includes(name)){
	                		$(e).parent().prepend(e);
	                		$(e).css("backgroundColor","#FFC6C6");
	                	}
	                });
	          	});
	
	            itemElch.onmouseover =  function () {
	                displayInfowindowch(marker, title);
	            };
	
	            itemElch.onmouseout =  function () {
	                infowindowch.close();
	            };
	        })(markerch, places[i].RES_NAME);
	
	        fragmentch.appendChild(itemElch);
	    }        
	
	
	    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
	    listElch.appendChild(fragmentch);
	    menuElch.scrollTop = 0;
	
	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	   // map.setBounds(bounds);
	    console.log(places);
	}
	
	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPaginationch(pagination) {
	    var paginationElch = document.getElementById('paginationch'),
	        fragmentch = document.createDocumentFragment(),
	        i; 
	
	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationElch.hasChildNodes()) {
	        paginationElch.removeChild (paginationElch.lastChild);
	    }
	
	    for (i=1; i<=pagination.last; i++) {
	        var elch = document.createElement('a');
	        elch.href = "#";
	        elch.innerHTML = i;
	
	        if (i===pagination.current) {
	            elch.className = 'on';
	        } else {
	            elch.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }
	
	        fragmentch.appendChild(elch);
	    }
	    paginationElch.appendChild(fragmentch);
	}
	
	
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindowch(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	
	    infowindowch.setContent(content);
	    infowindowch.open(mapch, marker);
	}
	
	
	//---------- 여기까지 DB에 저장된 데이터 출력 ----------
	
	
	kakao.maps.event.addListener(mapch, 'idle', function() {        
		//console.log('asdf');
		getInfoch();
	}); 
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>