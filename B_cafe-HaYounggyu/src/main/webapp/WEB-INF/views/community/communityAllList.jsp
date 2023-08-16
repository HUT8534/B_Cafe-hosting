
<!-- communityAllList.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>communityAllList</title>
<style type="text/css">
.link {
  color: gray; /* 기본적으로 회색으로 설정 */
}

.link:hover {
  color: purple; /* 마우스를 올렸을 때 보라색으로 변경 */
}
  .sub-visual {
    height: 200px;
}

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
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<link href="${contextPath}/resources/css/community/communityAllList.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet" />
</head>
<body>
	<c:import url="../default/header.jsp" />
	<c:import url="../default/quickBar.jsp" />
	
	<!-- 상단 부분 -->
		<div class="sub_content" id="contents">
		  <div class="sub-visual" style="background-image: url('${contextPath}/resources/imageFile/banner4.png')">
		    <div class="sub-visual_wrapper container">
		      <div class="sub-visual__content">
		        <h1 class="sub-visual__title wow fadeInDown" style="visibility: visible; animation-name: fadeInDown;">COMMUNITY</h1>
		        <p class="sub-visual__txt wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">커뮤니티 게시글을 확인할 수 있는 공간입니다</p>
		      </div>
		    </div>
		  </div>
		</div>


		<!-- 중간 부분 -->
		<div class="sub-nav sub-nav--bar">
			<ul class="sub-nav__wrap sub-nav-clone-depth2">
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
				<div class="page-title">
					<div class="container"></div>
				</div>

				<!-- board search area -->
				<div id="board-search">
					<div class="container">
						<div class="search-window">
							<form id="searchList" method="get" action="${contextPath}/community/searchList">
								<div class="search-wrap">
									<label for="search" class="blind">공지사항 검색</label> 
										<input id="search" type="search" name="search" placeholder="검색어를 입력해주세요." value="${search }" />
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

					<br> <br>

					<!-- board list area -->
					<div id="board-list">
						<div class="container">
							<table class="board-table">
								<thead>
									<tr>
										<th scope="col" class="th-num">번호</th>
										<th scope="col" class="th-title">제목</th>
										<th scope="col" class="th-user">작성자</th>
										<th scope="col" class="th-date">등록일</th>
										<th scope="col" class="th-date">조회수</th>
									</tr>
									<c:if test="${communityAllList.size() == 0 }">
										<tr>
											<th colspan="5">등록된 글이 없습니다</th>
										</tr>
									</c:if>
								</thead>
								<tbody>
									<c:forEach var="dto" items="${communityAllList}">
										<tr>
											<td>${dto.communityNum }</td>
											<td><a href="${contextPath }/community/contentView?communityNum=${dto.communityNum}">${dto.communityTitle }</a></td>
											<td>${dto.userId }</td>
											<td>${dto.regdate }</td>
											<td>${dto.hit }</td>
										</tr>
									</c:forEach>
								</tbody>
								<tr>
									<td colspan="4" align="center">
										<c:forEach var="num" begin="1" end="${repeat }">
											<a href="communityAllList?num=${num}">[ ${num } ]</a>
										</c:forEach>
									</td>
									<td colspan="2">
										<a href="${contextPath }/community/communityWriteForm">게시글 작성</a>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</section>

<c:import url="../default/footer.jsp"></c:import>
</body>
</html>
