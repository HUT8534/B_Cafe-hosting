
<!-- 커뮤니티 내용 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 내용 페이지</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<link href="${contextPath}/resources/css/community/contentView.css" rel="stylesheet" />
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
				alert("댓글이 작성 되었습니다.")
				replyData()
				location.reload()
			},
			error: function(){
				alert("- 로그인 후 이용해주세요 -")
				window.location.href = "/cafe/member/login";
			}
		})
		
	}
	
	function replyData() {
        $.ajax({
          url: "replyData/" + ${data.communityNum},
          type: "get",
          dataType: "json",
          success: function (rep) {
            console.log(rep);
            let html = "";
            rep.forEach(function (redata) {
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
                     "<b>내용 : </b>" + redata.communityContent +
                      "<br><hr></div>";
              if (redata.userId == '${loginUser}') {
                html += "<div align='left'><input type='button' value='삭제' onclick=\"deleteReply(" + redata.replySeq + ")\"></div>";
                 } else if (redata.userId === '${loginUser}' || '${loginUser}' === 'cafe'){
                	 html += "<div align='left'><input type='button' value='(관리자)삭제' onclick=\"deleteReply(" + redata.replySeq + ")\"></div>";
                 }
               });
            if (html == "") {
              html = "<th>등록된 글이 없습니다</th>";
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
          url: 'deleteReply/' + replySeq, // 수정된 부분
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
	   $('#communityContent').keyup(function (e) {
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
<style type="text/css">

</style>
</head>
<body onload="replyData()">
<c:import url="../default/header.jsp" />
<c:import url="../default/quickBar.jsp" />

<!-- 상단 부분 -->
<div class="sub_content" id="contents">
	<div class="sub-visual" style="background-image: url('${contextPath}/resources/imageFile/banner4.png')">
		<div class="sub-visual__wrapper container">
			<h1 class="sub-visual__title wow fadeInDown" style="visibility: visible; animation-name: fadeInDown;">COMMUNITY</h1>
			<p class="sub-visual__txt wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">커뮤니티 게시글 내용 확인할 수 있는 공간입니다</p>
		</div>
	</div>
	<!-- 중간 부분 -->
	<div class="sub-nav sub-nav--bar">
		<ul class="sub-nav__wrap sub-nav-clone--depth2">
			<!-- active 된 메뉴의 depth2 clone 하기 -->
			<li class="item">
				<a href="${contextPath }/community/communityAllList" class="link on">게시판</a>
				<a href="${contextPath }/qna/qnaList" class="link on">Q&A</a> 
				<a href="${contextPath }/gongji/gongjiList" class="link on">공지사항</a>
			</li>
		</ul>
	</div>
</div>
<!-- // model_wrap -->
<section class="notice">
	<div class="board-list">
		<div class="container">
			<table class="board-table">
				<tr>
					<th scope="col" class="th-num">NO.&nbsp;&nbsp;</th>
					<td>${data.communityNum}</td>
					<th scope="col" class="th-title">제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<th scope="col" class="th-date">작성일&nbsp;&nbsp;</th>
					<td>${data.regdate}</td>
				</tr>
				<tr class="inner-Contents title">
					<th scope="col" class="th-user">작성자&nbsp;&nbsp;</th>
					<td>${data.userId}</td>
					<td align="right" width="45%">${data.communityTitle}</td>					
				</tr>
				<tr>
						<td colspan="6">
							<div class="content"
								style="width: 1400px; height: 300px; white-space: pre-wrap; word-wrap: break-word;">${data.communityContent}</div>
						</td>

					</tr>
				<tr><td colspan="6"><hr></td></tr>
				<tr>
				
					<td colspan="6" align="left">
					    <div id="reply"></div> <!-- 작성된 댓글 리스트 -->
					    <br>
					    <form id="frm" style="display: inline-block;">
					        <input type="hidden" name="replyNum" value="${data.communityNum}">
					        <b>&lt; 댓글 작성 &gt;</b><br><b>작성자 : ${loginUser}</b>
					        <br>					        
					        <input type="text" maxlength="100" placeholder="100자 이내 작성" style="width: 1217px; height: 50px; display: inline-block;" id="communityContent" name="communityContent">
					        &nbsp; &nbsp;
					        <input type="button" class="larger-button" value="댓글 작성" onclick="rep()"><br><br>
					       <b class="textCount">0자</b><b class="textTotal">/100자</b>	
					    </form>	  	   
					    <br>
					</td>
				</tr>
				<tr>
					<td colspan="6" align="center">
						
						<c:choose>
						    <c:when test="${loginUser == 'cafe'}">
								<input type="button" class="larger-button" value="글 삭제(관리자)" onclick="location.href='${contextPath}/community/delete?communityNum=${data.communityNum}'">&nbsp;		
								<c:if test="${data.userId == loginUser}">	
								<input type="button" class="larger-button" value="수정하기" onclick="location.href='${contextPath}/community/modifyForm?communityNum=${data.communityNum}'">&nbsp;
								</c:if>
							</c:when>
							<c:when test="${data.userId == loginUser}">
								<input type="button" class="larger-button" value="수정하기" onclick="location.href='${contextPath}/community/modifyForm?communityNum=${data.communityNum}'">&nbsp;
								<input type="button" class="larger-button" value="삭제하기" onclick="location.href='${contextPath}/community/delete?communityNum=${data.communityNum}'">&nbsp;
							</c:when>
						</c:choose>
						
						<input type="button" class="larger-button" value="글목록" onclick="location.href='${contextPath}/community/communityAllList'">
					</td>
				</tr>
			</table>
		</div>
	</div>
</section>
<c:import url="../default/footer.jsp"></c:import>
</body>
</html>