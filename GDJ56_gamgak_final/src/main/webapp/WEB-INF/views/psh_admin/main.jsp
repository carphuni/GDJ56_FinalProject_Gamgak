<%@page import="java.text.SimpleDateFormat"%> <%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/adminheader.jsp" />
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set
  var="loginMember"
  value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"
/>
<div id="profile-wrapper">
  <section id="adContent">
    <!-- 관리자 프로필 -->
    <div id="adInfo">
      <img id="adimg" src="${path}/resources/images/프로필 기본 이미지.jpg" />
      <div id="adText">
        <h5><b>admin</b></h5>
        <h5>관리자</h5>
        <h5>마지막 접속 :</h5>
      </div>
    </div>
    <!-- 구분선 -->
    <div id="sep"></div>
    <!-- 내용 -->
    <div>
      <h2>관리자 페이지</h2>
    </div>

    <div id="memberListBox">
      <table id="memberList"></table>
    </div>
    <div id="pageBar"></div>
  </section>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
