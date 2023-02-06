<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/views/common/adminheader.jsp"/>
<style>
    #adInfo{display: flex; flex-direction: row;justify-content: center;}
    #adimg{width: 100px; height: 100px; margin-right: 50px;}
    #sep{width: 700px; height: 2px; background-color: red; margin-top: 20px; margin-bottom: 20px;}
    #headbox{display: flex; flex-direction: row; width: 100%;justify-content: space-between;margin-bottom: 10px;}
    #reportList{width: 100%;}
    #searchbox{display: flex; flex-direction: row;justify-content: center;}
    #reportdata{display: flex; flex-direction: row;justify-content: center;}
</style>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<div id="profile-wrapper">
    <section id="adContent">	
        <!-- 관리자 프로필 -->
        <div id="adInfo">
            <img id="adimg" src="${path}/resources/images/프로필 기본 이미지.jpg">
            <div id="adText">
                <h5><b>admin</b></h5>
                <h5>관리자</h5>
                <h5>마지막 접속시간 : 23.01.26 12:00</h5>
            </div>
        </div>
        <!-- 구분선 -->
        <div id="sep"></div>
        <!-- 내용 -->
        <div id="reportdata">
            <table id="dataList">
                <tr>
                    <th>오늘 접수 된 신고</th>
                    <th>누적 신고 수</th>
                </tr>
                <tr>
                    <td>${today}</td>
                    <td>${total}</td>
                </tr>                    
            </table>
        </div>
        <div id="headtext" onclick="userreport(cPage,ynval);">
            <h2>신고관리</h2>
        </div>
        <div id="headbox">
            <div id="psh_btns">
                <button onclick="userreport(cPage,ynval);">회원신고 관리</button>
                <button onclick="myresreport(cPage,ynval);">맛집저장신고 관리</button>
                <button onclick="meetingreport(cPage,ynval);">모임신고 관리</button>
                
            </div>
            <div id="searchbox">
                <input id="search">
                <button onclick="searchName()">검색</button>
            </div>
    
            <div>
                <select id="search">
                    <option value="">최신순</option>
                    <option value="">신고순</option>
                    <option value="">욕설/인신공격</option>
                    <option value="">상업적/홍보성</option>
                    <option value="">음란/선정성</option>
                    <option value="">불법정보</option>
                    <option value="">기타</option>
                </select>
            </div>
        </div>
        <!-- 리스트 -->
        <div id="reportListBox">
            <table id="reportList">

            </table>
         </div>
         <div id="pageBar">

         </div>
    </section>
