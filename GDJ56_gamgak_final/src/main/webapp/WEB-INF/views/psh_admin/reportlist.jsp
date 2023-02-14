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
      <div id="reportdata">
        <table id="dataList">
          <tr>
            <th>오늘 접수 된 신고</th>
            <th>누적 신고 수</th>
          </tr>
          <tr>
            <td>${today}</td>
            <td>${total}</td>
          </tr>
        </table>
      </div>
    </div>

    <hr class="sep" />
    <hr class="sep" />
    <div id="sep"></div>
    <hr class="sep" />
    <hr class="sep" />

    <div id="headText" onclick="solvereport(cPage,ynval);">
      <h2>신고관리</h2>
    </div>
    <hr class="sep" />
    <hr class="sep" />
    <div id="searchbox">
      <input type="text" id="repsearch" placeholder="이름으로 검색" />
      <button class="btn btn-primary btn-circle" onclick="searchName()">
        <i class="search-icon"></i>
      </button>
    </div>
    <hr class="sep" />
    <div id="headbox">
      <div id="psh_btns">
        <button
          class="btn btn-primary btn-ghost btn-slide"
          onclick="checksolve();"
        >
          처리완료
        </button>
        <button
          class="btn btn-primary btn-ghost btn-slide"
          onclick="userreport(cPage,ynval)"
        >
          회원신고
        </button>
        <button
          class="btn btn-primary btn-ghost btn-slide"
          onclick="myresreport(cPage,ynval);"
        >
          맛집저장신고
        </button>
        <button
          class="btn btn-primary btn-ghost btn-slide"
          onclick="meetingreport(cPage,ynval);"
        >
          모임신고
        </button>
      </div>
      <div id="orderbox">
        <select id="order">
          <option value="">최신순</option>
          <option value="">신고순</option>
          <option value="">욕설/인신공격</option>
          <option value="">상업적/홍보성</option>
          <option value="">음란/선정성</option>
          <option value="">불법정보</option>
          <option value="">기타</option>
        </select>
      </div>
    </div>

    <!-- 리스트 -->
    <div id="reportListBox">
      <table id="reportList"></table>
    </div>
    <div id="pageBar"></div>

    <hr class="sep" />
    <hr class="sep" />
    <div id="sep"></div>
    <hr class="sep" />
    <hr class="sep" />

    <div id="reportsolveT" onclick="solvereportlist('start');">
      <h2>신고처리</h2>
    </div>
    <hr class="sep" />
    <hr class="sep" />
    <div id="searchbox">
      <input type="text" id="solvesearch" placeholder="이름으로 검색" />
      <button class="btn btn-primary btn-circle" onclick="solvesearchName()">
        <i class="search-icon"></i>
      </button>
    </div>
    <hr class="sep" />
    <div id="headbox">
      <div id="psh_btns">
        <button
          class="btn btn-primary btn-ghost btn-slide"
          onclick="solvereportlist('user')"
          value="user"
        >
          회원신고
        </button>
        <button
          class="btn btn-primary btn-ghost btn-slide"
          onclick="solvereportlist('myres');"
          value="myres"
        >
          맛집저장신고
        </button>
        <button
          class="btn btn-primary btn-ghost btn-slide"
          onclick="solvereportlist('meeting');"
          value="meeting"
        >
          모임신고
        </button>
      </div>

      <div id="orderbox">
        <select id="order">
          <option value="">최신순</option>
          <option value="">신고순</option>
          <option value="">욕설/인신공격</option>
          <option value="">상업적/홍보성</option>
          <option value="">음란/선정성</option>
          <option value="">불법정보</option>
          <option value="">기타</option>
        </select>
      </div>
    </div>
    <!-- Modal -->
    <div
      class="modal fade"
      id="exampleModal"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">
              신고 상세내용
            </h1>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body"></div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              닫기
            </button>
          </div>
        </div>
      </div>
    </div>
    <div id="solvereportListBox">
      <table id="solvereportList"></table>
    </div>
    <div id="solvepageBar"></div>
  </section>
</div>

