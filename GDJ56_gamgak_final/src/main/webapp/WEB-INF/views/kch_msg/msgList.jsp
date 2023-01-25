<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- 모임 -->
<div id="meeting-wrapper">
	<div id="meeting-item">
		<a><img id="meeting-img" src="${path }/resources/images/플러스.png"></a>
		<p>모임 이름</p>
	</div>
	<div id="meeting-item">
		<a><img id="meeting-img" src="${path }/resources/images/임시 이미지03.jpg"></a>
		<p>모임 이름</p>
	</div>
</div>

<!-- 채팅방 목록 -->
<!-- 기능 구현 시 동적생성 해야함 -->
<div id="totalpage">
	<div id="msg_title">
		<b id="titletext">메세지 목록</b>
	</div>
	<a href="#" class="chat_modal" data-bs-toggle="modal" data-bs-target="#exampleModal">
		<div id="list">
			<div><img id="msg_profile" alt="" src="${path }/resources/images/프로필 기본 이미지.jpg"></div>
			<div id="name_msg">
				<div id="nickname"><b>차니니니니니</b></div>
				<div id="msg_text"><p>ㅋㅋㅋㅋㅋㅋ</p></div>
			</div>
			<div id="count_time">
				<div><span id="msg_count"> 10 </span></div>
				<div id="msg_time"><p>17:52</p></div>
			</div>
			<div id="msg_out_div"><button id="msg_out_bt">나가기</button></div>
		</div>
	</a>
</div>

<!-- 채팅방 -->
<!-- 기능 구현 시 동적생성 해야함 -->


  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
			<div id="modal_sender">
				<div id="moda_msg_text_r"><p>ㅋㅋㅋㅋㅋㅋ</p></div>
			</div>	
			<div id="modal_receiver">
				<div><img id="modal_msg_profile" alt="" src="${path }/resources/images/프로필 기본 이미지.jpg"></div>
				<div id="modal_name_msg">
					<div id="modal_nickname"><b>차니니니니니</b></div>
					<div id="moda_msg_text_s"><p>ㅋㅋㅋㅋㅋㅋ</p></div>
					<!-- 입력창 -->
					<div id="modal_msg">
						<div id="modal_msg_text">
							<input type="text" placeholder="내용을 입력해주세요">
						</div>    
						<div id="modal_msg_bt">
							<button id="modal_msg_send">입력</button>
						</div>
			    	</div>					
				</div>
			</div>		
        </div>
<!--         <div class="modal-footer">
			
        </div> -->
      </div>
    </div>
  </div>
  
  
<%-- <div class="modal">
	<div class="modal_content">
		<div id="x">x</div>
		<div id="model_sender">
			<div id="moda_msg_text_r"><p>ㅋㅋㅋㅋㅋㅋ</p></div>
		</div>	
		<div id="model_receiver">
			<div><img id="modal_msg_profile" alt="" src="${path }/resources/images/프로필 기본 이미지.jpg"></div>
			<div id="modal_name_msg">
				<div id="modal_nickname"><b>차니니니니니</b></div>
				<div id="moda_msg_text_s"><p>ㅋㅋㅋㅋㅋㅋ</p></div>
			</div>
		</div>			
		<div id="modal_msg">
			<div id="modal_msg_text">
				<input type="text" placeholder="내용을 입력해주세요">
			</div>    
			<div id="modal_msg_bt">
				<button id="modal_msg_send">입력</button>
			</div>
    	</div>
	</div>
</div>

<script>
	$(function(){ 
		/* 채팅방 열기 */
		$(".chat_modal").click(function(){
			$(".modal").fadeIn();
		});
		/* 채팅방 닫기 */
		$("#x").click(function(){
		    $(".modal").fadeOut();
		});
		  
	});
</script> --%>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>