<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<link href="${contextPath}/resources/css/community/contentView.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/brand.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet" />
<style type="text/css">
h1 {
	text-align: center;
}

.community {
	display: flex;
	justify-content: center;
	border: 1px black;
}

.write_save {
	text-align: left;
	border: 1px black;
}

input {
	width: 100%;
	padding: 10px 20px;
	margin: 5px 0;
	box-sizing: border-box;
	border: 1px solid black;
}

textarea {
	width: 100%;
	padding: 10px 20px;
	margin: 5px 0;
	box-sizing: border-box;
	border: 1px solid black;
}
</style>
<script type="text/javascript">
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
	     if (content.length > 500) {
	       // 500자를 초과하여 타이핑되지 않도록 함
	       $(this).val(content.substring(0, 500));
	       // 500자를 초과할 경우 알림 메시지 표시
	       alert('글자수는 500자까지 입력 가능합니다.');
	     }
	   });
	 });
</script>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<c:import url="../default/quickBar.jsp" />

	<!-- 상단 부분 -->
	<div class="sub_content" id="contents">
		<div class="sub-visual" style="background-image: url('${contextPath}/resources/imageFile/banner4.png')">
			<div class="sub-visual__wrapper container">
				<h1 class="sub-visual__title wow fadeInDown" style="visibility: visible; animation-name: fadeInDown;">COMMUNITY</h1>
				<p class="sub-visual__txt wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">커뮤니티 게시글을 수정할 수 있는 공간입니다</p>
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
		<!-- 커뮤니티 부분 -->
		<div class="sub-con">
			<div class="wrap community">
				<div class="modify_save">
					<form action="${contextPath }/community/modify" enctype="multipart/form-data" method="post">
						<input type="hidden" name="communityNum" value="${data.communityNum }"><br> 
						<b> 작성자 </b><br>
						<input type="text" name="userId" value="${loginUser }" readonly><br>
						<b> 제 목 </b><br> 
						<input type="text" name="communityTitle" size="50" value="${data.communityTitle}"><br>
						<b> 내 용 </b><br>
						<textarea rows="10" cols="50" name="communityContent">${data.communityContent }</textarea>
						<br>
						<b class="textCount">0자</b><b class="textTotal">/500자</b>
						<br> 
						<input type="submit" class="larger-submit" value="글 수정">&nbsp;
						<input type="button" class="larger-button" value="글목록" onclick="location.href='${contextPath}/community/communityAllList'">
					</form>
				</div>
			</div>
		</div>
	</div>
<c:import url="../default/footer.jsp"></c:import>
</body>
</html>


