<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/views/common/adminheader.jsp"/>
<style>
    #adInfo{display: flex; flex-direction: row;justify-content: center;}
    #adimg{width: 100px; height: 100px; margin-right: 50px;}
    #sep{width: 700px; height: 2px; background-color: red; margin-top: 20px; margin-bottom: 20px;}
    #headbox{display: flex; flex-direction: row; width: 100%;justify-content: space-between;margin-bottom: 10px;}
    #meetingList{width: 100%;}
    #searchbox{display: flex; flex-direction: row;justify-content: center;}
    #mtdata{display: flex; flex-direction: row;justify-content: center;}
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
        <div id="mtdata">
            <table id="dataList">
                <tr>
                    <th>누적 모임 수</th>
                    <th>삭제 모임 수</th>
                </tr>
                <tr>
                    <td>${totalmeeting}</td>
                    <td>${delmt}</td>
                </tr>              
            </table>
        </div>
        <div id="headtext" onclick="meetinglist(cPage,ynval);">
            <h2>모임관리</h2>
        </div>
        
        <div id="headbox">
            <div id="fns">
                <button id="delbtn"onclick="deletemeeting()">모임삭제</button>
                <button id="delmtlistbtn"onclick="deletemtlist()">삭제 모임 조회</button>
            </div>

            <div id="searchbox">
                <input id="search">
                <button onclick="searchName()">검색</button>
            </div>

            <div>
                <select id="search">
                    <option value="">최신순</option>
                    <option value="">신고순</option>
                </select>
            </div>
            
        </div>
        <!-- 리스트 -->
        <div id="meetingListBox">
            <table id="meetingList">

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
    //처음 로딩시 실행
    (() => {
        let ynval="N"
        meetinglist(cPage,ynval)
    })();

    //체크박스 전체선택 함수
    function selectAll(){
        const meetingcheck=document.querySelectorAll("input[name=meetingcheck]")
        // console.log($("#selectAll").prop("checked"))
        if($("#selectAll").prop("checked")){
            for(var i=0;i<meetingcheck.length;i++){
                meetingcheck[i].checked=true
            }
        }else{
            for(var i=0;i<meetingcheck.length;i++){
                meetingcheck[i].checked=false
            }
        }
    };

     //체크박스 값 가져와서 delete
     function deletemeeting(){
        if(!window.confirm("모임삭제를 계속 진행하시겠습니까?")){
            console.log("취소")
        }else{
            const del=document.querySelectorAll("input[name=meetingcheck]:checked")
            nodata=[];
            console.log(del)
            // let nodata="";
            for(let i=0;i<del.length;i++){
                // console.log(delmem[i].value)
                nodata.push(del[i].value)
            }
            console.log(JSON.stringify(nodata))
            $.ajax({
                url:"${path}/admin/deletedata.do",
                // dataType:"JSON",
                traditional: true,
                data:{
                    "nodata":JSON.stringify(nodata),
                    "tableN":"MEETING",
                    "columnN":"MEETING_NO",
                    yn:"DEL_YN"
                },
                success:data=>{
                    console.log(data.result);
                    for(let i=0;i<data.result.length;i++){
                        let total=+Number(data.result[i])
                    }
                    if(total=data.result.length)meetinglist(cPage,ynval);
                }
            })
        }
    }

    //모임 삭제 리스트 출력
    function deletemtlist(){
        let ynval="Y"
        meetinglist(cPage,ynval);
    }

    //모임리스트 출력
    function meetinglist(cPage,ynval){
        console.log(ynval)
        if(ynval==null)ynval="N"
        $("#meetingList").empty();
        $("#pageBar").empty();
        $.ajax({
            url:"${path}/admin/selectmeeting.do",
            data:{
                cPage:cPage,
                functionN:"meetinglist",
                tableN:"MYRES_NO",
                yn:"DEL_YN",
                ynval:ynval
                // numPerpage:numPerpage
            },
            success:data=>{
                
                //모임 리스트
                const tr=$("<tr>");
                const checkbox=$("<input id='selectAll' type='checkbox'>").attr("onclick","selectAll()")     
                    tr.append($("<th style='border:1px solid'>").append(checkbox))
                    tr.append($("<th style='border:1px solid'>").text("모임 번호"))
                    tr.append($("<th style='border:1px solid'>").text("모임 리더 번호"))
                    tr.append($("<th style='border:1px solid'>").text("모임명"))
                    tr.append($("<th style='border:1px solid'>").text("성별"))
                    tr.append($("<th style='border:1px solid'>").text("총 인원"))
                    tr.append($("<th style='border:1px solid'>").text("현재 인원"))
                    tr.append($("<th style='border:1px solid'>").text("모임 날짜"))
                    tr.append($("<th style='border:1px solid'>").text("모임 생성 날짜"))
                    tr.append($("<th style='border:1px solid'>").text("최소 나이"))
                    tr.append($("<th style='border:1px solid'>").text("최대 나이"))
                    tr.append($("<th style='border:1px solid'>").text("모임 지역"))
                    tr.append($("<th style='border:1px solid'>").text("상세 주소"))
                    tr.append($("<th style='border:1px solid'>").text("모임 신고 수"))
                    $("#meetingList").append(tr);
                if(data.list.length==0){
                    let tr2=$("<tr>")
                    tr2.append($("<td colspan='14' style='border:1px solid'>").text("저장식당이 없습니다"))
                    $("#meetingList").append(tr2)    
                }else{           
                data.list.forEach(v => {
                    // console.log(v)
                    // console.log(v)
                    let tr2=$("<tr>")
                    let a=$("<a>")
                    tr2.append($("<td style='border:1px solid'>").append($("<input name='meetingcheck' type='checkbox' value="+v.MEETING_NO+">")))
                    tr2.append($("<td style='border:1px solid'>").text(v.MEETING_NO))
                    tr2.append($("<td style='border:1px solid'>").text(v.MEMBER_LEADER_NO)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.MEETING_TITLE)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.MEETING_GENDER)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.MEETING_PEOPLENUM)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.MEETING_CURRENT_COUNT))
                    tr2.append($("<td style='border:1px solid'>").text(v.MEETING_DATE))
                    let enrolldate=v.MEETING_ENROLL_DATE    
                    tr2.append($("<td style='border:1px solid'>").text(enrolldate.slice(0,10)))
                    tr2.append($("<td style='border:1px solid'>").text(v.MEETING_MINAGE))
                    tr2.append($("<td style='border:1px solid'>").text(v.MEETING_MAXAGE))
                    tr2.append($("<td style='border:1px solid'>").text(v.MEETING_AREA))
                    tr2.append($("<td style='border:1px solid'>").text(v.MEETING_DETAILED_ADDR))
                    tr2.append($("<td style='border:1px solid'>").text(v.MTR_CNT))

                    $("#meetingList").append(tr2)    
                            
                });
                $("#pageBar").append(data.pageBar)
            }
        }
        })
    }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 