<script>
  let cPage;
  let numPerpage;
  let functionN;
  let ynval = "N";
  let N = "N";
  let Y = "Y";
  stopmem = [];
  reportmem = [];
  meetingmem = [];
  myresmem = [];

  //로딩시 실행
  (() => {
    let ynval = "N";
    solvereport(cPage, ynval);
    solvereportlist("start");
  })();

  //모달
  function openmodal(val) {
    console.log(val);
    $(".modal-body").empty();
    $.ajax({
      url: "${path}/admin/reportView.do",
      // dataType:"JSON",
      data: {
        no: val,
      },
      success: (data) => {
        data.list.forEach((v) => {
          console.log(v);
          const head = $("<div id='repview'>");
          head.append($("<div id='repNo'>").text(v.REPORT_NO + ".No"));
          head.append($("<div id='repTitle'>").text(v.REPORT_TITLE));
          $(".modal-body").append(head);
          let enrolldate = v.REPORT_DATE;
          $(".modal-body").append(
            $("<div id='reportDate'>").text(
              "신고날짜 : " + enrolldate.slice(0, 10)
            )
          );
          $(".modal-body").append(
            $("<div id='repTag'>").text("신고태그 : " + v.REPORT_TAG)
          );

          $(".modal-body").append($("<hr>"));
          $(".modal-body").append(
            $("<div id='repReason'>").text(v.REPORT_REASON)
          );
        });
      },
    });
  }
  //체크박스 전체선택 함수
  function selectAll() {
    const reportcheck = document.querySelectorAll("input[name='reportcheck']");
    // console.log($("#selectAll").prop("checked"))
    if ($("#selectAll").prop("checked")) {
      for (var i = 0; i < reportcheck.length; i++) {
        reportcheck[i].checked = true;
      }
    } else {
      for (var i = 0; i < reportcheck.length; i++) {
        reportcheck[i].checked = false;
      }
    }
  }

  //체크박스 값 가져와서 delete
  function checksolve() {
    if (!window.confirm("처리완료를 계속 진행하시겠습니까?")) {
      console.log("취소");
    } else {
      const del = document.querySelectorAll("input[name=reportcheck]:checked");
      nodata = [];
      // let nodata="";
      for (let i = 0; i < del.length; i++) {
        // console.log(delmem[i].value)
        nodata.push(del[i].value);
      }
      // console.log(JSON.stringify(nodata))
      $.ajax({
        url: "${path}/admin/deletedata.do",
        // dataType:"JSON",
        traditional: true,
        data: {
          nodata: JSON.stringify(nodata),
          tableN: "report",
          columnN: "report_no",
          yn: "solve_yn",
        },
        success: (data) => {
          console.log(data.result);
          for (let i = 0; i < data.result.length; i++) {
            let total = +Number(data.result[i]);
          }
          if ((total = data.result.length)) {
            userreport(cPage, ynval);
            solvereportlist("start");
          }
        },
      });
    }
  }

  //처리한 신고 리스트 출력
  function solvereportlist(e) {
    let ynval = "Y";
    console.log(e);
    if (e == "start") {
      solvereport(cPage, ynval);
    } else if (e == "user") {
      userreport(cPage, ynval);
    } else if (e == "meeting") {
      meetingreport(cPage, ynval);
    } else if (e == "myres") {
      myresreport(cPage, ynval);
    }
  }

  //태그합쳐서 신고리스트 출력
  function solvereport(cPage, ynval, msg) {
    if (ynval == "Y") {
      $("#solvereportList").empty();
      $("#solvepageBar").empty();
      $.ajax({
        url: "${path}/admin/reportResult.do",
        data: {
          tableN: "REPORT",
          cPage: cPage,
          functionN: "solvereport",
          yn: "SOLVE_YN",
          ynval: "Y",
        },
        success: (data) => {
          const tr = $("<tr>");
          tr.append($("<th>").text("신고번호"));
          tr.append($("<th>").text("신고제목"));
          tr.append($("<th>").text("신고 날짜"));
          tr.append($("<th>").text("신고 사유"));
          tr.append($("<th>").text("신고 태그"));

          $("#solvereportList").append(tr);
          if (data.list.length == 0) {
            let tr2 = $("<tr>");
            tr2.append($("<td colspan='14'>").text("처리된 신고가 없습니다"));
            $("#solvereportList").append(tr2);
          } else {
            data.list.forEach((v) => {
              // console.log(v.member_no, v.introduce)
              // console.log(v)
              let tr2 = $(
                "<tr data-bs-toggle='modal' data-bs-target='#exampleModal' onclick='openmodal(" +
                  v.REPORT_NO +
                  ")'>"
              );
              let a = $("<a>");
              tr2.append($("<td>").text(v.REPORT_NO));
              tr2.append($("<td>").text(v.REPORT_TITLE));
              let enrolldate = v.REPORT_DATE;
              tr2.append($("<td>").text(enrolldate.slice(0, 10)));
              tr2.append($("<td>").text(v.REPORT_REASON));
              tr2.append($("<td>").text(v.REPORT_TAG));

              $("#solvereportList").append(tr2);
            });
            $("#solvepageBar").append(data.pageBar);
          }
        },
      });
    } else {
      $("#reportList").empty();
      $("#pageBar").empty();
      $.ajax({
        url: "${path}/admin/reportResult.do",
        data: {
          tableN: "report",
          cPage: cPage,
          functionN: "solvereport",
          yn: "SOLVE_YN",
          ynval: "N",
        },
        success: (data) => {
          const tr = $("<tr>");
          const checkbox = $("<input id='selectAll' type='checkbox'>").attr(
            "onclick",
            "selectAll()"
          );
          tr.append($("<th>").append(checkbox));
          tr.append($("<th>").text("신고번호"));
          tr.append($("<th>").text("신고제목"));
          tr.append($("<th>").text("신고 날짜"));
          tr.append($("<th>").text("신고 사유"));
          tr.append($("<th>").text("신고 태그"));

          $("#reportList").append(tr);
          if (data.list.length == 0) {
            let tr2 = $("<tr>");
            tr2.append($("<td colspan='14'>").text("처리된 신고가 없습니다"));
            $("#reportList").append(tr2);
          } else {
            data.list.forEach((v) => {
              // console.log(v.member_no, v.introduce)
              // console.log(v)
              let tr2 = $(
                "<tr data-bs-toggle='modal' data-bs-target='#exampleModal' onclick='openmodal(" +
                  v.REPORT_NO +
                  ")'>"
              );
              let a = $("<a>");
              tr2.append(
                $("<td>").append(
                  $(
                    "<input name='reportcheck' type='checkbox' value=" +
                      v.REPORT_NO +
                      ">"
                  )
                )
              );
              tr2.append($("<td>").text(v.REPORT_NO));
              tr2.append($("<td>").text(v.REPORT_TITLE));
              let enrolldate = v.REPORT_DATE;
              tr2.append($("<td>").text(enrolldate.slice(0, 10)));
              tr2.append($("<td>").text(v.REPORT_REASON));
              tr2.append($("<td>").text(v.REPORT_TAG));

              $("#reportList").append(tr2);
            });
            $("#pageBar").append(data.pageBar);
          }
        },
      });
    }
  }

  //유저신고 리스트 출력
  function userreport(cPage, ynval) {
    console.log(ynval);

    if (ynval == "N") {
      $("#reportList").empty();
      $("#pageBar").empty();
      $.ajax({
        url: "${path}/admin/userreport.do",
        data: {
          tableN: "USERREPORT",
          cPage: cPage,
          functionN: "userreport",
          yn: "SOLVE_YN",
          ynval: "N",
        },
        success: (data) => {
          console.log(data);
          //ajax로 찬희언니한테 넘기기 관리자 정보는 세션으로 가져올 생각 또는 1로 지정
          //신고회원번호
          data.reportmem.forEach((v) => {
            reportmem.push(v.MEMBER_NO);
          });
          //정지회원번호
          data.stopmem.forEach((v) => {
            stopmem.push(v.MEMBER_NO);
          });
          //삭제저장맛집 회원번호
          data.myresmem.forEach((v) => {
            myresmem.push(v.MEMBER_NO);
          });
          //삭제 모임장 회원번호
          data.meetingmem.forEach((v) => {
            meetingmem.push(v.MEMBER_LEADER_NO);
          });

          $.ajax({
            url: "${path}/admin/checkdata.do",
            traditional: true,
            data: {
              stopmem: JSON.stringify(stopmem),
              reportmem: JSON.stringify(reportmem),
              myresmem: JSON.stringify(myresmem),
              meetingmem: JSON.stringify(meetingmem),
            },
            success: (data) => {},
          });
          const tr = $("<tr>");
          const checkbox = $("<input id='selectAll' type='checkbox'>").attr(
            "onclick",
            "selectAll()"
          );
          tr.append($("<th>").append(checkbox));
          tr.append($("<th>").text("신고번호"));
          tr.append($("<th>").text("신고제목"));
          tr.append($("<th>").text("회원 번호"));
          tr.append($("<th>").text("신고 날짜"));
          tr.append($("<th>").text("신고 사유"));
          tr.append($("<th>").text("신고 태그"));

          $("#reportList").append(tr);
          if (data.list.length == 0) {
            let tr2 = $("<tr>");
            tr2.append($("<td colspan='14'>").text("저장식당이 없습니다"));
            $("#reportList").append(tr2);
          } else {
            data.list.forEach((v) => {
              // console.log(v.member_no, v.introduce)
              // console.log(v)
              let tr2 = $(
                "<tr data-bs-toggle='modal' data-bs-target='#exampleModal' onclick='openmodal(" +
                  v.REPORT_NO +
                  ")'>"
              );
              let a = $("<a>");
              tr2.append(
                $("<td>").append(
                  $(
                    "<input name='reportcheck' type='checkbox' value='" +
                      v.REPORT_NO +
                      "'>"
                  )
                )
              );
              tr2.append($("<td>").text(v.REPORT_NO));
              tr2.append($("<td>").text(v.REPORT_TITLE));
              tr2.append($("<td>").text(v.MEMBER_NO));
              let enrolldate = v.REPORT_DATE;
              tr2.append($("<td>").text(enrolldate.slice(0, 10)));
              tr2.append($("<td>").text(v.REPORT_REASON));
              tr2.append($("<td>").text(v.REPORT_TAG));

              $("#reportList").append(tr2);
            });
            $("#pageBar").append(data.pageBar);
          }
        },
      });
    } else {
      $("#solvereportList").empty();
      $("#solvepageBar").empty();
      $.ajax({
        url: "${path}/admin/userreport.do",
        data: {
          tableN: "USERREPORT",
          cPage: cPage,
          functionN: "userreport",
          yn: "SOLVE_YN",
          ynval: "Y",
        },
        success: (data) => {
          const tr = $("<tr>");
          tr.append($("<th>").text("신고번호"));
          tr.append($("<th>").text("신고제목"));
          tr.append($("<th>").text("회원 번호"));
          tr.append($("<th>").text("신고 날짜"));
          tr.append($("<th>").text("신고 사유"));
          tr.append($("<th>").text("신고 태그"));

          $("#solvereportList").append(tr);
          if (data.list.length == 0) {
            let tr2 = $("<tr >");
            tr2.append($("<td colspan='14'>").text("저장식당이 없습니다"));
            $("#solvereportList").append(tr2);
          } else {
            data.list.forEach((v) => {
              // console.log(v.member_no, v.introduce)
              // console.log(v)
              let tr2 = $(
                "<tr data-bs-toggle='modal' data-bs-target='#exampleModal' onclick='openmodal(" +
                  v.REPORT_NO +
                  ")' >"
              );
              let a = $("<a>");
              tr2.append($("<td>").text(v.REPORT_NO));
              tr2.append($("<td>").text(v.REPORT_TITLE));
              tr2.append($("<td>").text(v.MEMBER_NO));
              let enrolldate = v.REPORT_DATE;
              tr2.append($("<td>").text(enrolldate.slice(0, 10)));
              tr2.append($("<td>").text(v.REPORT_REASON));
              tr2.append($("<td>").text(v.REPORT_TAG));

              $("#solvereportList").append(tr2);
            });
            $("#solvepageBar").append(data.pageBar);
          }
        },
      });
    }
  }
  //맛집저장신고 리스트 출력
  function myresreport(cPage, ynval) {
    if (ynval == "N") {
      $("#reportList").empty();
      $("#pageBar").empty();
      $.ajax({
        url: "${path}/admin/myresreport.do",
        data: {
          tableN: "MYRESREPORT",
          cPage: cPage,
          functionN: "myresreport",
          yn: "SOLVE_YN",
          ynval: "N",
        },
        success: (data) => {
          const tr = $("<tr>");
          const checkbox = $("<input id='selectAll' type='checkbox'>").attr(
            "onclick",
            "selectAll()"
          );
          tr.append($("<th>").append(checkbox));
          tr.append($("<th>").text("신고번호"));
          tr.append($("<th>").text("신고제목"));
          tr.append($("<th>").text("맛집저장 번호"));
          tr.append($("<th>").text("신고 날짜"));
          tr.append($("<th>").text("신고 사유"));
          tr.append($("<th>").text("신고 태그"));

          $("#reportList").append(tr);
          if (data.list.length == 0) {
            let tr2 = $("<tr>");
            tr2.append($("<td colspan='14'>").text("저장식당이 없습니다"));
            $("#reportList").append(tr2);
          } else {
            data.list.forEach((v) => {
              // console.log(v.member_no, v.introduce)
              // console.log(v)
              let tr2 = $(
                "<tr data-bs-toggle='modal' data-bs-target='#exampleModal' onclick='openmodal(" +
                  v.REPORT_NO +
                  ")'>"
              );
              let a = $("<a>");
              tr2.append(
                $("<td>").append(
                  $(
                    "<input name='reportcheck' type='checkbox'value=" +
                      v.REPORT_NO +
                      ">"
                  )
                )
              );
              tr2.append($("<td>").text(v.REPORT_NO));
              tr2.append($("<td>").text(v.REPORT_TITLE));
              tr2.append($("<td>").text(v.MYRES_NO));
              let enrolldate = v.REPORT_DATE;
              tr2.append($("<td>").text(enrolldate.slice(0, 10)));
              tr2.append($("<td>").text(v.REPORT_REASON));
              tr2.append($("<td>").text(v.REPORT_TAG));

              $("#reportList").append(tr2);
            });
            $("#pageBar").append(data.pageBar);
          }
        },
      });
    } else {
      $("#solvereportList").empty();
      $("#solvepageBar").empty();
      $.ajax({
        url: "${path}/admin/myresreport.do",
        data: {
          tableN: "MYRESREPORT",
          cPage: cPage,
          functionN: "myresreport",
          yn: "SOLVE_YN",
          ynval: "Y",
        },
        success: (data) => {
          const tr = $("<tr>");
          tr.append($("<th>").text("신고번호"));
          tr.append($("<th>").text("신고제목"));
          tr.append($("<th>").text("맛집저장 번호"));
          tr.append($("<th>").text("신고 날짜"));
          tr.append($("<th>").text("신고 사유"));
          tr.append($("<th>").text("신고 태그"));

          $("#solvereportList").append(tr);
          if (data.list.length == 0) {
            let tr2 = $("<tr>");
            tr2.append($("<td colspan='14'>").text("저장식당이 없습니다"));
            $("#solvereportList").append(tr2);
          } else {
            data.list.forEach((v) => {
              // console.log(v.member_no, v.introduce)
              // console.log(v)
              let tr2 = $(
                "<tr data-bs-toggle='modal' data-bs-target='#exampleModal' onclick='openmodal(" +
                  v.REPORT_NO +
                  ")'>"
              );
              let a = $("<a>");
              tr2.append($("<td>").text(v.REPORT_NO));
              tr2.append($("<td>").text(v.REPORT_TITLE));
              tr2.append($("<td>").text(v.MYRES_NO));
              let enrolldate = v.REPORT_DATE;
              tr2.append($("<td>").text(enrolldate.slice(0, 10)));
              tr2.append($("<td>").text(v.REPORT_REASON));
              tr2.append($("<td>").text(v.REPORT_TAG));

              $("#solvereportList").append(tr2);
            });
            $("#solvepageBar").append(data.pageBar);
          }
        },
      });
    }
  }
  //모임신고 리스트 출력
  function meetingreport(cPage, ynval) {
    if (ynval == "N") {
      $("#reportList").empty();
      $("#pageBar").empty();
      $.ajax({
        url: "${path}/admin/meetingreport.do",
        data: {
          tableN: "MEETINGREPORT",
          cPage: cPage,
          functionN: "meetingreport",
          yn: "SOLVE_YN",
          ynval: "N",
        },
        success: (data) => {
          const tr = $("<tr>");
          const checkbox = $("<input id='selectAll' type='checkbox'>").attr(
            "onclick",
            "selectAll()"
          );
          tr.append($("<th>").append(checkbox));
          tr.append($("<th>").text("신고번호"));
          tr.append($("<th>").text("신고제목"));
          tr.append($("<th>").text("모임 번호"));
          tr.append($("<th>").text("신고 날짜"));
          tr.append($("<th>").text("신고 사유"));
          tr.append($("<th>").text("신고 태그"));

          $("#reportList").append(tr);
          if (data.list.length == 0) {
            let tr2 = $("<tr>");
            tr2.append($("<td colspan='14'>").text("저장식당이 없습니다"));
            $("#reportList").append(tr2);
          } else {
            data.list.forEach((v) => {
              // console.log(v.member_no, v.introduce)
              // console.log(v)
              let tr2 = $(
                "<tr data-bs-toggle='modal' data-bs-target='#exampleModal' onclick='openmodal(" +
                  v.REPORT_NO +
                  ")'>"
              );
              let a = $("<a>");
              tr2.append(
                $("<td>").append(
                  $(
                    "<input name='reportcheck' type='checkbox'value=" +
                      v.REPORT_NO +
                      ">"
                  )
                )
              );
              tr2.append($("<td>").text(v.REPORT_NO));
              tr2.append($("<td>").text(v.REPORT_TITLE));
              tr2.append($("<td>").text(v.MEETING_NO));
              let enrolldate = v.REPORT_DATE;
              tr2.append($("<td>").text(enrolldate.slice(0, 10)));
              tr2.append($("<td>").text(v.REPORT_REASON));
              tr2.append($("<td>").text(v.REPORT_TAG));

              $("#reportList").append(tr2);
            });
            $("#pageBar").append(data.pageBar);
          }
        },
      });
    } else {
      $("#solvereportList").empty();
      $("#solvepageBar").empty();
      $.ajax({
        url: "${path}/admin/meetingreport.do",
        data: {
          tableN: "MEETINGREPORT",
          cPage: cPage,
          functionN: "meetingreport",
          yn: "SOLVE_YN",
          ynval: "Y",
        },
        success: (data) => {
          const tr = $("<tr>");
          tr.append($("<th>").text("신고번호"));
          tr.append($("<th>").text("신고제목"));
          tr.append($("<th>").text("모임 번호"));
          tr.append($("<th>").text("신고 날짜"));
          tr.append($("<th>").text("신고 사유"));
          tr.append($("<th>").text("신고 태그"));

          $("#solvereportList").append(tr);
          if (data.list.length == 0) {
            let tr2 = $("<tr>");
            tr2.append($("<td colspan='14'>").text("저장식당이 없습니다"));
            $("#solvereportList").append(tr2);
          } else {
            data.list.forEach((v) => {
              // console.log(v.member_no, v.introduce)
              // console.log(v)
              let tr2 = $(
                "<tr data-bs-toggle='modal' data-bs-target='#exampleModal' onclick='openmodal(" +
                  v.REPORT_NO +
                  ")'>"
              );
              let a = $("<a>");
              tr2.append($("<td>").text(v.REPORT_NO));
              tr2.append($("<td>").text(v.REPORT_TITLE));
              tr2.append($("<td>").text(v.MEETING_NO));
              let enrolldate = v.REPORT_DATE;
              tr2.append($("<td>").text(enrolldate.slice(0, 10)));
              tr2.append($("<td>").text(v.REPORT_REASON));
              tr2.append($("<td>").text(v.REPORT_TAG));

              $("#solvereportList").append(tr2);
            });
            $("#solvepageBar").append(data.pageBar);
          }
        },
      });
    }
  }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
