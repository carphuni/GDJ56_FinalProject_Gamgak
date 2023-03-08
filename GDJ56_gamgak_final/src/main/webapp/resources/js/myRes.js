let myresNosSplit=[];
let myresNos="";
let myresMapTag="";
let myresMapX=[];
let myresMapY=[];

//dataClass
class profileData{
	constructor(memberNo,cPage=1,area="",search="",url="")
	{	
		this.memberNo=memberNo;
		this.cPage=cPage;
		this.area=area;
		this.search=search;
		this.url=url;	
	}

	//스크롤 시 페이징 처리
	profileScroll() {
		if (Math.round($(window).scrollTop())> $(document).height() - $(window).height()) {
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
		this.url="/GDJ56_gamgak_final/profile/selectMyresAll";
		this.onScroll();
	}

	setSelectMyresArea(){
		//데이터 초기화
		this.search="";
		//스크롤 페이징 주소 변경
		this.url="/GDJ56_gamgak_final/profile/selectMyresArea";
		this.onScroll();
	}

	setSelectMyresSearch(){
		//데이터 초기화
		this.area="";
		//스크롤 페이징 주소 변경
		this.url="/GDJ56_gamgak_final/profile/selectMyresTitle";
		this.onScroll();
	}

	setSelectMyresAllUser(){
		//데이터 초기화
		this.area="";
		this.search="";
		this.memberNo=$("#memberNo").val();
		//스크롤 페이징 주소 변경
		this.url="/GDJ56_gamgak_final/profile/selectMyresAllUser";
		this.onScroll();
	}

	setSelectMyresAreaUser(){
		//데이터 초기화
		this.search="";
		this.memberNo=$("#memberNo").val();
		//스크롤 페이징 주소 변경
		this.url="/GDJ56_gamgak_final/profile/selectMyresAreaUser";
		this.onScroll();
	}

	setSelectMyresSearchUser(){
		//데이터 초기화
		this.area="";
		this.memberNo=$("#memberNo").val();
		//스크롤 페이징 주소 변경
		this.url="/GDJ56_gamgak_final/profile/selectMyresTitleUser";
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
				if($.trim(result).includes("name=\"myresNos\" value=\"\"")){
					$("#card-container").html("<div style='text-align: center;width:100%;margin-top:1rem;'>조회된 결과가 없습니다</div>");
				}else{
					$("#card-container").html(result);
				}
			}
		});   
	}
	
	
};

let pd=new profileData();
let memberFlag=$("#memberNo").val()=="";

$(window).scroll(()=>{
	pd.profileScroll();
})


$(()=>{
	if(memberFlag){
		pd.setSelectMyresAll();
	}else{
		pd.setSelectMyresAllUser();
	}
	pd.selectMyres();
	
})

//내 맛집 클릭 시
$("#show-click").click(()=>{
	if(memberFlag){
		pd.setSelectMyresAll();
	}else{
		pd.setSelectMyresAllUser();
	}
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
	if(memberFlag){
		pd.setSelectMyresArea();
	}else{
		pd.setSelectMyresAreaUser();
	}
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
	if(memberFlag){
		pd.setSelectMyresSearch();
	}else{
		pd.setSelectMyresSearchUser();
	}
	pd.selectMyres();
	
})


	
	

	 