</div>
<script>
     let cPage;
    let numPerpage;
    let functionN;
    let ynval="N";
    //로딩시 실행
    (() => {
        userreport(cPage, ynval)
    })();

    //체크박스 전체선택 함수
    function selectAll(){
        const reportcheck=document.querySelectorAll("input[name='reportcheck']")
        // console.log($("#selectAll").prop("checked"))
        if($("#selectAll").prop("checked")){
            for(var i=0;i<reportcheck.length;i++){
                reportcheck[i].checked=true
            }
        }else{
            for(var i=0;i<reportcheck.length;i++){
                reportcheck[i].checked=false
            }
        }
    };

    //처리한 신고 리스트 출력
    function deletememlist(){
        let ynval="Y"
        memberlist(cPage,ynval);
    }
    stopmem=[];
    reportmem=[];
    meetingmem=[];
    myresmem=[];
    //유저신고 리스트 출력
    function userreport(cPage,functionN){
       $("#reportList").empty();
       $("#pageBar").empty();
        $.ajax({
            url:"${path}/admin/userreport.do",
            data:{
                "tableN":"USERREPORT",
                cPage:cPage,
                functionN:"userreport",
                yn:"SOLVE_YN",
                ynval:ynval
            },
            success:data=>{
                console.log(data)
                //ajax로 찬희언니한테 넘기기 관리자 정보는 세션으로 가져올 생각 또는 1로 지정
                //신고회원번호
                data.reportmem.forEach(v=>{
                    reportmem.push(v.MEMBER_NO);
                });
                //정지회원번호
                data.stopmem.forEach(v=>{
                   stopmem.push(v.MEMBER_NO);
                });
                //삭제저장맛집 회원번호
                data.myresmem.forEach(v=>{
                    myresmem.push(v.MEMBER_NO);
                });
                //삭제 모임장 회원번호
                data.meetingmem.forEach(v=>{
                    meetingmem.push(v.MEMBER_LEADER_NO);
                });

                $.ajax({
                    url:"${path}/admin/checkdata.do",
                    traditional: true,
                    data:{
                        "stopmem":JSON.stringify(stopmem),
                        "reportmem":JSON.stringify(reportmem),
                        "myresmem":JSON.stringify(myresmem),
                        "meetingmem":JSON.stringify(meetingmem)
                    },
                    success:data=>{

                    }
                });    

                const tr=$("<tr>");
                const checkbox=$("<input id='selectAll' type='checkbox'>").attr("onclick","selectAll()") 
                    tr.append($("<th style='border:1px solid'>").append(checkbox)) 
                    tr.append($("<th style='border:1px solid'>").text("신고번호"))
                    tr.append($("<th style='border:1px solid'>").text("신고제목"))
                    tr.append($("<th style='border:1px solid'>").text("회원 번호"))
                    tr.append($("<th style='border:1px solid'>").text("신고 날짜"))
                    tr.append($("<th style='border:1px solid'>").text("신고 사유"))
                    tr.append($("<th style='border:1px solid'>").text("신고 태그"))
                    
                    $("#reportList").append(tr)  
                    
                data.list.forEach(v => {
                    // console.log(v.member_no, v.introduce)
                    // console.log(v)
                    let tr2=$("<tr>")
                    let a=$("<a>")
                    tr2.append($("<td style='border:1px solid'>").append($("<input name='reportcheck' type='checkbox'>")))
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_NO))
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_TITLE)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.MEMBER_NO))
                    let enrolldate=v.REPORT_DATE 
                    tr2.append($("<td style='border:1px solid'>").text(enrolldate.slice(0,10))) 
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_REASON)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_TAG))
                    
                    $("#reportList").append(tr2)    
                            
                });
                $("#pageBar").append(data.pageBar)
            }
        })
    }
    //맛집저장신고 리스트 출력
    function myresreport(cPage,functionN){
        $("#reportList").empty();
        $("#pageBar").empty();
        $.ajax({
            url:"${path}/admin/myresreport.do",
            data:{
                "tableN":"MYRESREPORT",
                cPage:cPage,
                functionN:"myresreport",
                yn:"SOLVE_YN",
                ynval:ynval
            },
            success:data=>{
                const tr=$("<tr>");
                const checkbox=$("<input id='selectAll' type='checkbox'>").attr("onclick","selectAll()")
                tr.append($("<th style='border:1px solid'>").append(checkbox)) 
                    tr.append($("<th style='border:1px solid'>").text("신고번호"))
                    tr.append($("<th style='border:1px solid'>").text("신고제목"))
                    tr.append($("<th style='border:1px solid'>").text("맛집저장 번호"))
                    tr.append($("<th style='border:1px solid'>").text("신고 날짜"))
                    tr.append($("<th style='border:1px solid'>").text("신고 사유"))
                    tr.append($("<th style='border:1px solid'>").text("신고 태그"))
                    
                    $("#reportList").append(tr)    
                data.list.forEach(v => {
                    // console.log(v.member_no, v.introduce)
                    // console.log(v)
                    let tr2=$("<tr>")
                    let a=$("<a>")
                    tr2.append($("<td style='border:1px solid'>").append($("<input name='reportcheck' type='checkbox'>")))
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_NO))
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_TITLE)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.MYRES_NO))
                    let enrolldate=v.REPORT_DATE 
                    tr2.append($("<td style='border:1px solid'>").text(enrolldate.slice(0,10))) 
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_REASON)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_TAG))
                    
                    $("#reportList").append(tr2)    
                            
                });
                $("#pageBar").append(data.pageBar)
            }
        })
    }
    //모임신고 리스트 출력
    function meetingreport(cPage,functionN){
        $("#reportList").empty();
        $("#pageBar").empty();
        $.ajax({
            url:"${path}/admin/meetingreport.do",
            data:{
                "tableN":"MEETINGREPORT",
                cPage:cPage,
                functionN:"meetingreport",
                yn:"SOLVE_YN",
                ynval:ynval
            },
            success:data=>{
                const tr=$("<tr>"); 
                    const checkbox=$("<input id='selectAll' type='checkbox'>").attr("onclick","selectAll()")    
                    tr.append($("<th style='border:1px solid'>").append(checkbox)) 
                    tr.append($("<th style='border:1px solid'>").text("신고번호"))
                    tr.append($("<th style='border:1px solid'>").text("신고제목"))
                    tr.append($("<th style='border:1px solid'>").text("모임 번호"))
                    tr.append($("<th style='border:1px solid'>").text("신고 날짜"))
                    tr.append($("<th style='border:1px solid'>").text("신고 사유"))
                    tr.append($("<th style='border:1px solid'>").text("신고 태그"))
                    
                
                        
                    $("#reportList").append(tr)    
                data.list.forEach(v => {
                    // console.log(v.member_no, v.introduce)
                    // console.log(v)
                    let tr2=$("<tr>")
                    let a=$("<a>")
                    tr2.append($("<td style='border:1px solid'>").append($("<input name='reportcheck' type='checkbox'>")))
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_NO))
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_TITLE)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.MEETING_NO))
                    let enrolldate=v.REPORT_DATE 
                    tr2.append($("<td style='border:1px solid'>").text(enrolldate.slice(0,10))) 
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_REASON)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_TAG))
                    
                    $("#reportList").append(tr2)
                            
                });
                $("#pageBar").append(data.pageBar)
            }
        })
    }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 