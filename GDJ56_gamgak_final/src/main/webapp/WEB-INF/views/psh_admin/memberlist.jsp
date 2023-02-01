<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/views/common/adminheader.jsp"/>
<style>
    #adInfo{display: flex; flex-direction: row;justify-content: center;}
    #adimg{width: 100px; height: 100px; margin-right: 50px;}
    #sep{width: 700px; height: 2px; background-color: red; margin-top: 20px; margin-bottom: 20px;}
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
         <div>
            <h2>회원관리</h2>
            <button onclick="deletemem()">회원탈퇴</button>
         </div>
         
         <div id="memberListBox">
            <table id="memberList">

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
    //처음 로딩시 실행
    (() => {
        memberlist(cPage,functionN)
    })();

    //체크박스 전체선택 함수
    function selectAll(){
        const memcheck=document.querySelectorAll("input[name=memcheck]")
        // console.log($("#selectAll").prop("checked"))
        console.log()
        if($("#selectAll").prop("checked")){
            for(var i=0;i<memcheck.length;i++){
                // console.log(memcheck[i].value)
                memcheck[i].checked=true
            }
        }else{
            for(var i=0;i<memcheck.length;i++){
                memcheck[i].checked=false
            }
        }
    };
    
    //체크박스 값 가져와서 delete
    function deletemem(){
        const delmem=document.querySelectorAll("input[name=memcheck]:checked")
        nodata=[];
        // let nodata="";
        for(let i=0;i<delmem.length;i++){
            // console.log(delmem[i].value)
            nodata.push(delmem[i].value)
        }
        // console.log(JSON.stringify(nodata))
        $.ajax({
            url:"${path}/admin/deletemember.do",
            // dataType:"JSON",
            traditional: true,
            data:{
                "nodata":JSON.stringify(nodata),
                "tableN":"MEMBER",
                "columnN":"MEMBER_NO"
            },
            success:data=>{
                console.log(data.result);
                for(let i=0;i<data.result.length;i++){
                    let total=+Number(data.result[i])
                }
                if(total=data.result.length)memberlist();
            }
        })
    }

    //리스트 출력
    function memberlist(cPage,functionN){
        $("#memberList").empty();
        $("#pageBar").empty();
        $.ajax({
            url:"${path}/admin/selectmember.do",
            data:{
                cPage:cPage,
                functionN:"memberlist"
                // numPerpage:numPerpage
            },
            success:data=>{
                // console.log(data.pageBar)
                // console.log(data.list)
                const tr=$("<tr>");
                const checkbox=$("<input id='selectAll' type='checkbox'>").attr("onclick","selectAll()")
                    tr.append($("<th style='border:1px solid'>").append(checkbox)) 
                    tr.append($("<th style='border:1px solid'>").text("번호"))
                    tr.append($("<th style='border:1px solid'>").text("이름"))
                    tr.append($("<th style='border:1px solid'>").text("이메일"))
                    tr.append($("<th style='border:1px solid'>").text("성별"))
                    tr.append($("<th style='border:1px solid'>").text("닉네임"))
                    tr.append($("<th style='border:1px solid'>").text("가입날짜"))
                    tr.append($("<th style='border:1px solid'>").text("식당 저장 수"))
                    tr.append($("<th style='border:1px solid'>").text("유저 신고 수"))
                    $("#memberList").append(tr)    
                data.list.forEach(v => {
                    // console.log(v.member_no, v.introduce)
                    // console.log(v)
                    let tr2=$("<tr>")
                    let a=$("<a>")
                    tr2.append($("<td style='border:1px solid'>").append($("<input name='memcheck' type='checkbox' value="+v.MEMBER_NO+">")))
                    tr2.append($("<td style='border:1px solid'>").text(v.MEMBER_NO))
                    tr2.append($("<td style='border:1px solid'>").text(v.MEMBER_NAME)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.MEMBER_EMAIL)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.MEMBER_GENDER)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.MEMBER_NICKNAME)) 
                    let enrolldate=v.MEMBER_ENROLLDATE
                    tr2.append($("<td style='border:1px solid'>").text(enrolldate.slice(0,10)))
                    // a.attr("href","http://localhost:9090/admin/myresview.do")
                    a.attr("href","http://localhost:9090/admin/myresview.do?no="+v.MEMBER_NO).text(v.MYRES_CNT)
                    tr2.append($("<td style='border:1px solid'>").append(a))
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_CNT))    
                    $("#memberList").append(tr2)    
                            
                });
                $("#pageBar").append(data.pageBar)
            }
        })
    }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
