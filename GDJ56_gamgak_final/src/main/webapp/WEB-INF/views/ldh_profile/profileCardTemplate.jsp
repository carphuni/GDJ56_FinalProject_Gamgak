<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach var="myres" items="${myResList }">
    <div class="card">
        <img src="${not empty myres.myPic? "/resources/upload/myres/"+=myres.myPic.myPicReName:''}" class="card-img-top" onerror="this.src='${path }/resources/images/이미지 없음.jpg'">
        <div class="card-body">
            <span id="card-title">${myres.restaurant.resName }</span>
            <span id="card-category">${myres.restaurant.resCategory }</span>
            <span id="card-address">${myres.restaurant.resAddress }</span>
            <span id="card-memo">${fn:substring(myres.myResMemo,0,10)}...</span>
        </div>
    </div>
</c:forEach>