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
        <h2>신고관리</h2>
        <div id="psh_btns">
            <button onclick="userreport();">회원신고 관리</button>
            <button onclick="myresreport();">식당저장신고 관리</button>
            <button onclick="meetingreport();">모임신고 관리</button>
        </div>
        <div id="reportListBox">
            <table id="reportList">

            </table>
         </div>
    </section>
</div>
<script>
    (() => {
        userreport()
    })();

    function userreport(){
       $("#reportList").empty();
        $.ajax({
            url:"${path}/admin/userreport.do",
            data:{
                "tableN":"USERREPORT"
            },
            success:data=>{
                const tr=$("<tr>"); 
                    tr.append($("<th style='border:1px solid'>").text("신고번호"))
                    tr.append($("<th style='border:1px solid'>").text("신고제목"))
                    tr.append($("<th style='border:1px solid'>").text("회원 번호"))
                    tr.append($("<th style='border:1px solid'>").text("신고 날짜"))
                    tr.append($("<th style='border:1px solid'>").text("신고 사유"))
                    tr.append($("<th style='border:1px solid'>").text("신고 태그"))
                    
                    $("#reportList").append(tr)    
                data.forEach(v => {
                    // console.log(v.member_no, v.introduce)
                    console.log(v)
                    let tr2=$("<tr>")
                    let a=$("<a>")
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_NO))
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_TITLE)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.MEMBER_NO)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_DATE)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_REASON)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_TAG))
                    
                    $("#reportList").append(tr2)    
                            
                });
            }
        })
    }

    function myresreport(){
        $("#reportList").empty();
        $.ajax({
            url:"${path}/admin/myresreport.do",
            data:{
                "tableN":"MYRESREPORT"
            },
            success:data=>{
                const tr=$("<tr>"); 
                    tr.append($("<th style='border:1px solid'>").text("신고번호"))
                    tr.append($("<th style='border:1px solid'>").text("신고제목"))
                    tr.append($("<th style='border:1px solid'>").text("회원 번호"))
                    tr.append($("<th style='border:1px solid'>").text("신고 날짜"))
                    tr.append($("<th style='border:1px solid'>").text("신고 사유"))
                    tr.append($("<th style='border:1px solid'>").text("신고 태그"))
                    
                    $("#reportList").append(tr)    
                data.forEach(v => {
                    // console.log(v.member_no, v.introduce)
                    console.log(v)
                    let tr2=$("<tr>")
                    let a=$("<a>")
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_NO))
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_TITLE)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.MYRES_NO)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_DATE)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_REASON)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_TAG))
                    
                    $("#reportList").append(tr2)    
                            
                });
            }
        })
    }

    function meetingreport(){
        $("#reportList").empty();
        $.ajax({
            url:"${path}/admin/meetingreport.do",
            data:{
                "tableN":"MEETINGREPORT"
            },
            success:data=>{
                const tr=$("<tr>"); 
                    tr.append($("<th style='border:1px solid'>").text("신고번호"))
                    tr.append($("<th style='border:1px solid'>").text("신고제목"))
                    tr.append($("<th style='border:1px solid'>").text("회원 번호"))
                    tr.append($("<th style='border:1px solid'>").text("신고 날짜"))
                    tr.append($("<th style='border:1px solid'>").text("신고 사유"))
                    tr.append($("<th style='border:1px solid'>").text("신고 태그"))
                    
                
                        
                    $("#reportList").append(tr)    
                data.forEach(v => {
                    // console.log(v.member_no, v.introduce)
                    console.log(v)
                    let tr2=$("<tr>")
                    let a=$("<a>")
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_NO))
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_TITLE)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.MEETING_NO)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_DATE)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_REASON)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.REPORT_TAG))
                    
                    $("#reportList").append(tr2)
                            
                });
            }
        })
    }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 