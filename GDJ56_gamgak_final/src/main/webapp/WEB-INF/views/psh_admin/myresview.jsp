<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/adminheader.jsp" />
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
        <div id="adText"></div>
      </div>
    </div>
    <!-- 구분선 -->
    <hr class="sep" />
    <hr class="sep" />
    <div id="sep"></div>
    <hr class="sep" />
    <hr class="sep" />
    <!-- 내용 -->
    <hr class="sep" />
    <hr class="sep" />
    <div id="headbox">
      <div id="fns">
        <button
          id="delbtn"
          onclick="deletemyres()"
          class="btn btn-primary btn-ghost btn-slide"
          onclick="deletemem()"
        >
          식당 삭제
        </button>
      </div>

      <div id="searchbox">
        <input id="search" placeholder="이름으로 검색" />
        <button class="btn btn-primary btn-circle" onclick="searchName()">
          <i class="search-icon"></i>
        </button>
      </div>

      <div id="orderbox">
        <select id="order">
          <option value="">공유Y</option>
          <option value="">공유N</option>
        </select>
      </div>
    </div>
    <!-- 리스트 -->
    <input type="hidden" value="${no}" id="no" />
    <div id="myresBox">
      <table id="myresList"></table>
      <div id="pageBar"></div>
    </div>
    <hr class="sep" />
    <hr class="sep" />
  </section>
</div>
<script>
  let cPage;
  let numPerpage;
  let functionN;
  let myresno;
  let N = "N";
  let Y = "Y";
  //처음 로딩시 실행
  (() => {
    myresno = $("#no").val();
    console.log(myresno);
    myreslist(cPage, functionN, myresno);
  })();

  //체크박스 전체선택 함수
  function selectAll() {
    const myrescheck = document.querySelectorAll("input[name='myrescheck']");
    // console.log($("#selectAll").prop("checked"))
    if ($("#selectAll").prop("checked")) {
      for (var i = 0; i < myrescheck.length; i++) {
        myrescheck[i].checked = true;
      }
    } else {
      for (var i = 0; i < myrescheck.length; i++) {
        myrescheck[i].checked = false;
      }
    }
  }

  //체크박스 값 가져와서 delete
  function deletemyres() {
    if (!window.confirm("저장식당 삭제를 계속 진행하시겠습니까?")) {
      console.log("취소");
    } else {
      const del = document.querySelectorAll("input[name=myrescheck]:checked");
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
          tableN: "MYRES",
          columnN: "MYRES_NO",
          yn: "DEL_YN",
        },
        success: (data) => {
          console.log(data.result);
          for (let i = 0; i < data.result.length; i++) {
            let total = +Number(data.result[i]);
          }
          if ((total = data.result.length)) myreslist();
        },
      });
    }
  }

  //리스트 출력
  function myreslist(cPage, functionN, myresno) {
    $("#myresList").empty();
    $("#pageBar").empty();
    $("#adText").empty();
    myresno = $("#no").val();
    $.ajax({
      url: "${path}/admin/selectmyres.do",
      data: {
        cPage: cPage,
        functionN: "myreslist",
        no: myresno,
        tableN: "member_no",
        yn: "DEL_YN",
        ynval: "N",
        // numPerpage:numPerpage
      },
      success: (data) => {
        // console.log(data.pageBar)
        console.log(data.member.member_email);
        $("#adText").append(
          $("<h2>").append($("<b>").text(data.member.member_name))
        );
        $("#adText").append($("<h5>").text(data.member.member_email));
        $("#adText").append($("<h5>").text(data.member.member_nickname));
        $("#adText").append($("<h5>").text(data.member.member_gender));
        $("#adText").append($("<h5>").text(data.member.member_enrolldate));

        const tr = $("<tr>");
        const checkbox = $("<input id='selectAll' type='checkbox'>").attr(
          "onclick",
          "selectAll()"
        );
        tr.append($("<th>").append(checkbox));
        tr.append($("<th>").text("회원번호"));
        tr.append($("<th>").text("식당저장 번호"));
        tr.append($("<th>").text("저장 날짜"));
        tr.append($("<th>").text("메모"));
        tr.append($("<th>").text("공유"));
        tr.append($("<th>").text("저장식당 신고 수"));

        $("#myresList").append(tr);
        if (data.list.length == 0) {
          let tr2 = $("<tr>");
          tr2.append($("<td colspan='6'>").text("저장식당이 없습니다"));
          $("#myresList").append(tr2);
        } else {
          data.list.forEach((v) => {
            // console.log(v.member_no, v.introduce)
            // console.log(v)

            let tr2 = $("<tr>");
            let a = $("<a>");
            tr2.append(
              $("<td>").append(
                $(
                  "<input name='myrescheck' type='checkbox' value=" +
                    v.MYRES_NO +
                    ">"
                )
              )
            );
            tr2.append($("<td>").text(v.MEMBER_NO));
            tr2.append($("<td>").text(v.MYRES_NO));
            let enrolldate = v.MYRES_SAVE_DATE;
            tr2.append($("<td>").text(enrolldate.slice(0, 10)));
            tr2.append($("<td>").text(v.MYRES_MEMO));
            tr2.append($("<td>").text(v.MYRES_YN));
            tr2.append($("<td>").text(v.REPORT_CNT));

            $("#myresList").append(tr2);
          });
          $("#pageBar").append(data.pageBar);
        }
      },
    });
  }
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
