const clearChildBottom=(e)=>{
	//태그의 자식 밑줄 제거
	$(e).children().css('border-bottom','0px')
}

const redBottom=(e)=>{
	//태그 밑줄 생성
	$(e).css('border-bottom','2px #dc3545 solid');
}

const hideChild=(e)=>{
	//태그 자식 숨기기
	$(e).children().hide();
}

const showTag=(e)=>{
	//태그 보이기
	$(e).show();
}

$("#show-click").click((e)=>{
	//내 맛집 클릭 시
	clearChildBottom("#search-container");
	redBottom(e.target);
	hideChild("#search-item");
	showTag("#show-search");
		
});

$("#area-click").click((e)=>{
	//지역별 클릭 시
	clearChildBottom("#search-container");
	redBottom(e.target);
	hideChild("#search-item");
	showTag("#area-search");
		
});

$("#title-click").click((e)=>{
	//검색 클릭 시
	clearChildBottom("#search-container");
	redBottom(e.target);
	hideChild("#search-item");
	showTag("#title-search");
		
});




