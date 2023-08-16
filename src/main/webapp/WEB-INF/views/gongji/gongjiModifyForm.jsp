
<!-- 공지 수정 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 수정 페이지</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<link href="${contextPath}/resources/css/gongji/gongjiModifyForm.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/brand.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet" />
<script type="text/javascript">
	function readURL(input) {
		var file = input.files[0];
		if (file) {
			var reader = new FileReader();
			reader.onload = function(e) {
				var $img = $('<img>').attr('src', e.target.result);
				$img.css({
					'max-width' : '100%', // 이미지의 최대 너비 설정
					'max-height' : '100%', // 이미지의 최대 높이 설정
				});

				var previewTd = $('#previewTd');
				if (previewTd.find('img').length > 0) {
					// 이미지가 이미 존재하는 경우, 새로운 이미지로 교체
					previewTd.find('img').attr('src', e.target.result);
				} else {
					// 이미지가 없는 경우, 새로운 이미지 추가
					previewTd.append($img);
				}
			};
			reader.readAsDataURL(file);
		}
	}
	function modifyGongjiContent() {
		var innerContent = $("#content").text();
		$("#gongjiContent").val(innerContent);
		var inputValue = $("#gongjiContent").val().replace(/^\s+/, '');
		$("#gongjiContent").val(inputValue);
	}
</script>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<c:import url="../default/quickBar.jsp" />
	
	<!-- 상단 부분 -->
	<div class="sub_content" id="contents">
		<div class="sub-visual" style="background-image: url('${contextPath}/resources/imageFile/banner4.png')">
			<div class="sub-visual__wrapper container">
				<h1 class="sub-visual__title wow fadeInDown" style="visibility: visible; animation-name: fadeInDown;">공 지 사 항</h1>
				<p class="sub-visual__txt wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">공지사항 게시글을 수정할 수 있는 공간입니다</p>
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
				<div class="board-list">
					<form id="modifyForm" action="${contextPath}/gongji/gongjiModify" enctype="multipart/form-data" method="post">
						<div class="container">
							<input type="hidden" name="gongjiNum" value="${data.gongjiNum}">
							<table class="board-table">
								<tr class="inner-Contents title">
									<th scope="col" class="th-title">제목</th>
									<td>
										<input type="text" name="gongjiTitle" value="${data.gongjiTitle}">
									</td>
								</tr>
								<tr>
									<td colspan="4" id="previewTd">
										<c:if test="${data.imageFileName != 'nan'}">
											<img alt="preview" src="${contextPath}/gongji/download?imageFileName=${data.imageFileName}">
										</c:if>
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<div id="content" contentEditable="true" style="width: 500px; height: 250px;">${data.gongjiContent}</div> 
										<input id="gongjiContent" name="gongjiContent" style="display: none">
									</td>
								</tr>
								<tr class="inner-Contents title">
									<td colspan="4">
										<label></label> 
										<input type="hidden" id="preview"> <input type="file" id="imageFileName" name="imageFileName" onchange="readURL(this)">
									</td>
								</tr>
								<tr class="inner-Contents">
									<td colspan="4"><input type="submit" class="btn" id="modifyButton" value="수정하기" onclick="modifyGongjiContent()"> &nbsp;
										<button type="button" class="larger-button" onclick="location.href='${contextPath}/gongji/gongjiView?gongjiNum=${data.gongjiNum}';">이전</button> &nbsp;
										<button type="button" class="larger-button" onclick="location.href='${contextPath}/gongji/gongjiList'">글목록</button>
									</td>
								</tr>
							</table>
						</div>
					</form>
				</div>
			</section>
		</div>
	</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>