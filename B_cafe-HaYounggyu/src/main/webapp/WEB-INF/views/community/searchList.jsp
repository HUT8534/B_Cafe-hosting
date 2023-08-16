<!-- 검색 결과 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시글 검색 결과</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<link href="${contextPath}/resources/css/community/searchList.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/brand.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet" />
</head>
<body>
	<c:import url="../default/header.jsp" />
	<c:import url="../default/quickBar.jsp" />

	<!-- 상단 부분 -->
	<div class="sub_content" id="contents">
		<div class="sub-visual"
			style="background-image: url('${contextPath}/resources/imageFile/banner4.png')">
			<div class="sub-visual__wrapper container">
				<h1 class="sub-visual__title wow fadeInDown" style="visibility: visible; animation-name: fadeInDown;">COMMUNITY</h1>
				<p class="sub-visual__txt wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">커뮤니티 게시글을 찾을 수 있는 공간입니다</p>
			</div>
		</div>

		<!-- 중간 부분 -->
		<div class="sub-nav sub-nav--bar">
			<ul class="sub-nav__wrap sub-nav-clone--depth2">
				<!-- active 된 메뉴의 depth2 clone 하기 -->
				<li class="item">
					<a href="${contextPath }/community/communityAllList" class="link on">게시판</a>
					<a href="${contextPath }/qna/qnaList" class="link on">Q&A</a> 
					<a href="${contextPath }/gongji/gongjiList" class="link on">공지사항</a></li>
			</ul>
		</div>
		<!-- 커뮤니티 부분 -->
		<div class="sub-con">
			<section class="notice">
				<div class="page-title">
					<div class="container"></div>

				</div>
				<!-- 검색창 추가/수정 -->
				<div id="board-search">
					<div class="container">
						<div class="search-window">
							<form id="searchList" method="get" action="${contextPath }/community/searchList">
								<div class="search-wrap">
									<label for="search" class="blind">커뮤니티 검색</label> 
										<input id="search" type="search" name="search" placeholder="검색어를 입력해주세요." value="${param.search}"/>
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
					<br>
					<br>
					<!-- ... -->
				</div>
				<div id="board-list">
					<div class="container">
						<table class="board-table">
							<thead>
								<tr>
									<th scope="col" class="th-num" style="text-align: center;">NO.</th>
									<th scope="col" class="th-title" style="text-align: center;">제목</th>
									<th scope="col" class="th-user" style="text-align: center;">글쓴이</th>
									<th scope="col" class="th-date" style="text-align: center;">작성일</th>
									<th scope="col" class="th-hit" style="text-align: center;">조회수</th>

								</tr>
							</thead>
							<tbody>
								<c:if test="${searchList.size() == 0}">
									<tr>
										<td colspan="5">등록된 공지가 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="dto" items="${searchList}">
									<tr>
										<td>${dto.communityNum }</td>
										<td><a href="${contextPath}/community/contentView?communityNum=${dto.communityNum}">${dto.communityTitle}</a></td>
										<td>${dto.userId}</td>
										<td>${dto.regdate}</td>
										<td>${dto.hit}</td>
									</tr>
								</c:forEach>

							</tbody>
							<tr>
								<td colspan="4" align="center">
									<c:forEach var="num" begin="1" end="${searchList.size() / 15 + 1}">
										<a href="${contextPath }/community/searchList?search=${param.search}&type=${param.type}">[${num} ]</a>
									</c:forEach>
								<td colspan="4" align="right">
									<a href="${contextPath }/community/communityAllList">글 목록</a>
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