<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/adminheader.jsp">
  <jsp:param name="title" value="회원가입" />
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath }" />
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
          <h5><b>admin</b></h5>
          <h5>관리자</h5>
          <h5>마지막 접속시간 : 23.01.26 12:00</h5>
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
            <td>오늘 보낸 메세지</td>
            <td>총 보낸 메세지</td>
          </tr>
        </table>
      </div>
    </div>

    <hr class="sep" />
    <hr class="sep" />
    <div id="sep"></div>
    <hr class="sep" />
    <hr class="sep" />

    <div id="headtext" onclick="msglist(cPage,ynval);">
      <h2>알림 메세지</h2>
    </div>

    <hr class="sep" />

    <div id="searchbox">
      <input id="search" placeholder="이름으로 검색" />
      <button class="btn btn-primary btn-circle" onclick="searchName()">
        <i class="search-icon"></i>
      </button>
    </div>
    <div id="headbox">
      <div id="fnsmem">
        <button
          class="btn btn-primary btn-ghost btn-slide"
          onclick="stopememlist()"
        >
          정지메세지
        </button>
        <button
          class="btn btn-primary btn-ghost btn-slide"
          onclick="noticememlist()"
        >
          경고메세지
        </button>
        <button
          class="btn btn-primary btn-ghost btn-slide"
          onclick="myresdellist()"
        >
          저장식당삭제메세지
        </button>
        <button
          class="btn btn-primary btn-ghost btn-slide"
          onclick="meetingdellist()"
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
  //처음 로딩시 실행
  (() => {
    let ynval = "N";
    msglist(cPage, ynval);
    memberlist(cPage, ynval);
  })();

  //체크박스 전체선택 함수
  function selectAll() {
    const memcheck = document.querySelectorAll("input[name=memcheck]");
    // console.log($("#selectAll").prop("checked"))
    console.log();
    if ($("#selectAll").prop("checked")) {
      for (var i = 0; i < memcheck.length; i++) {
        // console.log(memcheck[i].value)
        memcheck[i].checked = true;
      }
    } else {
      for (var i = 0; i < memcheck.length; i++) {
        memcheck[i].checked = false;
      }
    }
  }

  //체크박스 값 가져와서 delete
  function sendmsg() {
    if (!window.confirm("메세지 전송을 계속 진행하시겠습니까?")) {
      console.log("취소");
    } else {
      const delmem = document.querySelectorAll("input[name=memcheck]:checked");
      nodata = [];
      // let nodata="";
      for (let i = 0; i < delmem.length; i++) {
        // console.log(delmem[i].value)
        nodata.push(delmem[i].value);
      }
      // console.log(JSON.stringify(nodata))
      $.ajax({
        url: "${path}/admin/sendMsg.do",
        // dataType:"JSON",
        traditional: true,
        data: {
          nodata: JSON.stringify(nodata),
          tableN: "MEMBER",
          columnN: "MEMBER_NO",
          yn: "AUTHORITY_YN",
        },
        success: (data) => {
          console.log(data.result);
          for (let i = 0; i < data.result.length; i++) {
            let total = +Number(data.result[i]);
          }
          if ((total = data.result.length)) memberlist(cPage, ynval);
        },
      });
    }
  }

  //메세지리스트 출력
  function msglist(cPage) {
    // console.log(ynval)
    // if (ynval == null) ynval = "N";
    $("#msgList").empty();
    $("#msgpageBar").empty();
    $.ajax({
      url: "${path}/admin/msglist.do",
      data: {
        cPage: cPage,
        functionN: "msglist",
        loginMemberNo: 1,
        content: "",
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
            // console.log(v)
            let tr2 = $("<tr>");
            let a = $("<a>");
            tr2.append($("<td >").text(v.CHAT_NO));
            tr2.append($("<td>").text(v.MEMBER_NO));
            tr2.append($("<td>").text(v.CHATTING_CONTENT));
            let enrolldate = v.CHAT_ENROLL;
            tr2.append($("<td>").text(enrolldate.slice(0, 10)));

            $("#msgList").append(tr2);
          });
          $("#msgpageBar").append(data.pageBar);
        }
      },
    });
  }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
