<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/adminheader.jsp">
  <jsp:param name="title" value="회원가입" />
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set
  var="loginMember"
  value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"
/>
<div id="profile-wrapper">
  <section id="adContent">
    <hr class="sep" />
    <hr class="sep" />
    <hr class="sep" />
    <!-- 관리자 프로필 -->
    <div id="box">
      <div id="adInfo">
        <img id="adimg" src="${path}/resources/images/프로필 기본 이미지.jpg" />
        <div id="adText">
          <h5><b>${loginMember.memberEmail}</b></h5>
          <h5>${loginMember.memberNickName}</h5>
        </div>
      </div>
      <!-- 구분선 -->
      <hr class="sep" />
      <hr class="sep" />
      <hr class="sep" />

      <!-- 내용 -->
      <div id="memdata">
        <table id="dataList">
          <tr>
            <th>Today</th>
            <th>Total</th>
          </tr>
          <tr>
            <td></td>
            <td></td>
          </tr>
        </table>
      </div>
    </div>

    <hr class="sep" />
    <hr class="sep" />
    <div id="sep"></div>
    <hr class="sep" />
    <hr class="sep" />

    <div id="headtext" onclick="msglist(cPage,1,'');">
      <h2>알림 메세지</h2>
    </div>

    <hr class="sep" />

    <div id="searchbox">
      <input id="search" placeholder="이름으로 검색" />
      <button class="btn btn-primary btn-circle" onclick="searchName()">
        <i class="search-icon"></i>
      </button>
    </div>
    <hr class="sep" />
    <div id="headbox">
      <div id="fnsmem">
        <button
          class="btn btn-primary btn-ghost btn-slide"
          onclick="msglist(cPage,1,1)"
        >
          정지메세지
        </button>
        <button
          class="btn btn-primary btn-ghost btn-slide"
          onclick="msglist(cPage,1,2)"
        >
          경고메세지
        </button>
        <button
          class="btn btn-primary btn-ghost btn-slide"
          onclick="msglist(cPage,1,3)"
        >
          저장식당삭제메세지
        </button>
        <button
          class="btn btn-primary btn-ghost btn-slide"
          onclick="msglist(cPage,1,4)"
        >
          모임삭제메세지
        </button>
      </div>
    </div>
    <!-- 리스트 -->

    <div id="msgListBox">
      <table id="msgList"></table>
    </div>
    <div id="msgpageBar"></div>

    <hr class="sep" />
    <hr class="sep" />
  </section>
</div>
<script>
  let cPage;
  let numPerpage;
  let functionN;
  let ynval = "N";
  let N = "N";
  let Y = "Y";
  let msg;
  //처음 로딩시 실행
  (() => {
    let ynval = "N";
    msglist(cPage);
  })();

  //메세지리스트 출력
  function msglist(cPage, loginMemberNo, msg) {
    // console.log(ynval)
    // if (ynval == null) ynval = "N";
    if (msg == 1) msg = "정지";
    if (msg == 2) msg = "경고";
    if (msg == 3) msg = "식당";
    if (msg == 4) msg = "모임";
    $("#msgList").empty();
    $("#msgpageBar").empty();
    $.ajax({
      url: "${path}/admin/msglist.do",
      data: {
        cPage: cPage,
        loginMemberNo: 1,
        content: msg,
        // numPerpage:numPerpage
      },
      success: (data) => {
        // console.log(data.pageBar)
        console.log(data.list.length);
        // console.log(data.totalmem)
        // console.log(data.authmem)

        //메세지 리스트
        const tr = $("<tr>");
        tr.append($("<th>").text("채팅방 번호"));
        tr.append($("<th>").text("받는회원번호"));
        tr.append($("<th>").text("내용"));
        tr.append($("<th>").text("전송시간"));
        $("#msgList").append(tr);
        if (data.list.length == 0) {
          let tr2 = $("<tr>");
          tr2.append($("<td colspan='4'>").text("전송한 메세지가 없습니다"));
          $("#msgList").append(tr2);
        } else {
          data.list.forEach((v) => {
            // console.log(v.member_no, v.introduce)
            console.log(v);
            let tr2 = $("<tr>");
            let a = $("<a>");
            tr2.append($("<td >").text(v.CHAT_NO));
            tr2.append($("<td>").text(v.MEMBER_RECEIVER_NO));
            tr2.append($("<td>").text(v.CHATTING_CONTENT));
            // let enrolldate = v.CHAT_ENROLL;
            tr2.append($("<td>").text(v.CHAT_ENROLL));

            $("#msgList").append(tr2);
          });
          $("#msgpageBar").append(data.pageBar);
        }
      },
    });
  }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
