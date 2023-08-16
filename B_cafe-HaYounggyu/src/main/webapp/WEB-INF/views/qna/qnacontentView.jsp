

<!-- qna/qnacontentView.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnacontentView.jsp</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<link href="${contextPath}/resources/css/qna/qnacontentView.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/brand.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet" />
<script type="text/javascript">
	
	function rep(){
		let form = {}
		let arr = $("#frm").serializeArray() 
		for(i=0 ; i<arr.length ; i++){
			form[arr[i].name] = arr[i].value
		}		
		$.ajax({
			url: "addReply", type: "post", dataType: "json",
			data: JSON.stringify(form),
			contentType: "application/json; charset=utf-8",
			success: function(){
				alert("답글 추가 성공")
				replyData()
	            location.reload()
			},
			error: function(){
				alert("- 답글 추가 실패 -")
			}
		})		
	}	
	function replyData(){
		$.ajax({
			url: "replyData/"+${data.qnaNum}, 
			type: "get", 
			dataType: "json",
			success: function(rep){
				let html="";
				rep.forEach(function(redata){
					 let date = new Date(redata.regdate);
		              let writeDate =
		                date.getFullYear() + "년 " + 
		                (date.getMonth() + 1) +"월 " +
		                date.getDate() + "일 " +
		                date.getHours() + "시 " +
		                date.getMinutes() + "분 " +
		                date.getSeconds() + "초";
		                html += "<div align='left'><b>아이디 : </b>" + redata.userId + " / " +
		                        "<b>작성일 : </b>" + writeDate + "<br>" +
		                        "<b>내용 : </b>" + redata.qnaReContent +
		                        "<br><hr></div>";
		              if (redata.userId === '${loginUser}') {
		                html += "<div align='left'><input type='button' value='삭제' onclick=\"deleteReply(" + redata.replySeq + ")\"></div>";
		                 } else if (redata.userId === '${loginUser}' || '${loginUser}' === 'cafe'){
		                	 html += "<div align='left'><input type='button' value='(관리자)삭제' onclick=\"deleteReply(" + redata.replySeq + ")\"></div>";
		                 }
		               });
		            if (html == "") {
		              html = "<th>등록된 댓글이 없습니다</th>";
		            }

		            $("#reply").html(html);
		          },
		          error: function () {
		            alert("댓글 기능 오류");
		          },
		        });
		      }

	   function deleteReply(replySeq) {
	        $.ajax({
	          url: 'deleteReply/' + replySeq, 
	          type: 'GET',
	          success: function (response) {
	            alert(response.msg);
	            if (response.result == 1) {
	              window.location.reload();
	            }
	          },
	          error: function () {
	            alert('댓글 삭제 실패!');
	          }
	        });
	      }
	   
	   $(document).ready(function () {
		   $('#qnaReContent').keyup(function (e) {
		     let content = $(this).val();

		     // 글자수 세기
		     if (content.length == 0 || content == '') {
		       $('.textCount').text('0자');
		     } else {
		       $('.textCount').text(content.length + '자');
		     }

		     // 글자수 제한
		     if (content.length > 100) {
		       // 200자를 초과하여 타이핑되지 않도록 함
		       $(this).val(content.substring(0, 100));
		       // 200자를 초과할 경우 알림 메시지 표시
		       alert('글자수는 100자까지 입력 가능합니다.');
		     }
		   });
		 });
