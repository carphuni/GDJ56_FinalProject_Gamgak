let myresNosSplit=[];
let myresNos="";
let myresMapTag="";
let myresMapX=[];
let myresMapY=[];

//dataClass
class profileData{
	constructor(cPage=1,area="",search="",url="/profile/selectMyresAll")
	{
		this.cPage=cPage;
		this.area=area;
		this.search=search;
		this.url=url;	
	}

	//스크롤 시 페이징 처리
	profileScroll() {
		if (Math.round($(window).scrollTop())-15> $(document).height() - $(window).height()) {
			this.cPage++;
			$("#profileLoading").show();
			$.ajax({
				type: "GET",
				url: this.url,
				data: this,
				error: function() {
					console.log('통신실패!!');
				},
				success: function(result) {
					if($.trim(result).includes("name=\"myresNos\" value=\"\"")){
						//스크롤 이벤트 삭제
						$(window).off("scroll");
					}else{
						$("#card-container").append(result);
					}
					$("#profileLoading").hide();
				}
			});   
			
		} 
		
	}
	
	onScroll(){
		//스크롤 이벤트 살리기
		$(window).on("scroll",()=>{
			this.profileScroll();
		});
	}

	setSelectMyresAll(){
		//데이터 초기화
		this.area="";
		this.search="";
		//스크롤 페이징 주소 변경
		this.url="/profile/selectMyresAll";
		this.onScroll();
	}

	setSelectMyresArea(){
		//데이터 초기화
		this.search="";
		//스크롤 페이징 주소 변경
		this.url="/profile/selectMyresArea";
		this.onScroll();
	}

	setSelectMyresSearch(){
		//데이터 초기화
		this.area="";
		//스크롤 페이징 주소 변경
		this.url="/profile/selectMyresTitle";
		this.onScroll();
	}


	selectMyres(){
		this.cPage=1;
		$.ajax({
			type: "GET",
			url: this.url,
			data: this,
			error: function() {
				console.log('통신실패!!');
			},
			success: function(result) {
				if($.trim(result)==""){
					$("#card-container").html("<div style='text-align: center;width:100%;margin-top:1rem;'>조회된 결과가 없습니다</div>");
				}else{
					$("#card-container").html(result);
				}
			}
		});   
	}
	
	
};

let pd=new profileData();

$(window).scroll(()=>{
	pd.profileScroll();
})

$(()=>{
	pd.setSelectMyresAll();
	pd.selectMyres();
})

//내 맛집 클릭 시
$("#show-click").click(()=>{
	pd.setSelectMyresAll();
	pd.selectMyres();
})

//지역별 클릭시
$("#area-click").click(()=>{
	//selectbox option 초기화
	$($("#area-search")[0][0]).prop("selected", true);
})

//지역별 select 변경시
$("#area-search").change((e)=>{
	//선택한 지역 value 초기화
	pd.area=$(e.target).val();
	pd.setSelectMyresArea();
	pd.selectMyres();
})

//검색 클릭 시
$("#title-click").click(()=>{
	$("#title-search input").val("");
})

//제목, 카테고리 검색 시
$("#title-search button").click(()=>{
	//제목,카테고리 input value 초기화
	pd.search=$("#title-search input").val();
	pd.setSelectMyresSearch();
	pd.selectMyres();
})


	
	
	

	 
