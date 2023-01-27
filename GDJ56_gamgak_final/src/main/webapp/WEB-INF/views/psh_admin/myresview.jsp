<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/views/common/adminheader.jsp"/>
<style>
    #adInfo{display: flex; flex-direction: row;justify-content: center;}
    #adimg{width: 100px; height: 100px; margin-right: 50px;}
    #sep{width: 700px; height: 2px; background-color: red; margin-top: 20px; margin-bottom: 20px;}
    #myrestr>th,td{border:1px solid}
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
         <h2>회원식당 저장</h2>
         <div id="myresBox">
            <table id="myresList">
                <tr id="myrestr">
                    <th>회원번호</th>
                    <th>식당저장 번호</th>
                    <th>저장 날짜</th>
                    <th>메모</th>
                    <th>공유</th>
                </tr>
                <c:if test="${not empty myreslist }">
                	<c:forEach var="my" items="${myreslist }">
	                	<tr>
	                    	<td><c:out value="${my.MEMBER_NO }"/></td>
	                    	<td><a href="${path}/profile"><c:out value="${my.MYRES_NO }"/></a></td>
	                    	<td><c:out value="${my.MYRES_SAVE_DATE }"/></td>
	                    	<td><c:out value="${my.MYRES_MEMO }"/></td>
	                    	<td><c:out value="${my.MYRES_YN }"/></td>
	                	</tr>
                	</c:forEach>
                </c:if>
            </table>
         </div>
    </section>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