</script>
</head>
<body onload="replyData()">
	<c:import url="../default/header.jsp" />
	<c:import url="../default/quickBar.jsp" />
	
	<!-- 상단 부분 -->
	<div class="sub_content" id="contents">
		<div class="sub-visual" style="background-image: url('${contextPath}/resources/imageFile/banner4.png')">
			<div class="sub-visual__wrapper container">
				<h1 class="sub-visual__title wow fadeInDown" style="visibility: visible; animation-name: fadeInDown;">Q & A</h1>
				<p class="sub-visual__txt wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">게시글 내용을 볼 수 있습니다</p>
			</div>
		</div>

		<!-- 중간 부분 -->
		<div class="sub-nav sub-nav--bar">
			<ul class="sub-nav__wrap sub-nav-clone--depth2">
				<!-- active 된 메뉴의 depth2 clone 하기 -->
				<li class="item">
					<a href="${contextPath }/community/communityAllList" class="link on">게시판</a>
					<a href="${contextPath }/qna/qnaList" class="link on">Q & A</a> 
					<a href="${contextPath }/gongji/gongjiList" class="link on">공지사항</a>
				</li>
			</ul>
		</div>
		
	<div class="sub-con">
	<div id="modal_wrap">
		<div id="first">
			<div style="width: 450px; margin: 0 auto; padding-top: 10px;">
				
			</div>
		</div>
		<!-- // first -->
	</div>
		<!-- QnA 게시글 부분 -->
		<section class="notice">
				<div class="board-list">
					<div class="container">
						<table class="board-table">
							<tr>
								<th scope="col" class="th-num">NO.</th>
								<td>${data.qnaNum}</td>
								<th scope="col" class="th-user">글쓴이</th>
								<td>${data.userId}</td>
								<th scope="col" class="th-date">작성일</th>
								<td>${data.regdate}</td>
							</tr>
							<tr class="inner-Contents title">
								<th scope="col" class="th-title">제목</th>
								<td colspan="5" align="center">${data.qnaTitle}</td>
							</tr>
							<tr>
								<td colspan="6">
									<div class="content" style="width: 400px; height: 300px;">${data.qnaContent}</div>
								</td>
							</tr>
						
							<tr class="inner-Contents">
								<td colspan="6" align="left">
									<div id="reply"></div> 
									<form id="frm">
										<input type="hidden" name="qnaNum" value="${data.qnaNum }">
										<br>
										<b>&lt; 댓글 작성 &gt;</b><br><b>작성자 : ${loginUser}</b>
										<br>
										<b>내 용</b><br>
										<input type="text" maxlength="100" placeholder="100자 이내 작성" style="width: 1217px; height: 50px; display: inline-block;" id="qnaReContent" name="qnaReContent">
										&nbsp;&nbsp;
										<input type="button" class="larger-button" value="댓글 작성" onclick="validateAndSubmit()"><br>
										<b class="textCount">0자</b><b class="textTotal">/100자</b><br>
										<br>
									</form>
									</td>
									</tr>
									
									<tr>
									<td  colspan="6" align="center">
										<c:choose>
										<c:when test="${loginUser == 'cafe'}">
											<input type="button" class="larger-button" value="글 삭제(관리자)"
												onclick="location.href='${contextPath}/qna/delete?qnaNum=${data.qnaNum }'"> &nbsp;
												<c:if test="${data.userId == loginUser}">
												<input type="button" class="larger-button" value="수정하기"
												onclick="location.href='${contextPath}/qna/QnAmodifyForm?qnaNum=${data.qnaNum }'"> &nbsp;
												</c:if>
										</c:when>
										<c:when test="${data.userId == loginUser}">
											<input type="button" class="larger-button" value="수정하기"
												onclick="location.href='${contextPath}/qna/QnAmodifyForm?qnaNum=${data.qnaNum }'"> &nbsp;
											<input type="button" class="larger-button" value="삭제하기"
												onclick="location.href='${contextPath}/qna/delete?qnaNum=${data.qnaNum }'"> &nbsp;
										</c:when>
									</c:choose> <input type="button" class="larger-button" value="글목록"	onclick="location.href='${contextPath}/qna/qnaList'">
									</td>
								</tr>
						</table>
					</div>
				</div>
			</section>
		</div>
	</div>
	
	<script type="text/javascript">
    function validateAndSubmit() {
        var content = document.getElementById('qnaReContent').value;
        if (content.trim() === '') {
            alert('댓글 내용을 입력해주세요!');
        } else {
            rep(); // 댓글 작성 로직 실행
        }
    }
	</script>
<c:import url="../default/footer.jsp" />
</body>
</html>