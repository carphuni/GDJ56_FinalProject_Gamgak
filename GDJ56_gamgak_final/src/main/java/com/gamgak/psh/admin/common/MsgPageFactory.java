package com.gamgak.psh.admin.common;

public class MsgPageFactory {
	
	public static String getPage(int loginMemberNo,int cPage, int numPerpage, int totalData, String url,String msg) {
		//pagebar를 만들어서 반환해주는 기능을 하는 메소드
		System.out.println("cPage"+cPage);
		System.out.println("num"+numPerpage);
		System.out.println("total"+totalData);

		
		String pageBar="";
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		System.out.println("total"+totalPage);
		System.out.println("pageNo"+pageNo);
		System.out.println("pageEnd"+pageEnd);

		
		
		pageBar="<span class='pagination justify-content-center pagination-sm'>";
		
		if(pageNo==1) {
			pageBar+="<span class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>이전</a>";
			pageBar+="</span>";
		}else {
			pageBar+="<span class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:msglist("+(pageNo-1+","+loginMemberNo+","+msg)+")'>이전</a>";
			pageBar+="</span>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<span class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
				pageBar+="</span>";
			}else {
				pageBar+="<span class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:msglist("+(pageNo+","+loginMemberNo+","+msg)+")'>"
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
			pageBar+="<a class='page-link' href='javascript:msglist("+(pageNo+","+loginMemberNo+","+msg)+")'>다음</a>";
			pageBar+="</span>";
		}
		
		pageBar+="</ul>";
		
//		pageBar+="<script>";
//		pageBar+="function fn_paging(pageNo,loginMemberNo){";
//		pageBar+="location.assign('"+url+"?cPage='+pageNo+'&loginMemberNo='+loginMemberNo);";
//		pageBar+="}";
//		pageBar+="</script>";

		
		
		return pageBar;
	}
}
