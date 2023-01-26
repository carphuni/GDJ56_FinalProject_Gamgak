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
            <img id="adimg" src="${path}/resources/images/임시 프로필이지미01.png">
            <div id="adText">
                <h5><b>admin</b></h5>
                <h5>관리자</h5>
                <h5>마지막 접속시간 : 23.01.26 12:00</h5>
            </div>
        </div>
        <!-- 구분선 -->
        <div id="sep"></div>
         <!-- 내용 -->
         <h2>회원관리</h2>
         <div id="memberListBox">
            <table id="memberList">

            </table>
         </div>
    </section>
</div>
<script>
    (() => {
        memberlist()
    })();

    function memberlist(){
        $.ajax({
            url:"${path}/admin/selectmember.do",
            success:data=>{
                const tr=$("<tr border:1px solid black>"); 
                    tr.append($("<th style='border:1px solid'>").text("번호"))
                    tr.append($("<th style='border:1px solid'>").text("이름"))
                    tr.append($("<th style='border:1px solid'>").text("이메일"))
                    tr.append($("<th style='border:1px solid'>").text("성별"))
                    tr.append($("<th style='border:1px solid'>").text("닉네임"))
                    tr.append($("<th style='border:1px solid'>").text("가입날짜"))
                    tr.append($("<th style='border:1px solid'>").text("식당 저장 수"))
                    $("#memberList").append(tr)    
                data.forEach(v => {
                    // console.log(v.member_no, v.introduce)
                    console.log(v)
                    let tr2=$("<tr>")
                    tr2.append($("<td style='border:1px solid'>").text(v.member_no))
                    tr2.append($("<td style='border:1px solid'>").text(v.member_name)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.member_email)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.member_gender)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.member_nickname)) 
                    tr2.append($("<td style='border:1px solid'>").text(v.member_enrolldate))        
                    tr2.append($("<td style='border:1px solid'>").text(v.MYRES_CNT))    
                    $("#memberList").append(tr2)    
                            
                });
            }
        })
    }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
