<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/views/common/adminheader.jsp"/>
<style>
    #adInfo{display: flex; flex-direction: row;justify-content: center;}
    #adimg{width: 100px; height: 100px; margin-right: 50px;}
    #sep{width: 700px; height: 2px; background-color: red; margin-top: 20px; margin-bottom: 20px;}
    #myrestr>th,td{border:1px solid}
    #headbox{display: flex; flex-direction: row; width: 100%;justify-content: space-between}
    #myresList{width: 100%;}
</style>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<div id="profile-wrapper">
    <section id="adContent">	
        <!-- 관리자 프로필 -->
        <div id="adInfo">
            <img id="adimg" src="${path}/resources/images/프로필 기본 이미지.jpg">
            <div id="adText">
                
            </div>
        </div>
        <!-- 구분선 -->
        <div id="sep"></div>
         <!-- 내용 -->
        
         <div id="headbox">
            <div id="headtext">
                <h2>유저상세화면</h2>
            </div>
            <div id="fns">
                <button id="delbtn"onclick="deletemyres()">식당 삭제</button>
            </div>
            
         </div>
         <!-- 리스트 -->
         <input type="hidden" value=${no} id="no">
         <div id="myresBox">
            <table id="myresList">
                
            </table>
            <div id="pageBar">

            </div>
         </div>
    </section>
</div>
<script>
    let cPage;
    let numPerpage;
    let functionN;
    let myresno;
    //처음 로딩시 실행
    (() => {
        myresno=$("#no").val()
        console.log(myresno)
        myreslist(cPage,functionN,myresno)
    })();

    //체크박스 전체선택 함수
    function selectAll(){
        const myrescheck=document.querySelectorAll("input[name='myrescheck']")
        // console.log($("#selectAll").prop("checked"))
        if($("#selectAll").prop("checked")){
            for(var i=0;i<myrescheck.length;i++){
                myrescheck[i].checked=true
            }
        }else{
            for(var i=0;i<myrescheck.length;i++){
                myrescheck[i].checked=false
            }
        }
    };

    //체크박스 값 가져와서 delete
    function deletemyres(){
        if(!window.confirm("저장식당 삭제를 계속 진행하시겠습니까?")){
            console.log("취소")
        }else{
            const del=document.querySelectorAll("input[name=myrescheck]:checked")
            nodata=[];
            // let nodata="";
            for(let i=0;i<del.length;i++){
                // console.log(delmem[i].value)
                nodata.push(del[i].value)
            }
            // console.log(JSON.stringify(nodata))
            $.ajax({
                url:"${path}/admin/deletedata.do",
                // dataType:"JSON",
                traditional: true,
                data:{
                    "nodata":JSON.stringify(nodata),
                    "tableN":"MYRES",
                    "columnN":"MYRES_NO",
                    yn:"DEL_YN"
                },
                success:data=>{
                    console.log(data.result);
                    for(let i=0;i<data.result.length;i++){
                        let total=+Number(data.result[i])
                    }
                    if(total=data.result.length)myreslist();
                }
            })
        }
    }

    //리스트 출력
    function myreslist(cPage,functionN,myresno){
        $("#myresList").empty();
        $("#pageBar").empty();
        $("#adText").empty();
        myresno=$("#no").val();
        $.ajax({
            url:"${path}/admin/selectmyres.do",
            data:{
                cPage:cPage,
                functionN:"myreslist",
                no:myresno,
                tableN:"member_no",
                yn:"DEL_YN",
                ynval:"N"
                // numPerpage:numPerpage    
            },
            success:data=>{
                // console.log(data.pageBar)
                console.log(data.member.member_email)
                $("#adText").append($("<h2>").append($("<b>").text(data.member.member_name)))
                $("#adText").append($("<h5>").text(data.member.member_email))
                $("#adText").append($("<h5>").text(data.member.member_nickname))
                $("#adText").append($("<h5>").text(data.member.member_gender))
                $("#adText").append($("<h5>").text(data.member.member_enrolldate))    
                      

                
                const tr=$("<tr>");
                const checkbox=$("<input id='selectAll' type='checkbox'>").attr("onclick","selectAll()")
                    tr.append($("<th style='border:1px solid'>").append(checkbox)) 
                    tr.append($("<th style='border:1px solid'>").text("회원번호"))
                    tr.append($("<th style='border:1px solid'>").text("식당저장 번호"))
                    tr.append($("<th style='border:1px solid'>").text("저장 날짜"))
                    tr.append($("<th style='border:1px solid'>").text("메모"))
                    tr.append($("<th style='border:1px solid'>").text("공유"))
                    tr.append($("<th style='border:1px solid'>").text("저장식당 신고 수"))
            
                    $("#myresList").append(tr) 
                if(data.list.length==0){
                    let tr2=$("<tr>")
                    tr2.append($("<td colspan='6' style='border:1px solid'>").text("저장식당이 없습니다"))
                    $("#myresList").append(tr2)    
                }else{       
                data.list.forEach(v => {
                    // console.log(v.member_no, v.introduce)
                    // console.log(v)
                   
                    let tr2=$("<tr>")
                    let a=$("<a>")
                    tr2.append($("<td style='border:1px solid'>").append($("<input name='myrescheck' type='checkbox' value="+v.MYRES_NO+">")))
                    tr2.append($("<td style='border:1px solid'>").text(v.MEMBER_NO))
                    tr2.append($("<td style='border:1px solid'>").text(v.MYRES_NO))
                    let enrolldate=v.MYRES_SAVE_DATE
                    tr2.append($("<td style='border:1px solid'>").text(enrolldate.slice(0,10)))
                    tr2.append($("<td style='border:1px solid'>").text(v.MYRES_MEMO))  
                    tr2.append($("<td style='border:1px solid'>").text(v.MYRES_YN))
                        tr2.append($("<td style='border:1px solid'>").text(v.REPORT_CNT))
 
                    $("#myresList").append(tr2)    
                            
                });
                $("#pageBar").append(data.pageBar)
            }
        }
        })
    }
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
