package com.gamgak.psh.admin.common;

public class AdminPageFactory {
	
	public static String getPage(int cPage, int numPerpage, int totalData, String url,String functionN,String ynval) {
		//pagebar를 만들어서 반환해주는 기능을 하는 메소드
		String pageBar="";
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		
		pageBar="<span class='pagination justify-content-center pagination-sm'>";
		
		if(pageNo==1) {
			pageBar+="<span class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>이전</a>";
			pageBar+="</span>";
		}else {
			pageBar+="<span class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:"+functionN+"("+(pageNo-1)+","+(ynval)+")'>이전</a>";
//			pageBar+="<a class='page-link' href='"+url+"?cPage="+(pageNo-1)+"'>이전</a>";
			pageBar+="</span>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<span class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
				pageBar+="</span>";
			}else {
				pageBar+="<span class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:"+functionN+"("+(pageNo)+","+(ynval)+")'>"
//				pageBar+="<a class='page-link' href='"+url+"?cPage="+(pageNo)+"'>"
				+pageNo+"</a>";
				pageBar+="</span>";
			}
			
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</span>";
		}else {
			pageBar+="<span class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:"+functionN+"("+(pageNo)+","+(ynval)+")'>다음</a>";
//			pageBar+="<a class='page-link' href='"+url+"?cPage="+(pageNo)+"'>다음</a>";
			pageBar+="</span>";
		}
		
		pageBar+="</span>";
		
//		pageBar+="<script>";
//		pageBar+="function fn_paging(pageNo){";
//		pageBar+="location.assign('"+url+"?cPage='+pageNo);";
//		pageBar+="}";
//		pageBar+="</script>";
		
		
		
		return pageBar;
	}
}
