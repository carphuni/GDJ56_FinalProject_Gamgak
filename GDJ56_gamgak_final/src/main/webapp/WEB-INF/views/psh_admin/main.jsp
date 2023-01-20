<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
    #adInfo{display: flex; flex-direction: row;}
    #adimg{width: 100px; height: 100px; margin-right: 50px;}
</style>
<c:set var="path" value="${pageContext.request.contextPath }"/>
	<div id="adInfo">
        <img id="adimg" src="${path}/resources/images/임시 프로필이지미01.png">
        <div id="adText">
            <h5><b>admin</b></h5>
            <h5>관리자</h5>
            <h5>마지막 접속시간 : 23.01.26 12:00</h5>
        </div>
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
