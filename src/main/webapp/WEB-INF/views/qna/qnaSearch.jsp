<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnaSearch.jsp</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<link href="${contextPath}/resources/css/qna/qnaSearch.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/brand.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet" />
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<c:import url="../default/quickBar.jsp" />

	<!-- 상단 부분 -->
	<div class="sub_content" id="contents">
		<div class="sub-visual" style="background-image: url('${contextPath}/resources/imageFile/banner4.png')">
			<div class="sub-visual__wrapper container">
				<h1 class="sub-visual__title wow fadeInDown" style="visibility: visible; animation-name: fadeInDown;">Q & A</h1>
				<p class="sub-visual__txt wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">게시글을 찾을 수 있는 공간입니다</p>
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
			<section class="notice">
				<!-- board seach area -->
				<div id="board-search">
					<div class="container">
						<div class="search-window">
							<form id="qnaSearch" method="get" action="${contextPath}/qna/qnaSearch">
								<div class="search-wrap">
									<label for="search" class="blind">공지사항 검색</label> 
									<input id="search" type="search" name="search" placeholder="검색어를 입력해주세요." value="${param.search}" />
									<div class="search_wrap">
										<div class="select-area">
											<select id="type" class="type" name="type">
												<option value="t">제목</option>
												<option value="c">내용</option>
												<option value="w">작성자</option>
												<option value="tc">제목 + 내용</option>
											</select>
										</div>
									</div>
									<button type="submit" class="btn btn-dark">검색</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<br>
				<br>

				<!-- board list area -->
				<div id="board-list">
					<div class="container">
						<table class="board-table">
							<thead>
								<tr>
									<th scope="col" class="th-num" style="text-align: center;">NO.</th>
									<th scope="col" class="th-title" style="text-align: center;">제목</th>
									<th scope="col" class="th-user" style="text-align: center;">글쓴이</th>
									<th scope="col" class="th-date" style="text-align: center;">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${qnaSearch.size() == 0 }">
									<tr>
										<th colspan="4">등록된 글이 없습니다</th>
									</tr>
								</c:if>
								<c:forEach var="dto" items="${qnaSearch}">
									<tr>
										<td>${dto.qnaNum }</td>
										<td>
											<c:choose>
              								    <c:when test="${dto.userId == loginUser || loginUser == 'cafe'}">
													<a href="${contextPath }/qna/qnacontentView?qnaNum=${dto.qnaNum}">${dto.qnaTitle }</a>
												</c:when>
												<c:otherwise>
													<p>작성자와 관리자만 볼 수 있습니다</p>
												</c:otherwise>
											</c:choose>
										</td>
										<td>${dto.userId}</td>
										<td>${dto.regdate}</td>
									</tr>
								</c:forEach>
							</tbody>

							<tr>
								<td colspan="3" align="center">
									<c:forEach var="num" begin="1" end="${qnaSearch.size() / 10 + 1}">
										<a href="qnaSearch?num=${num}">[ ${num} ]</a>
									</c:forEach>
								<td colspan="4" align="right">
									<a href="${contextPath }/qna/qnaList">글 목록</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</section>
		</div>
	</div>
<c:import url="../default/footer.jsp"></c:import>
</body>
</html>