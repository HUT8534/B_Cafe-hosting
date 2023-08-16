
<!-- qna/modifyForm.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/modifyForm.jsp</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<link href="${contextPath}/resources/css/brand/brand.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet" />
<style type="text/css">
h1 {
	text-align: center;
}
.contentView {
	display: flex;
	justify-content: center;
	border: 1px black;
	margin: 5px;
	padding: 5px;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<c:import url="../default/quickBar.jsp"/>
	
	<!-- 상단 부분 -->
	<div class="sub_content" id="contents">
		<div class="sub-visual" style="background-image: url('${contextPath}/resources/imageFile/banner4.png')">
			<div class="sub-visual__wrapper container">
				<h1 class="sub-visual__title wow fadeInDown" style="visibility: visible; animation-name: fadeInDown;">Q & A</h1>
				<p class="sub-visual__txt wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">Q&A에 올린 게시글을 수정할 수 있습니다.</p>
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
	<div class="wrap qna">
		<div class="write_save">
			<form action="${contextPath }/qna/modify" enctype="multipart/form-data" method="post">
				<b> 작성자 </b><br>
				<input type="text" name="userId" value="${loginUser }" readonly><br>
				<b> 제 목 </b><br>
				<input type="text" name="qnaTitle" value="${data.qnaTitle}" size="50"><br>
				<b> 내 용 </b><br>
				<textarea rows="10" cols="50" name="qnaContent">${data.qnaContent }</textarea><br>
				<br>
				<input type="submit" value="QnA작성"> &nbsp;
				<input type="button" value="QnA목록" onclick="location.href='${contextPath}/qna/qnaList'">
			</form>
		</div>
	</div>
	</div>
	</div>
<c:import url="../default/footer.jsp"></c:import>
</body>
</html>