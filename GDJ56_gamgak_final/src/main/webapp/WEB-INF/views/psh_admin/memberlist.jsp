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
            <th>누적 회원 수</th>
            <th>정지 회원 수</th>
          </tr>
          <tr>
            <td>${total}</td>
            <td>${authmem}</td>
          </tr>
        </table>
      </div>
    </div>

    <hr class="sep" />
    <hr class="sep" />
    <div id="sep"></div>
    <hr class="sep" />
    <hr class="sep" />

    <div id="headtext" onclick="memberlist(cPage,ynval);">
      <h2>회원관리</h2>
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
          onclick="deletemem()"
        >
          회원탈퇴
        </button>
        <button
          class="btn btn-primary btn-ghost btn-slide"
          onclick="deletememlist()"
        >
          탈퇴조회
        </button>
        <button
          class="btn btn-primary btn-ghost btn-slide"
          onclick="stopemem()"
        >
          정지
        </button>
        <button
          class="btn btn-primary btn-ghost btn-slide"
          onclick="sendnoticememlist()"
        >
          경고
        </button>
        <button
          class="btn btn-primary btn-ghost btn-slide"
          onclick="sendmyresdellist()"
        >
          저장식당삭제
        </button>
        <button
          class="btn btn-primary btn-ghost btn-slide"
          onclick="sendmeetingdellist()"
        >
          모임삭제
        </button>
      </div>
    </div>
    <!-- 리스트 -->
    <div id="memberListBox">
      <table id="memberList"></table>
    </div>
    <div id="pageBar"></div>
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
  function deletemem() {
    if (!window.confirm("회원탈퇴를 계속 진행하시겠습니까?")) {
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
        url: "${path}/admin/deletedata.do",
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

  //탈퇴회원 리스트 출력
  function deletememlist() {
    let ynval = "Y";
    memberlist(cPage, ynval);
  }

  //리스트 출력
  function memberlist(cPage, ynval) {
    // console.log(ynval)
    if (ynval == null) ynval = "N";
    $("#memberList").empty();
    $("#pageBar").empty();
    $.ajax({
      url: "${path}/admin/selectmember.do",
      data: {
        cPage: cPage,
        functionN: "memberlist",
        tableN: "MYRES_NO",
        yn: "AUTHORITY_YN",
        ynval: ynval,
        // numPerpage:numPerpage
      },
      success: (data) => {
        // console.log(data.pageBar)
        // console.log(data.list)
        // console.log(data.totalmem)
        // console.log(data.authmem)

        //회원 리스트
        const tr = $("<tr>");
        const checkbox = $("<input id='selectAll' type='checkbox'>").attr(
          "onclick",
          "selectAll()"
        );
        tr.append($("<th>").append(checkbox));
        tr.append($("<th>").text("번호"));
        tr.append($("<th>").text("이름"));
        tr.append($("<th>").text("이메일"));
        tr.append($("<th>").text("성별"));
        tr.append($("<th>").text("닉네임"));
        tr.append($("<th>").text("가입날짜"));
        tr.append($("<th>").text("식당 저장 수"));
        tr.append($("<th>").text("유저 신고 수"));
        tr.append($("<th>").text("유저 권한"));
        $("#memberList").append(tr);
        if (data.list.length == 0) {
          let tr2 = $("<tr>");
          tr2.append($("<td colspan='11'>").text("저장식당이 없습니다"));
          $("#membertList").append(tr2);
        } else {
          data.list.forEach((v) => {
            // console.log(v.member_no, v.introduce)
            // console.log(v)
            let tr2 = $("<tr>");
            let a = $("<a>");
            tr2.append(
              $("<td>").append(
                $(
                  "<input name='memcheck' type='checkbox' value=" +
                    v.MEMBER_NO +
                    ">"
                )
              )
            );
            tr2.append($("<td >").text(v.MEMBER_NO));
            tr2.append($("<td>").text(v.MEMBER_NAME));
            tr2.append($("<td>").text(v.MEMBER_EMAIL));
            tr2.append($("<td>").text(v.MEMBER_GENDER));
            tr2.append($("<td>").text(v.MEMBER_NICKNAME));
            let enrolldate = v.MEMBER_ENROLLDATE;
            tr2.append($("<td>").text(enrolldate.slice(0, 10)));
            // a.attr(
            //   "href",
            //   "http://localhost:9090/admin/myresview.do?no=" + v.MEMBER_NO
            // ).text(v.MYRES_CNT);
            a.attr(
              "href",
              "http://gd1class.iptime.org:9999/GDJ56_gamgak_final/admin/myresview.do?no=" +
                v.MEMBER_NO
            ).text(v.MYRES_CNT);
            tr2.append($("<td>").append(a));
            tr2.append($("<td>").text(v.REPORT_CNT));
            tr2.append($("<td>").text(v.AUTHORITY_YN));
            $("#memberList").append(tr2);
          });
          $("#pageBar").append(data.pageBar);
        }
      },
    });
  }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
