
<!-- 공지 내용 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 내용 페이지</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<link href="${contextPath}/resources/css/community/contentView.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/brand.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet" />
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<c:import url="../default/quickBar.jsp"></c:import>

		<!-- 상단 부분 -->
	<div class="sub_content" id="contents">
		<div class="sub-visual" style="background-image: url('${contextPath}/resources/imageFile/banner4.png')">
			<div class="sub-visual__wrapper container">
				<h1 class="sub-visual__title wow fadeInDown" style="visibility: visible; animation-name: fadeInDown;">공 지 사 항</h1>
				<p class="sub-visual__txt wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">공지사항 게시글 내용을 확인할 수 있는 공간입니다</p>
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
		
			<section class="notice">
				<div class="board-list">
					<div class="container">
						<table class="board-table">
							<tr>
								<th scope="col" class="th-num">NO.&nbsp;&nbsp;</th>
								<td>${data.gongjiNum}</td>
								<th scope="col" class="th-title">제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
								<th scope="col" class="th-date">작성일&nbsp;&nbsp;</th>
								<td>${data.regdate}</td>
							</tr>
							<tr class="inner-Contents title">
							<th scope="col" class="th-user">작성자&nbsp;&nbsp;</th>
								<td>${data.userId}</td>
								<td align="right" width="45%">${data.gongjiTitle}</td>
							</tr>
							<tr>
								<td colspan="6">
									<div class="content image" style="width: 100%; height: auto; overflow: auto;">
										<c:if test="${data.imageFileName != 'nan'}">
											<img src="${contextPath}/gongji/download?imageFileName=${data.imageFileName}" alt="이미지 preview" style="object-fit: contain; max-width: 100%; max-height: 100%; background-size: contain;">
										</c:if>
									</div>
									<div class="content"
								style="width: 1400px; height: 300px; white-space: pre-wrap; word-wrap: break-word;">${data.gongjiContent}</div>
								</td>
							</tr>
							<tr>
								<c:if test="${data.imageFileName != 'nan'}">
									<td colspan="6"><a href="${contextPath}/gongji/download?imageFileName=${data.imageFileName}" download="${data.imageFileName}">${data.imageFileName}</a></td>
								</c:if>
							</tr>
							<tr class="inner-Contents">
								<td colspan="6" align="right" style="padding-right: 80px;">
									<c:if test="${loginUser=='cafe'}">
										<!-- 수정 버튼 -->
										<input type="button" value="수정" onclick="location.href='${contextPath}/gongji/gongjiModifyForm?gongjiNum=${data.gongjiNum}'"> &nbsp;
					            		<!-- 삭제 버튼 -->
										<input type="button" value="삭제" onclick="location.href='${contextPath}/gongji/gongjiDelete?gongjiNum=${data.gongjiNum}&imageFileName=${data.imageFileName}'">
									</c:if> &nbsp; 
									<!-- 글목록 버튼 --> 
									<input type="button" value="글목록" onclick="location.href='${contextPath}/gongji/gongjiList'">
								</td>
							</tr>
							<tr class="inner-Contents">
								<td colspan="6" align="center">
									<!-- 이전 버튼 --> 
									<c:if test="${(data.gongjiNum-1)>0}">
										<input type="button" value="이전" onclick="location.href='${contextPath}/gongji/gongjiView?gongjiNum=${data.gongjiNum-1}'">
									</c:if> &nbsp;&nbsp;/&nbsp;&nbsp; 
									<!-- 다음 버튼 --> 
									<c:if test="${data.gongjiNum < lastNum}">
										<input type="button" value="다음" onclick="location.href='${contextPath}/gongji/gongjiView?gongjiNum=${data.gongjiNum+1}'">
									</c:if>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</section>
		</div>

<c:import url="../default/footer.jsp"/>
</body>
</html>