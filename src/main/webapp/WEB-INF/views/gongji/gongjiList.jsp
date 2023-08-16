
<!-- 공지 목록 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 목록 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<link href="${contextPath}/resources/css/gongji/gongjiList.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/brand.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet" />
<script type="text/javascript">
	$(".search-wrap input").click(function(e) {
		e.preventDefault();
	})
</script>
<style type="text/css">
 
.sub-visual_wrapper {
  position: relative;
}

.sub-visual__content {
  position: absolute;
  top: 100px;
  left: 50%; 
  transform: translate(-50%, -50%);
  text-align: center;
}

</style>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<c:import url="../default/quickBar.jsp" />

	<!-- 상단 부분 -->
	<div class="sub_content" id="contents">
		<div class="sub-visual"
			style="background-image: url('${contextPath}/resources/imageFile/banner4.png')">
			<div class="sub-visual__wrapper container">
				<h1 class="sub-visual__title wow fadeInDown" style="visibility: visible; animation-name: fadeInDown;">공 지 사 항</h1>
				<p class="sub-visual__txt wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">공지사항 게시글을 확인할 수 있는 공간입니다</p>
			</div>
		</div>

		<!-- 중간 부분 -->
		<div class="sub-nav sub-nav--bar">
			<ul class="sub-nav__wrap sub-nav-clone--depth2">
				<!-- active 된 메뉴의 depth2 clone 하기 -->
				<li class="item"><a href="${contextPath }/community/communityAllList" class="link on">게시판</a>
					<a href="${contextPath }/qna/qnaList" class="link on">Q&A</a> 
					<a href="${contextPath }/gongji/gongjiList" class="link on">공지사항</a></li>
			</ul>
		</div>
		<!-- 커뮤니티 부분 -->
		<div class="sub-con">
			<!-- 섹션 시작 -->
			<section class="notice">
				<!--  페이지 제목 -->
				<div class="page-title">
					<div class="container">
						<h3></h3>
					</div>
				</div>
				<!-- 제목 끝 -->

				<!-- 검색 기능 -->
				<div id="board-search">
					<div class="container">
						<div class="search-window">
							<form id="gongjiSearch" method="get" action="${contextPath}/gongji/gongjiSearch">
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
					<br><br><br>
				</div>
				<!-- 검색 끝 -->

				<!-- 출력 테이블 시작 -->
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
								<c:choose>
									<c:when test="${not empty gongjiList}">
										<c:forEach var="dto" items="${gongjiList}">
											<tr>
												<td>${dto.gongjiNum}</td>
												<td><a href="${contextPath}/gongji/gongjiView?gongjiNum=${dto.gongjiNum}">${dto.gongjiTitle}</a></td>
												<td>${dto.userId}</td>
												<td>${dto.regdate}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:when test="${not empty gongjiSearch}">
										<c:forEach var="result" items="${gongjiSearch}">
											<tr>
												<td>${result.gongjiNum}</td>
												<td><a href="${contextPath}/gongji/gongjiView?gongjiNum=${result.gongjiNum}">${result.gongjiTitle}</a></td>
												<td>${result.userId}</td>
												<td>${result.regdate}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4">등록되거나 검색된 공지가 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
							<!-- 출력 테이블 페이징 번호 -->
							<tfoot>
								<tr>
									<c:choose>
										<c:when test="${loginUser eq 'cafe'}">
											<td></td>
											<td colspan="2" align="center"><c:forEach var="num" begin="1" end="${repeat}">
													<c:choose>
														<c:when test="${not empty gongjiList}">
															<a href="gongjiList?num=${num}">[${num}]</a>
														</c:when>
														<c:when test="${not empty gongjiSearch}">
															<a href="gongjiSearch?num=${num}&type=${sessionScope.typeValue}&search=${sessionScope.searchValue}">[${num}]</a>
														</c:when>
														<c:otherwise>
															<a href="#"></a>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</td>
											<td>
												<input type="button" class="btn" value="공지작성" onclick="location.href='${contextPath}/gongji/gongjiWriteForm'" />
											</td>
										</c:when>
										<c:otherwise>
											<td colspan="4" align="center"><c:forEach var="num"
													begin="1" end="${repeat}">
													<c:choose>
														<c:when test="${not empty gongjiList}">
															<a href="gongjiList?num=${num}">[${num}]</a>
														</c:when>
														<c:when test="${not empty gongjiSearch}">
															<a href="gongjiSearch?num=${num}&type=${sessionScope.typeValue}&search=${sessionScope.searchValue}">[${num}]</a>
														</c:when>
														<c:otherwise>
															<a href="#"></a>
														</c:otherwise>
													</c:choose>
												</c:forEach></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</tfoot>
							<!-- 페이지 번호 끝 -->
						</table>
					</div>
				</div>
				<!-- 출력 테이블 끝 -->
			</section>
			<!-- 섹션 끝 -->
		</div>
	</div>
<c:import url="../default/footer.jsp" />
</body>
</html>