
<!-- admin/edit.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin/edit.jsp</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<link href="${contextPath}/resources/css/brand/brand.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet" />

<script type="text/javascript">
	function readURL(input) {
		var file = input.files[0]; //파일정보
		if (file != "") {
			var reader = new FileReader();
			reader.readAsDataURL(file); // 파일 정보 읽어오기
			reader.onload = function(e) { // 파일 읽기에 성공하면 결과 표시
				$("#preview").attr("src", e.target.result) //경로를 끌고온것이다.
			}
		}
	}
</script>
<style type="text/css">
.wrap {
	text-align: center;
}

.wrap_table {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 700px;
}

.larger-button {
	padding: 10px 20px; /* 원하는 패딩 값으로 조정 */
	font-size: 16px; /* 원하는 폰트 크기로 조정 */
}

.larger-submit {
	padding: 10px 20px; /* 원하는 패딩 값으로 조정 */
	font-size: 16px; /* 원하는 폰트 크기로 조정 */
}
</style>
</head>
<body>

	<c:import url="../default/header.jsp" />
	<c:import url="../default/quickBar.jsp" />

	<!-- 상단 부분 -->
	<div class="sub_content" id="contents">
		<div class="sub-visual" style="background-image: url('${contextPath}/resources/imageFile/banner5.png')">
			<div class="sub-visual__wrapper container">
				<h1 class="sub-visual__title wow fadeInDown" style="visibility: visible; animation-name: fadeInDown;">관리자 페이지</h1>
				<p class="sub-visual__txt wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">메뉴 추가를 할 수 있습니다</p>
			</div>
		</div>

		<!-- 중간 부분 -->
		<div class="sub-nav sub-nav--bar">
			<ul class="sub-nav__wrap sub-nav-clone--depth2">
				<!-- active 된 메뉴의 depth2 clone 하기 -->
				<li class="item">
					<a href="${contextPath }/admin/adminPage" class="link on">메뉴 추가</a> 
					<a href="${contextPath }/admin/adminProductList" class="link on">메뉴 관리</a>
				</li>
			</ul>
		</div>

		<!-- 메뉴 부분 -->
		<div class="sub-con">

			<div class="wrap">
				<div class="wrap_table">
					<form action="${contextPath}/admin/editSave" enctype="multipart/form-data" method="post">
						<table border="1">
							<tr>
								<th>상품ID</th>
								<td><input type="text" value="${edit.menuId }" name="menuId" readonly></td>
							<tr>
								<th>상품이름</th>
								<td><input type="text" name="menuName" value="${edit.menuName }" readonly></td>
							</tr>
							<tr>
								<th>상품가격</th>
								<td><input type="text" name="menuPrice" placeholder="숫자로만 입력하세요!!!" value="${edit.menuPrice }"></td>
							</tr>
							<tr>
								<th>상품옵션1</th>
								<td><input type="text" name="menuOption1" placeholder="열량" value="${edit.menuOption1 }"></td>
							</tr>
							<tr>
								<th>상품옵션2</th>
								<td><input type="text" name="menuOption2" placeholder="식자재재료적기" value="${edit.menuOption2 }"></td>
							</tr>
							<tr>
								<th>상품이미지</th>
								<td colspan="2">
									<input type="file" name="menuImage" onchange="readURL(this)">
								</td>
							</tr>
							<!-- 
								<tr>
								<td colspan="2"><textarea></textarea> </td>
								</tr> 
							-->
						 	<tr>
								<td colspan="2">
									<img src="${contextPath }/admin/download?menuImage=${edit.menuImage}" 
									width="200px" height="200px" id="preview" width="100px" height="100px" alt="선택된 이미지가 없습니다">
								</td>
							</tr> 
							<tr>
								<td colspan="4">
									<input type="submit" class="larger-submit" value="수정">&nbsp; 
									<input type="button" class="larger-button" onclick="location.href='${contextPath}/admin/adminDelete?menuId=${edit.menuId }&menuImage=${edit.menuImage }'" value="삭제">&nbsp; 
									<input type="button" class="larger-button" onclick="location.href='${contextPath}/admin/adminProductList'" value="뒤로가기">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
<c:import url="../default/footer.jsp" />
</body>
</html>